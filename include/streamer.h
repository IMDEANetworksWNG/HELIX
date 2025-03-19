#ifndef HELIX_STREAMER_H
#define HELIX_STREAMER_H

#include "udp_transport.h"
#include "cmd_manager.h"

/**
 * @brief Number of retries for loading SSB data.  Used in case of initial communication failures.
 */
#define NUMBER_OF_RETRIES 5

/**
 * @brief Define to enable streamer debug messages, printed to stdout.
 */
#define STREAMER_DEBUG_MODE

#ifdef STREAMER_DEBUG_MODE
#define STREAM_DEBUG_PRINT(fmt, ...) printf(fmt, ##__VA_ARGS__)
#else
#define STREAM_DEBUG_PRINT(fmt, ...)    // Nothing
#endif


namespace helix {

    /**
     * @struct slot_str
     * @brief Structure to hold data received in a single time slot, along with associated metadata.
     */
    struct  slot_str{
        /** @brief Raw data received in the slot. */
        std::vector<uint8_t>     data;
        /** @brief Channel estimation data for the slot. */
        std::vector<uint8_t>     channel_estimation;
        /** @brief Signal-to-noise ratio (SNR) for the slot. */
        double                    snr;
        /** @brief Carrier frequency offset (CFO) for the slot. */
        double                    cfo;
        /** @brief Signal power for the slot. */
        double                    signal_pow;
        /** @brief Noise power for the slot. */
        double                    noise_pow;

        /**
         * @brief Constructor for the slot_str structure.  Initializes the data and channel estimation vectors with the specified sizes.
         *
         * @param data_size The size of the data vector.
         * @param ce_size   The size of the channel estimation vector.
         */
        slot_str(size_t data_size, size_t ce_size) : data(data_size),
                                                     channel_estimation(ce_size),
                                                     snr(0),
                                                     cfo(0){}
    };

    /**
     * @class streamer
     * @brief Class for streaming data to and from the 5G PHY testbed.  Provides functions for transmitting and receiving data,
     *        loading SSB data, and triggering TX/RX operations.
     */
    class streamer {

    public:
        /**
         * @brief Transmits raw data over the data socket.
         *
         * @param data      A pointer to the data to transmit.
         * @param num_bytes The number of bytes to transmit.
         */
        void transmit(void *data, ssize_t num_bytes);
        /**
         * @brief Transmits a vector of slots, where each slot contains a vector of int16_t data.
         *
         * @param data              A vector of vectors containing the data for each slot.
         * @param num_bytes_per_slot The number of bytes to transmit for each slot.
         */
        void transmit(const std::vector<std::vector<int16_t>>& data, ssize_t num_bytes_per_slot);


        /**
         * @brief Receives data into a single slot, along with optional metadata (channel estimation, energy, CFO).
         *
         * @param slot          A pointer to the slot_str structure to store the received data and metadata.
         * @param num_bytes     The number of bytes to receive.
         * @param ce_enable     Enable channel estimation metadata reception.
         * @param energy_enable Enable energy metadata reception.
         * @param cfo_enable    Enable CFO metadata reception.
         */
        void receive(slot_str* slot, ssize_t num_bytes, bool ce_enable, bool energy_enable, bool cfo_enable);
        /**
         * @brief Receives data into a vector of slots, along with optional metadata.
         *
         * @param slot_burst    A pointer to the vector of slot_str structures to store the received data and metadata.
         * @param num_bytes     The number of bytes to receive.
         * @param ce_enable     Enable channel estimation metadata reception.
         * @param energy_enable Enable energy metadata reception.
         *
         * @param cfo_enable    Enable CFO metadata reception.
         */
        void receive(std::vector<slot_str>* slot_burst, ssize_t num_bytes, bool ce_enable, bool energy_enable, bool cfo_enable);

        /**
         * @brief Loads SSB (Synchronization Signal Block) data to the FPGA.
         *
         * @param data      A pointer to the SSB data.
         * @param num_bytes The number of bytes to load.
         * @return          True if the data was loaded successfully, false otherwise.
         */
        bool load_SSB_data(void *data, ssize_t num_bytes);

        /**
         * @brief Constructor for the streamer class.
         *
         * @param udp         A pointer to the udp_transport object for UDP communication.
         * @param cmdManager  A pointer to the cmd_manager object for sending commands.
         */
        streamer(udp_transport* udp, cmd_manager* cmdManager):
                udp(udp),
                cmdManager(cmdManager){
        }

    private:
        /** @brief Pointer to the UDP transport object. */
        udp_transport* udp;
        /** @brief Pointer to the command manager object. */
        cmd_manager* cmdManager;

        /**
         * @brief Triggers a TX (transmit) operation on the FPGA.  Sends a command to the FPGA to prepare for transmission.
         *
         * @param num_bytes The number of bytes to be transmitted.
         * @return          True if the trigger was successful, false otherwise.
         */
        bool triggerTX(ssize_t num_bytes);

        /**
         * @brief Triggers an RX (receive) operation on the FPGA.  Sends a command to the FPGA to prepare for reception.
         *
         * @param num_bytes     The number of bytes to be received.
         * @param ce_enable     Enable channel estimation metadata reception.
         * @param energy_enable Enable energy metadata reception.
         * @param cfo_enable    Enable CFO metadata reception.
         * @param num_slots Number of slots to receive
         * @return          True if the trigger was successful, false otherwise.
         */
        bool triggerRX(ssize_t num_bytes, bool ce_enable, bool energy_enable, bool cfo_enable,int num_slots);

        /**
         * @brief Unpacks metadata (channel estimation, energy, CFO) received along with the data.
         *
         * @param slot          A pointer to the slot_str structure to store the metadata.
         * @param ce_enable     Enable channel estimation metadata reception.
         * @param energy_enable Enable energy metadata reception.
         * @param cfo_enable    Enable CFO metadata reception.
         */
        void unpack_metadata(slot_str* slot,bool ce_enable, bool energy_enable, bool cfo_enable);
    };

} // helix

#endif //HELIX_STREAMER_H