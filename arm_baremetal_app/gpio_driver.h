/*
 * gpio_driver.c
 *
 *  Created on: 25 nov. 2019
 *      Author: rruiz
 */

#ifndef __GPIO_DRIVER_H_
#define __GPIO_DRIVER_H_

/*****************************************************************************/

/******************* Include Files ********************************/


#define GPIO_BANK_OFFSET 78

#define HARD_RESET_TX_GPIO_PIN 0
#define HARD_RESET_RX_GPIO_PIN 1
#define LBM_START_PIN          2
#define LBM_LOAD_DATA_PIN      3
#define LBM_LOOPBACK_PIN       4
#define LBM_RST_PIN      	   5
//#define TRIGGER_PACKETIZER_PIN 6
#define ENABLE_RECV_PIN 6

int config_gpio();
int set_gpio(int gpio, int value);

#endif
