//
// Created by imdea on 22/11/2024.
//

#ifndef MIMORPH_RT_HELPERS_H
#define MIMORPH_RT_HELPERS_H

#include <iostream>
#include <string>
#include <vector>

bool check_data(uint8_t * received_data, uint8_t* sent_data, int num_bytes);
std::vector<uint8_t> convertToBytes(const std::vector<int16_t>& input);
void writeBinaryFileDouble(const std::string &filename, const std::vector<double> &data);
void writeBinaryFile(const std::string &filename, const std::vector<uint8_t> &data);
std::vector<uint8_t> convertToBytes(const std::vector<int16_t>& input);
void set_scheduler_options();
std::vector<int16_t> load_waveform_from_file(const std::string& filename);
void remove_ldpc_padding(std::vector<uint8_t>* rx_data);

#endif //MIMORPH_RT_HELPERS_H


