#include "rx_driver.h"
#include "tools.h"
#include "udp_driver.h"
#include "gpio_driver.h"
#include "rfdc_driver.h"
#include "cmd_parser.h"
#include "tx_dma_driver.h"
#include "xaxis_switch.h"

static XAxis_Switch AxisSwitch;

int enableRX(convData_t* cmdArrgs){

	set_gpio(ENABLE_RECV_PIN + GPIO_BANK_OFFSET, cmdArrgs[0].u);
	if (!cmdArrgs[0].u){
		set_gpio(HARD_RESET_RX_GPIO_PIN+GPIO_BANK_OFFSET,1);
		usleep(10);
		set_gpio(HARD_RESET_RX_GPIO_PIN+GPIO_BANK_OFFSET,0);
	}
	return XST_SUCCESS;
}

int changeRXsplit(convData_t* cmdArrgs){
	u8 splitNumber=cmdArrgs[0].u;
	/* Disable register update */
	XAxisScr_RegUpdateDisable(&AxisSwitch);
	switch(splitNumber){
	case SPLIT_6:
		XAxisScr_MiPortEnable(&AxisSwitch, 0, 0);
		XAxisScr_MiPortEnable(&AxisSwitch, 1, 1);
		XAxisScr_MiPortEnable(&AxisSwitch, 2, 2);
		XAxisScr_MiPortEnable(&AxisSwitch, 3, 3);
		XAxisScr_MiPortEnable(&AxisSwitch, 4, 4);
		XAxisScr_MiPortEnable(&AxisSwitch, 5, 5);
		XAxisScr_MiPortEnable(&AxisSwitch, 6, 6);
		XAxisScr_MiPortEnable(&AxisSwitch, 7, 7);
		XAxisScr_MiPortEnable(&AxisSwitch, 8, 8);
		XAxisScr_MiPortEnable(&AxisSwitch, 9, 9);
		break;
	case SPLIT_7_3:
		XAxisScr_MiPortEnable(&AxisSwitch, 0, 0);
		XAxisScr_MiPortEnable(&AxisSwitch, 1, 1);
		XAxisScr_MiPortEnable(&AxisSwitch, 2, 2);
		XAxisScr_MiPortEnable(&AxisSwitch, 3, 3);
		XAxisScr_MiPortEnable(&AxisSwitch, 4, 4);
		XAxisScr_MiPortEnable(&AxisSwitch, 5, 5);
		XAxisScr_MiPortDisable(&AxisSwitch, 6);
		XAxisScr_MiPortDisable(&AxisSwitch, 7);
		XAxisScr_MiPortEnable(&AxisSwitch, 8, 6);
		XAxisScr_MiPortEnable(&AxisSwitch, 9, 7);
		break;
	case SPLIT_7_2:
		XAxisScr_MiPortEnable(&AxisSwitch, 0, 0);
		XAxisScr_MiPortEnable(&AxisSwitch, 1, 1);
		XAxisScr_MiPortEnable(&AxisSwitch, 2, 2);
		XAxisScr_MiPortEnable(&AxisSwitch, 3, 3);
		XAxisScr_MiPortDisable(&AxisSwitch, 4);
		XAxisScr_MiPortDisable(&AxisSwitch, 5);
		XAxisScr_MiPortDisable(&AxisSwitch, 6);
		XAxisScr_MiPortDisable(&AxisSwitch, 7);
		XAxisScr_MiPortEnable(&AxisSwitch, 8, 4);
		XAxisScr_MiPortEnable(&AxisSwitch, 9, 5);
		break;
	case SPLIT_7_2x:
		XAxisScr_MiPortEnable(&AxisSwitch, 0, 0);
		XAxisScr_MiPortEnable(&AxisSwitch, 1, 1);
		XAxisScr_MiPortDisable(&AxisSwitch, 2);
		XAxisScr_MiPortDisable(&AxisSwitch, 3);
		XAxisScr_MiPortDisable(&AxisSwitch, 4);
		XAxisScr_MiPortDisable(&AxisSwitch, 5);
		XAxisScr_MiPortDisable(&AxisSwitch, 6);
		XAxisScr_MiPortDisable(&AxisSwitch, 7);
		XAxisScr_MiPortEnable(&AxisSwitch, 8, 2);
		XAxisScr_MiPortEnable(&AxisSwitch, 9, 3);
		break;
	case SPLIT_8:
		XAxisScr_MiPortDisable(&AxisSwitch, 0);
		XAxisScr_MiPortDisable(&AxisSwitch, 1);
		XAxisScr_MiPortDisable(&AxisSwitch, 2);
		XAxisScr_MiPortDisable(&AxisSwitch, 3);
		XAxisScr_MiPortDisable(&AxisSwitch, 4);
		XAxisScr_MiPortDisable(&AxisSwitch, 5);
		XAxisScr_MiPortDisable(&AxisSwitch, 6);
		XAxisScr_MiPortDisable(&AxisSwitch, 7);
		XAxisScr_MiPortEnable(&AxisSwitch, 8, 0);
		XAxisScr_MiPortEnable(&AxisSwitch, 9, 1);
		break;
	case FFT_ACCEL:
		XAxisScr_MiPortEnable(&AxisSwitch, 0, 10);
		XAxisScr_MiPortEnable(&AxisSwitch, 1, 11);
		XAxisScr_MiPortDisable(&AxisSwitch, 2);
		XAxisScr_MiPortDisable(&AxisSwitch, 3);
		XAxisScr_MiPortDisable(&AxisSwitch, 4);
		XAxisScr_MiPortDisable(&AxisSwitch, 5);
		XAxisScr_MiPortDisable(&AxisSwitch, 6);
		XAxisScr_MiPortDisable(&AxisSwitch, 7);
		XAxisScr_MiPortEnable(&AxisSwitch, 8, 2);
		XAxisScr_MiPortEnable(&AxisSwitch, 9, 3);
		break;
	default:
		printf("Split is not available");
		return XST_FAILURE;

	}
	XAxisScr_RegUpdateEnable(&AxisSwitch);

	set_gpio(HARD_RESET_RX_GPIO_PIN + GPIO_BANK_OFFSET, 1);
	usleep(2);
	set_gpio(HARD_RESET_RX_GPIO_PIN + GPIO_BANK_OFFSET, 0);

	return XST_SUCCESS;
}

int rx_xbar_init(){
	XAxis_Switch_Config *Config;
	int Status;

	Config = XAxisScr_LookupConfig(XPAR_RX_BLOCKS_AXIS_INTERCONNECT_0_XBAR_DEVICE_ID);

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


void triggerRX(convData_t* cmdArrgs){

	u8 enable_ce=cmdArrgs[1].u;
	u8 enable_energy=cmdArrgs[2].u;
	u8 enable_cfo=cmdArrgs[3].u;
	u64 n_packets=cmdArrgs[4].l;
	u32 message=0;
	uint8_t enable_packetizer=0;

	if (enable_ce | enable_energy | enable_cfo){
		message= 1 | enable_ce<<5| enable_energy<<6| enable_cfo<<8 | n_packets<<12;
		enable_packetizer=1;
	}


	//Enable extra data (Channel measurements, CFO and energy)
	Xil_Out32(XPAR_RX_BLOCKS_PACKETIZER_RT_0_BASEADDR, message);

	Xil_Out32(XPAR_STREAM_MANAGER_0_S00_AXI_BASEADDR, 0);

	usleep(1);

	Xil_Out32(XPAR_STREAM_MANAGER_0_S00_AXI_BASEADDR+0xC,cmdArrgs[0].u/8);

	//Send an ACK message to confirm the RX was triggered
	sendUDPcmd(UDP_CMD_ACK);

	//Xil_Out32(XPAR_STREAM_MANAGER_0_S00_AXI_BASEADDR,1<<31 | enable_packetizer<<29);
	Xil_Out32(XPAR_STREAM_MANAGER_0_S00_AXI_BASEADDR,1<<31);

}







