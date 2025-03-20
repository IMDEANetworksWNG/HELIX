#include "gpio_driver.h"
#include "tools.h"
#include "xparameters.h"
#include "xgpiops.h"

XGpioPs Gpio;
XGpioPs_Config *ConfigGPIO;

int enable_gpio(int gpio) {

	XGpioPs_SetDirectionPin(&Gpio, gpio, 1);
	XGpioPs_SetOutputEnablePin(&Gpio, gpio, 1);

	return 0;
}

int enable_gpio_in(int gpio) {

	XGpioPs_SetDirectionPin(&Gpio, gpio, 0);

	return 0;
}


int set_gpio(int gpio, int value) {
	XGpioPs_WritePin(&Gpio, gpio, value);
	return 0;
}

u32 read_gpio(int gpio) {
	return XGpioPs_ReadPin(&Gpio, gpio);;
}

int config_gpio() {

	printf("Initializing GPIO Driver \r\n");

	/* Initialize the GPIO driver. */
	ConfigGPIO = XGpioPs_LookupConfig(XPAR_PSU_GPIO_0_DEVICE_ID);

	XGpioPs_CfgInitialize(&Gpio, ConfigGPIO, XPAR_PSU_GPIO_0_BASEADDR);

	for(int i=0;i<95;i++){
		enable_gpio(i+GPIO_BANK_OFFSET);
	}

	printf("GPIO Driver initialized \r\n");

	return XST_SUCCESS;
}
