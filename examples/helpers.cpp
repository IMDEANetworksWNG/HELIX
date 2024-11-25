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

static int getTBSFromTable(int NdInfo) {
    // Capture TS 38.214 Table 5.1.3.2-1
    std::vector<int> tbsTable = {
            24,   32,   40,   48,   56,   64,   72,   80,   88,   96,  104,  112,  120,  128,  136,  144,  152,  160,  168,  176,  184,  192,  208,  224,  240,  256,
            272,  288,  304,  320,  336,  352,  368,  384,  408,  432,  456,  480,  504,  528,  552,  576,  608,  640,  672,  704,  736,  768,  808,  848,  888,  928,
            984, 1032, 1064, 1128, 1160, 1192, 1224, 1256, 1288, 1320, 1352, 1416, 1480, 1544, 1608, 1672, 1736, 1800, 1864, 1928, 2024, 2088, 2152, 2216, 2280, 2408,
            2472, 2536, 2600, 2664, 2728, 2792, 2856, 2976, 3104, 3240, 3368, 3496, 3624, 3752, 3824
    };

    // Find the closest TBS value in the table that is not less than NdInfo
    auto it = std::lower_bound(tbsTable.begin(), tbsTable.end(), NdInfo);

    // If a match is found, return the value; otherwise, return the last value in the table
    return (it != tbsTable.end()) ? *it : tbsTable.back();
}

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

int getTBS(const int mod_order,const int nPRB, const double R) {
    // Number of codewords
    int NREPerPRB=164;

    double NREPrime = double(NREPerPRB) - 6; //ptrs overhead
    int NRE = std::min(156.0,NREPrime)*double(nPRB);

    int tbs=0;

    int Ninfo=mod_order*NRE*R;

    if (Ninfo <= 3824) {
        int n = std::max(3, static_cast<int>(std::floor(std::log2(Ninfo)) - 6));
        // Calculate quantized intermediate number of information bits (Nd_info)
        int NdInfo = std::max(24, (1 << n) * (Ninfo / (1 << n)));
        // Get the TBS value using TS 38.214 Table 5.1.3.2-1
        tbs = getTBSFromTable(NdInfo);
    } else {
        int n = static_cast<int>(std::floor(std::log2(Ninfo - 24)) - 5);
        // Calculate quantized intermediate number of information bits (Nd_info)
        int NdInfo = std::max(3840, (1 << n) * static_cast<int>(std::round((Ninfo - 24.0) / (1 << n))));
        int C = 0;
        if (R <= 1.0 / 4.0) {
            C = std::ceil((NdInfo + 24.0) / 3816.0);
        } else {
            if (NdInfo > 8424) {
                C = std::ceil((NdInfo + 24.0) / 8424.0);
            } else {
                C = 1;
            }
        }
        // Calculate TBS
        tbs = 8 * C * std::ceil((NdInfo + 24.0) / (8.0 * C)) - 24;
    }

    return tbs;
}
