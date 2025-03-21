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
// 0x10 : Data signal of dmrsSym1
//        bit 15~0 - dmrsSym1[15:0] (Read/Write)
//        others   - reserved
// 0x14 : reserved
// 0x18 : Data signal of dmrsSym2
//        bit 15~0 - dmrsSym2[15:0] (Read/Write)
//        others   - reserved
// 0x1c : reserved
// 0x20 : Data signal of ssbSym1
//        bit 15~0 - ssbSym1[15:0] (Read/Write)
//        others   - reserved
// 0x24 : reserved
// 0x28 : Data signal of ssbSym2
//        bit 15~0 - ssbSym2[15:0] (Read/Write)
//        others   - reserved
// 0x2c : reserved
// 0x30 : Data signal of numSC
//        bit 15~0 - numSC[15:0] (Read/Write)
//        others   - reserved
// 0x34 : reserved
// 0x38 : Data signal of numOFDM
//        bit 15~0 - numOFDM[15:0] (Read/Write)
//        others   - reserved
// 0x3c : reserved
// 0x40 : Data signal of dmrsSpacing
//        bit 15~0 - dmrsSpacing[15:0] (Read/Write)
//        others   - reserved
// 0x44 : reserved
// 0x48 : Data signal of dmrsOffset
//        bit 15~0 - dmrsOffset[15:0] (Read/Write)
//        others   - reserved
// 0x4c : reserved
// 0x50 : Data signal of ptrsOffset
//        bit 15~0 - ptrsOffset[15:0] (Read/Write)
//        others   - reserved
// 0x54 : reserved
// 0x58 : Data signal of ssbFirstSC
//        bit 15~0 - ssbFirstSC[15:0] (Read/Write)
//        others   - reserved
// 0x5c : reserved
// 0x60 : Data signal of ssbLastSC
//        bit 15~0 - ssbLastSC[15:0] (Read/Write)
//        others   - reserved
// 0x64 : reserved
// 0x68 : Data signal of configuredBlock
//        bit 0  - configuredBlock[0] (Read/Write)
//        others - reserved
// 0x6c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XTXBUILDGRID_BUS_A_ADDR_DMRSSYM1_DATA        0x10
#define XTXBUILDGRID_BUS_A_BITS_DMRSSYM1_DATA        16
#define XTXBUILDGRID_BUS_A_ADDR_DMRSSYM2_DATA        0x18
#define XTXBUILDGRID_BUS_A_BITS_DMRSSYM2_DATA        16
#define XTXBUILDGRID_BUS_A_ADDR_SSBSYM1_DATA         0x20
#define XTXBUILDGRID_BUS_A_BITS_SSBSYM1_DATA         16
#define XTXBUILDGRID_BUS_A_ADDR_SSBSYM2_DATA         0x28
#define XTXBUILDGRID_BUS_A_BITS_SSBSYM2_DATA         16
#define XTXBUILDGRID_BUS_A_ADDR_NUMSC_DATA           0x30
#define XTXBUILDGRID_BUS_A_BITS_NUMSC_DATA           16
#define XTXBUILDGRID_BUS_A_ADDR_NUMOFDM_DATA         0x38
#define XTXBUILDGRID_BUS_A_BITS_NUMOFDM_DATA         16
#define XTXBUILDGRID_BUS_A_ADDR_DMRSSPACING_DATA     0x40
#define XTXBUILDGRID_BUS_A_BITS_DMRSSPACING_DATA     16
#define XTXBUILDGRID_BUS_A_ADDR_DMRSOFFSET_DATA      0x48
#define XTXBUILDGRID_BUS_A_BITS_DMRSOFFSET_DATA      16
#define XTXBUILDGRID_BUS_A_ADDR_PTRSOFFSET_DATA      0x50
#define XTXBUILDGRID_BUS_A_BITS_PTRSOFFSET_DATA      16
#define XTXBUILDGRID_BUS_A_ADDR_SSBFIRSTSC_DATA      0x58
#define XTXBUILDGRID_BUS_A_BITS_SSBFIRSTSC_DATA      16
#define XTXBUILDGRID_BUS_A_ADDR_SSBLASTSC_DATA       0x60
#define XTXBUILDGRID_BUS_A_BITS_SSBLASTSC_DATA       16
#define XTXBUILDGRID_BUS_A_ADDR_CONFIGUREDBLOCK_DATA 0x68
#define XTXBUILDGRID_BUS_A_BITS_CONFIGUREDBLOCK_DATA 1

