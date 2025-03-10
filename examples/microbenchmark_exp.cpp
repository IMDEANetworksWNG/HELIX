#include "../include/mimorph.h"
#include "../include/defines.h"
#include "helpers.h"
#include <iostream>
#include <vector>
#include <string>
#include <chrono>
#include <unistd.h>
#include <cmath>
const char* fpga_ip = "192.168.5.128"; // Replace with the actual server IP
const std::string  experiments_folder = "/mnt/NAS/Rafael/MOBISYS25/Matlab/";
//const std::string  experiments_folder = "/home/rafael/MOBISYS25/MATLAB/";
const std::string  subfolder = "/CAPTURED_DATA/BER/MED_RATE/test/"; ///CAPTURED_DATA/BER/VERY_HIGH_RATE/MED_SNR/
const std::vector<std::string> split_string = {"SPLIT6", "SPLIT7_3", "SPLIT7_2", "SPLIT7_2x", "SPLIT8"};

std::vector<mimorph::converter_conf> create_conv_conf(){
    return  {{400,RFDC_DAC_TYPE,0,0,true},
             {-400,RFDC_ADC_TYPE,2,0,true}};
}



int main() {
    //set task priority
    set_scheduler_options();

    //initialize platform with IP
    auto radio=mimorph::mimorph(fpga_ip);

    mimorph::stream_str stream_config{};

    uint8_t rx_split=SPLIT_7_2x;

    //set udp ifg and mss
    stream_config.udp_rx_mss=1024*8;
    stream_config.udp_rx_ifg=stream_config.udp_rx_mss/10;

    radio.control->set_streaming_param(stream_config);

    //Configure the transmitter and receiver blocks and split functionalities
    radio.control->configure_radio(rx_split,SPLIT_8, BW_MODE_HIGH,
                                   145, MOD_QPSK, 490.0/1024, 0);
    auto radio_parameters=radio.control->get_radio_config();

    //Set the frequency bands of the different converters
    std::vector<mimorph::converter_conf> conv_conf=create_conv_conf();
    radio.control->set_freq_band(conv_conf);

    uint32_t num_of_rx_bytes=radio.control->get_num_of_rx_bytes(rx_split);

    mimorph::slot_str rx_data(num_of_rx_bytes,radio_parameters->ofdm.num_sc*4);

    int n_packets=10;
    double signal_pow[n_packets];
    double noise_pow[n_packets];

    bool enable_snr=false;
    bool enable_ce= false;
    if(rx_split==SPLIT_6 | rx_split==SPLIT_7_3) enable_snr= true;

    std::cout << "Starting experiment as Receiver: " << std::endl;
    radio.control->enable_rx_radio(true);

    while(1){
        radio.stream->receive(&rx_data,num_of_rx_bytes,enable_ce,enable_snr,false);
        if(!rx_data.data.empty()) {
            std::cout << "Packet received. Number of bytes " << rx_data.data.size() << std::endl;
/*            std::string rx_packet_fn = experiments_folder + subfolder + split_string[rx_split-1] + "/Packet_0.bin";
            writeBinaryFile(rx_packet_fn,rx_data.data);*/
            break;
        }
        usleep(100);
        rx_data.data.resize(num_of_rx_bytes);
        for (int i = 0; i < 1; ++i) {
            rx_data.data.resize(num_of_rx_bytes);
        }
    }
    for(int i=0;i<n_packets;i++){
        auto start = std::chrono::high_resolution_clock::now();
        radio.stream->receive(&rx_data,num_of_rx_bytes,enable_ce,enable_snr,false);

        signal_pow[i]=rx_data.signal_pow;
        noise_pow[i]=rx_data.noise_pow;

        if(!rx_data.data.empty()){
            std::string rx_packet_fn = experiments_folder + subfolder + split_string[rx_split-1] + "/Packet_" + std::to_string(i) + ".bin";
            writeBinaryFile(rx_packet_fn,rx_data.data);
            if (enable_ce){
                rx_packet_fn = experiments_folder + subfolder + split_string[rx_split-1] + "/Channel_Est_" + std::to_string(i) + ".bin";
                writeBinaryFile(rx_packet_fn,rx_data.channel_estimation);
            }
        }
        rx_data.data.clear();
        rx_data.data.resize(num_of_rx_bytes);
    }

    radio.control->enable_rx_radio(false);
    if(rx_split<SPLIT_7_2){
        std::string side_info_fn = experiments_folder + subfolder + split_string[rx_split-1] + "/SNR_values.bin";
        std::vector<double> SNR_values;
        for (double val : signal_pow) {
            SNR_values.push_back(val);
        }
        for (double val : noise_pow) {
            SNR_values.push_back(val);
        }
        writeBinaryFileDouble(side_info_fn,SNR_values);
    }

    return 1;
}
