// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xdemapper_m_qam_top.h"

extern XDemapper_m_qam_top_Config XDemapper_m_qam_top_ConfigTable[];

XDemapper_m_qam_top_Config *XDemapper_m_qam_top_LookupConfig(u16 DeviceId) {
	XDemapper_m_qam_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDEMAPPER_M_QAM_TOP_NUM_INSTANCES; Index++) {
		if (XDemapper_m_qam_top_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDemapper_m_qam_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDemapper_m_qam_top_Initialize(XDemapper_m_qam_top *InstancePtr, u16 DeviceId) {
	XDemapper_m_qam_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDemapper_m_qam_top_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDemapper_m_qam_top_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

