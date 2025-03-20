
#ifndef __TX_DRIVER_H_
#define __TX_DRIVER_H_

#include "cmd_parser.h"

#define FIFO_SIZE 64*1024*4

void triggerTX();
int tx_xbar_init();
int loadSSB(convData_t* cmdArrgs);


#endif

