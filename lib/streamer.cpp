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
            //std::cout << "TX trigger was not set successfully\n";
            return false;
        };
        return true;
    }

    bool streamer::triggerRX(ssize_t num_bytes){
        cmd_struct cmd_str;
        cmd_str.cmd="triggerRX ";
        cmd_str.cmdArgs.push_back(std::to_string(num_bytes));

        if(cmdManager->sendCmd(cmd_str,true)!=TRIGGER_ACK){
            //std::cout << "RX trigger was not set successfully\n";
            return false;
        };
        return true;
    }


    void streamer::transmit(void *data, ssize_t num_bytes){
        for(int trial=0;trial<NUMBER_OF_RETRIES;trial++){
            if(triggerTX(num_bytes)){
                udp->send(data,num_bytes,true);
                return;
            }
            std::cout << "Retrying to send trigger\n";
        }
        std::cout << "Failed to set trigger after trials\n";
    }

    void streamer::receive(void *data, ssize_t num_bytes) {
        for(int trial=0;trial<NUMBER_OF_RETRIES;trial++){
            if(triggerRX(num_bytes)){
                udp->recv(data,num_bytes,true);
                return;
            }
            std::cout << "Retrying to send trigger\n";
        }
        std::cout << "Failed to set trigger after trials\n";
    }

} // mimorph