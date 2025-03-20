#ifndef __UDP_DRIVER_H_
#define __UDP_DRIVER_H_

#include "cmd_parser.h"

#define UDP_CMD_ACK 	16
#define UDP_CMD_FAILED  3

#define UDP_SERVER_AVAILABLE

void create_udp_task();
void configUDPServer(convData_t* cmdArrgs);
int UDP10G_init();
int sendUDPcmd(u32 value);
int recvUDP(u8* RxBufferPtr, u32 len);


#endif

