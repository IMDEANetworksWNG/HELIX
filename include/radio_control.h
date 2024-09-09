//
// Created by imdea on 29/05/2024.
//

#ifndef MIMORPH_RT_RADIO_CONTROL_H
#define MIMORPH_RT_RADIO_CONTROL_H

#include "cmd_manager.h"

namespace mimorph {

    struct converter_conf {
        float freq;
        bool  adc_or_dac;
        uint8_t tile;
        uint8_t block;
        bool last_tile;
    };

    struct stream_str {
        uint64_t radio_tx_mss;
        uint32_t radio_tx_ifg;

        uint32_t udp_rx_mss;
        uint32_t udp_rx_ifg;
    };

    struct ofdm_str {
        bool OFDM_Bypass;
        uint16_t CP1;
        uint16_t CP2;
        uint16_t NumOFDMSyms;

        uint16_t N_RE;
        uint16_t symPerSlot;
        uint16_t nullSC;
    };

    struct filter_str {
        float ifs;
        bool     bw;
    };


    class radio_control {

    public:
        void set_streaming_param(stream_str params);
        void set_ofdm_param(ofdm_str params);
        void set_filter_param(filter_str params);
        void set_freq_band( std::vector<converter_conf> config);
        explicit radio_control(cmd_manager* cmdManager):
            cmdManager(cmdManager) {
        }

        bool init_platform();

    private:
            cmd_manager* cmdManager;
    };

} // mimorph

#endif //MIMORPH_RT_RADIO_CONTROL_H
