//
// Created by imdea on 29/05/2024.
//

#include "../include/streamer.h"
#include "../include/defines.h"

namespace mimorph {
    bool streamer::triggerTX(ssize_t num_bytes){
        cmd_struct cmd_str;
        cmd_str.cmd="triggerTX ";
        cmd_str.cmdArgs.push_back(std::to_string(num_bytes));

        if(cmdManager->sendCmd(cmd_str,true)!=TRIGGER_ACK){
            std::cout << "Trigger was not set successfully\n";
            return false;
        };
        return true;
    }

    bool streamer::triggerRX(ssize_t num_bytes){
        cmd_struct cmd_str;
        cmd_str.cmd="triggerRX ";
        cmd_str.cmdArgs.push_back(std::to_string(num_bytes));

        if(cmdManager->sendCmd(cmd_str,true)!=TRIGGER_ACK){
            std::cout << "Trigger was not set successfully\n";
            return false;
        };
        return true;
    }


    void streamer::transmit(void *data, ssize_t num_bytes) {
        if(!triggerTX(num_bytes)){
            return;
        }
        udp->send(data,num_bytes,true);


    }

    void streamer::receive(void *data, ssize_t num_bytes) {
        if(!triggerRX(num_bytes)){
            return;
        }
        udp->recv(data,num_bytes,true);
    }

} // mimorph