//
// Created by imdea on 29/05/2024.
//

#include "../include/radio_control.h"
#include "../include/defines.h"
#include <cmath>
#include <iostream>

namespace mimorph {

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
    uint32_t value = (params.CP1/2) | (params.CP2/2)<<9 | (params.NumOFDMSyms)<<18 | params.OFDM_Bypass<<25;
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
        cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x38,ofdm_params.NumOFDMSyms-1); //Number of OFDM symbols in the slot -1
        cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x40,dmrs_params.scs/2-1);
        cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x48,dmrs_params.offset); //Location of the first DMRS subcarrier in the slot
        cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x50,ptrs_params.offset); //Location of the first PTRS subcarrier in the slot (FIXED)
        cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x58,ptrs_params.SSB_index[0]-2);
        cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x60,ptrs_params.SSB_index[1]);
        cmdManager->writeReg(TX_BUILD_GRID_ADDR+0x68,true);
}

    void radio_control::set_tx_nrPDSCH(uint16_t mod_order, uint32_t num_bits, uint32_t left_bits){
        cmdManager->writeReg(TX_NR_PDSCH_ADDR+0x10,mod_order);
        cmdManager->writeReg(TX_NR_PDSCH_ADDR+0x18,num_bits/64);
        cmdManager->writeReg(TX_NR_PDSCH_ADDR+0x20,left_bits);
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
    uint32_t value = params.CP1 | (params.CP2)<<9 | (params.NumOFDMSyms)<<18;
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
    uint32_t value = (params.num_sc/SSR_ADC) | (params.NumOFDMSyms-1)<<12;
    cmdManager->writeReg(RX_EQ_ADDR,value);
}

void radio_control::set_rx_phase_tracking_param(bool bw, ptrs_str ptrs_params, dmrs_str dmrs_params, ofdm_str ofdm_params) {
    uint32_t value = (dmrs_params.scs/SSR_ADC-dmrs_params.offset/SSR_ADC)-1 | (dmrs_params.scs/SSR_ADC-1)<<5 | dmrs_params.symbol_index<<10 | (ptrs_params.scs/SSR_ADC-1-ptrs_params.offset/SSR_ADC)<<15 |
            (ptrs_params.scs/SSR_ADC-1)<<20 | ptrs_params.even<<25 | ofdm_params.NumOFDMSyms<<26 | bw<<31;
    cmdManager->writeReg(RX_PTRS_BLOCK_ADDR,value);

    value = (ofdm_params.num_sc/SSR_ADC) | ptrs_params.SSB_symbols[0]<<12 | ptrs_params.SSB_symbols[1]<<17 |
            ptrs_params.SSB_symbols[2]<<22 | ptrs_params.SSB_symbols[3]<<27;
    cmdManager->writeReg(RX_PTRS_BLOCK_ADDR+0x4,value);

    value = (static_cast<int>(ceil(static_cast<double>(ptrs_params.SSB_index[0]/SSR_ADC)))) | static_cast<int>(ceil(static_cast<double>(ptrs_params.SSB_index[1]/SSR_ADC))-1)<<12;
    cmdManager->writeReg(RX_PTRS_BLOCK_ADDR+0x8,value);
}

void radio_control::set_rx_demap_param(uint16_t num_blocks, uint16_t mod_order) {
    cmdManager->writeReg(RX_DEMAP_ADDR+0x10,mod_order);
}

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


} // mimorph