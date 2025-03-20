#include "rfdc_driver.h"
#include "tools.h"
#include "xparameters.h"
#include "xrfdc.h"
#include "cmd_parser.h"

#define RFDC_DEVICE_ID 	XPAR_XRFDC_0_DEVICE_ID

/***************** Macros (Inline Functions) Definitions ********************/


/************************** Variable Definitions ****************************/
static XRFdc RFdcInst;
static XRFdc_MultiConverter_Sync_Config ADC_Sync_Config;
static XRFdc_MultiConverter_Sync_Config DAC_Sync_Config;

int setFreezeCal(convData_t* cmdArrgs) {
	int status;

	XRFdc_Cal_Freeze_Settings calPortSet;
	calPortSet.FreezeCalibration=cmdArrgs[0].i;
	calPortSet.DisableFreezePin=0;
	calPortSet.CalFrozen=0;
	for (int j = 0; j < 4; j++){
		for (int i = 0; i < 2; i++) {
			status = XRFdc_SetCalFreeze(&RFdcInst,j,i, &calPortSet);
			if (status != XRFDC_SUCCESS) {
				printf("error while setting calibration mode (ADC) %d\n", status);
				return XRFDC_FAILURE;
			}
		}
	}

	sleep (1);

	XRFdc_GetCalFreeze(&RFdcInst,2,0, &calPortSet);
	printf("Calibration result: %d\n",calPortSet.CalFrozen);
	return XRFDC_SUCCESS;
}

int setNCOfreq(convData_t* cmdArrgs){

	int status;
	u32 type=cmdArrgs[0].u;
	u32 tile=cmdArrgs[1].u;
	u32 block=	cmdArrgs[2].u;
	double freq=	cmdArrgs[3].d;
	u8 last_tile = cmdArrgs[4].i;

	XRFdc_Mixer_Settings Mixer_Settings;


	XRFdc_MTS_Sysref_Config(&RFdcInst,&ADC_Sync_Config,&DAC_Sync_Config,0);

	XRFdc_GetMixerSettings (&RFdcInst, type, tile, block, &Mixer_Settings);

	Mixer_Settings.Freq=freq;

	status = XRFdc_SetMixerSettings (&RFdcInst, type, tile, block, &Mixer_Settings);
	if (status != XRFDC_SUCCESS) {
		printf("Error Setting Mixer Settings = %d\n", status);
	return status;
	}

	XRFdc_ResetNCOPhase(&RFdcInst, type, tile,block);

	XRFdc_UpdateEvent(&RFdcInst, type, tile, 0, XRFDC_EVENT_MIXER);
//
//	if(last_tile){
//		sleep(0.1);
//		XRFdc_MTS_Sysref_Config(&RFdcInst,&ADC_Sync_Config,&DAC_Sync_Config,1);
//	}


	return XRFDC_SUCCESS;
}

int setNyquistZone(convData_t* cmdArrgs)
{
	int status;
	u32 type=cmdArrgs[0].u;
	u32 tile=cmdArrgs[1].u;
	u32 block=	cmdArrgs[2].u;
	u32 zone=	cmdArrgs[3].u;

	status = 	XRFdc_SetNyquistZone (&RFdcInst, type,tile,block, zone);
	if (status != XRFDC_SUCCESS) {
		printf("Error Setting Mixer Settings = %d\n", status);
	return status;
	}

	return XRFDC_SUCCESS;
}


int setQMCsettings(convData_t* cmdArrgs){
	int status;
	u32 type=cmdArrgs[0].u;
	u32 tile=cmdArrgs[1].u;
	u32 block=	cmdArrgs[2].u;
	u32 enableGain=	cmdArrgs[3].u;
	double gain=	cmdArrgs[4].d;
	XRFdc_QMC_Settings QMC_Settings;

	QMC_Settings.EventSource = XRFDC_EVNT_SRC_TILE; // QMC Settings are

	QMC_Settings.GainCorrectionFactor = gain; // Set Gain for I
	QMC_Settings.OffsetCorrectionFactor =-5.0;
	QMC_Settings.EnableGain = enableGain;
	QMC_Settings.EnablePhase = 0;
	status = XRFdc_SetQMCSettings(&RFdcInst, type, tile, block, &QMC_Settings);
	if (status != XRFDC_SUCCESS) {
		printf("Error Setting QMC Settings = %d\n", status);
	return status;
	}

	XRFdc_UpdateEvent(&RFdcInst,type, tile, 0, XRFDC_EVENT_QMC);

	return XRFDC_SUCCESS;
}




int NCO_init(){

	int status;
	XRFdc_Mixer_Settings Mixer_Settings;

	XRFdc_MTS_Sysref_Config(&RFdcInst,&ADC_Sync_Config,&DAC_Sync_Config,0);

	//DAC
	for (int j = 0; j < 1; j++) {
		for (int i = 0; i < 1; i++) {
			XRFdc_GetMixerSettings (&RFdcInst, XRFDC_DAC_TILE, j, i, &Mixer_Settings);
			//Mixer_Settings.EventSource = XRFDC_EVNT_SRC_SYSREF;
			Mixer_Settings.EventSource = XRFDC_EVNT_SRC_TILE;
			Mixer_Settings.Freq=400;
			Mixer_Settings.FineMixerScale =XRFDC_MIXER_SCALE_1P0;
			status = XRFdc_SetMixerSettings (&RFdcInst, XRFDC_DAC_TILE, j, i, &Mixer_Settings);
			if (status != XRFDC_SUCCESS) {
				printf("Error Setting Mixer Settings = %d\n", status);
			return status;
			}

			XRFdc_ResetNCOPhase(&RFdcInst, XRFDC_DAC_TILE, j, i);
		}
		XRFdc_UpdateEvent(&RFdcInst, XRFDC_DAC_TILE, j, 0, XRFDC_EVENT_MIXER);
	}


	for(int j = 2; j < 3; j++){ //Only for tiles 2 and 3
		for (int i = 0; i < 1; i++) {
			XRFdc_GetMixerSettings (&RFdcInst, XRFDC_ADC_TILE, j, i, &Mixer_Settings);
			//Mixer_Settings.EventSource = XRFDC_EVNT_SRC_SYSREF;
			Mixer_Settings.EventSource = XRFDC_EVNT_SRC_TILE;
			Mixer_Settings.Freq=-400;
			Mixer_Settings.FineMixerScale =XRFDC_MIXER_SCALE_1P0;
			status = XRFdc_SetMixerSettings (&RFdcInst, XRFDC_ADC_TILE, j, i, &Mixer_Settings);
			if (status != XRFDC_SUCCESS) {
				printf("Error Setting Mixer Settings = %d\n", status);
			return status;
			}

			XRFdc_ResetNCOPhase(&RFdcInst, XRFDC_ADC_TILE, j, i);
		}
		XRFdc_UpdateEvent(&RFdcInst, XRFDC_ADC_TILE, j, 0, XRFDC_EVENT_MIXER);
   }

	sleep(0.1);

	//XRFdc_MTS_Sysref_Config(&RFdcInst,&ADC_Sync_Config,&DAC_Sync_Config,1);

	return XRFDC_SUCCESS;
}





int conv_init(){

	int status;
	XRFdc_BlockStatus BlockStatus;

	u8 adc_tiles=1;
	u8 dac_tiles=1;
	u8 offset =2;


	for (int i = 0; i < adc_tiles; i++) {
		if (!XRFdc_IsADCBlockEnabled(&RFdcInst,i+offset,0)) {
			printf("Tile %d is NOT active\n", i+offset);
			return XRFDC_FAILURE;
		}
		printf("Tile %d is active\n", i+offset);

		status = XRFdc_Reset(&RFdcInst, XRFDC_ADC_TILE, i+offset);
		if (status != XRFDC_SUCCESS) {
			printf("error while resetting tile (ADC) %d\n", status);
			return XRFDC_FAILURE;
		}

		status =XRFdc_GetBlockStatus(&RFdcInst, XRFDC_ADC_TILE, i+offset, 0, &BlockStatus);
		if (status != XRFDC_SUCCESS) {
			return XRFDC_FAILURE;
		}

		printf("\n ADC%d%d Status \n"
		"DataPathClockStatus - %d \t IsFIFOFlagsEnabled - %d \t IsFIFOFlagsAsserted - %d \r\n", i+offset, 0, BlockStatus.DataPathClocksStatus,
		BlockStatus.IsFIFOFlagsEnabled, BlockStatus.IsFIFOFlagsAsserted);


	}


	for (int i = 0; i < dac_tiles; i++) {
		if (!XRFdc_IsDACBlockEnabled(&RFdcInst,i,0)) {
			printf("Tile %d is NOT active\n", i);
			return XRFDC_FAILURE;
		}
		printf("Tile %d is active\n", i);

		status = XRFdc_Reset(&RFdcInst, XRFDC_DAC_TILE, i);
		if (status != XRFDC_SUCCESS) {
			printf("error while resetting tile (DAC) %d\n", status);
			return XRFDC_FAILURE;
		}

		status =XRFdc_GetBlockStatus(&RFdcInst, XRFDC_DAC_TILE, i, 0, &BlockStatus);
		if (status != XRFDC_SUCCESS) {
			return XRFDC_FAILURE;
		}
		printf("\n DAC%d%d Status \n"
		"DataPathClockStatus - %d \t IsFIFOFlagsEnabled - %d \t IsFIFOFlagsAsserted - %d \r\n", i, 0, BlockStatus.DataPathClocksStatus,
		BlockStatus.IsFIFOFlagsEnabled, BlockStatus.IsFIFOFlagsAsserted);
	}


//    printf("\n=== Run ADC Sync ===\n");
//
//    /* Initialize ADC MTS Settings */
//    XRFdc_MultiConverter_Init (&ADC_Sync_Config, 0, 0, XRFDC_TILE_ID2);
//    ADC_Sync_Config.Tiles = 0xF;	/* Sync ADC tiles 0, 1, 2, 3 */
//
//    status = XRFdc_MultiConverter_Sync(&RFdcInst, XRFDC_ADC_TILE,
//					&ADC_Sync_Config);
//    if(status == XRFDC_MTS_OK){
//    	printf("INFO : ADC Multi-Tile-Sync completed successfully\n");
//    }else{
//		printf("ERROR : ADC Multi-Tile-Sync did not complete successfully. Error code is %u \n",status);
//		return status;
//    }
//
//	/* Run MTS for the ADC & DAC */
//	printf("\n=== Run DAC Sync ===\n");
//
//    XRFdc_MultiConverter_Init (&DAC_Sync_Config, 0, 0, XRFDC_TILE_ID0);
//    DAC_Sync_Config.Tiles = 0xF;	/* Sync DAC tiles 0, 1, 2, 3 */
//
//    status = XRFdc_MultiConverter_Sync(&RFdcInst, XRFDC_DAC_TILE,
//					&DAC_Sync_Config);
//    if(status == XRFDC_MTS_OK){
//    	printf("INFO : DAC Multi-Tile-Sync completed successfully\n");
//    }else{
//		printf("ERROR : DAC Multi-Tile-Sync did not complete successfully. Error code is %u \n",status);
//		return status;
//    }

	return XRFDC_SUCCESS;

}


int RFDC_driver_init()
{
	int status;
	XRFdc *RFdcInstPtr = &RFdcInst;
	XRFdc_Config *ConfigPtr;

    ConfigPtr = XRFdc_LookupConfig(RFDC_DEVICE_ID);
    if (ConfigPtr == NULL) {
		return XRFDC_FAILURE;
	}

    status = XRFdc_CfgInitialize(RFdcInstPtr, ConfigPtr);
    if (status != XRFDC_SUCCESS) {
        printf("RFdc Init Failure\n\r");
    }

	return XRFDC_SUCCESS;
}
