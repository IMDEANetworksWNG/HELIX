#include "../include/helix.h"
#include "../include/defines.h"
#include <iostream>

namespace helix {
    helix::helix(const char* _ip):
            ip(_ip)
    {
        udp= new udp_transport(ip,UDP_DATA_PORT,UDP_CONTROL_PORT,UDP_METADATA_PORT);
        cmd = new cmd_manager(udp);
        stream = new streamer(udp, cmd);
        control= new radio_control(cmd, stream);

        //This command will reset the TX and RX blocks
        if(!control->init_platform()){
            std::cerr <<"Platform is not available";
            exit(0);
        }


    }


} // helix