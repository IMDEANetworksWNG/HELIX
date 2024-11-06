#include "../include/mimorph.h"
#include "../include/defines.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <cmath>


const char* fpga_ip = "192.168.5.128"; // Replace with the actual server IP
const std::string  experiments_folder = "/home/rafael/Mobisys25_experiments/";


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



void configure_tx_blocks(mimorph::mimorph& radio, bool bw, uint8_t tx_split){

    auto* radio_config=radio.control->get_radio_config();
    radio_config->bw=bw;
    radio_config->tx_split=tx_split;
    radio.control->set_tx_split_config(radio_config->tx_split);

    radio.control->set_tx_buildGrid_param(radio_config->ofdm,radio_config->phase_tracking,radio_config->equalization, radio_config->offsetSSB);
    //Load SSB data into the memory
    std::string filename = experiments_folder +  "/Transmitter/slotFR2_CH1_SSB_TX1.txt";
    std::vector<int16_t> tx_data = load_waveform_from_file(filename);
    radio.control->set_tx_lbm_param(tx_data.size());
    radio.stream->load_SSB_data(tx_data.data(),tx_data.size() * 2);

    radio_config->ofdm.OFDM_Bypass=false;
    radio_config->ofdm.CP1=400;
    radio_config->ofdm.CP2=144;
    radio_config->ofdm.NumOFDMSyms=14;
    radio_config->ofdm.N_RE=145;
    radio_config->ofdm.num_sc=radio_config->ofdm.N_RE*12;
    radio_config->ofdm.nullSC=2048-radio_config->ofdm.num_sc;
    radio.control->set_tx_ofdm_param(radio_config->ofdm);
    radio.control->set_tx_ofdm_param(radio_config->ofdm);
    radio_config->ifs=0;
    radio.control->set_tx_filter_param(radio_config->bw,radio_config->ifs);

    radio_config->num_sch_sym=21867;
    radio_config->mod_order = MOD_QPSK;
    radio.control->set_tx_nrPDSCH(radio_config->mod_order,radio_config->num_sch_sym*2+42,22);
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

    uint8_t tx_split=SPLIT_7_1;

    //set radio ifg and mss
    stream_config.radio_tx_mss=pow(2,32)*8-1;
    stream_config.radio_tx_ifg=0;
    radio.control->set_streaming_param(stream_config);

    configure_tx_blocks(radio,BW_MODE_HIGH,tx_split);

    //Set the frequency bands of the different converters
    std::vector<mimorph::converter_conf> conv_conf=create_conv_conf();
    radio.control->set_freq_band(conv_conf);

    //Load data to send
    std::string filename;
    switch(tx_split){
        case SPLIT_7:
            filename  = experiments_folder +  "/Transmitter/slotFR2_CH1_SP7_TX1.txt";
            break;
        case SPLIT_7_1: //este paquete tenia un padding de 0s que hacia que no funcionase
            filename  = experiments_folder + "/Transmitter/slotFR2_CH1_7.1_TX1.txt";
            break;
        case SPLIT_7_2:
            filename  = experiments_folder +  "/Transmitter/slotFR2_CH1_SP7.2_TX1.txt";
            break;
        case SPLIT_8:
            filename  = experiments_folder +  "/Transmitter/slotFR2_CH1_SP8_TX1.txt";
            break;
        default:
            filename  = experiments_folder +  "/Transmitter/slotFR2_CH1_SP7_TX1.txt";
    }

    std::vector<int16_t> tx_data=load_waveform_from_file(filename);
    std::vector<std::vector<int16_t>> slot_burst;

    int burst_size=10;
    for (int i = 0; i < burst_size; ++i) {
//        std::vector<uint8_t> temp;
  //      for (int16_t val : tx_data) {
    //        temp.push_back(static_cast<uint8_t>(val));  // Conversion with possible truncation
      //  }
        slot_burst.push_back(tx_data);
    }

    usleep(100);

    std::cout << "Starting experiment: " << std::endl;

    while(1){
        //Transmitting a burst of slots
        radio.stream->transmit(slot_burst,tx_data.size()*2);
        usleep(30);
    }

    std::cout << "Experiment is finished " << std::endl;

    return 1;
}