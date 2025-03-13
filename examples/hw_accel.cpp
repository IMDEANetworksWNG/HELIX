#include "../include/mimorph.h"
#include "../include/defines.h"
#include "helpers.h"
#include <iostream>
#include <vector>
#include <string>
#include <chrono>
#include <unistd.h>
#include <cmath>
#include <bits/stdc++.h>
const char* fpga_ip = "192.168.5.128"; // Replace with the actual server IP
const std::string  experiments_folder = "/mnt/NAS/Rafael/MOBISYS25/Matlab/";
//const std::string  experiments_folder = "/home/rafael/MOBISYS25/MATLAB/";
const std::string  subfolder = "/CAPTURED_DATA/HW_ACCEL/FFT_ACCEL/"; ///CAPTURED_DATA/BER/VERY_HIGH_RATE/MED_SNR/
const std::vector<std::string> split_string = {"SPLIT6", "SPLIT7_3", "SPLIT7_2", "SPLIT7_2x", "SPLIT8"};

std::vector<mimorph::converter_conf> create_conv_conf(){
    return  {{400,RFDC_DAC_TYPE,0,0,true},
             {-400,RFDC_ADC_TYPE,2,0,true}};
}

void accel_data (mimorph::slot_str& rx_data,int num_of_rx_bytes, std::vector<int16_t>& tx_data, mimorph::mimorph& radio){
    pid_t pid = fork();
    if (pid < 0) {
        std::cerr << "Fork failed\n";
        return;
    } else if (pid == 0) {
        radio.stream->receive(&rx_data,num_of_rx_bytes,false,false,false);;  // Child process runs the receiver
    } else {
        radio.stream->transmit(tx_data.data(), tx_data.size() * 2);; // Parent process runs the transmitter
    }
}



int main() {
    //set task priority
    set_scheduler_options();

    //initialize platform with IP
    auto radio = mimorph::mimorph(fpga_ip);

    mimorph::stream_str stream_config{};

    uint8_t rx_split = FFT_ACCEL;
    uint8_t tx_split = HW_ACCEL_TX;
    uint8_t n_re = 145;
    float rate = 490.0 / 1024;
    uint8_t mod_order = MOD_QPSK;

    //set udp ifg and mss
    stream_config.udp_rx_mss = 1024 * 8;
    stream_config.udp_rx_ifg = stream_config.udp_rx_mss / 10;

    radio.control->set_streaming_param(stream_config);

    //Configure the transmitter and receiver blocks and split functionalities
    radio.control->configure_radio(rx_split, tx_split, BW_MODE_HIGH,
                                   145, MOD_QPSK, 490.0 / 1024, 0);
    auto radio_parameters = radio.control->get_radio_config();

    //Load data to send
    std::string filename = experiments_folder + "/GEN_DATA/" + get_waveform_filename(mod_order, n_re, rate, FFT_ACCEL);
    std::vector<int16_t> tx_data = load_waveform_from_file(filename);

    uint32_t num_of_rx_bytes = radio.control->get_num_of_rx_bytes(SPLIT_7_2x);
    mimorph::slot_str rx_data(num_of_rx_bytes, radio_parameters->ofdm.num_sc * 4);

    std::cout << "Starting experiment as hw accelerator: " << std::endl;
    radio.control->enable_rx_radio(true);

    int n_packets = 1000;
    std::vector<double> latency;
    int recv_pkts=0;



    auto start_tp = std::chrono::high_resolution_clock::now();
    for(int i=0;i<n_packets;i++){
        auto start = std::chrono::high_resolution_clock::now();
        accel_data(rx_data, num_of_rx_bytes,tx_data,radio);
        if(!rx_data.data.empty()) {
            auto end = std::chrono::high_resolution_clock::now();
            auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
            latency.push_back(duration.count());
            recv_pkts++;
        }
        rx_data.data.clear();
        rx_data.data.resize(num_of_rx_bytes);
    }

    auto end_tp = std::chrono::high_resolution_clock::now();
    radio.control->enable_rx_radio(false);

    // Finding sum
    /*MEASURE LATENCY*/
    double sum = accumulate(latency.begin(), latency.end(), 0);
    // Finding average of all elements
    std::cout << "Latency mean: "  << sum / latency.size() << " us. Packets recv: " << recv_pkts  << std::endl;
    std::string latency_fn = experiments_folder + subfolder + "DATA/Latency.bin";
    writeBinaryFileDouble(latency_fn,latency);

    /*MEASURE THROUGHPUT*/
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end_tp - start_tp);
    std::cout << "Elapsed time: " << duration.count() << " microseconds" << std::endl;

    auto tp = static_cast<double>(1.0*(recv_pkts)*num_of_rx_bytes/ duration.count());
    std::cout << "Recv packets: " << recv_pkts << "/" << n_packets << std::endl;
    std::cout << "Measured throughput is : " << tp << "Mbps" << std::endl;

    return 1;
}
