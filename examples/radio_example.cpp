#include "../include/mimorph.h"
#include "../include/defines.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <cmath>

const char* fpga_ip = "192.168.5.128"; // Replace with the actual server IP
const int num_of_tx_bytes=1024*128;

void create_rand_bytes(int num_bytes, char* random_data){

    srand(static_cast<unsigned>(time(nullptr)));
    for (int i = 0; i < num_bytes; ++i) {
        random_data[i] = static_cast<char>(rand() % 256);
    }
}

std::vector<mimorph::converter_conf> create_conv_conf(){
    return  {{400,RFDC_DAC_TYPE,0,0,true},
             {400,RFDC_ADC_TYPE,0,0,true}};
}


std::vector<int16_t> load_waveform_from_file(const std::string& filename) {
    std::ifstream file(filename);
    if (!file.is_open()) {
        std::cerr << "Error opening file" << std::endl;
        return {};
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

void configure_tx_blocks(mimorph::mimorph& radio, bool bw){
    //configure OFDM mod and TX filter
    mimorph::ofdm_str ofdm_config{};
    ofdm_config.OFDM_Bypass=false;
    ofdm_config.CP1=400;
    ofdm_config.CP2=144;
    ofdm_config.NumOFDMSyms=14;
    ofdm_config.N_RE=145;
    ofdm_config.num_sc=ofdm_config.N_RE*12;
    ofdm_config.nullSC=2048-ofdm_config.num_sc;
    radio.control->set_tx_ofdm_param(ofdm_config);

    mimorph::filter_str filter_config{};
    filter_config.ifs=0; //100 microseconds
    filter_config.bw=bw;
    radio.control->set_tx_filter_param(filter_config);
}

void configure_rx_blocks(mimorph::mimorph& radio, bool bw){
    //cfo correction
    radio.control->set_rx_cfo_correction_param(bw,false,2);//poner defines con los scaling //el escalado no funciona si el bloque no esta habilitado

    //configure OFDM mod and TX filter
    mimorph::ofdm_str ofdm_config{};
    ofdm_config.OFDM_Bypass=false;
    ofdm_config.CP1=400;
    ofdm_config.CP2=144;
    ofdm_config.NumOFDMSyms=14;
    ofdm_config.N_RE=145;
    ofdm_config.num_sc=ofdm_config.N_RE*12;
    radio.control->set_rx_ofdm_param(ofdm_config);

    //filter configuration
    radio.control->set_rx_filter_param(bw);

    //configure ssb block
    mimorph::ssb_sync_str ssb_config{};
    //ssb_config.ssb_sync=10447;//5403*2;//10447+75;
    ssb_config.ssb_sync=10447;//5403*2;//10447+75;
    ssb_config.slot_len=30944;// //30976
    radio.control->set_rx_ssb_param(bw,ssb_config);

    //configure channel estimation block
    mimorph::dmrs_str ce_config{};
    ce_config.offset=0;
    ce_config.scs=6;
    ce_config.symbol_index=3;
    ce_config.num_sc_virtual=(ofdm_config.num_sc+22); //this variable is adding 22 "virtual" sc to the sides
    ce_config.inv_num_dmrs=56; // este valor habria que ponerlo mejor
    ce_config.scaling_nVar=63; // este valor habria que ponerlo mejor
    radio.control->set_rx_ce_param(ce_config);

    //configure equalization block
    radio.control->set_rx_eq_param(ofdm_config);

    //configure phase tracking block
    mimorph::ptrs_str phase_tracking_config{};
    phase_tracking_config.offset=0;
    phase_tracking_config.scs=12*2; // este valor habria que ponerlo mejor
    phase_tracking_config.even=false;
    phase_tracking_config.SSB_index[0]=744;
    phase_tracking_config.SSB_index[1]=996;

    phase_tracking_config.SSB_symbols[0]=9;
    phase_tracking_config.SSB_symbols[1]=10;
    phase_tracking_config.SSB_symbols[2]=11;
    phase_tracking_config.SSB_symbols[3]=12;
    radio.control->set_rx_phase_tracking_param(bw,phase_tracking_config,ce_config,ofdm_config);

    //configure demapper
    uint16_t num_blocks=21867; //esto se puede mejorar (modulacion y numero slot length..)
    radio.control->set_rx_demap_param(num_blocks);

    //configure ldpc decoder
/*    uint16_t num_block=21867;
    radio.control->set_rx_demap_param(num_blocks);*/

}

bool check_data(char* received_data, char* sent_data, int num_bytes){
    // Check if the echoed data matches the original data
    if (memcmp(received_data, sent_data, num_bytes) == 0) {
        std::cout << "Data echoed correctly!" << std::endl;
        return true;
    } else {
        std::cout << "Data mismatch!" << std::endl;
        return false;
    }
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

    //set udp ifg and mss
    stream_config.udp_rx_mss=1024*2;
    stream_config.udp_rx_ifg=stream_config.udp_rx_mss/5;

    //set radio ifg and mss
    stream_config.radio_tx_mss=pow(2,32)*8-1;
    stream_config.radio_tx_ifg=0;
    radio.control->set_streaming_param(stream_config);

    configure_tx_blocks(radio,BW_MODE_HIGH);
    configure_rx_blocks(radio,BW_MODE_HIGH);

    //Set the frequency bands of the different converters
    std::vector<mimorph::converter_conf> conv_conf=create_conv_conf();
    radio.control->set_freq_band(conv_conf);

    std::string filename = "/home/rafael/MATLAB/PROJECT_5G_PHASE4/Matlab/GEN_DATA/2024.09.16/slotFR2_CH1_SP7.2_TX1.txt";
    std::vector<int16_t> tx_data=load_waveform_from_file(filename);
    
    // Trigger transmission of data

    radio.stream->triggerRX(tx_data.size()*2);

    for(int i=0;i<1000;i++){
      radio.stream->transmit(tx_data.data(),tx_data.size()*2);
      usleep(100);
  }

    return 1;
}