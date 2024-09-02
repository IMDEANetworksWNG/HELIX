//
// Created by imdea on 29/05/2024.
//

#ifndef MIMORPH_RT_STREAMER_H
#define MIMORPH_RT_STREAMER_H

#include "udp_transport.h"
#include "cmd_manager.h"

namespace mimorph {

    class streamer { ;

    public:
        void transmit(void *data, ssize_t num_bytes);

        void receive(void *data, ssize_t num_bytes);

        streamer(udp_transport* udp, cmd_manager* cmdManager):
            udp(udp),
            cmdManager(cmdManager){
        }

    private:
        udp_transport* udp;
        cmd_manager* cmdManager;

        bool triggerTX(ssize_t num_bytes);
        bool triggerRX(ssize_t num_bytes);

    };

} // mimorph

#endif //MIMORPH_RT_STREAMER_H
