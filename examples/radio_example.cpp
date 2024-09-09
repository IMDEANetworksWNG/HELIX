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
    return  {{400,RFDC_DAC_TYPE,0,0,true}};
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

int main() {

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

    //configure OFDM mod and TX filter
    mimorph::ofdm_str ofdm_config{};
    ofdm_config.OFDM_Bypass=false;
    ofdm_config.CP1=400;
    ofdm_config.CP2=144;
    ofdm_config.NumOFDMSyms=14;
    ofdm_config.N_RE=145;
    ofdm_config.symPerSlot=ofdm_config.N_RE*12;
    ofdm_config.nullSC=2048-ofdm_config.symPerSlot;
    radio.control->set_ofdm_param(ofdm_config);

    mimorph::filter_str filter_config{};
    filter_config.ifs=0; //100 microseconds
    filter_config.bw=BW_MODE_HIGH;
    radio.control->set_filter_param(filter_config);

    //Set the frequency bands of the different converters
    std::vector<mimorph::converter_conf> conv_conf=create_conv_conf();
    radio.control->set_freq_band(conv_conf);

    std::string filename = "/home/rafael/MATLAB/PROJECT_5G_PHASE4/Matlab/GEN_DATA/2024.09.04/slotFR2_CH1_SP7.2_TX1.txt";
    std::vector<int16_t> tx_data=load_waveform_from_file(filename);
    
    // Trigger transmission of data
    while(1){
        radio.stream->transmit(tx_data.data(),tx_data.size()*2);
        usleep(100);
    }

    //radio.stream->transmit(tx_data.data(),tx_data.size()*2);


    return 1;
}