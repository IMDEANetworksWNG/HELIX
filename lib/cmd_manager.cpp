#include "../include/cmd_manager.h"
#include <cstring>

using namespace helix;

std::string u32_to_hex_string(uint32_t value) {
    static const char hex_digits[] = "0123456789ABCDEF";
    std::string output;
    output.reserve(10); // Assuming 32-bit integer (8 hexadecimal digits)
    output="0x";

    for (int i = 0; i < 8; ++i) {
        uint8_t nibble = (value >> (28 - 4 * i)) & 0xF;
        output.push_back(hex_digits[nibble]);
    }

    return output;
}

uint32_t cmd_manager::sendCmd(const cmd_struct& data, bool itHasReply) {
    std::string message =data.cmd;
    for (const std::string& str : data.cmdArgs) {
        message += str + " ";
    }
    message += " \n";

    udp->control_socket.send((void*)message.c_str(),message.size());

    if(itHasReply){
        char reply[4];
        memset(reply,0,4);
        udp->control_socket.recv((void*)reply,sizeof(reply));
        return *(uint32_t *)reply;
    }
    return 0;
}
uint32_t cmd_manager::readReg(uint32_t addr) {

    cmd_struct cmd_str;
    cmd_str.cmd="readReg ";
    cmd_str.cmdArgs.push_back(u32_to_hex_string(addr));

    return sendCmd(cmd_str,true);
}

void cmd_manager::writeReg(uint32_t addr, uint32_t value) {
    cmd_struct cmd_str;

    cmd_str.cmd="writeReg ";
    cmd_str.cmdArgs.push_back(u32_to_hex_string(addr));
    cmd_str.cmdArgs.push_back(std::to_string(value));

    sendCmd(cmd_str,false);
}
