#include <iostream>
#include <cstring>
#include <cstdlib>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <unistd.h>

const char* dest_ip = "192.168.4.128"; // Replace with the actual server IP
const int client_port = 12345;
const int data_port = 10001;
const int control_port = 10000;

int udp_socket;

void configure_udp_socket(){
    udp_socket = socket(AF_INET, SOCK_DGRAM, 0);
    if (udp_socket == -1) {
        std::cerr << "Error creating socket." << std::endl;
        exit(EXIT_FAILURE);
    }
    sockaddr_in serverAddress;
    serverAddress.sin_family = AF_INET;
    serverAddress.sin_addr.s_addr = INADDR_ANY;
    serverAddress.sin_port = htons(client_port); // Set your desired source port

    if (bind(udp_socket, (sockaddr*)&serverAddress, sizeof(serverAddress)) == -1) {
        std::cerr << "Error binding socket." << std::endl;
        exit(EXIT_FAILURE);
    }
}


void sendUDP(char* data, int num_bytes) {
    // Server address
    struct sockaddr_in server_addr{};
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(data_port);
    server_addr.sin_addr.s_addr = inet_addr(dest_ip);

    // Send the random data to the server
    ssize_t sent_bytes = sendto(udp_socket, data, num_bytes, 0,
                                reinterpret_cast<struct sockaddr*>(&server_addr), sizeof(server_addr));
    if (sent_bytes == -1) {
        perror("Error sending data");
        close(udp_socket);
        exit(EXIT_FAILURE);
    }

}

void receiveUDP(const char* sent_data, int num_bytes){
    // Receive the echoed data from the server
    char received_data[num_bytes];
    ssize_t totalReceived = 0;

    // Server address
    struct sockaddr_in server_addr{};
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(data_port);
    server_addr.sin_addr.s_addr = inet_addr(dest_ip);

    socklen_t server_addr_len = sizeof(server_addr);
    while (totalReceived < num_bytes){
        ssize_t received_bytes = recvfrom(udp_socket, received_data+totalReceived, num_bytes, 0,
                                          reinterpret_cast<struct sockaddr*>(&server_addr), &server_addr_len);
        if (received_bytes == -1) {
            perror("Error receiving data");
            close(udp_socket);
            exit(EXIT_FAILURE);
        }
        totalReceived+= received_bytes;
    }


}

int sendCommand(const char* message){

    // Set up the destination address
    sockaddr_in destAddr;
    destAddr.sin_family = AF_INET;
    destAddr.sin_port = htons(control_port); // Port number 10000 CPU -- 10001 RF
    destAddr.sin_addr.s_addr = inet_addr(dest_ip); // Destination IP address
    // Send the message
    ssize_t sentBytes = sendto(udp_socket, message, std::strlen(message), 0,
                               reinterpret_cast<sockaddr*>(&destAddr), sizeof(destAddr));
    if (sentBytes == -1) {
        std::cerr << "Error sending message." << std::endl;
        close(udp_socket);
        return 1;
    }

    usleep(5);

    return 0;
}

uint32_t recvCommand(){

    // Set up the destination address
    char command[4];
    sockaddr_in destAddr;
    destAddr.sin_family = AF_INET;
    destAddr.sin_port = htons(control_port); // Port number 10000 CPU -- 10001 RF
    destAddr.sin_addr.s_addr = inet_addr(dest_ip); // Destination IP address
    socklen_t clientAddrLen = sizeof(destAddr);

    int bytesReceived = recvfrom(udp_socket, &command, sizeof(command), 0, (struct sockaddr*)&destAddr, &clientAddrLen);
    if (bytesReceived == -1) {
        std::cerr << "Error receiving data." << std::endl;
        close(udp_socket);
        return 1;
    }

    return command[0];
}




void setTXStreamingParameters(uint32_t mss, uint32_t ifg, uint32_t transfer_size){

    std::string command ="writeReg 0xB0020010 " + std::to_string(mss/8) + " \n";
    const char* message = command.c_str();
    if(sendCommand(message)){
        std::cout << "Sending command failed ";
        exit(EXIT_FAILURE);
    }
    command ="writeReg 0xB0020014 " + std::to_string(ifg/8) + " \n";
    message = command.c_str();
    if(sendCommand(message)){
        std::cout << "Sending command failed ";
        exit(EXIT_FAILURE);
    }
    command ="writeReg 0xB0020018 " + std::to_string(transfer_size/8) + " \n";
    message = command.c_str();
    if(sendCommand(message)){
        std::cout << "Sending command failed ";
        exit(EXIT_FAILURE);
    }

}

void setRXStreamingParameters(uint32_t mss, uint32_t ifg, uint32_t transfer_size){

    std::string command ="writeReg 0xB0020004 " + std::to_string(mss/8) + " \n";
    const char* message = command.c_str();
    if(sendCommand(message)){
        std::cout << "Sending command failed ";
        exit(EXIT_FAILURE);
    }
    command ="writeReg 0xB0020008 " + std::to_string(ifg/8) + " \n";
    message = command.c_str();
    if(sendCommand(message)){
        std::cout << "Sending command failed ";
        exit(EXIT_FAILURE);
    }
    command ="writeReg 0xB002000C " + std::to_string(transfer_size/8) + " \n";
    message = command.c_str();
    if(sendCommand(message)){
        std::cout << "Sending command failed ";
        exit(EXIT_FAILURE);
    }

}
void triggerTX(){
    // Trigger TX streaming
    std::string command ="triggerTX \n";
    const char* message = command.c_str();
    if(sendCommand(message)){
        std::cout << "Sending command failed ";
        exit(EXIT_FAILURE);
    }
    if(recvCommand()!=16){
        std::cout << "Trigger was not set successfully ";
        exit(EXIT_FAILURE);
    }

}

void triggerRX(){
    // Trigger RX streaming
    std::string command ="triggerRX \n";
    const char* message = command.c_str();
    if(sendCommand(message)){
        std::cout << "Sending command failed ";
        exit(EXIT_FAILURE);
    }
    if(recvCommand()!=16){
        std::cout << "Trigger was not set successfully ";
        exit(EXIT_FAILURE);
    }

}


int main() {
    // Generate random bytes (e.g., 10 bytes)
    configure_udp_socket();

    uint16_t transfer_size = 1024;
    const int num_bytes = 512*8;
    char random_data[num_bytes];
    srand(static_cast<unsigned>(time(nullptr)));
    for (int i = 0; i < num_bytes; ++i) {
        random_data[i] = static_cast<char>(rand() % 256);
    }

    setTXStreamingParameters(num_bytes, 0, num_bytes);
    setRXStreamingParameters(transfer_size, 1024, num_bytes);

    triggerTX();
    sendUDP(random_data,num_bytes);

    triggerRX();
    receiveUDP(random_data,num_bytes);


}