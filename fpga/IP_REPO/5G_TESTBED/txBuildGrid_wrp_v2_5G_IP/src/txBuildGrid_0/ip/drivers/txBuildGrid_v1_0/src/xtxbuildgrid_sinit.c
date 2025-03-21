// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xtxbuildgrid.h"

extern XTxbuildgrid_Config XTxbuildgrid_ConfigTable[];

XTxbuildgrid_Config *XTxbuildgrid_LookupConfig(u16 DeviceId) {
	XTxbuildgrid_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XTXBUILDGRID_NUM_INSTANCES; Index++) {
		if (XTxbuildgrid_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XTxbuildgrid_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XTxbuildgrid_Initialize(XTxbuildgrid *InstancePtr, u16 DeviceId) {
	XTxbuildgrid_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XTxbuildgrid_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XTxbuildgrid_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

