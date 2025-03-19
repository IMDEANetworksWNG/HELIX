#include "../include/helix.h"
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

std::vector<helix::converter_conf> create_conv_conf(){
    return  {{400,RFDC_DAC_TYPE,0,0,true},
             {-400,RFDC_ADC_TYPE,2,0,true}};
}

// Shared data and mutex
helix::slot_str shared_rx_data(0, 0); // Properly initialize sizes
std::mutex rx_data_mutex;

void receiver_thread(helix::slot_str& rx_data, int num_of_rx_bytes, helix::helix& radio) {
    radio.stream->receive(&rx_data, num_of_rx_bytes, false, false, false);

    // Protect access to shared_rx_data with a mutex
    std::lock_guard<std::mutex> lock(rx_data_mutex);
    shared_rx_data = std::move(rx_data); // Move data to shared data structure
    //std::cout << "Receiver Thread: Received data (size): " << shared_rx_data.data.size() << "\n"; // Output size to check data is sent to the share data
}

void accel_data(helix::slot_str& rx_data, int num_of_rx_bytes, std::vector<int16_t>& tx_data, helix::helix& radio) {

    helix::slot_str temp_data (num_of_rx_bytes,0);
    // Launch the receiver thread.
    std::thread receiver(receiver_thread, std::ref(temp_data), num_of_rx_bytes, std::ref(radio));

    // Transmitter (runs in the main thread)
    radio.stream->transmit(tx_data.data(), tx_data.size() * 2);

    receiver.join();
    // Access the received data (protected by the mutex)
    std::lock_guard<std::mutex> lock(rx_data_mutex);
    rx_data = std::move(shared_rx_data); // Move data to local variable
}


int main() {
    //set task priority
    set_scheduler_options();

    //initialize platform with IP
    auto radio = helix::helix(fpga_ip);

    helix::stream_str stream_config{};

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
    helix::slot_str rx_data(num_of_rx_bytes, radio_parameters->ofdm.num_sc * 4);

    std::cout << "Starting experiment as hw accelerator: " << std::endl;
    radio.control->enable_rx_radio(true);

    int n_packets = 10000;
    std::vector<double> latency;
    int recv_pkts=0;

    pid_t main_pid = getpid();
    latency.reserve(n_packets);

    accel_data(rx_data, num_of_rx_bytes,tx_data,radio);
    rx_data.data.clear();
    rx_data.data.resize(num_of_rx_bytes);

    auto start_tp = std::chrono::high_resolution_clock::now();

    for (int i = 0; i < n_packets; i++) {
        auto start = std::chrono::high_resolution_clock::now();

        accel_data(rx_data, num_of_rx_bytes, tx_data, radio);

        if (!rx_data.data.empty()) {
            auto end = std::chrono::high_resolution_clock::now();
            latency.push_back(std::chrono::duration_cast<std::chrono::microseconds>(end - start).count());
            recv_pkts++;
            /*std::string rx_packet_fn = experiments_folder + subfolder +  "/DATA/Packet_" + std::to_string(i) + ".bin";
            writeBinaryFile(rx_packet_fn,rx_data.data);*/
        }
        rx_data.data.clear();
        rx_data.data.resize(num_of_rx_bytes);
    }

    if (getpid() == main_pid) {
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
    }

    return 1;
}
