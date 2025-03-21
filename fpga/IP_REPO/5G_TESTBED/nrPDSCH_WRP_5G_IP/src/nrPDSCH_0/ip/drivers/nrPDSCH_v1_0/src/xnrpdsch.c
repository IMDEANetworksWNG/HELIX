// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xnrpdsch.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XNrpdsch_CfgInitialize(XNrpdsch *InstancePtr, XNrpdsch_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XNrpdsch_Set_modOrder(XNrpdsch *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XNrpdsch_WriteReg(InstancePtr->Bus_a_BaseAddress, XNRPDSCH_BUS_A_ADDR_MODORDER_DATA, Data);
}

u32 XNrpdsch_Get_modOrder(XNrpdsch *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XNrpdsch_ReadReg(InstancePtr->Bus_a_BaseAddress, XNRPDSCH_BUS_A_ADDR_MODORDER_DATA);
    return Data;
}

void XNrpdsch_Set_nBitsdivSSRbits(XNrpdsch *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XNrpdsch_WriteReg(InstancePtr->Bus_a_BaseAddress, XNRPDSCH_BUS_A_ADDR_NBITSDIVSSRBITS_DATA, Data);
}

u32 XNrpdsch_Get_nBitsdivSSRbits(XNrpdsch *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XNrpdsch_ReadReg(InstancePtr->Bus_a_BaseAddress, XNRPDSCH_BUS_A_ADDR_NBITSDIVSSRBITS_DATA);
    return Data;
}

void XNrpdsch_Set_leftBits(XNrpdsch *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XNrpdsch_WriteReg(InstancePtr->Bus_a_BaseAddress, XNRPDSCH_BUS_A_ADDR_LEFTBITS_DATA, Data);
}

u32 XNrpdsch_Get_leftBits(XNrpdsch *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XNrpdsch_ReadReg(InstancePtr->Bus_a_BaseAddress, XNRPDSCH_BUS_A_ADDR_LEFTBITS_DATA);
    return Data;
}

