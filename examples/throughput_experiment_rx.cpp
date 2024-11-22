#include "../include/mimorph.h"
#include "../include/defines.h"
#include "helpers.h"
#include <iostream>
#include <vector>
#include <string>
#include <unistd.h>


const char* fpga_ip = "192.168.5.128"; // Replace with the actual server IP
const std::string  experiments_folder = "/home/rafael/Mobisys25_experiments/";

std::vector<mimorph::converter_conf> create_conv_conf(){
    return  {{400,RFDC_DAC_TYPE,0,0,true},
             {-400,RFDC_ADC_TYPE,2,0,true}};
}


void configure_rx_blocks(mimorph::mimorph& radio, bool bw, uint8_t rx_split){

    auto* radio_config=radio.control->get_radio_config();
    radio_config->bw=bw;

    radio_config->rx_split=rx_split;
    radio.control->set_rx_split_config(radio_config->rx_split);

    //cfo correction
    radio.control->set_rx_cfo_correction_param(radio_config->bw,true,SCALE_FACTOR_MULT_2);

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
    radio_config->tbs=21504;  // vh -> 40976 -- high->33816 -- med ->21504 -- low ->14088
    radio_config->code_rate= 490.0/1024; //low 318 -- med 490 -- high 768 -- vh 921;
    auto ldpc_config = get_LDPC_config(radio_config->tbs, radio_config->code_rate,radio_config->num_sch_sym*2,MOD_QPSK);
    radio_config->ldpc_segmented_length= ldpc_config.K*ldpc_config.C;
    radio.control->set_rx_ldcp_param(ldpc_config);
}


int main() {
    //set task priority
    //set_scheduler_options();

    //initialize platform with IP
    auto radio=mimorph::mimorph(fpga_ip);

    //configure streaming parameters //TO DO: separar TX y RX en udp y radio
    mimorph::stream_str stream_config{};

    uint8_t rx_split=SPLIT_6;

    //set udp ifg and mss
    stream_config.udp_rx_mss=1024*8;
    stream_config.udp_rx_ifg=stream_config.udp_rx_mss/10;

    radio.control->set_streaming_param(stream_config);

    configure_rx_blocks(radio,BW_MODE_HIGH,rx_split);
    auto radio_parameters=radio.control->get_radio_config();

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
            num_of_rx_bytes=radio_parameters->ldpc_segmented_length/8;
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
            num_of_rx_bytes=15474*8;
            break;
        default:
            num_of_rx_bytes=2904;
    }

    auto* radio_config=radio.control->get_radio_config();
    mimorph::slot_str rx_data(num_of_rx_bytes,radio_config->ofdm.num_sc*4);

    int n_errors=0;
    int n_packets=1000;

    std::cout << "Starting experiment as Receiver: " << std::endl;

    while(1){
        radio.stream->receive(&rx_data,num_of_rx_bytes,false,false,false);
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

    for(int i=0;i<n_packets;i++){
        radio.stream->receive(&rx_data,num_of_rx_bytes,false,false,false);

        if(rx_split==SPLIT_6){
            remove_ldpc_padding(&rx_data.data);
            if(!check_data(rx_data.data.data(),tx_bytes.data(),tx_bytes.size())){
                n_errors++;
                std::cout << "Packet number " << i+1 << " failed" << std::endl;
            }
        }
        else if(!rx_data.data.empty()){
            std::string rx_packet_fn = experiments_folder+ "/Receiver/Packet_" + std::to_string(i) + "_Split7_1.bin";
            writeBinaryFile(rx_packet_fn,rx_data.data);
        }

        usleep(30);
        rx_data.data.clear();
        rx_data.data.resize(num_of_rx_bytes);
    }

    if(rx_split==SPLIT_6)
        std::cout << "Number of packet with errors: " << n_errors << "/" << n_packets << std::endl;
    return 1;
}
