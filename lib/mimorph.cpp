//
// Created by imdea on 29/05/2024.
//

#include "../include/mimorph.h"
#include "../include/defines.h"

namespace mimorph {
    mimorph::mimorph(const char* _ip):
            ip(_ip)
    {
        udp= new udp_transport(ip,UDP_CONTROL_PORT,UDP_DATA_PORT,UDP_CLIENT_PORT);
        cmd = new cmd_manager(udp);
        stream = new streamer(udp, cmd);
        control= new radio_control(cmd);

        //This command will reset the TX and RX blocks
        if(!control->init_platform()){
            throw std::invalid_argument("Platform was not initialized");
        }


    }


} // mimorph