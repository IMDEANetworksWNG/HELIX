#include "../include/helix.h"
#include "../include/defines.h"
#include "helpers.h"
#include <iostream>
#include <vector>
#include <string>
#include <unistd.h>

const char* fpga_ip = "192.168.5.128";
const std::string  experiments_folder = "matlab/";
const std::string  subfolder = "/RX_data/";

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

    uint8_t rx_split=SPLIT_6;
    uint8_t tx_split = SPLIT_7_2;
    uint8_t n_re = 100;
    float rate = 490.0/1024;
    uint8_t mod_order = MOD_QPSK;

    //set udp ifg and mss
    stream_config.udp_rx_mss=1024*8;
    stream_config.udp_rx_ifg=stream_config.udp_rx_mss/10;

    radio.control->set_streaming_param(stream_config);

    //Configure the transmitter and receiver blocks and split functionalities
    radio.control->configure_radio(rx_split,tx_split, BW_MODE_HIGH,
                                   n_re, mod_order, rate, 0);


    //Set the frequency bands of the different converters
    std::vector<helix::converter_conf> conv_conf=create_conv_conf();
    radio.control->set_freq_band(conv_conf);

    uint32_t num_rx_bytes_slot=radio.control->get_num_of_rx_bytes(rx_split);

    auto* radio_config=radio.control->get_radio_config();
    helix::slot_str rx_data(num_rx_bytes_slot,radio_config->ofdm.num_sc*4);

    int n_packets=40000; //40000 with ifs of 0.5ms will be 20s
    bool enable_ce= true;

    std::vector<std::vector<uint8_t>> cest_data(n_packets);

    std::cout << "Starting experiment as Receiver: " << std::endl;
    rx_data.channel_estimation.clear();
    radio.control->enable_rx_radio(true);
    while(1){
        radio.stream->receive(&rx_data,num_rx_bytes_slot,enable_ce,false,false);
        if(!rx_data.data.empty()) {
            std::cout << "First packet received. Number of bytes " << rx_data.data.size() << std::endl;
            cest_data[0]=rx_data.channel_estimation;
            rx_data.channel_estimation.clear();
            rx_data.channel_estimation.resize(radio_config->ofdm.num_sc*4);
            break;
        }
        usleep(100);
        rx_data.data.resize(num_rx_bytes_slot);
        for (int i = 0; i < 1; ++i) {
            rx_data.data.resize(num_rx_bytes_slot);
        }
    }
    for(int i=0;i<n_packets;i++){
        radio.stream->receive(&rx_data,num_rx_bytes_slot,enable_ce,false,false);
        cest_data[i]=rx_data.channel_estimation;
        rx_data.channel_estimation.clear();
        rx_data.channel_estimation.resize(radio_config->ofdm.num_sc*4);
        rx_data.data.clear();
        rx_data.data.resize(num_rx_bytes_slot);
    }
    radio.control->enable_rx_radio(false);
    // Flattened vector
    std::vector<uint8_t> flattened;

    // Append each inner vector's elements to the flattened vector
    for (const auto& innerVec : cest_data) {
        flattened.insert(flattened.end(), innerVec.begin(), innerVec.end());
    }
    std::string side_info_fn = experiments_folder + subfolder + "/cest_nre145_3.bin";
    writeBinaryFile(side_info_fn,flattened);


    return 1;
}
