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
const int num_of_tx_bytes=1024*128;


std::vector<mimorph::converter_conf> create_conv_conf(){
    return  {{400,RFDC_DAC_TYPE,0,0,true},
             {-400,RFDC_ADC_TYPE,2,0,true}};
}


std::vector<int16_t> load_waveform_from_file(const std::string& filename) {
    std::ifstream file(filename);
    if (!file.is_open()) {
        std::cerr << "Error opening file" << std::endl;
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

    //set udp ifg and ms
    stream_config.udp_rx_mss=1024*8;
    stream_config.udp_rx_ifg=stream_config.udp_rx_mss/5;

    //set radio ifg and mss
    stream_config.radio_tx_mss=pow(2,32)*8-1;
    stream_config.radio_tx_ifg=0;
    radio.control->set_streaming_param(stream_config);

    radio.control->set_tx_split_config(SPLIT_8);

    //Set the frequency bands of the different converters
    std::vector<mimorph::converter_conf> conv_conf=create_conv_conf();
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