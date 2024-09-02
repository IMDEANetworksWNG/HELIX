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
    tv.tv_usec = 100000;
    if (setsockopt(socket_, SOL_SOCKET, SO_RCVTIMEO,&tv,sizeof(tv)) < 0) {
        perror("Error");
    }
    int val = IP_PMTUDISC_DO;
    if (setsockopt(socket_, IPPROTO_IP, IP_MTU_DISCOVER, &val, sizeof(val)) < 0) {
        perror("Error");
    }

    if (bind(socket_, (sockaddr*)&clientAddr, sizeof(clientAddr)) == -1) {
        std::cerr << "Error binding socket." << std::endl;
        exit(EXIT_FAILURE);
    }


}

void udp_transport::send(void* data, ssize_t num_bytes, bool isdata) {
    if(isdata){
        serverAddr.sin_port = htons(data_port);
    }
    else{serverAddr.sin_port = htons(control_port);}

    // Send the random data to the server
/*
    ssize_t sent_bytes = sendto(socket_, data, num_bytes, 0,
                                (sockaddr*)(&serverAddr), sizeof(serverAddr));
*/
    auto* ptr=(uint8_t*)data;
    size_t bytes_sent = 0;
    while (bytes_sent < num_bytes) {
        size_t chunk_size = (num_bytes - bytes_sent > MAX_PAYLOAD_SIZE) ? MAX_PAYLOAD_SIZE : (num_bytes - bytes_sent);
        ssize_t sent = sendto(socket_, ptr + bytes_sent, chunk_size, 0, (sockaddr*)(&serverAddr), sizeof(serverAddr));
        if (sent == -1) {
            perror("sendto failed");
            exit(EXIT_FAILURE);
        }
        bytes_sent += sent;
    }
    if (bytes_sent == -1) {
        perror("Error sending data");
        close(socket_);
        return;
        //exit(EXIT_FAILURE);
    }

}

void udp_transport::recv(void* data, ssize_t num_bytes, bool isdata) {
    if(isdata){
        serverAddr.sin_port = htons(data_port);
    }
    else{serverAddr.sin_port = htons(control_port);}

    ssize_t totalReceived = 0;
    ssize_t received_bytes=0;

    auto* ptr=(uint8_t*)data;
    socklen_t server_addr_len = sizeof(serverAddr);
    //TO DO: design a timeout
    while (totalReceived < num_bytes){
        ptr+=received_bytes;

        received_bytes = recvfrom(socket_, (void *)ptr, num_bytes, 0,
                                          (sockaddr*)(&serverAddr), &server_addr_len);
        if (received_bytes == -1) {
            perror("Error receiving data");
            close(socket_);
            return;
            //exit(EXIT_FAILURE);
        }
        totalReceived+= received_bytes;
    }

}

