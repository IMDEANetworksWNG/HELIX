//
// Created by imdea on 29/05/2024.
//

#ifndef MIMORPH_RT_STREAMER_H
#define MIMORPH_RT_STREAMER_H

#include "udp_transport.h"
#include "cmd_manager.h"

#define NUMBER_OF_RETRIES 5


namespace mimorph {

    struct  slot_str{
        std::vector<uint8_t>     data;
        std::vector<uint8_t>     channel_estimation;
        float                    energy;
        float                    cfo;

        slot_str(size_t data_size, size_t ce_size) : data(data_size),
        channel_estimation(ce_size),
        energy(0),
        cfo(0){}
    };

    class streamer {

    public:
        void transmit(void *data, ssize_t num_bytes);

        //void receive(void *data, ssize_t num_bytes);
        void receive(slot_str* slot, ssize_t num_bytes, bool ce_enable, bool energy_enable, bool cfo_enable);

        bool load_SSB_data(void *data, ssize_t num_bytes);

        streamer(udp_transport* udp, cmd_manager* cmdManager):
            udp(udp),
            cmdManager(cmdManager){
        }

    private:
        udp_transport* udp;
        cmd_manager* cmdManager;
        bool triggerTX(ssize_t num_bytes);

        bool triggerRX(ssize_t num_bytes, bool ce_enable, bool energy_enable, bool cfo_enable);

        void unpack_metadata(slot_str* slot,bool ce_enable, bool energy_enable, bool cfo_enable);
    };

} // mimorph

#endif //MIMORPH_RT_STREAMER_H
