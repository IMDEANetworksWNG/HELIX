//
// Created by imdea on 29/05/2024.
//

#include "../include/udp_transport.h"

using namespace mimorph;

udp_transport::udp_transport(const char* _ip, int _control_port, int _data_port, int client_port):
    ip(_ip),
    control_port(_control_port),
    data_port(_data_port),
    clientAddr(),
    serverAddr(),
    socket_()
{
    socket_ = socket(AF_INET, SOCK_DGRAM, 0);
    if (socket_ == -1) {
        std::cerr << "Error creating socket." << std::endl;
        exit(EXIT_FAILURE);
    }

    clientAddr.sin_family = AF_INET;
    clientAddr.sin_addr.s_addr = INADDR_ANY;
    clientAddr.sin_port = htons(client_port); // Set your desired source port

    serverAddr.sin_family = AF_INET;
    serverAddr.sin_addr.s_addr = inet_addr(ip);

    //Timeout for the socket (100ms)
    struct timeval tv;
    tv.tv_sec = 0;
    tv.tv_usec = 10000; //10
    if (setsockopt(socket_, SOL_SOCKET, SO_RCVTIMEO,&tv,sizeof(tv)) < 0) {
        perror("Error");
    }
    int val = IP_PMTUDISC_DO;
    if (setsockopt(socket_, IPPROTO_IP, IP_MTU_DISCOVER, &val, sizeof(val)) < 0) {
        perror("Error");
    }

    val = 6;
    if (setsockopt(socket_, SOL_SOCKET, SO_PRIORITY, &val, sizeof(val)) < 0) {
        perror("Error");
    }
    val = 1;
    if (setsockopt(socket_, SOL_SOCKET, SO_BUSY_POLL, &val, sizeof(val)) < 0) {
        perror("Error");
    }


    if (bind(socket_, (sockaddr*)&clientAddr, sizeof(clientAddr)) == -1) {
        std::cerr << "Error binding socket." << std::endl;
        exit(EXIT_FAILURE);
    }


}

void udp_transport::send(void* data, ssize_t num_bytes, int port) {
/*    if(isdata){
        serverAddr.sin_port = htons(data_port);
    }
    else{serverAddr.sin_port = htons(control_port);}*/
    serverAddr.sin_port = htons(port);

    auto* ptr=(uint8_t*)data;
    size_t bytes_sent = 0;
    while (bytes_sent < num_bytes) {
        size_t chunk_size = (num_bytes - bytes_sent > MAX_PAYLOAD_SIZE) ? MAX_PAYLOAD_SIZE : (num_bytes - bytes_sent);
        ssize_t sent = sendto(socket_, ptr + bytes_sent, chunk_size, 0, (sockaddr*)(&serverAddr), sizeof(serverAddr));
        if (sent == -1) {
            perror("sendto failed");
            return;
        }
        bytes_sent += sent;
    }
    if (bytes_sent == -1) {
        perror("Error sending data");
        return;
    }

}

ssize_t udp_transport::recv(void* data, ssize_t num_bytes, int port) {
    serverAddr.sin_port = htons(port);

    ssize_t totalReceived = 0;
    ssize_t received_bytes=0;

    auto* ptr=(uint8_t*)data;
    socklen_t server_addr_len = sizeof(serverAddr);

    while (totalReceived < num_bytes){
        ptr+=received_bytes;

        received_bytes = recvfrom(socket_, (void *)ptr, num_bytes, 0,
                                          (sockaddr*)(&serverAddr), &server_addr_len);
        if (received_bytes == -1) {
            perror("Error receiving data");
            return totalReceived;
        }
        totalReceived+= received_bytes;
    }
    return totalReceived;
}

