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

void radio_control::set_ofdm_param(ofdm_str params) {
    uint32_t value = params.CP1/2 | (params.CP2/2)<<9 | (params.NumOFDMSyms)<<18 | params.OFDM_Bypass<<25;
    cmdManager->writeReg(OFDM_MOD_ADDR,value);

    value = params.symPerSlot/2 | params.nullSC/2<<10;
    cmdManager->writeReg(OFDM_MOD_ADDR+0x4,value);
}

void radio_control::set_filter_param(filter_str params) {
    cmdManager->writeReg(TX_UPSAMPLING_ADDR+TX_IFS_OFFSET,static_cast<uint32_t>(params.ifs*SAMPLING_CLK_DAC));
    cmdManager->writeReg(TX_UPSAMPLING_ADDR+TX_BW_OFFSET,params.bw);
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