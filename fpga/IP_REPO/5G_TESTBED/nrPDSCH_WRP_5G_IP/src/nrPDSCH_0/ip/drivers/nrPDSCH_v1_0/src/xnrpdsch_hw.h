// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// BUS_A
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of modOrder
//        bit 3~0 - modOrder[3:0] (Read/Write)
//        others  - reserved
// 0x14 : reserved
// 0x18 : Data signal of nBitsdivSSRbits
//        bit 11~0 - nBitsdivSSRbits[11:0] (Read/Write)
//        others   - reserved
// 0x1c : reserved
// 0x20 : Data signal of leftBits
//        bit 5~0 - leftBits[5:0] (Read/Write)
//        others  - reserved
// 0x24 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XNRPDSCH_BUS_A_ADDR_MODORDER_DATA        0x10
#define XNRPDSCH_BUS_A_BITS_MODORDER_DATA        4
#define XNRPDSCH_BUS_A_ADDR_NBITSDIVSSRBITS_DATA 0x18
#define XNRPDSCH_BUS_A_BITS_NBITSDIVSSRBITS_DATA 12
#define XNRPDSCH_BUS_A_ADDR_LEFTBITS_DATA        0x20
#define XNRPDSCH_BUS_A_BITS_LEFTBITS_DATA        6

