// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xtxbuildgrid.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XTxbuildgrid_CfgInitialize(XTxbuildgrid *InstancePtr, XTxbuildgrid_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Bus_a_BaseAddress = ConfigPtr->Bus_a_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XTxbuildgrid_Set_dmrsSym1(XTxbuildgrid *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTxbuildgrid_WriteReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_DMRSSYM1_DATA, Data);
}

u32 XTxbuildgrid_Get_dmrsSym1(XTxbuildgrid *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTxbuildgrid_ReadReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_DMRSSYM1_DATA);
    return Data;
}

void XTxbuildgrid_Set_dmrsSym2(XTxbuildgrid *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTxbuildgrid_WriteReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_DMRSSYM2_DATA, Data);
}

u32 XTxbuildgrid_Get_dmrsSym2(XTxbuildgrid *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTxbuildgrid_ReadReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_DMRSSYM2_DATA);
    return Data;
}

void XTxbuildgrid_Set_ssbSym1(XTxbuildgrid *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTxbuildgrid_WriteReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_SSBSYM1_DATA, Data);
}

u32 XTxbuildgrid_Get_ssbSym1(XTxbuildgrid *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTxbuildgrid_ReadReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_SSBSYM1_DATA);
    return Data;
}

void XTxbuildgrid_Set_ssbSym2(XTxbuildgrid *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTxbuildgrid_WriteReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_SSBSYM2_DATA, Data);
}

u32 XTxbuildgrid_Get_ssbSym2(XTxbuildgrid *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTxbuildgrid_ReadReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_SSBSYM2_DATA);
    return Data;
}

void XTxbuildgrid_Set_numSC(XTxbuildgrid *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTxbuildgrid_WriteReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_NUMSC_DATA, Data);
}

u32 XTxbuildgrid_Get_numSC(XTxbuildgrid *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTxbuildgrid_ReadReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_NUMSC_DATA);
    return Data;
}

void XTxbuildgrid_Set_numOFDM(XTxbuildgrid *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTxbuildgrid_WriteReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_NUMOFDM_DATA, Data);
}

u32 XTxbuildgrid_Get_numOFDM(XTxbuildgrid *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTxbuildgrid_ReadReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_NUMOFDM_DATA);
    return Data;
}

void XTxbuildgrid_Set_dmrsSpacing(XTxbuildgrid *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTxbuildgrid_WriteReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_DMRSSPACING_DATA, Data);
}

u32 XTxbuildgrid_Get_dmrsSpacing(XTxbuildgrid *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTxbuildgrid_ReadReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_DMRSSPACING_DATA);
    return Data;
}

void XTxbuildgrid_Set_dmrsOffset(XTxbuildgrid *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTxbuildgrid_WriteReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_DMRSOFFSET_DATA, Data);
}

u32 XTxbuildgrid_Get_dmrsOffset(XTxbuildgrid *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTxbuildgrid_ReadReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_DMRSOFFSET_DATA);
    return Data;
}

void XTxbuildgrid_Set_ptrsOffset(XTxbuildgrid *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTxbuildgrid_WriteReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_PTRSOFFSET_DATA, Data);
}

u32 XTxbuildgrid_Get_ptrsOffset(XTxbuildgrid *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTxbuildgrid_ReadReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_PTRSOFFSET_DATA);
    return Data;
}

void XTxbuildgrid_Set_ssbFirstSC(XTxbuildgrid *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTxbuildgrid_WriteReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_SSBFIRSTSC_DATA, Data);
}

u32 XTxbuildgrid_Get_ssbFirstSC(XTxbuildgrid *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTxbuildgrid_ReadReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_SSBFIRSTSC_DATA);
    return Data;
}

void XTxbuildgrid_Set_ssbLastSC(XTxbuildgrid *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTxbuildgrid_WriteReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_SSBLASTSC_DATA, Data);
}

u32 XTxbuildgrid_Get_ssbLastSC(XTxbuildgrid *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTxbuildgrid_ReadReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_SSBLASTSC_DATA);
    return Data;
}

void XTxbuildgrid_Set_configuredBlock(XTxbuildgrid *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XTxbuildgrid_WriteReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_CONFIGUREDBLOCK_DATA, Data);
}

u32 XTxbuildgrid_Get_configuredBlock(XTxbuildgrid *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XTxbuildgrid_ReadReg(InstancePtr->Bus_a_BaseAddress, XTXBUILDGRID_BUS_A_ADDR_CONFIGUREDBLOCK_DATA);
    return Data;
}

