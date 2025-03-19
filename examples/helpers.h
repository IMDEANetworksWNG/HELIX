#ifndef HELIX_HELPERS_H
#define HELIX_HELPERS_H

#include <string>
#include <vector>
#include <cstdint>

/**
 * @brief Checks if two data buffers are identical. For validation purposes.
 *
 * @param received_data Pointer to the received data buffer.
 * @param sent_data     Pointer to the original sent data buffer.
 * @param num_bytes     The number of bytes to compare.
 * @return              True if the data matches, false otherwise.
 */
bool check_data(uint8_t * received_data, uint8_t* sent_data, int num_bytes);

/**
 * @brief Converts a vector of int16_t (representing bits) into a vector of bytes.
 *        Packs 8 int16_t values (0 or 1) into a single byte.
 *
 * @param input A vector of int16_t values, where each value should be 0 or 1. The size of input should be multiple of 8
 * @return      A vector of bytes, where each byte contains 8 packed bits.  Returns an empty vector if the input is invalid (not a multiple of 8 or contains non-binary values).
 */
std::vector<uint8_t> convertToBytes(const std::vector<int16_t>& input);

/**
 * @brief Writes a vector of doubles to a binary file. Used to store the side info data (cfo, snr, ce).
 *
 * @param filename The name of the file to write to.
 * @param data     The vector of doubles to write.
 */
void writeBinaryFileDouble(const std::string &filename, const std::vector<double> &data);

/**
 * @brief Writes a vector of uint8_t to a binary file. Normally used for storing raw data coming from the FPGA
 *
 * @param filename The name of the file to write to.
 * @param data     The vector of uint8_t to write.
 */
void writeBinaryFile(const std::string &filename, const std::vector<uint8_t> &data);

/**
 * @brief Sets the scheduler options for real-time performance. Root permissions are needed.
 *        Binds the process to CPU core 0 and sets the scheduling policy to FIFO with maximum priority.
 *        Prints error messages to stderr if the operations fail.
 */
void set_scheduler_options();

/**
 * @brief Loads a waveform from a text file containing a list of int16_t values.
 *
 * @param filename The name of the file to load the waveform from.
 * @return         A vector of int16_t values representing the waveform. Exits if the file cannot be opened.
 */
std::vector<int16_t> load_waveform_from_file(const std::string& filename);

/**
 * @brief Constructs a waveform filename based on modulation order, number of resource elements, rate, and split configuration.
 *
 * @param mod_order The modulation order (e.g., MOD_QPSK, MOD_16QAM).
 * @param n_re      The number of resource elements.
 * @param rate      The rate.
 * @param split     The split configuration (e.g., SPLIT_7_3, SPLIT_7_2).
 * @return          The constructed waveform filename.
 */
std::string get_waveform_filename(uint8_t mod_order, uint8_t n_re, float rate, uint8_t split);

#endif //HELIX_HELPERS_H