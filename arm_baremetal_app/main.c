#include <stdio.h>
#include "xparameters.h"


#include "xrfclk.h"
#include "gpio_driver.h"
#include "tx_driver.h"
#include "rx_driver.h"
#include "rfdc_driver.h"
#include "sdfs_driver.h"
#include "udp_driver.h"
#include "tools.h"
#include "tx_dma_driver.h"

#define DEBUG


void main_thread(void *p);

#define THREAD_STACKSIZE 1024


int init_drivers()
{
	int status;

	clockCFG_init(LMK_122_88MHZ);
	//clockCFG_init(LMK_110MHZ);

	status = RFDC_driver_init();
	if (status) {
		printf("ERROR: Failed to run RFDC Driver initialization\n");
		return XST_FAILURE;
	}

	status = conv_init();
	if (status) {
		printf("ERROR: Failed to run converters initialization\n");
		return XST_FAILURE;
	}

	status = NCO_init();
	if (status) {
		printf("ERROR: Failed to run NCO initialization\n");
		return XST_FAILURE;
	}

	status = config_gpio();
	if (status) {
		printf("ERROR: Failed to run GPIO initialization\n");
		return XST_FAILURE;
	}

	status = SdFs_init();
	if (status) {
		printf("ERROR: Failed to run SdFs initialization\n");
		return XST_FAILURE;
	}

	status = DMA_TX_driver_init();
	if (status) {
		printf("ERROR: Failed to run DMA DAC initialization\n");
		return XST_FAILURE;
	}


	status = UDP10G_init();
	if (status) {
		printf("ERROR: Failed to run UDP server initialization\n");
		return XST_FAILURE;
	}

	status = tx_xbar_init();
	if (status) {
		printf("ERROR: Failed to run tx xbar\n");
		return XST_FAILURE;
	}

	status = rx_xbar_init();
	if (status) {
		printf("ERROR: Failed to run rx xbar\n");
		return XST_FAILURE;
	}


#ifdef INTERRUPTS
	status = intr_init();
	if (status) {
		printf("ERROR: Failed to run interrupt driver initialization\n");
		return XST_FAILURE;
	}
#endif

    return 0;

}


void main_thread(void *p)
{
	//initialize modules (DMA, UDP, RF-IP...)
    init_drivers();

    //create UDP clien task
    create_udp_task();

	vTaskDelete(NULL);

	return;
}

int main()
{

	xTaskCreate(main_thread,"main_thread",1024 , NULL,
			2,
			NULL);
	vTaskStartScheduler();
	while(1);
	return 0;
}
