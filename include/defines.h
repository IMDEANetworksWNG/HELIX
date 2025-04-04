#ifndef HELIX_DEFINES_H
#define HELIX_DEFINES_H

//UDP parameters
#define UDP_STACK_ADDR      0xB0000000
#define UDP_CONTROL_PORT    10000
#define UDP_DATA_PORT       10001
#define UDP_METADATA_PORT   10002
#define UDP_CLIENT_PORT     12345
#define UDP_CMD_ACK 	16
#define UDP_CMD_FAILED  3

//Stream manager parameters
#define STREAM_MANAGER_ADDR                     0xB000A000
#define CONTROL_REG_OFFSET                      0x0
#define CONTROL_UDP_MSS_OFFSET                  0x4
#define CONTROL_UDP_IFG_OFFSET                  0x8
#define CONTROL_UDP_TRANSFER_SIZE_OFFSET        0xC
#define CONTROL_TX_RADIO_MSS_OFFSET             0x10
#define CONTROL_TX_RADIO_IFG_OFFSET             0x14
#define CONTROL_TX_RADIO_TRANSFER_SIZE_OFFSET   0x18
#define STREAM_MANAGER_DATA_WIDTH_BYTES   8

//Scaling factor
#define SCALE_FACTOR_DIV_1                      0
#define SCALE_FACTOR_DIV_2                      1
#define SCALE_FACTOR_DIV_4                      3
#define SCALE_FACTOR_DIV_8                      4
#define SCALE_FACTOR_MULT_2                     5
#define SCALE_FACTOR_MULT_4                     6
#define SCALE_FACTOR_MULT_8                     6

//Transmitter blocks - FPGA addresses
#define TX_OFDM_MOD_ADDR                        0xB000B000
#define TX_UPSAMPLING_ADDR                      0xB000C000
#define TX_LBM_ADDR                             0xB0012000
#define TX_NR_PDSCH_ADDR                        0xB000E000
#define TX_BUILD_GRID_ADDR                      0xB000F000

//Receiver blocks - FPGA addresses
#define RX_CFO_CORRECTION_ADDR  0xB0003000
#define RX_CE_BLOCK_ADDR        0xB0002000
#define RX_DEMAP_ADDR           0xB0004000
#define RX_FILTER_ADDR          0xB0005000
#define RX_EQ_ADDR              0xB0006000
#define RX_OFDM_DEMOD_ADDR      0xB0007000
#define RX_PTRS_BLOCK_ADDR      0xB0008000
#define RX_SSB_ADDR             0xB0009000
#define RX_LDCP_DECODER_ADDR    0xB000D000
#define RX_DYNAMIC_BUFFER_ADDR  0xB0014000
#define RX_AGC_ADDR             0xB0016000

//PHY parameters
#define OFDM_FFT_SIZE 2048
#define NUM_SC_PER_RE 12
#define SAMPLING_CLK_DAC 245.76e6
#define SAMPLING_CLK_ADC 245.76e6
#define SSR_ADC           2
#define BW_MODE_HIGH 0
#define BW_MODE_LOW 1
#define RFDC_ADC_TYPE 0
#define RFDC_DAC_TYPE 1
#define SCALING_NVAR 1.1161
#define NUM_DMRS_PER_RB_TYPE_1 6
#define NUM_DMRS_PER_RB_TYPE_2 4
#define DMRS_SYM_LENGTH 1
#define SSR_NR_PDSCH 64
#define SSB_BLOCK_RE 20
#define SSB_BLOCK_NUM_SYMBOLS 4
#define SUBCARRIERS_PER_RE 12

// Modulation order definitions
#define MOD_BPSK    1
#define MOD_QPSK    2
#define MOD_16QAM   4
#define MOD_64QAM   6
#define MOD_256QAM  8

// Split definitions
#define SSB_FILE 	0
#define SPLIT_6 	1
#define SPLIT_7_3 	2
#define SPLIT_7_2 	3
#define SPLIT_7_2x 	4
#define SPLIT_8	 	5
#define FFT_ACCEL 	6
#define LDPC_ACCEL 	7
#define ALL_RX_ACCEL	8
#define HW_ACCEL_TX	6

#endif //HELIX_DEFINES_H
