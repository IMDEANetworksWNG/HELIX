// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xnrpdsch.h"

extern XNrpdsch_Config XNrpdsch_ConfigTable[];

XNrpdsch_Config *XNrpdsch_LookupConfig(u16 DeviceId) {
	XNrpdsch_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XNRPDSCH_NUM_INSTANCES; Index++) {
		if (XNrpdsch_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XNrpdsch_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XNrpdsch_Initialize(XNrpdsch *InstancePtr, u16 DeviceId) {
	XNrpdsch_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XNrpdsch_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XNrpdsch_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

