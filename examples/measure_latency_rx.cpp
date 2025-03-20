#include "../include/helix.h"
#include "../include/defines.h"
#include "helpers.h"
#include <iostream>
#include <vector>
#include <string>
#include <unistd.h>
#include <chrono>
#include <cmath>

const char* fpga_ip = "192.168.5.128";
const std::string  experiments_folder = "matlab/";
const std::vector<std::string> split_string = {"SPLIT6", "SPLIT7", "SPLIT7_1", "SPLIT7_2", "SPLIT8"};

std::vector<helix::converter_conf> create_conv_conf(){
    return  {{400,RFDC_DAC_TYPE,0,0,true},
             {-400,RFDC_ADC_TYPE,2,0,true}};
}

int main() {
    //set task priority
    set_scheduler_options();

    //initialize platform with IP
    auto radio=helix::helix(fpga_ip);

    uint8_t rx_split=SPLIT_6;
    uint8_t tx_split=SPLIT_7_3;
    uint8_t n_re = 145;
    float rate = 490.0/1024;
    uint8_t mod_order = MOD_QPSK;

    //set udp ifg and mss
    helix::stream_str stream_config{};
    stream_config.udp_rx_mss=1024*8;
    stream_config.udp_rx_ifg=stream_config.udp_rx_mss/10;
    stream_config.radio_tx_mss=pow(2,32)*8-1;
    stream_config.radio_tx_ifg=0;
    radio.control->set_streaming_param(stream_config);

    //Configure the transmitter and receiver blocks and split functionalities
    radio.control->configure_radio(tx_split,tx_split, BW_MODE_HIGH,
                                   n_re, mod_order, rate, 0);
    auto radio_parameters=radio.control->get_radio_config();

    //load SSB in the block RAM
    std::string ssb_filename = experiments_folder + "/GEN_DATA/" +  get_waveform_filename(mod_order, n_re, rate, SSB_FILE);
    std::vector<int16_t> ssb = load_waveform_from_file(ssb_filename);
    radio.control->load_SSB(ssb);

    //Set the frequency bands of the different converters
    std::vector<helix::converter_conf> conv_conf=create_conv_conf();
    radio.control->set_freq_band(conv_conf);

    //Load data to send
    std::string filename = experiments_folder + "/GEN_DATA/" + get_waveform_filename(mod_order, n_re, rate, tx_split);
    std::vector<int16_t> tx_data = load_waveform_from_file(filename);
    usleep(1000);

    uint32_t num_of_rx_bytes=radio.control->get_num_of_rx_bytes(rx_split);
    helix::slot_str rx_data(num_of_rx_bytes,radio_parameters->ofdm.num_sc*4);

    std::cout << "Starting experiment as Node B: " << std::endl;
    radio.control->enable_rx_radio(true);
    int n_recv_pkts=0;
    while(n_recv_pkts<10000){
        radio.stream->receive(&rx_data,num_of_rx_bytes,false,false,false);
        if(!rx_data.data.empty()) {
            n_recv_pkts++;
            radio.stream->transmit(tx_data.data(),tx_data.size()*2);
        }
        rx_data.data.clear();
        rx_data.data.resize(num_of_rx_bytes);
    }
    radio.control->enable_rx_radio(false);

    std::cout << "The experiment has finished " << std::endl;
}
