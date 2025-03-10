//
// Created by imdea on 29/05/2024.
//

#include "../include/streamer.h"
#include "../include/defines.h"
#include "cmath"
#include <cstring>
#include <unistd.h>

namespace mimorph {
    void streamer::unpack_metadata(slot_str* slot,bool ce_enable, bool energy_enable, bool cfo_enable){
        ssize_t num_bytes=0;
        auto ce_size=(ssize_t)slot->channel_estimation.size();
        if (ce_enable)num_bytes+=ce_size;
        if (energy_enable) num_bytes+=16;
        if (cfo_enable) num_bytes+=4;

        if (!num_bytes) return ;

        auto data= new uint8_t [num_bytes];

        ssize_t recv_bytes=udp->metadata_socket.recv(data,num_bytes);
        if(recv_bytes<num_bytes)
                STREAM_DEBUG_PRINT("STREAMER_DEBUG: Less bytes received than expected: %zd\n", recv_bytes);

        if (ce_enable){
            slot->channel_estimation.assign(data,data+ce_size);
            data+=ce_size;
        }
        if (energy_enable){
            int32_t power=(data[3] << 24) | (data[2] << 16) |(data[1] << 8) | (data[0]);
            int32_t noise=(data[11] << 24) | (data[10] << 16) |(data[9] << 8) | (data[8]);
            slot->signal_pow=static_cast<double>(power)/pow(2,16);
            slot->noise_pow=static_cast<double>(noise)/pow(2,31);
            slot->snr=(slot->signal_pow-slot->noise_pow)/slot->noise_pow;
            data+=16;
        }
        if (cfo_enable){
            int32_t cfo=(data[3] << 24) | (data[2] << 16) |(data[1] << 8) | (data[0]);
            slot->cfo=round(240 * 1e3 * (cfo/pow(2,15)) / (2*M_PI));
        }
    }

    bool streamer::triggerTX(ssize_t num_bytes){
        cmd_struct cmd_str;
        cmd_str.cmd="triggerTX ";
        cmd_str.cmdArgs.push_back(std::to_string(num_bytes));

        if(cmdManager->sendCmd(cmd_str,true)!=UDP_CMD_ACK){
            STREAM_DEBUG_PRINT("STREAMER_DEBUG: TX trigger wasn't set succesfully\n");
            return false;
        };
        return true;
    }

    bool streamer::triggerRX(ssize_t num_bytes, bool ce_enable, bool energy_enable, bool cfo_enable,int num_slots){
        cmd_struct cmd_str;
        cmd_str.cmd="triggerRX ";
        cmd_str.cmdArgs.push_back(std::to_string(num_bytes));
        cmd_str.cmdArgs.push_back(std::to_string(ce_enable));
        cmd_str.cmdArgs.push_back(std::to_string(energy_enable));
        cmd_str.cmdArgs.push_back(std::to_string(cfo_enable));
        cmd_str.cmdArgs.push_back(std::to_string(num_slots));

        if(cmdManager->sendCmd(cmd_str,true)!=UDP_CMD_ACK){
            STREAM_DEBUG_PRINT("STREAMER_DEBUG: RX trigger wasn't set succesfully\n");
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
            udp->control_socket.recv((void *) reply, sizeof(reply));
            if(reply[0]==UDP_CMD_ACK){
                udp->control_socket.send(data,num_bytes);
                return true;
            }
            usleep(50000);
        }
        perror("STREAMER_DEBUG: Loading SSB block failed");
        exit(0);
    }


    void streamer::transmit(void *data, ssize_t num_bytes){
        if(triggerTX(num_bytes)){
            udp->data_socket.send(data,num_bytes);
            return;
        }
    }

    //Only working for split 6 or below 8000 bytes packet
    void streamer::transmit(const std::vector<std::vector<int16_t>>& data, ssize_t num_bytes_per_slot){
        ssize_t total_bytes=data.size()*num_bytes_per_slot;
        if(triggerTX(total_bytes)){
            for (auto slot : data) {
                udp->data_socket.send(slot.data(),num_bytes_per_slot);
                usleep(1);
            }
            return;
        }
    }

    void streamer::receive(slot_str* slot, ssize_t num_bytes, bool ce_enable, bool energy_enable, bool cfo_enable) {
        if(triggerRX(num_bytes, ce_enable, energy_enable, cfo_enable,1)){
            ssize_t recv_bytes=udp->data_socket.recv(slot->data.data(),num_bytes);
            if(recv_bytes<num_bytes)
                    STREAM_DEBUG_PRINT("STREAMER_DEBUG: Less bytes received than expected: %zd\n", recv_bytes);
            slot->data.resize(recv_bytes);
            if((ce_enable | energy_enable | cfo_enable) & !slot->data.empty()){
                unpack_metadata(slot,ce_enable,energy_enable,cfo_enable);
            }
            return;
        }
    }

    void streamer::receive(std::vector<slot_str>* slot_burst, ssize_t num_bytes_per_slot, bool ce_enable, bool energy_enable, bool cfo_enable) {
        ssize_t total_bytes=slot_burst->size()*num_bytes_per_slot;

        if(triggerRX(total_bytes, ce_enable, energy_enable, cfo_enable,slot_burst->size())){
            for (auto& slot : *slot_burst){
                ssize_t recv_bytes=udp->data_socket.recv(slot.data.data(),num_bytes_per_slot);
                if(recv_bytes<num_bytes_per_slot)
                        STREAM_DEBUG_PRINT("STREAMER_DEBUG: Less bytes received than expected: %zd\n", recv_bytes);
                slot.data.resize(recv_bytes);
                if(ce_enable | energy_enable | cfo_enable){
                    unpack_metadata(&slot, ce_enable, energy_enable, cfo_enable);
                }
            }
            return;
        }
    }

} // mimorph