#include "../include/udp_transport.h"
#include <iostream>
#include <string>
#include <arpa/inet.h> // For sockaddr_in
#include <sys/socket.h>

using namespace helix;


udp_socket::udp_socket(const char* _ip, int client_port):
    ip(_ip),
    clientAddr(),
    serverAddr(),
    socket_()
{
    socket_ = socket(AF_INET, SOCK_DGRAM, 0);
    if (socket_ == -1) {
        std::cerr << "UDP: Error creating socket." << std::endl;
        exit(EXIT_FAILURE);
    }

    clientAddr.sin_family = AF_INET;
    clientAddr.sin_addr.s_addr = INADDR_ANY;
    clientAddr.sin_port = htons(client_port);

    serverAddr.sin_family = AF_INET;
    serverAddr.sin_addr.s_addr = inet_addr(ip);
    serverAddr.sin_port = htons(client_port);

    //Timeout for the socket
    struct timeval tv;
    tv.tv_sec = 0;
    tv.tv_usec = 200000;
    if (setsockopt(socket_, SOL_SOCKET, SO_RCVTIMEO,&tv,sizeof(tv)) < 0) {
        DEBUG_PRINT("UDP_DEBUG: " );
    }
    int val = IP_PMTUDISC_DO;
    if (setsockopt(socket_, IPPROTO_IP, IP_MTU_DISCOVER, &val, sizeof(val)) < 0) {
        DEBUG_PRINT("UDP_DEBUG: " );
    }

    if (bind(socket_, (sockaddr*)&clientAddr, sizeof(clientAddr)) == -1) {
        std::cerr << "UDP:Error binding socket." << std::endl;
        exit(EXIT_FAILURE);
    }


}

void udp_socket::send(void* data, ssize_t num_bytes) {
    auto* ptr=(uint8_t*)data;
    size_t bytes_sent = 0;
    while (bytes_sent < num_bytes) {
        size_t chunk_size = (num_bytes - bytes_sent > MAX_PAYLOAD_SIZE) ? MAX_PAYLOAD_SIZE : (num_bytes - bytes_sent);
        ssize_t sent = sendto(socket_, ptr + bytes_sent, chunk_size, 0, (sockaddr*)(&serverAddr), sizeof(serverAddr));
        if (sent == -1) {
            DEBUG_PRINT("UDP_DEBUG: sendto failed");
            return;
        }
        bytes_sent += sent;
    }
    if (bytes_sent == -1) {
        DEBUG_PRINT("UDP_DEBUG: Error sending data");
        return;
    }

}


ssize_t udp_socket::recv(void* data, ssize_t num_bytes) {
    ssize_t totalReceived = 0;
    ssize_t received_bytes;
    auto ptr = static_cast<uint8_t*>(data);
    socklen_t server_addr_len = sizeof(serverAddr);

    while (totalReceived < num_bytes) {
        received_bytes = recvfrom(socket_, ptr + totalReceived, num_bytes - totalReceived, 0,
                                  (sockaddr*)(&serverAddr), &server_addr_len);
        if (received_bytes == -1) {
            DEBUG_PRINT("UDP_DEBUG: Error receiving data");
            return -1;  // Return -1 to indicate an error, rather than a partial read
        }
        totalReceived += received_bytes;
    }
    return totalReceived;
}

