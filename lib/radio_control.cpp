//
// Created by imdea on 29/05/2024.
//

#include "../include/radio_control.h"
#include "../include/defines.h"

namespace mimorph {

void radio_control::set_streaming_param(stream_str params) {
    cmdManager->writeReg(STREAM_MANAGER_ADDR+CONTROL_UDP_IFG_OFFSET,params.udp_rx_ifg/STREAM_MANAGER_DATA_WIDTH_BYTES);
    cmdManager->writeReg(STREAM_MANAGER_ADDR+CONTROL_UDP_MSS_OFFSET,params.udp_rx_mss/STREAM_MANAGER_DATA_WIDTH_BYTES);

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

void radio_control::set_tx_filter_param(filter_str params) {
    cmdManager->writeReg(TX_UPSAMPLING_ADDR+TX_IFS_OFFSET,static_cast<uint32_t>(params.ifs*SAMPLING_CLK_DAC));
    cmdManager->writeReg(TX_UPSAMPLING_ADDR+TX_BW_OFFSET,params.bw);
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
    uint32_t value = (dmrs_params.scs/SSR_ADC-dmrs_params.offset/SSR_ADC)-1 | (dmrs_params.scs/SSR_ADC-1)<<5 | dmrs_params.symbol_index<<10 | (ptrs_params.scs/SSR_ADC-ptrs_params.offset/SSR_ADC)<<15 |
            (ptrs_params.scs/SSR_ADC-1)<<20 | ptrs_params.even<<25 | ofdm_params.NumOFDMSyms<<26 | bw<<31;
    cmdManager->writeReg(RX_PTRS_BLOCK_ADDR,value);

    value = (ofdm_params.num_sc/SSR_ADC) | ptrs_params.SSB_symbols[0]<<12 | ptrs_params.SSB_symbols[1]<<17 |
            ptrs_params.SSB_symbols[2]<<22 | ptrs_params.SSB_symbols[3]<<27;
    cmdManager->writeReg(RX_PTRS_BLOCK_ADDR+0x4,value);

    value = (ptrs_params.SSB_index[0]/SSR_ADC) | (ptrs_params.SSB_index[1]/SSR_ADC-1)<<12;
    cmdManager->writeReg(RX_PTRS_BLOCK_ADDR+0x8,value);
}

    void radio_control::set_rx_demap_param(uint16_t num_blocks) {
        cmdManager->writeReg(RX_DEMAP_ADDR,num_blocks);
    }


bool radio_control::init_platform() {
    cmd_struct cmd;
    cmd.cmd="initPlatform";
    uint32_t version=0;
    version = cmdManager->sendCmd(cmd, true);

    if(!version){
        std::cout << "Platform unavailable";
        return false;
    }
    std::cout << "Connected to platform with version: " << (char *) &version << "\n";

    return true;
}


} // mimorph