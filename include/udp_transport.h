#ifndef HELIX_UDP_TRANSPORT_H
#define HELIX_UDP_TRANSPORT_H

#include <netinet/ip.h>

/**
 * @brief Maximum payload size for UDP packets.  This value should be chosen carefully
 *        considering MTU (Maximum Transmission Unit) to avoid IP fragmentation.
 */
#define MAX_PAYLOAD_SIZE 8192

/**
 * @brief Uncomment to enable UDP debug messages using perror.  This will print error
 *        messages to stderr when UDP operations fail.  Define it in your build system or
 *        directly here for debugging purposes.
 */
//#define UDP_DEBUG_MODE

#ifdef UDP_DEBUG_MODE
#define DEBUG_PRINT(x) perror(x)
#else
#define DEBUG_PRINT(x)    // Nothing
#endif

namespace helix {

    /**
     * @class udp_socket
     * @brief A class for managing a UDP socket connection.  Provides functionality for
     *        sending and receiving data over UDP.
     */
    class udp_socket {

    public:
        /**
         * @brief Sends data over the UDP socket.  Handles fragmentation if the data exceeds MAX_PAYLOAD_SIZE.
         *
         * @param data      A pointer to the data to send.
         * @param num_bytes The number of bytes to send.
         */
        void send(void *data, ssize_t num_bytes);

        /**
         * @brief Receives data over the UDP socket.  This function expects the complete message to be sent in a single or multiple packets.
         *
         * @param data      A pointer to the buffer to store the received data.
         * @param num_bytes The maximum number of bytes to receive.
         * @return          The number of bytes actually received, or -1 on error.
         */
        ssize_t recv(void *data, ssize_t num_bytes);

        /**
         * @brief Constructor for the udp_socket class.  Creates and binds a UDP socket.
         *
         * @param _ip         The IP address of the server to connect to (e.g., "127.0.0.1").
         * @param client_port The port number to use for the client socket. This is the port the FPGA PHY testbed will send data to.
         */
        udp_socket(const char *_ip, int client_port);

    private:
        /** @brief The socket file descriptor. */
        int socket_;
        /** @brief The client address structure. */
        sockaddr_in clientAddr;
        /** @brief The server address structure. */
        sockaddr_in serverAddr;
        /** @brief The IP address of the server as a string. */
        const char *ip;
    };

    /**
     * @class udp_transport
     * @brief A class to manage multiple UDP sockets for different types of data (data, control, metadata).
     */
    class udp_transport {
    public:
        /**
         * @brief Constructor for the udp_transport class.  Creates three UDP sockets for data, control, and metadata.
         *
         * @param _ip            The IP address of the server to connect to (e.g., "127.0.0.1").
         * @param data_port     The port number to use for the data socket.
         * @param control_port  The port number to use for the control socket.
         * @param metadata_port The port number to use for the metadata socket.
         */
        udp_transport(const char *_ip, int data_port, int control_port, int metadata_port)
                : data_socket(_ip, data_port), control_socket(_ip, control_port), metadata_socket(_ip, metadata_port) {}

        /** @brief UDP socket for transmitting and receiving data. */
        udp_socket data_socket;
        /** @brief UDP socket for sending and receiving control commands. */
        udp_socket control_socket;
        /** @brief UDP socket for sending and receiving metadata. */
        udp_socket metadata_socket;
    };

}

#endif //HELIX_UDP_TRANSPORT_H