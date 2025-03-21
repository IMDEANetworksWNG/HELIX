// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XDEMAPPER_M_QAM_TOP_H
#define XDEMAPPER_M_QAM_TOP_H

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
#include "xdemapper_m_qam_top_hw.h"

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
} XDemapper_m_qam_top_Config;
#endif

typedef struct {
    u64 Bus_a_BaseAddress;
    u32 IsReady;
} XDemapper_m_qam_top;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDemapper_m_qam_top_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDemapper_m_qam_top_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDemapper_m_qam_top_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDemapper_m_qam_top_ReadReg(BaseAddress, RegOffset) \
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
int XDemapper_m_qam_top_Initialize(XDemapper_m_qam_top *InstancePtr, u16 DeviceId);
XDemapper_m_qam_top_Config* XDemapper_m_qam_top_LookupConfig(u16 DeviceId);
int XDemapper_m_qam_top_CfgInitialize(XDemapper_m_qam_top *InstancePtr, XDemapper_m_qam_top_Config *ConfigPtr);
#else
int XDemapper_m_qam_top_Initialize(XDemapper_m_qam_top *InstancePtr, const char* InstanceName);
int XDemapper_m_qam_top_Release(XDemapper_m_qam_top *InstancePtr);
#endif


void XDemapper_m_qam_top_Set_modOrder(XDemapper_m_qam_top *InstancePtr, u32 Data);
u32 XDemapper_m_qam_top_Get_modOrder(XDemapper_m_qam_top *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
