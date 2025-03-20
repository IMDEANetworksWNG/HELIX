#include "udp_driver.h"		/* stdio */

#include "udp_dma_driver.h"
#include "cmd_parser.h"
#include "tx_dma_driver.h"
#include "xtime_l.h"


#define DEFAULT_IP_ADDRESS	"192.168.5.128"
#define DEFAULT_IP_MASK		"255.255.255.0"
#define DEFAULT_GW_ADDRESS	"192.168.5.255"

#define PACKET_SIZE 1024*8
#define IFG 		1024*4

#define THREAD_STACKSIZE 1024


#define DDR_ADDR	XPAR_PSU_DDR_0_S_AXI_BASEADDR
//
u32 *tx_buf = (u32 *)DDR_ADDR ;
u32 *recv_buf = (u32 *)(DDR_ADDR +0x10000) ;

static unsigned int inet_aton (const char *c_ipaddr);

static unsigned int inet_aton (const char *c_ipaddr)
{
	unsigned int u_ipaddr = 0;
	unsigned int u_tmp = 0;
	char c;
	int i_base = 10;
	int i_shift = 0;
	int i_recycle = 3;

	c = *c_ipaddr;
	while (1)
		{
		u_tmp = 0;
		while (1)
			{
			if (isdigit (c))
			{
				u_tmp = (u_tmp * i_base) + (c-0x30);
				c = *++c_ipaddr;
			}
		else
		{
			break;
		}

	}

	//BYTE shift, note network byte order is big-endian mode
	i_shift = 8*i_recycle--;
	u_tmp <<= i_shift;
	u_ipaddr += u_tmp;

	//to point (.) Processing of symbols
	if (c == '.')
	{
		c = *++c_ipaddr;
	}
	else
	{
		//If other symbols (such as a terminator, etc.) jump out of the loop
		break;
		}
	}

	return u_ipaddr;

}

int recvUDP(u8* RxBufferPtr, u32 len){

	return recv(RxBufferPtr,len);
}


int sendUDPcmd(u32 value){

	int status;

	memcpy(tx_buf,&value,sizeof(u32));

	status=send(tx_buf,4);

	if(status!=XST_SUCCESS){
		printf("Packet transmission failed\n");
	}

	return XST_SUCCESS;
}



/* thread spawned for each connection */
void process_request()
{
	int RECV_BUF_SIZE = 64;
	int status=0;

	while (1) {
		if(!recv(recv_buf, RECV_BUF_SIZE)){
			//printf("Packet Received \n");

			status = cmdParse(recv_buf);

			if(status)printf("Command ERROR: %d\n",status);
		}

	}


}


void create_udp_task(){

	xTaskCreate(process_request,"process_cmd",1024 , NULL,
			1,
			NULL);
//	sys_thread_new("process_cmd", process_request, 0,
//		THREAD_STACKSIZE,
//		2);
}

void configUDPServer(convData_t* cmdArrgs){

	u32 ifg=cmdArrgs[0].u;
	u32 pkt_size=cmdArrgs[1].u;

	Xil_Out32(XPAR_UDP_STACK_0_S00_AXI_BASEADDR+0x8, ifg/8);
	Xil_Out32(XPAR_UDP_STACK_0_S00_AXI_BASEADDR+0xC, pkt_size/8);
}



int UDP10G_init()
{
	unsigned int ip,gw;

	ip=	inet_aton(DEFAULT_IP_ADDRESS);
	gw=	inet_aton(DEFAULT_GW_ADDRESS);

	Xil_Out32(XPAR_UDP_STACK_0_S00_AXI_BASEADDR, ip);
	Xil_Out32(XPAR_UDP_STACK_0_S00_AXI_BASEADDR+0x4, gw);

	Xil_Out32(XPAR_UDP_STACK_0_S00_AXI_BASEADDR+0x8, IFG/8);
	Xil_Out32(XPAR_UDP_STACK_0_S00_AXI_BASEADDR+0xC, PACKET_SIZE/8);

	unsigned int temp =Xil_In32(XPAR_UDP_STACK_0_S00_AXI_BASEADDR+0x8);
	temp =Xil_In32(XPAR_UDP_STACK_0_S00_AXI_BASEADDR+0xC);

	init_udp_dma_driver();

	return XST_SUCCESS;
}



