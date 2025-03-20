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

    //set udp ifg and mss
    helix::stream_str stream_config{};
    stream_config.udp_rx_mss=1024*8;
    stream_config.udp_rx_ifg=stream_config.udp_rx_mss/10;
    radio.control->set_streaming_param(stream_config);

    //Configure the transmitter and receiver blocks and split functionalities
    radio.control->configure_radio(rx_split,rx_split, BW_MODE_HIGH,
                                   145, MOD_QPSK, 490.0/1024, 0);

    //Set the frequency bands of the different converters
    std::vector<helix::converter_conf> conv_conf=create_conv_conf();
    radio.control->set_freq_band(conv_conf);

    uint32_t num_rx_bytes_slot=radio.control->get_num_of_rx_bytes(rx_split);

    auto* radio_config=radio.control->get_radio_config();
    helix::slot_str rx_data(num_rx_bytes_slot,radio_config->ofdm.num_sc*4);

    int n_packets=10;
    int n_recv_pkts=0;

    std::cout << "Starting experiment as Receiver: " << std::endl;

    while(1){
        radio.stream->receive(&rx_data,num_rx_bytes_slot,false,false,false);
        if(!rx_data.data.empty()) {
            std::cout << "Packet received. Number of bytes " << rx_data.data.size() << std::endl;
            rx_data.data.clear();
            rx_data.data.resize(num_rx_bytes_slot);
            break;
        }
        usleep(100);
        rx_data.data.resize(num_rx_bytes_slot);
        for (int i = 0; i < 1; ++i) {
            rx_data.data.resize(num_rx_bytes_slot);
        }
    }

    auto start = std::chrono::high_resolution_clock::now();
    for(int i=0;i<n_packets;i++){
        radio.stream->receive(&rx_data,num_rx_bytes_slot,false, false,false);
        if(!rx_data.data.empty()){
            n_recv_pkts++;
        }
        rx_data.data.clear();
        rx_data.data.resize(num_rx_bytes_slot);
    }

    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    std::cout << "Elapsed time: " << duration.count() << " microseconds" << std::endl;

    int bytes_per_slot=radio_config->tbs/8;

    auto tp = static_cast<double>(1.0*(n_recv_pkts)*bytes_per_slot*8/ duration.count());
    std::cout << "Recv packets: " << n_recv_pkts << "/" << n_packets << std::endl;
    std::cout << "Measured throughput is : " << tp << "Mbps" << std::endl;
    return 1;
}
