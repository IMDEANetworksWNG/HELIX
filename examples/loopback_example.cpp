#include "../include/mimorph.h"

const char* fpga_ip = "192.168.4.128"; // Replace with the actual server IP
const int num_of_tx_bytes=1024*4;

void create_rand_bytes(int num_bytes, char* random_data){

    srand(static_cast<unsigned>(time(nullptr)));
    for (int i = 0; i < num_bytes; ++i) {
        random_data[i] = static_cast<char>(rand() % 256);
    }
}

bool check_data(char* received_data, char* sent_data, int num_bytes){
    // Check if the echoed data matches the original data
    if (memcmp(received_data, sent_data, num_bytes) == 0) {
        std::cout << "Data echoed correctly!" << std::endl;
        return true;
    } else {
        std::cout << "Data mismatch!" << std::endl;
        return false;
    }
}

int main() {

    //initialize platform with IP
    auto radio=mimorph::mimorph(fpga_ip);

    //configure streaming parameters //TO DO: separar TX y RX en udp y radio
    mimorph::stream_str stream_config{};

    //set udp ifg and mss
    stream_config.udp_rx_mss=1024*2;
    stream_config.udp_rx_ifg=stream_config.udp_rx_mss/5;

    //set radio ifg and mss
    stream_config.radio_tx_mss=num_of_tx_bytes;
    stream_config.radio_tx_ifg=0;

    radio.control->set_streaming_parameters(stream_config);

    // Create array of random bytes to send
    char tx_data[num_of_tx_bytes];
    create_rand_bytes(num_of_tx_bytes,tx_data);

    // Trigger transmission of data
    radio.stream->transmit(tx_data,num_of_tx_bytes);

    // Trigger reception of data
    char received_data[num_of_tx_bytes];
    radio.stream->receive(received_data,num_of_tx_bytes);

    // Check if data was echoed correctly
    check_data(received_data,tx_data,num_of_tx_bytes);

    return 1;
}