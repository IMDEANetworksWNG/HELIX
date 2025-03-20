
#include "tx_dma_driver.h"
#include "tools.h"
#include "xaxidma.h"
#include <time.h>

#define DDR_ADDR	XPAR_PSU_DDR_0_S_AXI_BASEADDR

/************************** Variable Definitions *****************************/
/*
 * Device instance definitions
 */
XAxiDma AxiDmaTX;

u32 *Packet = (u32 *) DDR_ADDR + 0x100000;


int SendPacketsDMA(int16_t *buf, u32 size){
	int Status;

    int timeout_milliseconds = 1000; // timeout in milliseconds
    clock_t start_time = clock(); // get the starting clock ticks

	/* Disable interrupts, we use polling mode*/
	XAxiDma_IntrDisable(&AxiDmaTX, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DMA_TO_DEVICE);


	/* Flush the buffers before the DMA transfer, in case the Data Cache
	 * is enabled
	 */
	Xil_DCacheFlushRange((UINTPTR)buf, size);

	Status = XAxiDma_SimpleTransfer(&AxiDmaTX,(UINTPTR) buf,
			size, XAXIDMA_DMA_TO_DEVICE);

	if (Status != XST_SUCCESS) {
		printf("DMA ERROR: %d \r\n", Status);
		return XST_FAILURE;
	}


	while ((XAxiDma_Busy(&AxiDmaTX,XAXIDMA_DMA_TO_DEVICE))) {
			/* Wait */
	    clock_t elapsed_time = (clock() - start_time) * 1000 / CLOCKS_PER_SEC;

	    if (elapsed_time >= timeout_milliseconds) {
	        printf("Timeout occurred while setting DMA\n");
	        break;
	    }
	}

	return XST_SUCCESS;
}

int DMA_TX_driver_init()
{
	XAxiDma_Config *CfgPtr;
	int Status;

	/* Initialize the XAxiDma device.
	 */
	CfgPtr = XAxiDma_LookupConfig(DMA_TX_DEV_ID);
	if (!CfgPtr) {
		printf("No config found for %d\r\n", DMA_TX_DEV_ID);
		return XST_FAILURE;
	}

	Status = XAxiDma_CfgInitialize(&AxiDmaTX, CfgPtr);
	if (Status != XST_SUCCESS) {
		printf("Initialization failed %d\r\n", Status);
		return XST_FAILURE;
	}

	if(XAxiDma_HasSg(&AxiDmaTX)){
		printf("Device configured as SG mode \r\n");
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}
