//
// Created by imdea on 03/06/2024.
//

#ifndef MIMORPH_RT_DEFINES_H
#define MIMORPH_RT_DEFINES_H

#define UDP_STACK_ADDR      0xB0000000
#define UDP_CONTROL_PORT    10000
#define UDP_DATA_PORT       10001
#define UDP_CLIENT_PORT     12345

#define STREAM_MANAGER_ADDR                     0xB0020000
#define CONTROL_REG_OFFSET                      0x0
#define CONTROL_UDP_MSS_OFFSET                  0x4
#define CONTROL_UDP_IFG_OFFSET                  0x8
#define CONTROL_UDP_TRANSFER_SIZE_OFFSET        0xC
#define CONTROL_TX_RADIO_MSS_OFFSET             0x10
#define CONTROL_TX_RADIO_IFG_OFFSET             0x14
#define CONTROL_TX_RADIO_TRANSFER_SIZE_OFFSET   0x18

#define OFDM_MOD_ADDR                           0xB0021000

#define TX_UPSAMPLING_ADDR                      0xB0022000
#define TX_IFS_OFFSET                           0x0
#define TX_BW_OFFSET                            0x4

#define STREAM_MANAGER_DATA_WIDTH_BYTES   8

#define TRIGGER_ACK   0x10

#define SAMPLING_CLK_DAC 245.76e6

#define BW_MODE_HIGH 0
#define BW_MODE_LOW 1

#define RFDC_ADC_TYPE 0
#define RFDC_DAC_TYPE 1

#endif //MIMORPH_RT_DEFINES_H
