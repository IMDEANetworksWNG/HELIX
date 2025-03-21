// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module txBuildGrid_BUS_A_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 7,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire [15:0]                   dmrsSym1,
    output wire [15:0]                   dmrsSym2,
    output wire [15:0]                   ssbSym1,
    output wire [15:0]                   ssbSym2,
    output wire [15:0]                   numSC,
    output wire [15:0]                   numOFDM,
    output wire [15:0]                   dmrsSpacing,
    output wire [15:0]                   dmrsOffset,
    output wire [15:0]                   ptrsOffset,
    output wire [15:0]                   ssbFirstSC,
    output wire [15:0]                   ssbLastSC,
    output wire [0:0]                    configuredBlock
);
//------------------------Address Info-------------------
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

//------------------------Parameter----------------------
localparam
    ADDR_DMRSSYM1_DATA_0        = 7'h10,
    ADDR_DMRSSYM1_CTRL          = 7'h14,
    ADDR_DMRSSYM2_DATA_0        = 7'h18,
    ADDR_DMRSSYM2_CTRL          = 7'h1c,
    ADDR_SSBSYM1_DATA_0         = 7'h20,
    ADDR_SSBSYM1_CTRL           = 7'h24,
    ADDR_SSBSYM2_DATA_0         = 7'h28,
    ADDR_SSBSYM2_CTRL           = 7'h2c,
    ADDR_NUMSC_DATA_0           = 7'h30,
    ADDR_NUMSC_CTRL             = 7'h34,
    ADDR_NUMOFDM_DATA_0         = 7'h38,
    ADDR_NUMOFDM_CTRL           = 7'h3c,
    ADDR_DMRSSPACING_DATA_0     = 7'h40,
    ADDR_DMRSSPACING_CTRL       = 7'h44,
    ADDR_DMRSOFFSET_DATA_0      = 7'h48,
    ADDR_DMRSOFFSET_CTRL        = 7'h4c,
    ADDR_PTRSOFFSET_DATA_0      = 7'h50,
    ADDR_PTRSOFFSET_CTRL        = 7'h54,
    ADDR_SSBFIRSTSC_DATA_0      = 7'h58,
    ADDR_SSBFIRSTSC_CTRL        = 7'h5c,
    ADDR_SSBLASTSC_DATA_0       = 7'h60,
    ADDR_SSBLASTSC_CTRL         = 7'h64,
    ADDR_CONFIGUREDBLOCK_DATA_0 = 7'h68,
    ADDR_CONFIGUREDBLOCK_CTRL   = 7'h6c,
    WRIDLE                      = 2'd0,
    WRDATA                      = 2'd1,
    WRRESP                      = 2'd2,
    WRRESET                     = 2'd3,
    RDIDLE                      = 2'd0,
    RDDATA                      = 2'd1,
    RDRESET                     = 2'd2,
    ADDR_BITS                = 7;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg  [15:0]                   int_dmrsSym1 = 'b0;
    reg  [15:0]                   int_dmrsSym2 = 'b0;
    reg  [15:0]                   int_ssbSym1 = 'b0;
    reg  [15:0]                   int_ssbSym2 = 'b0;
    reg  [15:0]                   int_numSC = 'b0;
    reg  [15:0]                   int_numOFDM = 'b0;
    reg  [15:0]                   int_dmrsSpacing = 'b0;
    reg  [15:0]                   int_dmrsOffset = 'b0;
    reg  [15:0]                   int_ptrsOffset = 'b0;
    reg  [15:0]                   int_ssbFirstSC = 'b0;
    reg  [15:0]                   int_ssbLastSC = 'b0;
    reg  [0:0]                    int_configuredBlock = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_DMRSSYM1_DATA_0: begin
                    rdata <= int_dmrsSym1[15:0];
                end
                ADDR_DMRSSYM2_DATA_0: begin
                    rdata <= int_dmrsSym2[15:0];
                end
                ADDR_SSBSYM1_DATA_0: begin
                    rdata <= int_ssbSym1[15:0];
                end
                ADDR_SSBSYM2_DATA_0: begin
                    rdata <= int_ssbSym2[15:0];
                end
                ADDR_NUMSC_DATA_0: begin
                    rdata <= int_numSC[15:0];
                end
                ADDR_NUMOFDM_DATA_0: begin
                    rdata <= int_numOFDM[15:0];
                end
                ADDR_DMRSSPACING_DATA_0: begin
                    rdata <= int_dmrsSpacing[15:0];
                end
                ADDR_DMRSOFFSET_DATA_0: begin
                    rdata <= int_dmrsOffset[15:0];
                end
                ADDR_PTRSOFFSET_DATA_0: begin
                    rdata <= int_ptrsOffset[15:0];
                end
                ADDR_SSBFIRSTSC_DATA_0: begin
                    rdata <= int_ssbFirstSC[15:0];
                end
                ADDR_SSBLASTSC_DATA_0: begin
                    rdata <= int_ssbLastSC[15:0];
                end
                ADDR_CONFIGUREDBLOCK_DATA_0: begin
                    rdata <= int_configuredBlock[0:0];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign dmrsSym1        = int_dmrsSym1;
assign dmrsSym2        = int_dmrsSym2;
assign ssbSym1         = int_ssbSym1;
assign ssbSym2         = int_ssbSym2;
assign numSC           = int_numSC;
assign numOFDM         = int_numOFDM;
assign dmrsSpacing     = int_dmrsSpacing;
assign dmrsOffset      = int_dmrsOffset;
assign ptrsOffset      = int_ptrsOffset;
assign ssbFirstSC      = int_ssbFirstSC;
assign ssbLastSC       = int_ssbLastSC;
assign configuredBlock = int_configuredBlock;
// int_dmrsSym1[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_dmrsSym1[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DMRSSYM1_DATA_0)
            int_dmrsSym1[15:0] <= (WDATA[31:0] & wmask) | (int_dmrsSym1[15:0] & ~wmask);
    end
end

// int_dmrsSym2[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_dmrsSym2[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DMRSSYM2_DATA_0)
            int_dmrsSym2[15:0] <= (WDATA[31:0] & wmask) | (int_dmrsSym2[15:0] & ~wmask);
    end
end

// int_ssbSym1[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ssbSym1[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_SSBSYM1_DATA_0)
            int_ssbSym1[15:0] <= (WDATA[31:0] & wmask) | (int_ssbSym1[15:0] & ~wmask);
    end
end

// int_ssbSym2[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ssbSym2[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_SSBSYM2_DATA_0)
            int_ssbSym2[15:0] <= (WDATA[31:0] & wmask) | (int_ssbSym2[15:0] & ~wmask);
    end
end

// int_numSC[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_numSC[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NUMSC_DATA_0)
            int_numSC[15:0] <= (WDATA[31:0] & wmask) | (int_numSC[15:0] & ~wmask);
    end
end

// int_numOFDM[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_numOFDM[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NUMOFDM_DATA_0)
            int_numOFDM[15:0] <= (WDATA[31:0] & wmask) | (int_numOFDM[15:0] & ~wmask);
    end
end

// int_dmrsSpacing[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_dmrsSpacing[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DMRSSPACING_DATA_0)
            int_dmrsSpacing[15:0] <= (WDATA[31:0] & wmask) | (int_dmrsSpacing[15:0] & ~wmask);
    end
end

// int_dmrsOffset[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_dmrsOffset[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_DMRSOFFSET_DATA_0)
            int_dmrsOffset[15:0] <= (WDATA[31:0] & wmask) | (int_dmrsOffset[15:0] & ~wmask);
    end
end

// int_ptrsOffset[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ptrsOffset[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_PTRSOFFSET_DATA_0)
            int_ptrsOffset[15:0] <= (WDATA[31:0] & wmask) | (int_ptrsOffset[15:0] & ~wmask);
    end
end

// int_ssbFirstSC[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ssbFirstSC[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_SSBFIRSTSC_DATA_0)
            int_ssbFirstSC[15:0] <= (WDATA[31:0] & wmask) | (int_ssbFirstSC[15:0] & ~wmask);
    end
end

// int_ssbLastSC[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_ssbLastSC[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_SSBLASTSC_DATA_0)
            int_ssbLastSC[15:0] <= (WDATA[31:0] & wmask) | (int_ssbLastSC[15:0] & ~wmask);
    end
end

// int_configuredBlock[0:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_configuredBlock[0:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_CONFIGUREDBLOCK_DATA_0)
            int_configuredBlock[0:0] <= (WDATA[31:0] & wmask) | (int_configuredBlock[0:0] & ~wmask);
    end
end


//------------------------Memory logic-------------------

endmodule
