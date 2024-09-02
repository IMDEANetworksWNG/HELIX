//
// Created by imdea on 30/05/2024.
//

#include <iostream>
#include <fstream>
#include <sstream>
#include <vector>
#include <string>

#include "test_csv.h"

std::vector<std::string> blockNames;
std::string blockNames_fn="block_names.conf";

// Function to split a line into tokens based on comma delimiter
std::vector<std::string> getNextLineAndSplitIntoTokens(std::istream& str) {
    std::vector<std::string> result;
    std::string line;
    std::getline(str, line);
    std::stringstream lineStream(line);
    std::string cell;
    while (std::getline(lineStream, cell, ',')) {
        result.push_back(cell);
    }
    // Check for a trailing comma with no data after it
    if (!lineStream && cell.empty()) {
        result.push_back("");
    }
    return result;
}

std::vector<std::string> splitNameIntoTokens(std::string& str) {
    std::istringstream iss(str);
    std::vector<std::string> tokens;
    std::string token;
    while (std::getline(iss, token, '/')) {
        tokens.push_back(token);
    }
    return tokens;
}

uint32_t readBlockNames (std::string filename) {

    std::ifstream fileInput(filename);
    if (!fileInput.is_open()) {
        std::cout << "Unable to open file." << std::endl;
        return 1;
    }
    std::string line;
    while (std::getline(fileInput, line)) {
        blockNames.push_back(line);
    }
    return 1;
}



int main() {

    std::string filename = "/home/rafael/Vivado/ZCU208/MIMORPH_RT/addr_table.csv"; // Replace with your CSV file path
    std::string searchString = "stream_manager_0"; // Replace with the string you're searching for

    std::ifstream fileInput(filename);
    if (!fileInput.is_open()) {
        std::cout << "Unable to open file." << std::endl;
        return 1;
    }

    std::string line;
    while (std::getline(fileInput, line)) {
        std::vector<std::string> tokens = getNextLineAndSplitIntoTokens(fileInput);
        if (tokens.size() > 2) {
            std::vector<std::string> smalltokens = splitNameIntoTokens(tokens[2]);
            for (const std::string &str: smalltokens) {
                if (str == searchString) {
                    std::cout << "Found: " << tokens[3] << std::endl;
                }
            }
        }
    }

    fileInput.close();
    return 0;
}