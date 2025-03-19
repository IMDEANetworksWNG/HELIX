#include "../include/helix.h"
#include "../include/defines.h"
#include "helpers.h"
#include <vector>
#include <string>
#include <cmath>
#include <unistd.h>


const char* fpga_ip = "192.168.5.128"; // Replace with the actual server IP
const int num_of_tx_bytes=1024*128;


std::vector<helix::converter_conf> create_conv_conf(){
    return  {{400,RFDC_DAC_TYPE,0,0,true},
             {-400,RFDC_ADC_TYPE,2,0,true}};
}

int main() {
    //set task priority
    set_scheduler_options();

    //initialize platform with IP
    auto radio=helix::helix(fpga_ip);

    //configure streaming parameters //TO DO: separar TX y RX en udp y radio
    helix::stream_str stream_config{};

    //set udp ifg and ms
    stream_config.udp_rx_mss=1024*8;
    stream_config.udp_rx_ifg=stream_config.udp_rx_mss/5;

    //set radio ifg and mss
    stream_config.radio_tx_mss=pow(2,32)*8-1;
    stream_config.radio_tx_ifg=0;
    radio.control->set_streaming_param(stream_config);

    radio.control->set_tx_split_config(SPLIT_8);

    //Set the frequency bands of the different converters
    std::vector<helix::converter_conf> conv_conf=create_conv_conf();
    radio.control->set_freq_band(conv_conf);

    //Load data to send
    std::string filename;

    filename  = "/home/rafael/MATLAB/PROJECT_5G_PHASE4/Matlab/GEN_DATA/SINE_50_TX1.txt";

    std::vector<int16_t> tx_data=load_waveform_from_file(filename);

    while(1){
        radio.stream->transmit(tx_data.data(),tx_data.size()*2);
        usleep(20);
    }


    return 1;
}