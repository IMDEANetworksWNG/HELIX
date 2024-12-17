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

void configure_rx_blocks(mimorph::mimorph& radio, bool bw, uint8_t rx_split, int num_resource_elements, int mod_order, float rate, int num_psch_symbs){

    auto* radio_config=radio.control->get_radio_config();
    radio_config->bw=bw;

    radio_config->rx_split=rx_split;
    radio.control->set_rx_split_config(radio_config->rx_split);

    //cfo correction
    radio.control->set_rx_cfo_correction_param(radio_config->bw,true,SCALE_FACTOR_DIV_2);

    radio_config->ofdm.OFDM_Bypass=false;
    radio_config->ofdm.CP1=400;
    radio_config->ofdm.CP2=144;
    radio_config->ofdm.NumOFDMSyms=14;
    radio_config->ofdm.N_RE=num_resource_elements; //72 145
    radio_config->ofdm.num_sc=radio_config->ofdm.N_RE*12;
    radio_config->ofdm.nullSC=2048-radio_config->ofdm.num_sc;
    radio.control->set_rx_ofdm_param(radio_config->ofdm);

    if ((radio_config->ofdm.num_sc/12) % 2 == 0)
        radio_config->offsetSSB = 0;
    else
        radio_config->offsetSSB = 6;

    //filter configuration
    radio.control->set_rx_filter_param(radio_config->bw);

    //configure ssb block
    radio_config->synchronization.ssb_sync=10447;
    radio_config->synchronization.slot_len=30944;
    radio.control->set_rx_ssb_param(bw,radio_config->synchronization);

    //configure channel estimation block
    radio_config->equalization.offset=0;
    radio_config->equalization.scs=6;
    radio_config->equalization.symbol_index=3;
    radio_config->equalization.num_sc_virtual=(radio_config->ofdm.num_sc+22); //this variable is adding 22 "virtual" sc to the sides

    int num_dmrs=(radio_config->ofdm.N_RE)*NUM_DMRS_PER_RB;
    int value = static_cast<int>(std::round(1.0/num_dmrs * std::pow(2, 15)));
    radio_config->equalization.inv_num_dmrs=value;

    value = static_cast<int>(std::round(SCALING_NVAR/(num_dmrs-1) * std::pow(2, 15)));
    radio_config->equalization.scaling_nVar=value;
    radio.control->set_rx_ce_param(radio_config->equalization);

    //configure equalization block
    radio.control->set_rx_eq_param(radio_config->ofdm);

    //configure phase tracking block
    radio_config->phase_tracking.offset=0;
    radio_config->phase_tracking.scs=12*2;
    radio_config->phase_tracking.even=false;
    radio_config->phase_tracking.SSB_index[0]=751-radio_config->equalization.scs-1;
    radio_config->phase_tracking.SSB_index[1]=990+radio_config->equalization.scs;

    radio_config->phase_tracking.SSB_symbols[0]=9;
    radio_config->phase_tracking.SSB_symbols[1]=10;
    radio_config->phase_tracking.SSB_symbols[2]=11;
    radio_config->phase_tracking.SSB_symbols[3]=12;
    radio.control->set_rx_phase_tracking_param(bw,radio_config->phase_tracking,radio_config->equalization,radio_config->ofdm);

    radio_config->tbs= getTBS(mod_order,num_resource_elements,rate);

    //configure demapper
    radio_config->num_sch_sym=num_psch_symbs;
    radio_config->mod_order = mod_order;
    radio.control->set_rx_demap_param(radio_config->num_sch_sym, radio_config->mod_order);

    //configure ldpc decoder
    radio_config->code_rate= rate;
    auto ldpc_config = get_LDPC_config(radio_config->tbs, radio_config->code_rate,radio_config->num_sch_sym*radio_config->mod_order,radio_config->mod_order);
    radio_config->ldpc_segmented_length= ldpc_config.K*ldpc_config.C;
    radio.control->set_rx_ldcp_param(ldpc_config);
}


void configure_tx_blocks(mimorph::mimorph& radio, bool bw, uint8_t tx_split){

    auto* radio_config=radio.control->get_radio_config();
    radio_config->bw=bw;
    radio_config->tx_split=tx_split;
    radio.control->set_tx_split_config(radio_config->tx_split);

    radio.control->set_tx_buildGrid_param(radio_config->ofdm,radio_config->phase_tracking,radio_config->equalization, radio_config->offsetSSB);
    //Load SSB data into the memory
    std::string filename = experiments_folder +  "/slotFR2_CH1_SSB_TX1.txt";
    std::vector<int16_t> tx_data = load_waveform_from_file(filename);
    radio.control->set_tx_lbm_param(tx_data.size());
    radio.stream->load_SSB_data(tx_data.data(),tx_data.size() * 2);

    //radio.control->set_tx_ofdm_param(radio_config->ofdm);
    radio.control->set_tx_ofdm_param(radio_config->ofdm);
    radio_config->ifs=0;
    radio.control->set_tx_filter_param(radio_config->bw,radio_config->ifs);

    radio.control->set_tx_nrPDSCH(radio_config->mod_order,radio_config->num_sch_sym);
}

int main() {
    //set task priority
    set_scheduler_options();

    //initialize platform with IP
    auto radio = mimorph::mimorph(fpga_ip);

    //configure streaming parameters //TO DO: separar TX y RX en udp y radio
    mimorph::stream_str stream_config{};

    uint8_t tx_split = SPLIT_8;

    //set radio ifg and mss
    stream_config.udp_rx_mss = 1024 * 8;
    stream_config.udp_rx_ifg = stream_config.udp_rx_mss / 10;
    stream_config.radio_tx_mss = pow(2, 32) * 8 - 1;
    stream_config.radio_tx_ifg = 0;
    radio.control->set_streaming_param(stream_config);

    //low 318 -- med 490 -- high 768 -- vh 921 // 73 and 145 RE //21867 -- 10527
    //configure_rx_blocks(radio,BW_MODE_HIGH,tx_split,73,MOD_QPSK,490.0/1024, 10527);
    configure_rx_blocks(radio, BW_MODE_HIGH, tx_split, 80, MOD_QPSK, 490.0 / 1024, 11680);
    configure_tx_blocks(radio, BW_MODE_HIGH, tx_split);

    //Set the frequency bands of the different converters
    std::vector<mimorph::converter_conf> conv_conf = create_conv_conf();
    radio.control->set_freq_band(conv_conf);

    //Load data to send
    std::string filename;
    switch (tx_split) {
        case SPLIT_7:
            filename = experiments_folder + "/slotFR2_CH1_7_TX1.txt";
            break;
        case SPLIT_7_1: //este paquete tenia un padding de 0s que hacia que no funcionase
            filename = experiments_folder + "/slotFR2_CH1_7.1_TX1.txt";
            break;
        case SPLIT_7_2:
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