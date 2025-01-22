//
// Created by imdea on 22/11/2024.
//

#include "helpers.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>
#include <cstring>
#include <cmath>
#include <algorithm>



bool check_data(uint8_t * received_data, uint8_t* sent_data, int num_bytes){
    // Check if the echoed data matches the original data
    if (memcmp(received_data, sent_data, num_bytes) == 0) {
        //std::cout << "Data echoed correctly!" << std::endl;
        return true;
    } else {
        //std::cout << "Data mismatch!" << std::endl;
        return false;
    }
}

std::vector<uint8_t> convertToBytes(const std::vector<int16_t>& input) {
    std::vector<uint8_t> output;
    size_t size = input.size();

    // Ensure the input size is divisible by 8, as we're packing 8 int16 values into one byte
    if (size % 8 != 0) {
        std::cerr << "Input size must be a multiple of 8." << std::endl;
        return output;
    }

    // Process the input 8 bits at a time
    for (size_t i = 0; i < size; i += 8) {
        uint8_t byte = 0;

        // Pack 8 bits (0 or 1) into one byte
        for (int bit = 0; bit < 8; ++bit) {
            // Ensure that the int16 value is either 0 or 1
            if (input[i + bit] != 0 && input[i + bit] != 1) {
                std::cerr << "Input values must be binary (0 or 1)." << std::endl;
                return std::vector<uint8_t>();  // Return empty if input is invalid
            }

            // Shift and add the bit to the byte
            byte |= (input[i + bit] & 1) << (bit);  // Highest bit first
        }

        output.push_back(byte);  // Store the packed byte
    }

    return output;
}

void writeBinaryFile(const std::string &filename, const std::vector<uint8_t> &data) {
    // Create a binary file output stream
    if(data.empty())
        return;

    std::ofstream file(filename, std::ios::binary);

    // Check if the file opened successfully
    if (!file.is_open()) {
        std::cerr << "Could not open the file for writing!  -> " <<  filename << std::endl;
        return;
    }

    // Write the data to the binary file
    for (int value : data) {
        file.write(reinterpret_cast<const char*>(&value), 1);
    }

    // Close the file
    file.close();
}

void writeBinaryFileDouble(const std::string &filename, const std::vector<double> &data) {
    // Create a binary file output stream
    if(data.empty())
        return;

    std::ofstream file(filename, std::ios::binary);

    // Check if the file opened successfully
    if (!file.is_open()) {
        std::cerr << "Could not open the file for writing!  -> " <<  filename << std::endl;
        return;
    }

    // Write the data to the binary file
    for (double value : data) {
        file.write(reinterpret_cast<const char*>(&value), sizeof(double));
    }

    // Close the file
    file.close();
}


std::vector<int16_t> load_waveform_from_file(const std::string& filename) {
    std::ifstream file(filename);
    if (!file.is_open()) {
        std::cerr << "Error opening file: " << filename << std::endl;
        exit(0);
    }

    std::vector<int16_t> values;
    std::string line;

    while (std::getline(file, line)) {
        std::stringstream ss(line);
        //ss << std::hex << line;
        int16_t value;
        ss >> value;
        values.push_back(value);
    }

    file.close();
    return values;
}

void remove_ldpc_padding(std::vector<uint8_t>* rx_data){
    //Removing the padding from the LDPC decoder
    uint8_t * ptr = rx_data->data();
    rx_data->clear();
    rx_data->insert(rx_data->begin(),ptr,ptr+897);
    rx_data->insert(rx_data->end(),ptr+968,ptr+968+897);
    rx_data->insert(rx_data->end(),ptr+968*2,ptr+(968*2)+897);
}

void set_scheduler_options(){
    cpu_set_t mask;
    CPU_ZERO(&mask);
    CPU_SET(0, &mask);  // Bind process to core 50
    if (sched_setaffinity(0, sizeof(mask), &mask)) {
        std::cerr << "Failed to set process affinity: " << strerror(errno) << std::endl;
    }
    sched_param param{};
    param.sched_priority = sched_get_priority_max(SCHED_FIFO);

    // Set the scheduling policy to FIFO (Real-time)
    if (sched_setscheduler(0, SCHED_FIFO, &param) == -1) {
        std::cerr << "Failed to set process priority: " << strerror(errno) << std::endl;
    }
}

