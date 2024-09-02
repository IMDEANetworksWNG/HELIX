//
// Created by imdea on 29/05/2024.
//

#ifndef MIMORPH_RT_MIMORPH_H
#define MIMORPH_RT_MIMORPH_H

#include "radio_control.h"
#include "streamer.h"
#include "udp_transport.h"

namespace mimorph {

    class mimorph {

        public:
            explicit mimorph(const char* _ip);
            streamer* stream;
            radio_control* control;

        private:
            udp_transport* udp;
            cmd_manager* cmd;
            const char* ip;
    };

} // mimorph

#endif //MIMORPH_RT_MIMORPH_H
