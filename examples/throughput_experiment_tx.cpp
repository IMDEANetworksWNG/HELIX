#include "../include/mimorph.h"
#include "../include/defines.h"
#include "helpers.h"
#include <iostream>
#include <vector>
#include <string>
#include <cmath>
#include <unistd.h>
#include <chrono>


const char* fpga_ip = "192.168.5.128"; // Replace with the actual server IP
const std::string  experiments_folder = "/mnt/NAS/Rafael/MOBISYS25/Matlab/GEN_DATA/256QAM_MED_RATE/";

std::vector<mimorph::converter_conf> create_conv_conf(){
    return  {{400,RFDC_DAC_TYPE,0,0,true},
             {-400,RFDC_ADC_TYPE,2,0,true}};
}

int main() {
    //set task priority
    set_scheduler_options();

    //initialize platform with IP
    auto radio = mimorph::mimorph(fpga_ip);

    uint8_t tx_split = SPLIT_8;

    //set radio ifg and mss
    mimorph::stream_str stream_config{};
    stream_config.udp_rx_mss = 1024 * 8;
    stream_config.udp_rx_ifg = stream_config.udp_rx_mss / 10;
    stream_config.radio_tx_mss = pow(2, 32) * 8 - 1;
    stream_config.radio_tx_ifg = 0;
    radio.control->set_streaming_param(stream_config);

    //load SSB in the block RAM
    std::string ssb_filename = experiments_folder +  "/slotFR2_CH1_SSB_TX1.txt";
    std::vector<int16_t> ssb = load_waveform_from_file(ssb_filename);
    radio.control->load_SSB(ssb);

    //Configure the transmitter and receiver blocks and split functionalities
    radio.control->configure_radio(tx_split,tx_split, BW_MODE_HIGH,
                                   145, MOD_QPSK, 490.0/1024, 0);

    //Set the frequency bands of the different converters
    std::vector<mimorph::converter_conf> conv_conf = create_conv_conf();
    radio.control->set_freq_band(conv_conf);

    //Load data to send
    std::string filename;
    switch (tx_split) {
        case SPLIT_7_3:
            filename = experiments_folder + "/slotFR2_CH1_7_TX1.txt";
            break;
        case SPLIT_7_2:
            filename = experiments_folder + "/slotFR2_CH1_7.1_TX1.txt";
            break;
        case SPLIT_7_2x:
            filename = experiments_folder + "/slotFR2_CH1_7.2_TX1.txt";
            break;
        case SPLIT_8:
            filename = experiments_folder + "/slotFR2_CH1_8_TX1.txt";
            break;
        default:
            filename = experiments_folder + "/slotFR2_CH1_7_TX1.txt";
    }

    std::vector<int16_t> tx_data = load_waveform_from_file(filename);
    usleep(1000);

    std::cout << "Starting experiment as Transmitter: " << std::endl;

    while(1){
        radio.stream->transmit(tx_data.data(),tx_data.size()*2);
        usleep(1000); //10000 - 500
    }

/*    for (int i = 0; i < 5002; i++) {
        radio.stream->transmit(tx_data.data(), tx_data.size() * 2);
        usleep(20000);//10000 - 500
    }*/
    std::cout << "Experiment is finished " << std::endl;

    return 1;
}