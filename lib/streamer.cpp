//
// Created by imdea on 29/05/2024.
//

#include "../include/streamer.h"
#include "../include/defines.h"
#include <chrono>
namespace mimorph {
    void streamer::unpack_metadata(slot_str* slot,bool ce_enable, bool energy_enable, bool cfo_enable){
        ssize_t num_bytes=0;
        auto ce_size=(ssize_t)slot->channel_estimation.size();
        if (ce_enable)num_bytes+=ce_size;
        if (energy_enable) num_bytes+=1;
        if (cfo_enable) num_bytes+=1;

        if (!num_bytes) return ;

        //uint8_t* data; //allocate data first
        auto data= new int;
        ssize_t recv_bytes=udp->recv(data,num_bytes,UDP_METADATA_PORT);
        if(recv_bytes<num_bytes)
            std::cout << "Less bytes received than expected:" << recv_bytes << " bytes\n";

        if (ce_enable){
            //std::copy(data,data+slot->channel_estimation.size(),slot->channel_estimation.begin());
            slot->channel_estimation.insert(slot->channel_estimation.begin(),data,data+ce_size);
            data+=ce_size;
        }
        if (energy_enable){
            slot->energy=data[0];
            data++;
        }
        if (cfo_enable){
            slot->cfo=data[1];
            data++;
        }

    }

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

    bool streamer::triggerRX(ssize_t num_bytes, bool ce_enable, bool energy_enable, bool cfo_enable){
        cmd_struct cmd_str;
        cmd_str.cmd="triggerRX ";
        cmd_str.cmdArgs.push_back(std::to_string(num_bytes));
        cmd_str.cmdArgs.push_back(std::to_string(ce_enable));
        cmd_str.cmdArgs.push_back(std::to_string(energy_enable));
        cmd_str.cmdArgs.push_back(std::to_string(cfo_enable));

        if(cmdManager->sendCmd(cmd_str,true)!=UDP_CMD_ACK){
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
            udp->recv((void *) reply, sizeof(reply), UDP_CONTROL_PORT);
            if(reply[0]==UDP_CMD_ACK){
                udp->send(data,num_bytes,UDP_CONTROL_PORT);
                return true;
            }
            usleep(50000);
        }
        perror("Loading SSB block failed");
        exit(0);
    }


    void streamer::transmit(void *data, ssize_t num_bytes){
        if(triggerTX(num_bytes)){
            udp->send(data,num_bytes,UDP_DATA_PORT);
            return;
        }
        //std::cout << "Failed to set trigger after trials\n";
    }

    void streamer::receive(slot_str* slot, ssize_t num_bytes, bool ce_enable, bool energy_enable, bool cfo_enable) {
        if(triggerRX(num_bytes, ce_enable, energy_enable, cfo_enable)){
            ssize_t recv_bytes=udp->recv(slot->data.data(),num_bytes,UDP_DATA_PORT);
            if(recv_bytes<num_bytes)
                std::cout << "Less bytes received than expected:" << recv_bytes << " bytes\n";
            if(ce_enable | energy_enable | cfo_enable){
                unpack_metadata(slot,ce_enable,energy_enable,cfo_enable);
            }
            return;
        }
    }

/*    void streamer::receive_multiple_slots(std::vector<slot_str> slots, ssize_t num_bytes_per_slot, bool ce_enable, bool energy_enable, bool cfo_enable) {
        if(triggerRX(num_bytes_per_slot, ce_enable, energy_enable, cfo_enable)){
            ssize_t recv_bytes=udp->recv(data,num_bytes,true);
            if(recv_bytes<num_bytes)
                std::cout << "Less bytes received than expected:" << recv_bytes << " bytes\n";
            return;
        }
    }*/

} // mimorph