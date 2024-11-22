//
// Created by imdea on 29/05/2024.
//

#ifndef MIMORPH_RT_CMD_MANAGER_H
#define MIMORPH_RT_CMD_MANAGER_H

#include <vector>
#include <string>
#include "udp_transport.h"

namespace mimorph{

    struct cmd_struct {
        std::string cmd;
        std::vector<std::string> cmdArgs;
    };


    class cmd_manager { ;

    public:
        uint32_t sendCmd(const cmd_struct& data, bool itHasReply);

        uint32_t readReg(uint32_t addr);
        void writeReg(uint32_t addr, uint32_t value);

        explicit cmd_manager(udp_transport* udp):udp(udp){

        }

    private:
            udp_transport* udp;
        };

}



#endif //MIMORPH_RT_CMD_MANAGER_H
