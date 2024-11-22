//
// Created by imdea on 29/05/2024.
//

#ifndef MIMORPH_RT_UDP_TRANSPORT_H
#define MIMORPH_RT_UDP_TRANSPORT_H

#include <netinet/ip.h>

#define MAX_PAYLOAD_SIZE 8192

//#define UDP_DEBUG_MODE

#ifdef UDP_DEBUG_MODE
#define DEBUG_PRINT(x) perror(x)
#else
#define DEBUG_PRINT(x)    // Nothing
#endif

namespace mimorph {

    class udp_socket {

    public:
        void send(void *data, ssize_t num_bytes);

        ssize_t recv(void *data, ssize_t num_bytes);

        udp_socket(const char *_ip, int client_port);

    private:
        int socket_;
        sockaddr_in clientAddr;
        sockaddr_in serverAddr;
        const char *ip;
    };

    class udp_transport {
    public:
        udp_transport(const char *_ip, int data_port, int control_port, int metadata_port)
                : data_socket(_ip, data_port), control_socket(_ip, control_port), metadata_socket(_ip, metadata_port) {}

        udp_socket data_socket;
        udp_socket control_socket;
        udp_socket metadata_socket;
    };

}

#endif //MIMORPH_RT_UDP_TRANSPORT_H
