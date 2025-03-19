#ifndef HELIX_HELIX_H
#define HELIX_HELIX_H

#include "radio_control.h"
#include "streamer.h"
#include "udp_transport.h"

namespace helix {

    class helix {

        public:
            explicit helix(const char* _ip);
            streamer* stream;
            radio_control* control;

        private:
            udp_transport* udp;
            cmd_manager* cmd;
            const char* ip;
    };

} // helix

#endif //HELIX_HELIX_H
