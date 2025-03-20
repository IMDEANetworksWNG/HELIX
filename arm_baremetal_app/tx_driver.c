#include "tx_driver.h"
#include "tools.h"
#include "udp_driver.h"
#include "gpio_driver.h"
#include "sdfs_driver.h"
#include "cmd_parser.h"
#include "tx_dma_driver.h"
#include "xil_io.h"
#include "xtime_l.h"
#include "xaxis_switch.h"

#define DDR_ADDR	 	XPAR_PSU_DDR_0_S_AXI_BASEADDR
#define TX_BUFFER_BASE 	DDR_ADDR +0x20000

static XAxis_Switch AxisSwitch;

int changeTXsplit(convData_t* cmdArrgs){
	u8 splitNumber=cmdArrgs[0].u;
	/* Disable register update */
	XAxisScr_RegUpdateDisable(&AxisSwitch);
	switch(splitNumber){
	case SPLIT_7_3:
		XAxisScr_MiPortEnable(&AxisSwitch, 0, 0);
		XAxisScr_MiPortEnable(&AxisSwitch, 1, 1);
		XAxisScr_MiPortEnable(&AxisSwitch, 2, 2);
		XAxisScr_MiPortEnable(&AxisSwitch, 3, 3);
		XAxisScr_MiPortDisable(&AxisSwitch, 4);
		XAxisScr_MiPortDisable(&AxisSwitch, 5);
		break;
	case SPLIT_7_2:
		XAxisScr_MiPortDisable(&AxisSwitch, 0);
		XAxisScr_MiPortEnable(&AxisSwitch, 1, 0);
		XAxisScr_MiPortEnable(&AxisSwitch, 2, 2);
		XAxisScr_MiPortEnable(&AxisSwitch, 3, 3);
		XAxisScr_MiPortDisable(&AxisSwitch, 4);
		XAxisScr_MiPortDisable(&AxisSwitch, 5);
		break;
	case SPLIT_7_2x:
		XAxisScr_MiPortDisable(&AxisSwitch, 0);
		XAxisScr_MiPortDisable(&AxisSwitch, 1);
		XAxisScr_MiPortEnable(&AxisSwitch, 2, 0);
		XAxisScr_MiPortEnable(&AxisSwitch, 3, 3);
		XAxisScr_MiPortDisable(&AxisSwitch, 4);
		XAxisScr_MiPortDisable(&AxisSwitch, 5);
		break;
	case SPLIT_8:
		XAxisScr_MiPortDisable(&AxisSwitch, 0);
		XAxisScr_MiPortDisable(&AxisSwitch, 1);
		XAxisScr_MiPortDisable(&AxisSwitch, 2);
		XAxisScr_MiPortEnable(&AxisSwitch, 3, 4);
		XAxisScr_MiPortEnable(&AxisSwitch, 4, 0);
		XAxisScr_MiPortDisable(&AxisSwitch, 5);
		break;
	case HW_ACCEL_TX:
		XAxisScr_MiPortDisable(&AxisSwitch, 0);
		XAxisScr_MiPortDisable(&AxisSwitch, 1);
		XAxisScr_MiPortDisable(&AxisSwitch, 2);
		XAxisScr_MiPortDisable(&AxisSwitch, 3);
		XAxisScr_MiPortDisable(&AxisSwitch, 4);
		XAxisScr_MiPortEnable(&AxisSwitch, 5, 0);
		break;
	default:
		printf("Split is not available");
		return XST_FAILURE;

	}
	XAxisScr_RegUpdateEnable(&AxisSwitch);

	set_gpio(HARD_RESET_TX_GPIO_PIN + GPIO_BANK_OFFSET, 1);
	usleep(2);
	set_gpio(HARD_RESET_TX_GPIO_PIN + GPIO_BANK_OFFSET, 0);

	return XST_SUCCESS;
}

int tx_xbar_init(){
	XAxis_Switch_Config *Config;
	int Status;

	Config = XAxisScr_LookupConfig(XPAR_TX_BLOCKS_AXIS_INTERCONNECT_0_XBAR_DEVICE_ID);

	Status = XAxisScr_CfgInitialize(&AxisSwitch, Config,
			Config->BaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("AXI4-Stream initialization failed.\r\n");
		return XST_FAILURE;
	}

	/* Disable register update */
	XAxisScr_RegUpdateDisable(&AxisSwitch);

	/* Disable all MI ports */
	XAxisScr_MiPortDisableAll(&AxisSwitch);

	return XST_SUCCESS;

}

static int loadLBM(u8 *buf, u32 size) {
	int ret;

	/* Disable start gpio */
	set_gpio(LBM_START_PIN + GPIO_BANK_OFFSET, 0);
	/* Disable loopback gpio */
	set_gpio(LBM_LOOPBACK_PIN + GPIO_BANK_OFFSET, 0);

	/* Reset FIFO */
	set_gpio(LBM_RST_PIN + GPIO_BANK_OFFSET, 1);
	usleep(10);
	set_gpio(LBM_RST_PIN + GPIO_BANK_OFFSET, 0);

	/* Enable load gpio */
	set_gpio(LBM_LOAD_DATA_PIN + GPIO_BANK_OFFSET, 1);

	/* Trigger DMA */
	ret = SendPacketsDMA(buf, size);
	if (ret) {
		printf("Failed to send data\n");
		return XST_FAILURE;
	}

	usleep(1000);

	/* Enable loopback gpio */
	set_gpio(LBM_LOAD_DATA_PIN + GPIO_BANK_OFFSET, 0);
	set_gpio(LBM_LOOPBACK_PIN + GPIO_BANK_OFFSET, 1);
	set_gpio(LBM_START_PIN + GPIO_BANK_OFFSET, 1);

    return XST_SUCCESS;
}


int loadSSB(convData_t* cmdArrgs){

	u32 nSamples=cmdArrgs[0].u;

	if(nSamples%16){
		printf("Error with alignment\n");
		sendUDPcmd(UDP_CMD_FAILED); //error
		return XST_FAILURE;
	}

	if (nSamples > FIFO_SIZE) {
		printf("size is too big\n");
		sendUDPcmd(UDP_CMD_FAILED); //error
		return XST_FAILURE;
	}

	//send ACK to Host
	sendUDPcmd(UDP_CMD_ACK);

	usleep(1000);

	//************ESTA PARTE HAY QUE REVISARLA****************
	//First we read samples from UDP port
	if((recvUDP((u8*)TX_BUFFER_BASE,nSamples))<0){
		printf("Error while reading samples \n");
		sendUDPcmd(UDP_CMD_FAILED);
		return XST_FAILURE;
	}

	usleep(1000);

 //trasient of time to load data into PS DDR

	//Then we feed it to the LBM using a TX DMA
	if(loadLBM((u8*)TX_BUFFER_BASE,nSamples)){
		printf("Error while loading data to DMA \n");
		sendUDPcmd(UDP_CMD_FAILED);
		return XST_FAILURE;
	}

	//sendUDPcmd(UDP_CMD_ACK);

	return XST_SUCCESS;

}

void triggerTX(convData_t* cmdArrgs){

	//Send an ACK message to confirm the TX was triggered
	sendUDPcmd(UDP_CMD_ACK);

	Xil_Out32(XPAR_STREAM_MANAGER_0_S00_AXI_BASEADDR, 0);

	usleep(1);

	Xil_Out32(XPAR_STREAM_MANAGER_0_S00_AXI_BASEADDR+0x18,cmdArrgs[0].u/8);

	Xil_Out32(XPAR_STREAM_MANAGER_0_S00_AXI_BASEADDR,1<<30);


}



