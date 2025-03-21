// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XNRPDSCH_H
#define XNRPDSCH_H

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
#include "xnrpdsch_hw.h"

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
} XNrpdsch_Config;
#endif

typedef struct {
    u64 Bus_a_BaseAddress;
    u32 IsReady;
} XNrpdsch;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XNrpdsch_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XNrpdsch_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XNrpdsch_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XNrpdsch_ReadReg(BaseAddress, RegOffset) \
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
int XNrpdsch_Initialize(XNrpdsch *InstancePtr, u16 DeviceId);
XNrpdsch_Config* XNrpdsch_LookupConfig(u16 DeviceId);
int XNrpdsch_CfgInitialize(XNrpdsch *InstancePtr, XNrpdsch_Config *ConfigPtr);
#else
int XNrpdsch_Initialize(XNrpdsch *InstancePtr, const char* InstanceName);
int XNrpdsch_Release(XNrpdsch *InstancePtr);
#endif


void XNrpdsch_Set_modOrder(XNrpdsch *InstancePtr, u32 Data);
u32 XNrpdsch_Get_modOrder(XNrpdsch *InstancePtr);
void XNrpdsch_Set_nBitsdivSSRbits(XNrpdsch *InstancePtr, u32 Data);
u32 XNrpdsch_Get_nBitsdivSSRbits(XNrpdsch *InstancePtr);
void XNrpdsch_Set_leftBits(XNrpdsch *InstancePtr, u32 Data);
u32 XNrpdsch_Get_leftBits(XNrpdsch *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
