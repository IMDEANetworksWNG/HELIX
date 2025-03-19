#ifndef HELIX_RADIO_CONTROL_H
#define HELIX_RADIO_CONTROL_H

#include "cmd_manager.h"
#include "streamer.h"
#include "ldpc_configuration.h"
#include <cstdint>
#include <vector>

namespace helix {

    /**
     * @struct converter_conf
     * @brief Structure to store configuration information for a frequency converter (ADC or DAC).
     */
    struct converter_conf {
        /** @brief Frequency in Hz. */
        float freq;
        /** @brief True if it's an ADC, false if it's a DAC. */
        bool  adc_or_dac;
        /** @brief Tile number. */
        uint8_t tile;
        /** @brief Block number. */
        uint8_t block;
        /** @brief Flag indicating if this is the last tile in a sequence. */
        bool last_tile;
    };

    /**
     * @struct stream_str
     * @brief Structure to store streaming parameters.
     */
    struct stream_str {
        /** @brief Radio transmit Maximum Segment Size in bytes. */
        uint64_t radio_tx_mss;
        /** @brief Radio transmit Inter-Frame Gap in clock cycles. */
        uint32_t radio_tx_ifg;

        /** @brief UDP receive Maximum Segment Size in bytes. So far it only works for 8192 Bytes */
        uint32_t udp_rx_mss;
        /** @brief UDP receive Inter-Frame Gap in clock cycles. */
        uint32_t udp_rx_ifg;
    };

    /**
     * @struct ofdm_str
     * @brief Structure to store OFDM modulation parameters.
     */
    struct ofdm_str {
        /** @brief Bypass OFDM modulation (for testing purposes). */
        bool OFDM_Bypass;
        /** @brief Cyclic prefix length for the first symbol. */
        uint16_t CP1;
        /** @brief Cyclic prefix length for subsequent symbols. */
        uint16_t CP2;
        /** @brief Number of OFDM symbols in a slot. */
        uint16_t num_OFDM_syms;

        /** @brief Number of Resource Elements (REs). */
        uint16_t N_RE;
        /** @brief Number of subcarriers. */
        uint16_t num_sc;
        /** @brief Number of null subcarriers. */
        uint16_t nullSC;
    };

    /**
     * @struct filter_str
     * @brief Structure to store filter parameters.
     */
    struct filter_str {
        /** @brief Intermediate Frequency Spacing. */
        float ifs;
        /** @brief Bandwidth. */
        bool     bw;
    };

    /**
     * @struct ssb_sync_str
     * @brief Structure to store SSB (Synchronization Signal Block) synchronization parameters.
     */
    struct ssb_sync_str {
        /** @brief SSB synchronization value. */
        uint32_t    ssb_sync;
        /** @brief Slot length. */
        uint32_t    slot_len;
    };

    /**
     * @struct dmrs_str
     * @brief Structure to store DM-RS (Demodulation Reference Signal) parameters.
     */
    struct  dmrs_str{
        /** @brief DM-RS type (1 or 2).  Determines the subcarrier pattern. */
        uint8_t     type;
        /** @brief Offset of the first DM-RS subcarrier from the start of the OFDM symbol. */
        uint8_t     offset;
        /** @brief Subcarrier spacing for the DM-RS subcarriers. */
        uint8_t     scs;
        /** @brief OFDM symbol index in the slot where the DM-RS subcarriers are located. */
        uint16_t    symbol_index;
        /** @brief Number of virtual subcarriers used for channel estimation. */
        uint16_t    num_sc_virtual;
        /** @brief Inverse of the number of DM-RS subcarriers, scaled. */
        uint16_t    inv_num_dmrs;
        /** @brief Scaling factor for noise variance. */
        uint16_t    scaling_nVar;
    };

    /**
     * @struct ptrs_str
     * @brief Structure to store PT-RS (Phase-Tracking Reference Signal) parameters.
     */
    struct  ptrs_str{
        /** @brief Offset of the first PT-RS subcarrier from the start of the OFDM symbol. */
        uint8_t     offset;
        /** @brief Subcarrier spacing for the PT-RS subcarriers. */
        uint8_t     scs;
        /** @brief Flag indicating if the PT-RS pattern is even or odd. */
        bool        even;
        /** @brief Array of symbols where the SSB block is located. */
        uint8_t     SSB_symbols[4];
        /** @brief Array of subcarrier indexes for the start and end of the SSB block. */
        uint16_t    SSB_index[2];
    };

    /**
     * @struct radio_config_str
     * @brief Structure to store the overall radio configuration.
     */
    struct  radio_config_str{
        /** @brief Transmit functional split configuration. */
        uint8_t             tx_split;
        /** @brief Receive functional split configuration. */
        uint8_t             rx_split;
        /** @brief Bandwidth. */
        bool                bw;
        /** @brief Phase tracking parameters. */
        ptrs_str            phase_tracking;
        /** @brief Equalization parameters. */
        dmrs_str            equalization;
        /** @brief SSB synchronization parameters. */
        ssb_sync_str        synchronization;
        /** @brief OFDM modulation parameters. */
        ofdm_str            ofdm;
        /** @brief Transport block size. */
        uint32_t            tbs;
        /** @brief Number of DL-UL schedule channel (SCH) resource blocks. */
        uint32_t            num_sch;
        /** @brief Number of SSB resource blocks. */
        uint32_t            num_ssb;
        /** @brief Number of DM-RS resource blocks. */
        uint32_t            num_dmrs;
        /** @brief Number of PT-RS resource blocks. */
        uint32_t            num_ptrs;
        /** @brief Total grid size. */
        uint32_t            grid_size;
        /** @brief Modulation order (e.g., 2 for QPSK, 4 for 16QAM, 6 for 64QAM). */
        uint16_t            mod_order;
        /** @brief SSB offset. It will differ if the NRE is even or odd */
        uint16_t            offsetSSB;
        /** @brief Length of the LDPC encoded segment. */
        uint32_t            ldpc_segmented_length;
        /** @brief Inter-frame spacing at the transmitter in clock cycles. */
        float               ifs;
        /** @brief Code rate. */
        float               code_rate;
        /** @brief Flag to enable AGC (Automatic Gain Control). */
        bool                agc_enabled;
        /** @brief AGC reference voltage. */
        int                 agc_vref;
    };

    /**
     * @class radio_control
     * @brief Class for controlling the radio parameters and configuring the different blocks in the system.
     */
    class radio_control {

    public:
        /**
         * @brief Sets the streaming parameters.
         *
         * @param params Structure containing the streaming parameters.
         */
        void set_streaming_param(stream_str params);
        /**
         * @brief Sets the frequency band for the ADCs and DACs.
         *
         * @param config Vector of converter configuration structures.
         */
        void set_freq_band( std::vector<converter_conf> config);
        /**
         * @brief Sets the transmit functional split configuration.
         *
         * @param split Split configuration value.
         */
        void set_tx_split_config(uint8_t split);
        /**
         * @brief Sets the receive functional split configuration.
         *
         * @param split Split configuration value.
         */
        void set_rx_split_config(uint8_t split);
        /**
         * @brief Configures the radio with the specified parameters.
         *
         * @param rx_split              Receive functional split configuration. Split {6,7.3,7.2,7.2x,8}
         * @param tx_split              Transmit functional split configuration. Split {7.3,7.2,7.2x,8}
         * @param bw                    subcarrier spacing option - 30KHz or 240KHz
         * @param num_resource_elements Number of resource elements.
         * @param mod_order             Modulation order.
         * @param rate                  Code rate.
         * @param tx_ifs                Inter-frame spacing at the transmitter. Value '0' will set a flexible inter-frame spacing.
         */
        void configure_radio(uint8_t rx_split, uint8_t tx_split, uint8_t bw, int num_resource_elements, uint8_t mod_order, float rate, float tx_ifs);
        /**
         * @brief Loads the SSB (Synchronization Signal Block) data in the transmitter.
         *
         * @param tx_data Vector containing the SSB data.
         */
        void load_SSB(std::vector<int16_t> tx_data);
        /**
         * @brief Gets the number of bytes to receive based on the split configuration.
         *
         * @param split Split configuration value.
         * @return      Number of bytes to receive.
         */
        uint32_t  get_num_of_rx_bytes(uint8_t split);
        /**
         * @brief Enables or disables the receiver radio.
         *
         * @param enable True to enable, false to disable.
         */
        void enable_rx_radio(bool enable);

        /**
         * @brief Returns a pointer to the radio configuration structure.
         *
         * @return Pointer to the radio_config_str structure.
         */
        radio_config_str* get_radio_config(){
            return &radio_config;
        }

        /**
         * @brief Constructor for the radio_control class.
         *
         * @param cmdManager Pointer to the command manager.
         * @param stream     Pointer to the streamer.
         */
        explicit radio_control(cmd_manager* cmdManager, streamer* stream):
            cmdManager(cmdManager),
            stream(stream),
            radio_config()
            {
        }

        /**
         * @brief Initializes the platform by sending a command and retrieving the version.
         *
         * @return True if the platform was initialized successfully, false otherwise.
         */
        bool init_platform();

    private:
        /** @brief Pointer to the command manager. */
        cmd_manager* cmdManager;
        /** @brief Pointer to the streamer. */
        streamer* stream;
        /** @brief Radio configuration structure. */
        radio_config_str radio_config;

        /**
         * @brief Configures the transmit blocks.
         *
         * @param tx_split Transmit functional split configuration.
         */
        void configure_tx_blocks(uint8_t tx_split);
        /**
         * @brief Configures the receive blocks.
         *
         * @param rx_split Receive functional split configuration.
         */
        void configure_rx_blocks(uint8_t rx_split);
        /**
         * @brief Updates the radio configuration parameters.
         *
         * @param bw                    Bandwidth.
         * @param num_resource_elements Number of resource elements.
         * @param mod_order             Modulation order.
         * @param rate                  Code rate.
         * @param tx_ifs                Inter-frame spacing at the transmitter.
         */
        void update_config_parameters(bool bw, int num_resource_elements, int mod_order, float rate, float tx_ifs);

        /**
         * @brief Sets the receive CFO (Carrier Frequency Offset) correction parameters.
         *
         * @param bw      Bandwidth.
         * @param enable  Enable flag.
         * @param scaling Scaling factor.
         */
        void set_rx_cfo_correction_param(bool bw, bool enable, uint8_t scaling);
        /**
         * @brief Sets the receive filter parameter (bandwidth).
         *
         * @param bw Bandwidth.
         */
        void set_rx_filter_param(bool bw);
        /**
         * @brief Sets the receive SSB (Synchronization Signal Block) parameters.
         *
         * @param bw     Bandwidth.
         * @param params SSB synchronization parameters.
         */
        void set_rx_ssb_param(bool bw, ssb_sync_str params);
        /**
         * @brief Sets the receive OFDM parameters.
         *
         * @param params OFDM parameters.
         */
        void set_rx_ofdm_param(ofdm_str params);
        /**
         * @brief Sets the receive channel estimation parameters.
         *
         * @param params Channel estimation parameters.
         */
        void set_rx_ce_param(dmrs_str params);
        /**
         * @brief Sets the receive equalization parameters.
         *
         * @param params OFDM parameters.
         */
        void set_rx_eq_param(ofdm_str params);
        /**
         * @brief Sets the receive phase tracking parameters.
         *
         * @param bw          Bandwidth.
         * @param ptrs_params PT-RS parameters.
         * @param dmrs_params DM-RS parameters.
         * @param ofdm_params OFDM parameters.
         */
        void set_rx_phase_tracking_param(bool bw, ptrs_str ptrs_params, dmrs_str dmrs_params, ofdm_str ofdm_params);
        /**
         * @brief Sets the receive demapping parameters.
         *
         * @param num_blocks Number of blocks.
         * @param mod_order  Modulation order.
         */
        void set_rx_demap_param(uint16_t num_blocks, uint16_t mod_order);
        /**
         * @brief Sets the receive LDPC (Low-Density Parity-Check) decoder parameters.
         *
         * @param params LDPC parameters.
         */
        void set_rx_ldcp_param(ldpc_info params);
        /**
         * @brief Sets the dynamic buffer parameters.
         *
         * @param num_bytes Number of bytes.
         */
        void set_dynamic_buffer_params(uint num_bytes);

        /**
         * @brief Sets the receive automatic gain control (AGC) parameters.
         *
         * @param enable Enable or disable AGC.
         * @param vref AGC reference voltage.
         */
        void set_rx_agc_param(bool enable, int vref);

        /**
         * @brief Sets the transmit OFDM parameters.
         *
         * @param params OFDM parameters.
         */
        void set_tx_ofdm_param(ofdm_str params);
        /**
         * @brief Sets the transmit filter parameters.
         *
         * @param bw  Bandwidth.
         * @param ifs Inter-frame spacing.
         */
        void set_tx_filter_param(bool bw, float ifs);
        /**
         * @brief Sets the transmit LBM (Look-Back Memory) parameters.
         *
         * @param size Size of the LBM.
         */
        void set_tx_lbm_param(uint32_t size);
        /**
         * @brief Sets the transmit grid builder parameters.
         *
         * @param ofdm_params   OFDM parameters.
         * @param ptrs_params   PT-RS parameters.
         * @param dmrs_params   DM-RS parameters.
         * @param offsetSSB    SSB offset.
         */
        void set_tx_buildGrid_param(ofdm_str ofdm_params, ptrs_str ptrs_params, dmrs_str dmrs_params, uint16_t offsetSSB);
        /**
         * @brief Sets the transmit symbol mapping parameters.
         *
         * @param mod_order Modulation order.
         * @param num_sch   Number of scheduled channel resource blocks.
         */
        void set_tx_symbol_map_param(uint16_t mod_order, uint32_t num_sch);
    };

} // helix

#endif //HELIX_RADIO_CONTROL_H