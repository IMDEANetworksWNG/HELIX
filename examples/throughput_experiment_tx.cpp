#include "../include/helix.h"
#include "../include/defines.h"
#include "helpers.h"
#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <unistd.h>
#include <chrono>


const char* fpga_ip = "192.168.5.128";
const std::string  experiments_folder = "/mnt/NAS/Rafael/MOBISYS25/Matlab/";

std::vector<helix::converter_conf> create_conv_conf(){
    return  {{400,RFDC_DAC_TYPE,0,0,true},
             {-400,RFDC_ADC_TYPE,2,0,true}};
}

int main() {
    //set task priority
    set_scheduler_options();

    //initialize platform with IP
    auto radio = helix::helix(fpga_ip);

    uint8_t tx_split=SPLIT_6;
    MCSParameters mcs = getMCSParameters(MCS::MCS_12);
    uint8_t PRB = 145;

    //set radio ifg and mss
    helix::stream_str stream_config{};
    stream_config.udp_rx_mss = 1024 * 8;
    stream_config.udp_rx_ifg = stream_config.udp_rx_mss / 10;
    stream_config.radio_tx_mss = pow(2, 32) * 8 - 1;
    stream_config.radio_tx_ifg = 0;
    radio.control->set_streaming_param(stream_config);


    //Configure the transmitter and receiver blocks and split functionalities
    radio.control->configure_radio(tx_split,tx_split, BW_MODE_HIGH,
                                   PRB, mcs.modulationOrder, mcs.codingRate, 0);

    //load SSB in the block RAM
    std::string ssb_filename = experiments_folder + "/GEN_DATA/" +  get_waveform_filename(mcs.modulationOrder, PRB, mcs.codingRate, SSB_FILE);
    std::vector<int16_t> ssb = load_waveform_from_file(ssb_filename);
    radio.control->load_SSB(ssb);

    //Set the frequency bands of the different converters
    std::vector<helix::converter_conf> conv_conf=create_conv_conf();
    radio.control->set_freq_band(conv_conf);

    //Load data to send
    std::string filename = experiments_folder + "/GEN_DATA/" +  get_waveform_filename(mcs.modulationOrder, PRB, mcs.codingRate, tx_split);
    std::vector<int16_t> tx_data = load_waveform_from_file(filename);
    usleep(1000);

    std::cout << "Starting experiment as Transmitter: " << std::endl;

    while(1){
        radio.stream->transmit(tx_data.data(),tx_data.size()*2);
        usleep(50000); //10000 - 500
    }
}