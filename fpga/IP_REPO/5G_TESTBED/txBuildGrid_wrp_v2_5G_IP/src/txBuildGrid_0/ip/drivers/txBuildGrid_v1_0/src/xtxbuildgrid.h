// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XTXBUILDGRID_H
#define XTXBUILDGRID_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xtxbuildgrid_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Bus_a_BaseAddress;
} XTxbuildgrid_Config;
#endif

typedef struct {
    u64 Bus_a_BaseAddress;
    u32 IsReady;
} XTxbuildgrid;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XTxbuildgrid_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XTxbuildgrid_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XTxbuildgrid_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XTxbuildgrid_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XTxbuildgrid_Initialize(XTxbuildgrid *InstancePtr, u16 DeviceId);
XTxbuildgrid_Config* XTxbuildgrid_LookupConfig(u16 DeviceId);
int XTxbuildgrid_CfgInitialize(XTxbuildgrid *InstancePtr, XTxbuildgrid_Config *ConfigPtr);
#else
int XTxbuildgrid_Initialize(XTxbuildgrid *InstancePtr, const char* InstanceName);
int XTxbuildgrid_Release(XTxbuildgrid *InstancePtr);
#endif


void XTxbuildgrid_Set_dmrsSym1(XTxbuildgrid *InstancePtr, u32 Data);
u32 XTxbuildgrid_Get_dmrsSym1(XTxbuildgrid *InstancePtr);
void XTxbuildgrid_Set_dmrsSym2(XTxbuildgrid *InstancePtr, u32 Data);
u32 XTxbuildgrid_Get_dmrsSym2(XTxbuildgrid *InstancePtr);
void XTxbuildgrid_Set_ssbSym1(XTxbuildgrid *InstancePtr, u32 Data);
u32 XTxbuildgrid_Get_ssbSym1(XTxbuildgrid *InstancePtr);
void XTxbuildgrid_Set_ssbSym2(XTxbuildgrid *InstancePtr, u32 Data);
u32 XTxbuildgrid_Get_ssbSym2(XTxbuildgrid *InstancePtr);
void XTxbuildgrid_Set_numSC(XTxbuildgrid *InstancePtr, u32 Data);
u32 XTxbuildgrid_Get_numSC(XTxbuildgrid *InstancePtr);
void XTxbuildgrid_Set_numOFDM(XTxbuildgrid *InstancePtr, u32 Data);
u32 XTxbuildgrid_Get_numOFDM(XTxbuildgrid *InstancePtr);
void XTxbuildgrid_Set_dmrsSpacing(XTxbuildgrid *InstancePtr, u32 Data);
u32 XTxbuildgrid_Get_dmrsSpacing(XTxbuildgrid *InstancePtr);
void XTxbuildgrid_Set_dmrsOffset(XTxbuildgrid *InstancePtr, u32 Data);
u32 XTxbuildgrid_Get_dmrsOffset(XTxbuildgrid *InstancePtr);
void XTxbuildgrid_Set_ptrsOffset(XTxbuildgrid *InstancePtr, u32 Data);
u32 XTxbuildgrid_Get_ptrsOffset(XTxbuildgrid *InstancePtr);
void XTxbuildgrid_Set_ssbFirstSC(XTxbuildgrid *InstancePtr, u32 Data);
u32 XTxbuildgrid_Get_ssbFirstSC(XTxbuildgrid *InstancePtr);
void XTxbuildgrid_Set_ssbLastSC(XTxbuildgrid *InstancePtr, u32 Data);
u32 XTxbuildgrid_Get_ssbLastSC(XTxbuildgrid *InstancePtr);
void XTxbuildgrid_Set_configuredBlock(XTxbuildgrid *InstancePtr, u32 Data);
u32 XTxbuildgrid_Get_configuredBlock(XTxbuildgrid *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
