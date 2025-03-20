#ifndef __RFDC_DRIVER_H_
#define __RFDC_DRIVER_H_


/******************* Include Files ********************************/


#define DAC 1
#define ADC 0

int conv_init();
int change_fifo_stat(int fifo_id, int tile_id, int stat);
int RFDC_driver_init();
int NCO_init();

#endif

