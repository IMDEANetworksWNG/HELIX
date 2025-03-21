// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xdemapper_m_qam_top.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDemapper_m_qam_top_CfgInitialize(XDemapper_m_qam_top *InstancePtr, XDemapper_m_qam_top_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDemapper_m_qam_top_Set_modOrder(XDemapper_m_qam_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDemapper_m_qam_top_WriteReg(InstancePtr->Bus_a_BaseAddress, XDEMAPPER_M_QAM_TOP_BUS_A_ADDR_MODORDER_DATA, Data);
}

u32 XDemapper_m_qam_top_Get_modOrder(XDemapper_m_qam_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDemapper_m_qam_top_ReadReg(InstancePtr->Bus_a_BaseAddress, XDEMAPPER_M_QAM_TOP_BUS_A_ADDR_MODORDER_DATA);
    return Data;
}

