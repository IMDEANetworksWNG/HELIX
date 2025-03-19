#ifndef HELIX_CMD_MANAGER_H
#define HELIX_CMD_MANAGER_H

#include <vector>
#include <string>
#include "udp_transport.h"

namespace helix{

    /**
     * @struct cmd_struct
     * @brief Structure to hold a command and its arguments for transmission to the FPGA.
     */
    struct cmd_struct {
        /** @brief The command string (e.g., "readReg", "writeReg"). */
        std::string cmd;
        /** @brief A vector of string arguments for the command. */
        std::vector<std::string> cmdArgs;
    };


    /**
     * @class cmd_manager
     * @brief Manages sending commands to and receiving responses from the FPGA over UDP.
     *        Provides functions for sending generic commands, reading registers, and writing registers.
     */
    class cmd_manager {

    public:
        /**
         * @brief Sends a command to the FPGA and optionally receives a reply.
         *
         * @param data        The command structure containing the command and its arguments.
         * @param itHasReply  True if the command expects a reply, false otherwise.
         * @return            The 32-bit unsigned integer reply from the FPGA, or 0 if no reply is expected.
         */
        uint32_t sendCmd(const cmd_struct& data, bool itHasReply);

        /**
         * @brief Reads the value of a register from the FPGA.
         *
         * @param addr  The address of the register to read.
         * @return      The 32-bit unsigned integer value of the register.
         */
        uint32_t readReg(uint32_t addr);
        /**
         * @brief Writes a value to a register on the FPGA.
         *
         * @param addr   The address of the register to write to.
         * @param value  The 32-bit unsigned integer value to write to the register.
         */
        void writeReg(uint32_t addr, uint32_t value);

        /**
         * @brief Constructor for the cmd_manager class.
         *
         * @param udp A pointer to the udp_transport object for UDP communication.
         */
        explicit cmd_manager(udp_transport* udp):udp(udp){

        }

    private:
        /** @brief Pointer to the UDP transport object. */
        udp_transport* udp;
    };

}

#endif //HELIX_CMD_MANAGER_H