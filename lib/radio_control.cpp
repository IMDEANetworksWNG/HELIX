#include "../include/radio_control.h"
#include "../include/defines.h"
#include <cmath>
#include <iostream>

namespace helix {

static int getTBSFromTable(int NdInfo) {
    // Capture TS 38.214 Table 5.1.3.2-1
    std::vector<int> tbsTable = {
            24,   32,   40,   48,   56,   64,   72,   80,   88,   96,  104,  112,  120,  128,  136,  144,  152,  160,  168,  176,  184,  192,  208,  224,  240,  256,
            272,  288,  304,  320,  336,  352,  368,  384,  408,  432,  456,  480,  504,  528,  552,  576,  608,  640,  672,  704,  736,  768,  808,  848,  888,  928,
            984, 1032, 1064, 1128, 1160, 1192, 1224, 1256, 1288, 1320, 1352, 1416, 1480, 1544, 1608, 1672, 1736, 1800, 1864, 1928, 2024, 2088, 2152, 2216, 2280, 2408,
            2472, 2536, 2600, 2664, 2728, 2792, 2856, 2976, 3104, 3240, 3368, 3496, 3624, 3752, 3824
    };

    // Find the closest TBS value in the table that is not less than NdInfo
    auto it = std::lower_bound(tbsTable.begin(), tbsTable.end(), NdInfo);

    // If a match is found, return the value; otherwise, return the last value in the table
    return (it != tbsTable.end()) ? *it : tbsTable.back();
}

static int getTBS(const int mod_order,const int nPRB, const double R) {
    // Number of codewords
    int NREPerPRB=164;

    double NREPrime = double(NREPerPRB) - 6; //ptrs overhead
    int NRE = std::min(156.0,NREPrime)*double(nPRB);

    int tbs=0;

    int Ninfo=mod_order*NRE*R;

    if (Ninfo <= 3824) {
        int n = std::max(3, static_cast<int>(std::floor(std::log2(Ninfo)) - 6));
        // Calculate quantized intermediate number of information bits (Nd_info)
        int NdInfo = std::max(24, (1 << n) * (Ninfo / (1 << n)));
        // Get the TBS value using TS 38.214 Table 5.1.3.2-1
        tbs = getTBSFromTable(NdInfo);
    } else {
        int n = static_cast<int>(std::floor(std::log2(Ninfo - 24)) - 5);
        // Calculate quantized intermediate number of information bits (Nd_info)
        int NdInfo = std::max(3840, (1 << n) * static_cast<int>(std::round((Ninfo - 24.0) / (1 << n))));
        int C = 0;
        if (R <= 1.0 / 4.0) {
            C = std::ceil((NdInfo + 24.0) / 3816.0);
        } else {
            if (NdInfo > 8424) {
                C = std::ceil((NdInfo + 24.0) / 8424.0);
            } else {
                C = 1;
            }
        }
        // Calculate TBS
        tbs = 8 * C * std::ceil((NdInfo + 24.0) / (8.0 * C)) - 24;
    }

    return tbs;
}


void radio_control::set_streaming_param(stream_str params) {
    cmdManager->writeReg(STREAM_MANAGER_ADDR+CONTROL_UDP_IFG_OFFSET,params.udp_rx_ifg/STREAM_MANAGER_DATA_WIDTH_BYTES);
    cmdManager->writeReg(STREAM_MANAGER_ADDR+CONTROL_UDP_MSS_OFFSET,params.udp_rx_mss/STREAM_MANAGER_DATA_WIDTH_BYTES);

    cmd_struct cmd_str;
    cmd_str.cmd="configUDPServer ";
    cmd_str.cmdArgs.push_back(std::to_string(params.udp_rx_ifg));
    cmd_str.cmdArgs.push_back(std::to_string(params.udp_rx_mss));
    cmdManager->sendCmd(cmd_str,false);

    cmdManager->writeReg(STREAM_MANAGER_ADDR+CONTROL_TX_RADIO_MSS_OFFSET,params.radio_tx_mss/STREAM_MANAGER_DATA_WIDTH_BYTES);
    cmdManager->writeReg(STREAM_MANAGER_ADDR+CONTROL_TX_RADIO_IFG_OFFSET,params.radio_tx_ifg/STREAM_MANAGER_DATA_WIDTH_BYTES);
}

void radio_control::set_freq_band( std::vector<converter_conf> config) {
    for (auto & conf_str : config) {
        cmd_struct cmd_str;
        cmd_str.cmd="setNCOfreq ";
        cmd_str.cmdArgs.push_back(std::to_string(conf_str.adc_or_dac));
        cmd_str.cmdArgs.push_back(std::to_string(conf_str.tile));
        cmd_str.cmdArgs.push_back(std::to_string(conf_str.block));
        cmd_str.cmdArgs.push_back(std::to_string(conf_str.freq));
        cmd_str.cmdArgs.push_back(std::to_string(conf_str.last_tile));

        cmdManager->sendCmd(cmd_str,false);
    }
}

void radio_control::set_tx_ofdm_param(ofdm_str params) {
    uint32_t value = (params.CP1/2) | (params.CP2/2)<<9 | (params.num_OFDM_syms)<<18 | params.OFDM_Bypass<<25;
    cmdManager->writeReg(TX_OFDM_MOD_ADDR,value);

    value = (params.num_sc/SSR_ADC) | (params.nullSC/SSR_ADC)<<10;
    cmdManager->writeReg(TX_OFDM_MOD_ADDR+0x4,value);
}

void radio_control::set_tx_lbm_param(uint32_t size){
    int lookupTable[8] = {6, 0, 0, 2, 2, 4, 4, 6};
    int rem_samples = lookupTable[size%8];
    uint32_t value= (size/16) | (rem_samples)<<16;
    cmdManager->writeReg(TX_LBM_ADDR,value);
}

void radio_control::set_tx_buildGrid_param(ofdm_str ofdm_params, ptrs_str ptrs_params, dmrs_str dmrs_params, uint16_t offsetSSB){

    cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x68,false); //First configure the block and after enable the block
    cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x10,dmrs_params.symbol_index-1); // Tx support more than one DMRS symbol in the slot. But Rx support only one.
    cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x18,dmrs_params.symbol_index-1); // Repeat the symbol if there is only one DM-RS in the slot
    cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x20,ptrs_params.SSB_symbols[0]-1-1); //First symbol with SSB -2
    cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x28,ptrs_params.SSB_symbols[3]); //Last symbol with SSB
    cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x30,ofdm_params.num_sc-2-2); //Number of used subcarriers in the OFDM symbol
    cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x38,ofdm_params.num_OFDM_syms-1); //Number of OFDM symbols in the slot -1
    cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x40,dmrs_params.scs/2-1);
    cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x48,dmrs_params.offset); //Location of the first DMRS subcarrier in the slot
    cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x50,ptrs_params.offset); //Location of the first PTRS subcarrier in the slot (FIXED)
    cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x58,ptrs_params.SSB_index[0]-2);
    cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x60,ptrs_params.SSB_index[1]);
    cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x68,true);
}

void radio_control::set_tx_symbol_map_param(uint16_t mod_order, uint32_t num_sch){
    int leftover=0;
    int padblock=0;
    if ((num_sch*mod_order) % SSR_NR_PDSCH > 0){
        leftover = (num_sch*mod_order) % SSR_NR_PDSCH;
        padblock = SSR_NR_PDSCH-leftover ;
    }
    cmdManager->writeReg(TX_NR_PDSCH_ADDR+0x10,mod_order);
    cmdManager->writeReg(TX_NR_PDSCH_ADDR+0x18,(num_sch*mod_order + padblock)/64);
    cmdManager->writeReg(TX_NR_PDSCH_ADDR+0x20,leftover);
}

void radio_control::set_tx_filter_param(bool bw, float ifs) {
    cmdManager->writeReg(TX_UPSAMPLING_ADDR,static_cast<uint32_t>(ifs*SAMPLING_CLK_DAC));
    cmdManager->writeReg(TX_UPSAMPLING_ADDR+0x4,bw);
}

void radio_control::set_rx_cfo_correction_param(bool bw, bool enable, uint8_t scaling) {
    uint32_t value = bw | enable<<1 | scaling<<2;
    cmdManager->writeReg(RX_CFO_CORRECTION_ADDR,value);
}

void radio_control::set_rx_filter_param(bool bw) {
    cmdManager->writeReg(RX_FILTER_ADDR,bw);
}

void radio_control::set_rx_ssb_param(bool bw, ssb_sync_str params) {
    cmdManager->writeReg(RX_SSB_ADDR,params.ssb_sync);
    uint32_t value = bw | (params.slot_len/SSR_ADC)<<1;
    cmdManager->writeReg(RX_SSB_ADDR+0x4,value);
}

void radio_control::set_rx_ofdm_param(ofdm_str params) {
    uint32_t value = params.CP1 | (params.CP2)<<9 | (params.num_OFDM_syms)<<18;
    cmdManager->writeReg(RX_OFDM_DEMOD_ADDR,value);

    value = (OFDM_FFT_SIZE/SSR_ADC-params.num_sc/SSR_ADC-1) |(OFDM_FFT_SIZE/SSR_ADC+params.num_sc/SSR_ADC)<<12;
    cmdManager->writeReg(RX_OFDM_DEMOD_ADDR+0x4,value);
}

void radio_control::set_rx_ce_param(dmrs_str params) {
    uint32_t value = params.offset/SSR_ADC | (params.scs/SSR_ADC-1)<<4 | params.symbol_index<<9 | (params.num_sc_virtual/SSR_ADC)<<14;
    cmdManager->writeReg(RX_CE_BLOCK_ADDR,value);

    value = params.inv_num_dmrs |params.scaling_nVar<<16;
    cmdManager->writeReg(RX_CE_BLOCK_ADDR+0x4,value);
}

void radio_control::set_rx_eq_param(ofdm_str params) {
    uint32_t value = (params.num_sc/SSR_ADC) | (params.num_OFDM_syms-1)<<12;
    cmdManager->writeReg(RX_EQ_ADDR,value);
}

void radio_control::set_rx_agc_param(bool enable, int vref) {
    uint32_t value = vref | enable<<31;
    cmdManager->writeReg(RX_AGC_ADDR,value);
}

void radio_control::set_rx_phase_tracking_param(bool bw, ptrs_str ptrs_params, dmrs_str dmrs_params, ofdm_str ofdm_params) {
    uint32_t value = (dmrs_params.scs/SSR_ADC-dmrs_params.offset/SSR_ADC)-1 | (dmrs_params.scs/SSR_ADC-1)<<5 | dmrs_params.symbol_index<<10 | (ptrs_params.scs/SSR_ADC-1-ptrs_params.offset/SSR_ADC)<<15 |
                     (ptrs_params.scs/SSR_ADC-1)<<20 | ptrs_params.even<<25 | ofdm_params.num_OFDM_syms<<26 | bw<<31;
    cmdManager->writeReg(RX_PTRS_BLOCK_ADDR,value);

    value = (ofdm_params.num_sc/SSR_ADC) | ptrs_params.SSB_symbols[0]<<12 | ptrs_params.SSB_symbols[1]<<17 |
            ptrs_params.SSB_symbols[2]<<22 | ptrs_params.SSB_symbols[3]<<27;
    cmdManager->writeReg(RX_PTRS_BLOCK_ADDR+0x4,value);

    value = (static_cast<int>(ceil(static_cast<double>(ptrs_params.SSB_index[0]/SSR_ADC)))) | static_cast<int>(ceil(static_cast<double>(ptrs_params.SSB_index[1]/SSR_ADC))-1)<<12;
    cmdManager->writeReg(RX_PTRS_BLOCK_ADDR+0x8,value);
}

void radio_control::set_rx_demap_param(uint16_t num_blocks, uint16_t mod_order) {
    cmdManager->writeReg(RX_DEMAP_ADDR,mod_order);
}
/*void radio_control::set_rx_demap_param(uint16_t num_blocks, uint16_t mod_order) {
    cmdManager->writeReg(RX_DEMAP_ADDR,ceil((num_blocks*mod_order/4.0)));
}*/

void radio_control::set_rx_ldcp_param(ldpc_info params) {
    uint32_t value= params.regs.Kdm1 |
                    params.regs.Em1[0]<<11 |
                    params.regs.Em1[1]<<22;
    cmdManager->writeReg(RX_LDCP_DECODER_ADDR,value);

    value= params.regs.Em1[1] >> 10 |
           params.regs.Em1[2]<<1 |
           params.regs.Em1[3]<<12 |
           params.regs.Em1[4]<<23;
    cmdManager->writeReg(RX_LDCP_DECODER_ADDR+0x4,value);

    value= params.regs.Em1[4] >> 9 |
           params.regs.Em1[5]<< 2 |
           params.regs.E_F1<<13;
    cmdManager->writeReg(RX_LDCP_DECODER_ADDR+0x8,value);

    value= params.regs.E_F1 >> 19 |
           params.regs.E_L1 << 5 |
           params.regs.E_F2 << 29;
    cmdManager->writeReg(RX_LDCP_DECODER_ADDR+0xC,value);

    value= params.regs.E_F2 >> 3 |
           params.regs.E_L2 << 21;
    cmdManager->writeReg(RX_LDCP_DECODER_ADDR+0x10,value);

    value= params.regs.E_L2 >> 11 |
           params.regs.E_jump1 << 13 |
           params.regs.E_jump2 << 19 |
           params.regs.nPunctured << 25;
    cmdManager->writeReg(RX_LDCP_DECODER_ADDR+0x14,value);

    value= params.regs.lastPunctured |
           params.regs.Fm1 << 4 |
           params.regs.lastFillers << 15 |
           params.regs.nZeros[0] << 19 |
           params.regs.nZeros[1] << 30 ;
    cmdManager->writeReg(RX_LDCP_DECODER_ADDR+0x18,value);

    value= params.regs.nZeros[1] >> 2 |
           params.regs.nZeros[2] << 9 |
           params.regs.nZeros[3] << 20 |
           params.regs.nZeros[4] << 31 ;
    cmdManager->writeReg(RX_LDCP_DECODER_ADDR+0x1C,value);

    value= params.regs.nZeros[4] >> 1 |
           params.regs.nZeros[5] << 10 |
           params.regs.lastZeros << 21 ;
    cmdManager->writeReg(RX_LDCP_DECODER_ADDR+0x20,value);

    value= params.regs.lastZeros >> 11 |
           params.regs.CM1 << 13 |
           params.regs.ldpc_ctrl_regs << 16 ;
    cmdManager->writeReg(RX_LDCP_DECODER_ADDR+0x24,value);

    value= params.regs.ldpc_ctrl_regs >> 16 |
           params.regs.F_R << 24;
    cmdManager->writeReg(RX_LDCP_DECODER_ADDR+0x28,value);

    value= params.modFactor |
           params.padding << 4 |
           params.nLLRs_per_block << 8 ;
    cmdManager->writeReg(RX_LDCP_DECODER_ADDR+0x2C,value);

    value= params.regs.KdOffset[0] |
           params.regs.KdOffset[1] << 2 |
           params.regs.KdOffset[2] << 4 |
           params.regs.KdOffset[3] << 6 |
           params.regs.KdOffset[4] << 8 |
           params.regs.KdOffset[5]  << 10;
    cmdManager->writeReg(RX_LDCP_DECODER_ADDR+0x30,value);


}

void radio_control::set_tx_split_config(uint8_t split){
    cmd_struct cmd_str;
    cmd_str.cmd="changeTXsplit ";
    cmd_str.cmdArgs.push_back(std::to_string(split));
    cmdManager->sendCmd(cmd_str,false);
}

void radio_control::set_rx_split_config(uint8_t split){
    cmd_struct cmd_str;
    cmd_str.cmd="changeRXsplit ";
    cmd_str.cmdArgs.push_back(std::to_string(split));
    cmdManager->sendCmd(cmd_str,false);
}

void radio_control::set_dynamic_buffer_params(uint num_bytes){
    //uint32_t prog_full=((RX_FIFO_BYTES/2)-(RX_FIFO_BYTES%(num_bytes)))/8;
    cmdManager->writeReg(RX_DYNAMIC_BUFFER_ADDR,64*1024-num_bytes/8);
}

void radio_control::enable_rx_radio(bool enable) {
    cmd_struct cmd_str;
    cmd_str.cmd="enableRX ";
    cmd_str.cmdArgs.push_back(std::to_string(enable));
    cmdManager->sendCmd(cmd_str,false);
}

uint32_t radio_control::get_num_of_rx_bytes(uint8_t split) {
    uint32_t num_of_rx_bytes;
    switch(split){
        case SPLIT_6:
            num_of_rx_bytes=radio_config.ldpc_segmented_length/8;
            break;
        case SPLIT_7_3:
            switch (radio_config.mod_order) {
                case MOD_QPSK:
                    num_of_rx_bytes=(radio_config.num_ptrs+radio_config.num_sch)*4;
                    break;
                case MOD_16QAM:
                    num_of_rx_bytes=(radio_config.num_sch+4)*8;
                    break;
                case MOD_64QAM:
                    num_of_rx_bytes=(radio_config.num_sch+4)*16;
                    break;
                case MOD_256QAM:
                    num_of_rx_bytes=(radio_config.num_sch+4)*16;
                    break;
            }
            break;
        case SPLIT_7_2:
            num_of_rx_bytes=(radio_config.num_ptrs+radio_config.num_sch)*4;
            break;
        case SPLIT_7_2x:
            num_of_rx_bytes=radio_config.ofdm.num_sc*radio_config.ofdm.num_OFDM_syms*2*2;
            break;
        case SPLIT_8:
            num_of_rx_bytes=15474*8;
            break;
        default:
            num_of_rx_bytes=radio_config.ldpc_segmented_length/8;
    }
    return num_of_rx_bytes;
}

void radio_control::update_config_parameters(bool bw, int num_resource_elements, int mod_order, float rate, float tx_ifs){

    radio_config.bw=bw;

    radio_config.ofdm.OFDM_Bypass=false;
    radio_config.ofdm.CP1=400;
    radio_config.ofdm.CP2=144;
    radio_config.ofdm.num_OFDM_syms=14;
    radio_config.ofdm.N_RE=num_resource_elements;
    radio_config.ofdm.num_sc=radio_config.ofdm.N_RE*SUBCARRIERS_PER_RE;
    radio_config.ofdm.nullSC=2048-radio_config.ofdm.num_sc;

    radio_config.grid_size=radio_config.ofdm.num_sc*radio_config.ofdm.num_OFDM_syms;

    if ((radio_config.ofdm.num_sc/12) % 2 == 0)
        radio_config.offsetSSB = 0;
    else
        radio_config.offsetSSB = 6;


    //configure ssb block
    radio_config.num_ssb= SSB_BLOCK_RE*SSB_BLOCK_NUM_SYMBOLS*SUBCARRIERS_PER_RE+(radio_config.offsetSSB*2)*SSB_BLOCK_NUM_SYMBOLS;
    radio_config.synchronization.ssb_sync=10447;
    radio_config.synchronization.slot_len=30944;

    //configure channel estimation block
    radio_config.equalization.type =2;
    radio_config.equalization.offset=0;
    radio_config.equalization.scs=6;
    radio_config.equalization.symbol_index=3;
    radio_config.equalization.num_sc_virtual=(radio_config.ofdm.num_sc+22); //this variable is adding 22 "virtual" sc to the sides

    radio_config.num_dmrs=(radio_config.ofdm.N_RE)*NUM_DMRS_PER_RB_TYPE_2;
    int value = static_cast<int>(std::round(1.0/radio_config.num_dmrs * std::pow(2, 15)));
    radio_config.equalization.inv_num_dmrs=value;

    value = static_cast<int>(std::round(SCALING_NVAR/(radio_config.num_dmrs-1) * std::pow(2, 15)));
    radio_config.equalization.scaling_nVar=value;

    //configure phase tracking block
    radio_config.num_ptrs=ceil(static_cast<double>(radio_config.ofdm.N_RE/2.0))*(radio_config.ofdm.num_OFDM_syms-DMRS_SYM_LENGTH-SSB_BLOCK_NUM_SYMBOLS)+ceil((radio_config.ofdm.N_RE-SSB_BLOCK_RE-1)/2.0)*SSB_BLOCK_NUM_SYMBOLS;
    radio_config.phase_tracking.offset=0;
    radio_config.phase_tracking.scs=SUBCARRIERS_PER_RE*2;
    radio_config.phase_tracking.even=false;

    radio_config.phase_tracking.SSB_index[0]=(radio_config.ofdm.num_sc/2)-(SSB_BLOCK_RE*SUBCARRIERS_PER_RE/2)-radio_config.offsetSSB;
    radio_config.phase_tracking.SSB_index[1]=(radio_config.ofdm.num_sc/2)+(SSB_BLOCK_RE*SUBCARRIERS_PER_RE/2)+radio_config.offsetSSB;

    radio_config.phase_tracking.SSB_symbols[0]=9;
    radio_config.phase_tracking.SSB_symbols[1]=10;
    radio_config.phase_tracking.SSB_symbols[2]=11;
    radio_config.phase_tracking.SSB_symbols[3]=12;

    radio_config.tbs= getTBS(mod_order,num_resource_elements,rate);

    //configure demapper
    radio_config.num_sch= radio_config.grid_size-radio_config.num_dmrs-radio_config.num_ptrs-radio_config.num_ssb;
    radio_config.mod_order = mod_order;
    //configure ldpc decoder
    radio_config.code_rate= rate;

    radio_config.ifs=tx_ifs;
}


void radio_control::configure_rx_blocks(uint8_t rx_split){

    radio_config.rx_split=rx_split;
    set_rx_split_config(radio_config.rx_split);

    //automatic gain control
    set_rx_agc_param(true, 800);

    //cfo correction
    set_rx_cfo_correction_param(radio_config.bw,false,SCALE_FACTOR_DIV_1);

    //rx ofdm
    set_rx_ofdm_param(radio_config.ofdm);

    //filter configuration
    set_rx_filter_param(radio_config.bw);

    //configure ssb block
    set_rx_ssb_param(radio_config.bw,radio_config.synchronization);

    //configure channel estimation block
    set_rx_ce_param(radio_config.equalization);

    //configure equalization block
    set_rx_eq_param(radio_config.ofdm);

    //configure phase tracking
    set_rx_phase_tracking_param(radio_config.bw,radio_config.phase_tracking,radio_config.equalization,radio_config.ofdm);
    //configure demapper
    set_rx_demap_param(radio_config.num_sch, radio_config.mod_order);

    //configure ldpc decoder
    auto ldpc_config = get_LDPC_config(radio_config.tbs, radio_config.code_rate,radio_config.num_sch*radio_config.mod_order,radio_config.mod_order);
    radio_config.ldpc_segmented_length= ldpc_config.K*ldpc_config.C*ldpc_config.modFactor;
    set_rx_ldcp_param(ldpc_config);
}

void radio_control::configure_tx_blocks(uint8_t tx_split){

    radio_config.tx_split=tx_split;

    //configure functional splitting
    set_tx_split_config(radio_config.tx_split);

    //configure symbol mapping
    set_tx_symbol_map_param(radio_config.mod_order,radio_config.num_sch);

    //configure grid builder block
    set_tx_buildGrid_param(radio_config.ofdm,radio_config.phase_tracking,radio_config.equalization, radio_config.offsetSSB);

    //configure ofdm modulator
    set_tx_ofdm_param(radio_config.ofdm);

    //configure filter and ifs
    set_tx_filter_param(radio_config.bw,radio_config.ifs);


}

void radio_control::load_SSB(std::vector<int16_t> tx_data){
    set_tx_lbm_param(tx_data.size());
    stream->load_SSB_data(tx_data.data(),tx_data.size() * 2);
}

void radio_control::configure_radio(uint8_t rx_split, uint8_t tx_split, uint8_t bw, int num_resource_elements, uint8_t mod_order, float rate, float tx_ifs){
    enable_rx_radio(false);
    update_config_parameters(bw, num_resource_elements, mod_order, rate, tx_ifs);
    configure_rx_blocks(rx_split);
    configure_tx_blocks(tx_split);
    set_dynamic_buffer_params(get_num_of_rx_bytes(rx_split)); // the reg uses the same reset than the fifo
}

bool radio_control::init_platform() {
    cmd_struct cmd;
    cmd.cmd="initPlatform";
    uint32_t version=0;
    version = cmdManager->sendCmd(cmd, true);

    if(!version){
        return false;
    }
    std::cout << "Connected to platform with version: " << (char *) &version << "\n";

    return true;
}


} // helix