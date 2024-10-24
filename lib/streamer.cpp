//
// Created by imdea on 29/05/2024.
//

#include "../include/streamer.h"
#include "../include/defines.h"
#include <chrono>
namespace mimorph {
    bool streamer::triggerTX(ssize_t num_bytes){
        cmd_struct cmd_str;
        cmd_str.cmd="triggerTX ";
        cmd_str.cmdArgs.push_back(std::to_string(num_bytes));

        if(cmdManager->sendCmd(cmd_str,true)!=UDP_CMD_ACK){
            //std::cout << "TX trigger was not set successfully\n";
            return false;
        };
        return true;
    }

    bool streamer::triggerRX(ssize_t num_bytes){
        cmd_struct cmd_str;
        cmd_str.cmd="triggerRX ";
        cmd_str.cmdArgs.push_back(std::to_string(num_bytes));

        if(cmdManager->sendCmd(cmd_str,true)!=UDP_CMD_ACK){
            //std::cout << "RX trigger was not set successfully\n";
            return false;
        };
        return true;
    }

    bool streamer::load_SSB_data(void *data, ssize_t num_bytes){
        cmd_struct cmd_str;
        cmd_str.cmd="loadSSB ";
        char reply[4];
        memset(reply,0,4);
        cmd_str.cmdArgs.push_back(std::to_string(num_bytes));

        cmdManager->sendCmd(cmd_str,false);
        for(int trial=0;trial<NUMBER_OF_RETRIES;trial++) {
            udp->recv((void *) reply, sizeof(reply), false);
            if(reply[0]==UDP_CMD_ACK){
                udp->send(data,num_bytes,false);
                return true;
            }
            usleep(50000);
        }
        perror("Loading SSB block failed");
        exit(0);
    }


    void streamer::transmit(void *data, ssize_t num_bytes){
        if(triggerTX(num_bytes)){
            udp->send(data,num_bytes,true);
            return;
        }
        //std::cout << "Failed to set trigger after trials\n";
    }

    void streamer::receive(void *data, ssize_t num_bytes) {
        if(triggerRX(num_bytes)){
            udp->recv(data,num_bytes,true);
            return;
        }
        //std::cout << "Failed to set trigger after trials\n";
    }

} // mimorph