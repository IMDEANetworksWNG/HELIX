#include "../include/mimorph.h"
#include "../include/defines.h"
#include "helpers.h"
#include <iostream>
#include <vector>
#include <string>
#include <unistd.h>
#include <chrono>
#include <cmath>

const char* fpga_ip = "192.168.5.128"; // Replace with the actual server IP
const std::string  experiments_folder = "/home/rafael/Mobisys25_experiments/";

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
    radio.control->set_rx_cfo_correction_param(radio_config->bw,true,SCALE_FACTOR_DIV_4);

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


int main() {
    //set task priority
    set_scheduler_options();

    //initialize platform with IP
    auto radio=mimorph::mimorph(fpga_ip);

    //configure streaming parameters //TO DO: separar TX y RX en udp y radio
    mimorph::stream_str stream_config{};

    uint8_t rx_split=SPLIT_6;

    //set udp ifg and mss
    stream_config.udp_rx_mss=1024*8;
    stream_config.udp_rx_ifg=stream_config.udp_rx_mss/10;

    radio.control->set_streaming_param(stream_config);

    //low 318 -- med 490 -- high 768 -- vh 921 // 73 and 145 RE //21867 -- 10527
    configure_rx_blocks(radio,BW_MODE_HIGH,rx_split,145,MOD_256QAM,490.0/1024, 21867);
    auto radio_parameters=radio.control->get_radio_config();

    //Set the frequency bands of the different converters
    std::vector<mimorph::converter_conf> conv_conf=create_conv_conf();
    radio.control->set_freq_band(conv_conf);

    int num_of_rx_bytes;
    switch(rx_split){
        case SPLIT_6:
            num_of_rx_bytes=radio_parameters->ldpc_segmented_length/8;
            break;
        case SPLIT_7_3:
            num_of_rx_bytes=45544*2; //22888 -- 45544
            break;
        case SPLIT_7_2:
            num_of_rx_bytes=45544*2; //22888 -- 45544
            break;
        case SPLIT_7_2x:
            num_of_rx_bytes=radio_parameters->ofdm.num_sc*radio_parameters->ofdm.NumOFDMSyms*2*2;
            break;
        case SPLIT_8:
            num_of_rx_bytes=15474*8;
            break;
        default:
            num_of_rx_bytes=radio_parameters->ldpc_segmented_length/8;
    }

    auto* radio_config=radio.control->get_radio_config();
    mimorph::slot_str rx_data(num_of_rx_bytes,radio_config->ofdm.num_sc*4);

    int n_packets=10;
    int n_recv_pkts=0;
    int n_ce_err=0;

    std::cout << "Starting experiment as Receiver: " << std::endl;


    while(1){
        radio.stream->receive(&rx_data,num_of_rx_bytes,false,false,false);
        if(!rx_data.data.empty()) {
            std::cout << "Packet received. Number of bytes " << rx_data.data.size() << std::endl;
            rx_data.data.clear();
            rx_data.data.resize(num_of_rx_bytes);
            break;
        }
        usleep(100);
        rx_data.data.resize(num_of_rx_bytes);
        for (int i = 0; i < 1; ++i) {
            rx_data.data.resize(num_of_rx_bytes);
        }
    }

    auto start = std::chrono::high_resolution_clock::now();
    for(int i=0;i<n_packets;i++){
        radio.stream->receive(&rx_data,num_of_rx_bytes,false, false,false);
        if(!rx_data.data.empty()){
            n_recv_pkts++;
        }
        rx_data.data.clear();
        rx_data.data.resize(num_of_rx_bytes);
    }

    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    std::cout << "Elapsed time: " << duration.count() << " microseconds" << std::endl;

    int bytes_per_slot=radio_config->tbs/8; //5122 -- 2688 -- 2496 -- 1345

    auto tp = static_cast<double>(1.0*(n_recv_pkts)*bytes_per_slot*8/ duration.count());
    std::cout << "Recv packets: " << n_recv_pkts << "/" << n_packets << std::endl;
    std::cout << "Measured throughput is : " << tp << "Mbps" << std::endl;
    return 1;
}
