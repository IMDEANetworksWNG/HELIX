#include "../include/mimorph.h"
#include "../include/defines.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <cmath>
#include <chrono>


const char* fpga_ip = "192.168.5.128"; // Replace with the actual server IP
const std::string  experiments_folder = "/home/rafael/Mobisys25_experiments/MATLAB/CAPTURED_DATA/MIMORPH_RT/";
const std::vector<std::string> split_string = {"SPLIT6", "SPLIT7", "SPLIT7_1", "SPLIT7_2", "SPLIT8"};


bool check_data(uint8_t * received_data, uint8_t* sent_data, int num_bytes){
    // Check if the echoed data matches the original data
    if (memcmp(received_data, sent_data, num_bytes) == 0) {
        //std::cout << "Data echoed correctly!" << std::endl;
        return true;
    } else {
        //std::cout << "Data mismatch!" << std::endl;
        return false;
    }
}

std::vector<uint8_t> convertToBytes(const std::vector<int16_t>& input) {
    std::vector<uint8_t> output;
    size_t size = input.size();

    // Ensure the input size is divisible by 8, as we're packing 8 int16 values into one byte
    if (size % 8 != 0) {
        std::cerr << "Input size must be a multiple of 8." << std::endl;
        return output;
    }

    // Process the input 8 bits at a time
    for (size_t i = 0; i < size; i += 8) {
        uint8_t byte = 0;

        // Pack 8 bits (0 or 1) into one byte
        for (int bit = 0; bit < 8; ++bit) {
            // Ensure that the int16 value is either 0 or 1
            if (input[i + bit] != 0 && input[i + bit] != 1) {
                std::cerr << "Input values must be binary (0 or 1)." << std::endl;
                return std::vector<uint8_t>();  // Return empty if input is invalid
            }

            // Shift and add the bit to the byte
            byte |= (input[i + bit] & 1) << (bit);  // Highest bit first
        }

        output.push_back(byte);  // Store the packed byte
    }

    return output;
}

std::vector<mimorph::converter_conf> create_conv_conf(){
    return  {{400,RFDC_DAC_TYPE,0,0,true},
             {-400,RFDC_ADC_TYPE,2,0,true}};
}

void writeBinaryFile(const std::string &filename, const std::vector<uint8_t> &data) {
    // Create a binary file output stream
    if(data.empty())
        return;

    std::ofstream file(filename, std::ios::binary);

    // Check if the file opened successfully
    if (!file.is_open()) {
        std::cerr << "Could not open the file for writing!" << std::endl;
        return;
    }

    // Write the data to the binary file
    for (int value : data) {
        file.write(reinterpret_cast<const char*>(&value), 1);
    }

    // Close the file
    file.close();

    std::cout << "Data written to " << filename << std::endl;
}


std::vector<int16_t> load_waveform_from_file(const std::string& filename) {
    std::ifstream file(filename);
    if (!file.is_open()) {
        std::cerr << "Error opening file: " << filename << std::endl;
        exit(0);
    }

    std::vector<int16_t> values;
    std::string line;

    while (std::getline(file, line)) {
        std::stringstream ss(line);
        //ss << std::hex << line;
        int16_t value;
        ss >> value;
        values.push_back(value);
    }

    file.close();
    return values;
}

void remove_ldpc_padding(std::vector<uint8_t>* rx_data){
    //Removing the padding from the LDPC decoder
    uint8_t * ptr = rx_data->data();
    rx_data->clear();
    rx_data->insert(rx_data->begin(),ptr,ptr+897);
    rx_data->insert(rx_data->end(),ptr+968,ptr+968+897);
    rx_data->insert(rx_data->end(),ptr+968*2,ptr+(968*2)+897);
}


void configure_rx_blocks(mimorph::mimorph& radio, bool bw, uint8_t rx_split){

    auto* radio_config=radio.control->get_radio_config();
    radio_config->bw=bw;

    radio_config->rx_split=rx_split;
    radio.control->set_rx_split_config(radio_config->rx_split);

    //cfo correction
    radio.control->set_rx_cfo_correction_param(radio_config->bw,true,2);//poner defines con los scaling //el escalado no funciona si el bloque no esta habilitado

    radio_config->ofdm.OFDM_Bypass=false;
    radio_config->ofdm.CP1=400;
    radio_config->ofdm.CP2=144;
    radio_config->ofdm.NumOFDMSyms=14;
    radio_config->ofdm.N_RE=145;
    radio_config->ofdm.num_sc=radio_config->ofdm.N_RE*12;
    radio_config->ofdm.nullSC=2048-radio_config->ofdm.num_sc;
    radio.control->set_rx_ofdm_param(radio_config->ofdm);

    if ((radio_config->ofdm.num_sc/12) % 2 == 0)
        radio_config->offsetSSB = 0;
    else
        radio_config->offsetSSB = 6;

    //filter configuration
    radio.control->set_rx_filter_param(radio_config->bw);

    //configure ssb block
    radio_config->synchronization.ssb_sync=10447;
    radio_config->synchronization.slot_len=30944;
    radio.control->set_rx_ssb_param(bw,radio_config->synchronization);

    //configure channel estimation block
    radio_config->equalization.offset=0;
    radio_config->equalization.scs=6;
    radio_config->equalization.symbol_index=3;
    radio_config->equalization.num_sc_virtual=(radio_config->ofdm.num_sc+22); //this variable is adding 22 "virtual" sc to the sides
    radio_config->equalization.inv_num_dmrs=56;
    radio_config->equalization.scaling_nVar=63;
    radio.control->set_rx_ce_param(radio_config->equalization);

    //configure equalization block
    radio.control->set_rx_eq_param(radio_config->ofdm);

    //configure phase tracking block
    radio_config->phase_tracking.offset=0;
    radio_config->phase_tracking.scs=12*2;
    radio_config->phase_tracking.even=false;
    radio_config->phase_tracking.SSB_index[0]=744;
    radio_config->phase_tracking.SSB_index[1]=996;
    radio_config->phase_tracking.SSB_symbols[0]=9;
    radio_config->phase_tracking.SSB_symbols[1]=10;
    radio_config->phase_tracking.SSB_symbols[2]=11;
    radio_config->phase_tracking.SSB_symbols[3]=12;
    radio.control->set_rx_phase_tracking_param(bw,radio_config->phase_tracking,radio_config->equalization,radio_config->ofdm);

    //configure demapper
    radio_config->num_sch_sym=21867;
    radio_config->mod_order = MOD_QPSK;
    radio.control->set_rx_demap_param(radio_config->num_sch_sym, radio_config->mod_order);

    //configure ldpc decoder
    radio_config->tbs=21504;
    radio_config->code_rate=490.0/1024;
    auto ldpc_config = get_LDPC_config(radio_config->tbs, radio_config->code_rate,radio_config->num_sch_sym*2,MOD_QPSK);
    radio.control->set_rx_ldcp_param(ldpc_config);;
}

void set_scheduler_options(){
    cpu_set_t mask;
    CPU_ZERO(&mask);
    CPU_SET(50, &mask);  // Bind process to core 50
    if (sched_setaffinity(0, sizeof(mask), &mask)) {
        std::cerr << "Failed to set process affinity: " << strerror(errno) << std::endl;
    }
    sched_param param{};
    param.sched_priority = sched_get_priority_max(SCHED_FIFO);

    // Set the scheduling policy to FIFO (Real-time)
    if (sched_setscheduler(0, SCHED_FIFO, &param) == -1) {
        std::cerr << "Failed to set process priority: " << strerror(errno) << std::endl;
    }
}

int main() {
    //set task priority
    set_scheduler_options();

    //initialize platform with IP
    auto radio=mimorph::mimorph(fpga_ip);

    //configure streaming parameters //TO DO: separar TX y RX en udp y radio
    mimorph::stream_str stream_config{};

    uint8_t rx_split=SPLIT_7_1;

    //set udp ifg and mss
    stream_config.udp_rx_mss=1024*8;
    stream_config.udp_rx_ifg=stream_config.udp_rx_mss/10;

    radio.control->set_streaming_param(stream_config);

    configure_rx_blocks(radio,BW_MODE_HIGH,rx_split);

    //Set the frequency bands of the different converters
    std::vector<mimorph::converter_conf> conv_conf=create_conv_conf();
    radio.control->set_freq_band(conv_conf);


    std::vector<uint8_t> tx_bytes;
    if(rx_split==SPLIT_6){
        std::string filename = experiments_folder + "/Transmitter/tx_bits.txt";
        std::vector<int16_t> tx_bits=load_waveform_from_file(filename);
        tx_bytes=convertToBytes(tx_bits);
    }
    int num_of_rx_bytes;
    switch(rx_split){
        case SPLIT_6:
            num_of_rx_bytes=2904;
            break;
        case SPLIT_7:
            num_of_rx_bytes=45544*2;
            break;
        case SPLIT_7_1:
            num_of_rx_bytes=45544*2;
            break;
        case SPLIT_7_2:
            num_of_rx_bytes=97440;
            break;
        case SPLIT_8:
            num_of_rx_bytes=127872;
            break;
        default:
            num_of_rx_bytes=2904;
    }

    auto* radio_config=radio.control->get_radio_config();
    mimorph::slot_str rx_data(num_of_rx_bytes,radio_config->ofdm.num_sc*4);

    int n_errors=0;
    int n_rcv_pkts=0;
    int n_packets=5;
    double signal_pow[n_packets];
    double noise_pow[n_packets];
    sleep(1);

    std::cout << "Starting experiment as Receiver: " << std::endl;

    while(1){
        radio.stream->receive(&rx_data,num_of_rx_bytes,false,true,true);
        if(!rx_data.data.empty()) {
            std::cout << "Packet received. Number of bytes " << rx_data.data.size() << std::endl;
            break;
        }
        usleep(100);
        rx_data.data.resize(num_of_rx_bytes);
        for (int i = 0; i < 1; ++i) {
            rx_data.data.resize(num_of_rx_bytes);
        }
    }
    //auto start = std::chrono::high_resolution_clock::now();
    for(int i=0;i<n_packets;i++){
        radio.stream->receive(&rx_data,num_of_rx_bytes,false,true,false);
        signal_pow[i]=rx_data.signal_pow;
        noise_pow[i]=rx_data.noise_pow;
        if(rx_split==SPLIT_6){
            if(!rx_data.data.empty()) {
                n_rcv_pkts++;
                remove_ldpc_padding(&rx_data.data);
                if (!check_data(rx_data.data.data(), tx_bytes.data(), tx_bytes.size())) {
                    n_errors++;
                    std::cout << "Packet number " << i + 1 << " failed" << std::endl;
                }
            }
        }
        else if(!rx_data.data.empty()){
            std::string rx_packet_fn = experiments_folder + split_string[rx_split-1] + "/Packet_" + std::to_string(i) + ".bin";
            writeBinaryFile(rx_packet_fn,rx_data.data);
        }
        rx_data.data.clear();
        rx_data.data.resize(num_of_rx_bytes);
    }

  /*  auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);

    std::cout << "Elapsed time: " << duration.count() << " microseconds" << std::endl;
*/

    if(rx_split==SPLIT_6) std::cout << "Number of packet with errors: " << n_errors << "/" << n_rcv_pkts << std::endl;

/*    auto tp = static_cast<double>(1.0*(n_rcv_pkts -n_errors)*2904*8/ duration.count());
    std::cout << "Measured throughput is : " << tp << "Mbps" << std::endl;*/
    return 1;
}
