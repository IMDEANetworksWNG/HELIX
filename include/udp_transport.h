//
// Created by imdea on 29/05/2024.
//

#ifndef MIMORPH_RT_UDP_TRANSPORT_H
#define MIMORPH_RT_UDP_TRANSPORT_H

#include <iostream>
#include <string>
#include <cstring>
#include <arpa/inet.h> // For sockaddr_in
#include <sys/socket.h>
#include <unistd.h>
#include <netinet/ip.h>

#define MAX_PAYLOAD_SIZE 8192


namespace mimorph{
    class udp_transport {

    public:
        void send(void *data, ssize_t num_bytes,bool isdata);
        void recv(void *data, ssize_t num_bytes, bool isdata);

        udp_transport(const char* _ip, int _control_port, int _data_port, int client_port);

    private:
        int socket_;
        sockaddr_in clientAddr;
        sockaddr_in serverAddr;
        const char* ip;
        int control_port;
        int data_port;
    };
}



#endif //MIMORPH_RT_UDP_TRANSPORT_H
