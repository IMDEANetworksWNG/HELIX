//
// Created by imdea on 29/05/2024.
//

#ifndef MIMORPH_RT_RADIO_CONTROL_H
#define MIMORPH_RT_RADIO_CONTROL_H

#include "cmd_manager.h"
#include "streamer.h"
#include "ldpc_configuration.h"

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
        uint16_t num_OFDM_syms;

        uint16_t N_RE;
        uint16_t num_sc;
        uint16_t nullSC;
    };

    struct filter_str {
        float ifs;
        bool     bw;
    };


    struct ssb_sync_str {
        uint32_t    ssb_sync;
        uint32_t    slot_len;

    };

    struct  dmrs_str{
        uint8_t     type; // Type 1: 6 DM-RS subcarriers per PRB -> {0, 2, 4, 6, 8, 10} ....   Type 2: 4 DM-RS subcarriers per PRB -> {0, 1, 6, 7}
        uint8_t     offset; // Offset of the first DMRS subcarrier from the start of the ofdm symbol
        uint8_t     scs; //subcarrier spacing for the DMRS subcarriers
        uint16_t    symbol_index; //OFDM symbol in the slot where the DMRS subcarriers are located
        uint16_t    num_sc_virtual;
        uint16_t    inv_num_dmrs;
        uint16_t    scaling_nVar;
    };

    struct  ptrs_str{
        uint8_t     offset;
        uint8_t     scs;
        bool        even;
        uint8_t     SSB_symbols[4]; //beggining-end of the SSB block in terms of symbols
        uint16_t    SSB_index[2]; //beggining-end of the SSB block in terms of sc
    };

    struct  radio_config_str{
        uint8_t             tx_split;
        uint8_t             rx_split;
        bool                bw;
        ptrs_str            phase_tracking;
        dmrs_str            equalization;
        ssb_sync_str        synchronization;
        ofdm_str            ofdm;
        uint32_t            tbs;
        uint32_t            num_sch;
        uint32_t            num_ssb;
        uint32_t            num_dmrs;
        uint32_t            num_ptrs;
        uint32_t            grid_size;
        uint16_t            mod_order;
        uint16_t            offsetSSB;
        uint32_t            ldpc_segmented_length;
        float               ifs; //inter-frame spacing at tx
        float               code_rate; //inter-frame spacing at tx
    };

    class radio_control {

    public:
        void set_streaming_param(stream_str params);
        void set_freq_band( std::vector<converter_conf> config);
        void set_tx_split_config(uint8_t split);
        void set_rx_split_config(uint8_t split);
        void configure_radio(uint8_t rx_split, uint8_t tx_split, uint8_t bw, int num_resource_elements, uint8_t mod_order, float rate, float tx_ifs);
        void load_SSB(std::vector<int16_t> tx_data);
        uint32_t  get_num_of_rx_bytes(uint8_t split);

        radio_config_str* get_radio_config(){
            return &radio_config;
        }

        explicit radio_control(cmd_manager* cmdManager, streamer* stream):
            cmdManager(cmdManager),
            stream(stream),
            radio_config()
            {
        }

        bool init_platform();

    private:
            cmd_manager* cmdManager;
            streamer* stream;
            radio_config_str radio_config;
            void configure_tx_blocks(uint8_t tx_split);
            void configure_rx_blocks(uint8_t rx_split);
            void update_config_parameters(bool bw, int num_resource_elements, int mod_order, float rate, float tx_ifs);

            void set_rx_cfo_correction_param(bool bw, bool enable, uint8_t scaling);
            void set_rx_filter_param(bool bw);
            void set_rx_ssb_param(bool bw, ssb_sync_str params);
            void set_rx_ofdm_param(ofdm_str params);
            void set_rx_ce_param(dmrs_str params);
            void set_rx_eq_param(ofdm_str params);
            void set_rx_phase_tracking_param(bool bw, ptrs_str ptrs_params, dmrs_str dmrs_params, ofdm_str ofdm_params);
            void set_rx_demap_param(uint16_t num_blocks, uint16_t mod_order);
            void set_rx_ldcp_param(ldpc_info params);

            void set_tx_ofdm_param(ofdm_str params);
            void set_tx_filter_param(bool bw, float ifs);
            void set_tx_lbm_param(uint32_t size);
            void set_tx_buildGrid_param(ofdm_str ofdm_params, ptrs_str ptrs_params, dmrs_str dmrs_params, uint16_t offsetSSB);
            void set_tx_symbol_map_param(uint16_t mod_order, uint32_t num_sch);
    };

} // mimorph

#endif //MIMORPH_RT_RADIO_CONTROL_H
