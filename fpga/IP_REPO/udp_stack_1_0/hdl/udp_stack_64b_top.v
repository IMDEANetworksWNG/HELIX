/*

Copyright (c) 2014-2021 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * FPGA core logic
 */
module udp_stack_64b_v1_0 #
(
    parameter TARGET = "XILINX",
    		// Parameters of Axi Slave Bus Interface S00_AXIS
    parameter integer C_S00_AXI_DATA_WIDTH	= 32,
    parameter integer C_S00_AXIS_TDATA_WIDTH	= 64,
    parameter integer C_S00_AXI_ADDR_WIDTH	= 4,
    parameter integer M_S00_AXIS_TDATA_WIDTH	= 64,
    parameter integer C_M00_AXIS_START_COUNT	= 32
)
(
    /*
     * Clock: 156.25MHz
     * Synchronous reset
     */
    output  wire       phy_tx_clk,
    output  wire       phy_tx_rst,
    output  wire       phy_rx_clk,
    output  wire       phy_rx_rst,
    
    input  wire       clk_125MHz,
    input  wire       rst_125MHz,
    
    input  wire       gt_ref_clk,
    
    output  wire        xcvr_txp,
    output  wire        xcvr_txn,
    input  wire        xcvr_rxp,
    input  wire        xcvr_rxn,
    
    		// Ports of Axi Slave Bus Interface S00_AXIS
    //input wire  s00_axis_aclk,
    //input wire  s00_axis_aresetn,
    output wire  s00_axis_tready,
    input wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] s00_axis_tdata,
    input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tkeep,
    input wire  s00_axis_tlast,
    input wire  s00_axis_tvalid,
    input wire  [1:0] s00_axis_tuser,

    input wire  m00_axis_tready,
    output wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
    output wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tkeep,
    output wire  m00_axis_tlast,
    output wire  m00_axis_tvalid,
    output wire  m00_axis_tuser,
    
    input wire  m01_axis_tready,
    output wire [C_S00_AXIS_TDATA_WIDTH-1 : 0] m01_axis_tdata,
    output wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] m01_axis_tkeep,
    output wire  m01_axis_tlast,
    output wire  m01_axis_tvalid,
    output wire  m01_axis_tuser,
    
    		// Ports of Axi Slave Bus Interface S00_AXI
    input wire  s00_axi_aclk,
    input wire  s00_axi_aresetn,
    input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
    input wire [2 : 0] s00_axi_awprot,
    input wire  s00_axi_awvalid,
    output wire  s00_axi_awready,
    input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
    input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
    input wire  s00_axi_wvalid,
    output wire  s00_axi_wready,
    output wire [1 : 0] s00_axi_bresp,
    output wire  s00_axi_bvalid,
    input wire  s00_axi_bready,
    input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
    input wire [2 : 0] s00_axi_arprot,
    input wire  s00_axi_arvalid,
    output wire  s00_axi_arready,
    output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
    output wire [1 : 0] s00_axi_rresp,
    output wire  s00_axi_rvalid,
    input wire  s00_axi_rready
    
  //  output wire [63:0] control_dma
    

);

/*
 * Ethernet: QSFP28
 */
  
//wire        phy_tx_clk;
//wire        phy_tx_rst;
wire [63:0] qsfp1_txd_1;
wire [7:0]  qsfp1_txc_1;
//wire        phy_rx_clk;
//wire        phy_rx_rst;
wire [63:0] qsfp1_rxd_1;
wire [7:0]  qsfp1_rxc_1;

// AXI between MAC and Ethernet modules
wire [63:0] mac_rx_axis_tdata;
wire [7:0] mac_rx_axis_tkeep;
wire mac_rx_axis_tvalid;
wire mac_rx_axis_tready;
wire mac_rx_axis_tlast;
wire mac_rx_axis_tuser;

wire [63:0] mac_tx_axis_tdata;
wire [7:0] mac_tx_axis_tkeep;
wire mac_tx_axis_tvalid;
wire mac_tx_axis_tready;
wire mac_tx_axis_tlast;
wire mac_tx_axis_tuser;

wire [63:0] rx_axis_tdata;
wire [7:0] rx_axis_tkeep;
wire rx_axis_tvalid;
wire rx_axis_tready;
wire rx_axis_tlast;
wire rx_axis_tuser;

wire [63:0] tx_axis_tdata;
wire [7:0] tx_axis_tkeep;
wire tx_axis_tvalid;
wire tx_axis_tready;
wire tx_axis_tlast;
wire tx_axis_tuser;

// Ethernet frame between Ethernet modules and UDP stack
wire rx_eth_hdr_ready;
wire rx_eth_hdr_valid;
wire [47:0] rx_eth_dest_mac;
wire [47:0] rx_eth_src_mac;
wire [15:0] rx_eth_type;
wire [63:0] rx_eth_payload_axis_tdata;
wire [7:0] rx_eth_payload_axis_tkeep;
wire rx_eth_payload_axis_tvalid;
wire rx_eth_payload_axis_tready;
wire rx_eth_payload_axis_tlast;
wire rx_eth_payload_axis_tuser;

wire tx_eth_hdr_ready;
wire tx_eth_hdr_valid;
wire [47:0] tx_eth_dest_mac;
wire [47:0] tx_eth_src_mac;
wire [15:0] tx_eth_type;
wire [63:0] tx_eth_payload_axis_tdata;
wire [7:0] tx_eth_payload_axis_tkeep;
wire tx_eth_payload_axis_tvalid;
wire tx_eth_payload_axis_tready;
wire tx_eth_payload_axis_tlast;
wire tx_eth_payload_axis_tuser;

// IP frame connections
wire rx_ip_hdr_valid;
wire rx_ip_hdr_ready;
wire [47:0] rx_ip_eth_dest_mac;
wire [47:0] rx_ip_eth_src_mac;
wire [15:0] rx_ip_eth_type;
wire [3:0] rx_ip_version;
wire [3:0] rx_ip_ihl;
wire [5:0] rx_ip_dscp;
wire [1:0] rx_ip_ecn;
wire [15:0] rx_ip_length;
wire [15:0] rx_ip_identification;
wire [2:0] rx_ip_flags;
wire [12:0] rx_ip_fragment_offset;
wire [7:0] rx_ip_ttl;
wire [7:0] rx_ip_protocol;
wire [15:0] rx_ip_header_checksum;
wire [31:0] rx_ip_source_ip;
wire [31:0] rx_ip_dest_ip;
wire [63:0] rx_ip_payload_axis_tdata;
wire [7:0] rx_ip_payload_axis_tkeep;
wire rx_ip_payload_axis_tvalid;
wire rx_ip_payload_axis_tready;
wire rx_ip_payload_axis_tlast;
wire rx_ip_payload_axis_tuser;

wire tx_ip_hdr_valid;
wire tx_ip_hdr_ready;
wire [5:0] tx_ip_dscp;
wire [1:0] tx_ip_ecn;
wire [15:0] tx_ip_length;
wire [7:0] tx_ip_ttl;
wire [7:0] tx_ip_protocol;
wire [31:0] tx_ip_source_ip;
wire [31:0] tx_ip_dest_ip;
wire [63:0] tx_ip_payload_axis_tdata;
wire [7:0] tx_ip_payload_axis_tkeep;
wire tx_ip_payload_axis_tvalid;
wire tx_ip_payload_axis_tready;
wire tx_ip_payload_axis_tlast;
wire tx_ip_payload_axis_tuser;

// UDP frame connections
wire rx_udp_hdr_valid;
wire rx_udp_hdr_ready;
wire [47:0] rx_udp_eth_dest_mac;
wire [47:0] rx_udp_eth_src_mac;
wire [15:0] rx_udp_eth_type;
wire [3:0] rx_udp_ip_version;
wire [3:0] rx_udp_ip_ihl;
wire [5:0] rx_udp_ip_dscp;
wire [1:0] rx_udp_ip_ecn;
wire [15:0] rx_udp_ip_length;
wire [15:0] rx_udp_ip_identification;
wire [2:0] rx_udp_ip_flags;
wire [12:0] rx_udp_ip_fragment_offset;
wire [7:0] rx_udp_ip_ttl;
wire [7:0] rx_udp_ip_protocol;
wire [15:0] rx_udp_ip_header_checksum;
wire [31:0] rx_udp_ip_source_ip;
wire [31:0] rx_udp_ip_dest_ip;
wire [15:0] rx_udp_source_port;
wire [15:0] rx_udp_dest_port;
wire [15:0] rx_udp_length;
wire [15:0] rx_udp_checksum;
wire [63:0] rx_udp_payload_axis_tdata;
wire [7:0] rx_udp_payload_axis_tkeep;
wire rx_udp_payload_axis_tvalid;
wire rx_udp_payload_axis_tready;
wire rx_udp_payload_axis_tlast;
wire rx_udp_payload_axis_tuser;

wire tx_udp_hdr_valid;
wire tx_udp_hdr_ready;
wire [5:0] tx_udp_ip_dscp;
wire [1:0] tx_udp_ip_ecn;
wire [7:0] tx_udp_ip_ttl;
wire [31:0] tx_udp_ip_source_ip;
wire [31:0] tx_udp_ip_dest_ip;
wire [15:0] tx_udp_source_port;
wire [15:0] tx_udp_dest_port;
wire [15:0] tx_udp_length;
wire [15:0] tx_udp_checksum;
wire [63:0] tx_udp_payload_axis_tdata;
wire [7:0] tx_udp_payload_axis_tkeep;
wire tx_udp_payload_axis_tvalid;
wire tx_udp_payload_axis_tready;
wire tx_udp_payload_axis_tlast;
wire tx_udp_payload_axis_tuser;

wire [63:0] rx_fifo_udp_payload_axis_tdata;
wire [7:0] rx_fifo_udp_payload_axis_tkeep;
wire rx_fifo_udp_payload_axis_tvalid;
wire rx_fifo_udp_payload_axis_tready;
wire rx_fifo_udp_payload_axis_tlast;
wire rx_fifo_udp_payload_axis_tuser;

wire [63:0] tx_fifo_udp_payload_axis_tdata;
wire [7:0] tx_fifo_udp_payload_axis_tkeep;
wire tx_fifo_udp_payload_axis_tvalid;
wire tx_fifo_udp_payload_axis_tready;
wire tx_fifo_udp_payload_axis_tlast;
wire tx_fifo_udp_payload_axis_tuser;

wire [31:0] ip,gw,sm,ifg,mss;

// Configuration
wire [47:0] local_mac   = 48'h02_00_00_00_00_00;
wire [31:0] local_ip,gateway_ip,mss_reg,ifg_reg;
wire [31:0] subnet_mask = {8'd255, 8'd255, 8'd255, 8'd0};


// IP ports not used
assign rx_ip_hdr_ready = 1;
assign rx_ip_payload_axis_tready = 1;

assign tx_ip_hdr_valid = 0;
assign tx_ip_dscp = 0;
assign tx_ip_ecn = 0;
assign tx_ip_length = 0;
assign tx_ip_ttl = 0;
assign tx_ip_protocol = 0;
assign tx_ip_source_ip = 0;
assign tx_ip_dest_ip = 0;
assign tx_ip_payload_axis_tdata = 0;
assign tx_ip_payload_axis_tkeep = 0;
assign tx_ip_payload_axis_tvalid = 0;
assign tx_ip_payload_axis_tlast = 0;
assign tx_ip_payload_axis_tuser = 0;

// Loop back UDP
//wire match_cond = rx_udp_dest_port == 1234;


wire match_cond_rf  = rx_udp_dest_port == 10001;
wire match_cond_ps  = rx_udp_dest_port == 10000;
wire no_match_rf = !match_cond_rf;
wire no_match_ps = !match_cond_ps;

reg  tx_udp_payload_axis_tlast_r,tx_udp_payload_axis_tlast_rr,tx_udp_payload_axis_tlast_rrr,tx_udp_payload_axis_tlast_rrrr,tx_udp_payload_axis_tlast_rrrrr;

reg match_cond_reg_rf = 0;
reg match_cond_reg_ps = 0;
reg no_match_reg_rf = 0;
reg no_match_reg_ps = 0;

wire clk=phy_tx_clk;
wire rst=phy_tx_rst;

always @(posedge clk) begin
    if (rst) begin
        match_cond_reg_rf <= 0;
        no_match_reg_rf <= 0;
    end else begin
        if (rx_udp_payload_axis_tvalid) begin
            if ((!match_cond_reg_rf && !no_match_reg_rf) ||
                (rx_udp_payload_axis_tvalid && rx_udp_payload_axis_tready && rx_udp_payload_axis_tlast)) begin
                match_cond_reg_rf <= match_cond_rf;
                no_match_reg_rf <= no_match_rf;
            end
        end else begin
            match_cond_reg_rf <= 0;
            no_match_reg_rf <= 0;
        end
    end
end

always @(posedge clk) begin
    if (rst) begin
        match_cond_reg_ps <= 0;
        no_match_reg_ps <= 0;
    end else begin
        if (rx_udp_payload_axis_tvalid) begin
            if ((!match_cond_reg_ps && !no_match_reg_ps) ||
                (rx_udp_payload_axis_tvalid && rx_udp_payload_axis_tready && rx_udp_payload_axis_tlast)) begin
                match_cond_reg_ps <= match_cond_ps;
                no_match_reg_ps <= no_match_ps;
            end
        end else begin
            match_cond_reg_ps <= 0;
            no_match_reg_ps <= 0;
        end
    end
end



always @(posedge clk) begin
    if (rst) begin
        tx_udp_payload_axis_tlast_r <=0;
        tx_udp_payload_axis_tlast_rr <=0;
        tx_udp_payload_axis_tlast_rrr <=0;
        tx_udp_payload_axis_tlast_rrrr <=0;
        tx_udp_payload_axis_tlast_rrrrr <=0;
    end else begin
        tx_udp_payload_axis_tlast_r <=tx_udp_payload_axis_tlast;
        tx_udp_payload_axis_tlast_rr <=tx_udp_payload_axis_tlast_r;
        tx_udp_payload_axis_tlast_rrr <=tx_udp_payload_axis_tlast_rr;
        tx_udp_payload_axis_tlast_rrrr <=tx_udp_payload_axis_tlast_rrr;
        tx_udp_payload_axis_tlast_rrrrr <=tx_udp_payload_axis_tlast_rrrr;
    end
end

//assign tx_udp_hdr_valid = tx_udp_payload_axis_tlast_rrrrr;
assign tx_udp_hdr_valid = s00_axis_tvalid;
assign rx_udp_hdr_ready = (tx_eth_hdr_ready && (match_cond_rf || match_cond_ps)) || no_match_rf || no_match_ps;
assign tx_udp_ip_dscp = 0;
assign tx_udp_ip_ecn = 0;
assign tx_udp_ip_ttl = 64;
assign tx_udp_ip_source_ip = local_ip;
assign tx_udp_ip_dest_ip = rx_udp_ip_source_ip;
//assign tx_udp_source_port = s00_axis_tuser ? 16'd10001 :16'd10000;
//assign tx_udp_dest_port = rx_udp_source_port;
assign tx_udp_dest_port = tx_udp_source_port;

assign tx_udp_source_port = (s00_axis_tuser == 2'b00) ? 16'd10000 :
                            (s00_axis_tuser == 2'b01) ? 16'd10001 :
                            (s00_axis_tuser == 2'b10) ? 16'd10002 :
                            (s00_axis_tuser == 2'b11) ? 16'd0 :
                            16'd0;  // Default case


assign tx_udp_payload_axis_tdata = s00_axis_tdata;
assign tx_udp_payload_axis_tkeep = s00_axis_tkeep;
assign tx_udp_payload_axis_tvalid = s00_axis_tvalid;
assign s00_axis_tready = tx_udp_payload_axis_tready;
assign tx_udp_payload_axis_tlast = s00_axis_tlast;
assign tx_udp_payload_axis_tuser = tx_fifo_udp_payload_axis_tuser;

//assign rx_fifo_udp_payload_axis_tdata = rx_udp_payload_axis_tdata;
//assign rx_fifo_udp_payload_axis_tkeep = rx_udp_payload_axis_tkeep;
//assign rx_fifo_udp_payload_axis_tvalid = rx_udp_payload_axis_tvalid && match_cond_reg;
//assign rx_udp_payload_axis_tready = (rx_fifo_udp_payload_axis_tready && match_cond_reg) || no_match_reg;
//assign rx_fifo_udp_payload_axis_tlast = rx_udp_payload_axis_tlast;
//assign rx_fifo_udp_payload_axis_tuser = rx_udp_payload_axis_tuser;

assign m00_axis_tdata = rx_udp_payload_axis_tdata;
assign m00_axis_tkeep = rx_udp_payload_axis_tkeep;
assign m00_axis_tvalid = rx_udp_payload_axis_tvalid && match_cond_reg_rf;
assign rx_udp_payload_axis_tready = (m00_axis_tready && (match_cond_reg_rf)) || (m01_axis_tready && (match_cond_reg_ps)) || no_match_reg_rf || no_match_reg_ps;
assign m00_axis_tlast = rx_udp_payload_axis_tlast;
assign m00_axis_tuser = rx_udp_payload_axis_tuser;

assign m01_axis_tdata = rx_udp_payload_axis_tdata;
assign m01_axis_tkeep = rx_udp_payload_axis_tkeep;
assign m01_axis_tvalid = rx_udp_payload_axis_tvalid && match_cond_reg_ps;
assign m01_axis_tlast = rx_udp_payload_axis_tlast;
assign m01_axis_tuser = rx_udp_payload_axis_tuser;

// Place first payload byte onto LEDs
reg valid_last = 0;
reg [7:0] led_reg = 0;

always @(posedge clk) begin
    if (rst) begin
        led_reg <= 0;
    end else begin
        valid_last <= tx_udp_payload_axis_tvalid;
        if (tx_udp_payload_axis_tvalid && !valid_last) begin
            led_reg <= tx_udp_payload_axis_tdata;
        end
    end
end



	udp_stack_64b_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) udp_stack_64b_v1_0_S00_AXI_inst (
	    .local_ip(ip),
	    .local_gw(gw),
	    .ifg(ifg),
	    .mss(mss),
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

wire tx_fifo_overflow,tx_fifo_bad_frame,tx_fifo_good_frame;




eth_10g_0 #(
)
eth_10g_0_inst (
    .xcvr_ctrl_clk(clk_125MHz),
    .xcvr_ctrl_rst(rst_125MHz),

    // Common
    .xcvr_gtpowergood_out(),

    // PLL out
    .xcvr_gtrefclk00_in(gt_ref_clk),
    .xcvr_qpll0lock_out(),
    .xcvr_qpll0outclk_out(),
    .xcvr_qpll0outrefclk_out(),

    // PLL in
    .xcvr_qpll0lock_in(1'b0),
    .xcvr_qpll0reset_out(),
    .xcvr_qpll0clk_in(1'b0),
    .xcvr_qpll0refclk_in(1'b0),

    // Serial data
    .xcvr_txp(xcvr_txp),
    .xcvr_txn(xcvr_txn),
    
    .xcvr_rxp(xcvr_rxp),
    .xcvr_rxn(xcvr_rxn),

    // PHY connections
    .phy_tx_clk(phy_tx_clk),
    .phy_tx_rst(phy_tx_rst),
    .phy_xgmii_txd(qsfp1_txd_1),
    .phy_xgmii_txc(qsfp1_txc_1),
    
    .phy_rx_clk(phy_rx_clk),
    .phy_rx_rst(phy_rx_rst),
    .phy_xgmii_rxd(qsfp1_rxd_1),
    .phy_xgmii_rxc(qsfp1_rxc_1),
    
    .phy_tx_bad_block(),
    .phy_rx_error_count(),
    .phy_rx_bad_block(),
    .phy_rx_sequence_error(),
    .phy_rx_block_lock(),
    .phy_rx_high_ber(),
    
    .phy_tx_prbs31_enable(1'b0),
    .phy_rx_prbs31_enable(1'b0)
);


eth_mac_10g_fifo #(
    .ENABLE_PADDING(1),
    .ENABLE_DIC(1),
    .MIN_FRAME_LENGTH(64),
    .TX_FIFO_DEPTH(9000),
    .TX_FRAME_FIFO(1),
    .RX_FIFO_DEPTH(9000),
    .RX_FRAME_FIFO(1)
)
eth_mac_10g_fifo_inst (
    .rx_clk(phy_rx_clk),
    .rx_rst(phy_rx_rst),
    .tx_clk(phy_tx_clk),
    .tx_rst(phy_tx_rst),
    .logic_clk(clk),
    .logic_rst(rst),

    .tx_axis_tdata(mac_tx_axis_tdata),
    .tx_axis_tkeep(mac_tx_axis_tkeep),
    .tx_axis_tvalid(mac_tx_axis_tvalid),
    .tx_axis_tready(mac_tx_axis_tready),
    .tx_axis_tlast(mac_tx_axis_tlast),
    .tx_axis_tuser(mac_tx_axis_tuser),

    .rx_axis_tdata(mac_rx_axis_tdata),
    .rx_axis_tkeep(mac_rx_axis_tkeep),
    .rx_axis_tvalid(mac_rx_axis_tvalid),
    .rx_axis_tready(mac_rx_axis_tready),
    .rx_axis_tlast(mac_rx_axis_tlast),
    .rx_axis_tuser(mac_rx_axis_tuser),

    .xgmii_rxd(qsfp1_rxd_1),
    .xgmii_rxc(qsfp1_rxc_1),
    .xgmii_txd(qsfp1_txd_1),
    .xgmii_txc(qsfp1_txc_1),

    .tx_fifo_overflow(tx_fifo_overflow),
    .tx_fifo_bad_frame(tx_fifo_bad_frame),
    .tx_fifo_good_frame(tx_fifo_good_frame),
    .rx_error_bad_frame(),
    .rx_error_bad_fcs(),
    .rx_fifo_overflow(),
    .rx_fifo_bad_frame(),
    .rx_fifo_good_frame(),

    .ifg_delay(8'd12)
);




eth_axis_rx #(
    .DATA_WIDTH(64)
)
eth_axis_rx_inst (
    .clk(clk),
    .rst(rst),
    // AXI input
    .s_axis_tdata(mac_rx_axis_tdata),
    .s_axis_tkeep(mac_rx_axis_tkeep),
    .s_axis_tvalid(mac_rx_axis_tvalid),
    .s_axis_tready(mac_rx_axis_tready),
    .s_axis_tlast(mac_rx_axis_tlast),
    .s_axis_tuser(mac_rx_axis_tuser),
    // Ethernet frame output
    .m_eth_hdr_valid(rx_eth_hdr_valid),
    .m_eth_hdr_ready(rx_eth_hdr_ready),
    .m_eth_dest_mac(rx_eth_dest_mac),
    .m_eth_src_mac(rx_eth_src_mac),
    .m_eth_type(rx_eth_type),
    .m_eth_payload_axis_tdata(rx_eth_payload_axis_tdata),
    .m_eth_payload_axis_tkeep(rx_eth_payload_axis_tkeep),
    .m_eth_payload_axis_tvalid(rx_eth_payload_axis_tvalid),
    .m_eth_payload_axis_tready(rx_eth_payload_axis_tready),
    .m_eth_payload_axis_tlast(rx_eth_payload_axis_tlast),
    .m_eth_payload_axis_tuser(rx_eth_payload_axis_tuser),
    // Status signals
    .busy(),
    .error_header_early_termination()
);

eth_axis_tx #(
    .DATA_WIDTH(64)
)
eth_axis_tx_inst (
    .clk(clk),
    .rst(rst),
    // Ethernet frame input
    .s_eth_hdr_valid(tx_eth_hdr_valid),
    .s_eth_hdr_ready(tx_eth_hdr_ready),
    .s_eth_dest_mac(tx_eth_dest_mac),
    .s_eth_src_mac(tx_eth_src_mac),
    .s_eth_type(tx_eth_type),
    .s_eth_payload_axis_tdata(tx_eth_payload_axis_tdata),
    .s_eth_payload_axis_tkeep(tx_eth_payload_axis_tkeep),
    .s_eth_payload_axis_tvalid(tx_eth_payload_axis_tvalid),
    .s_eth_payload_axis_tready(tx_eth_payload_axis_tready),
    .s_eth_payload_axis_tlast(tx_eth_payload_axis_tlast),
    .s_eth_payload_axis_tuser(tx_eth_payload_axis_tuser),
    // AXI output
    .m_axis_tdata(mac_tx_axis_tdata),
    .m_axis_tkeep(mac_tx_axis_tkeep),
    .m_axis_tvalid(mac_tx_axis_tvalid),
    .m_axis_tready(mac_tx_axis_tready),
    .m_axis_tlast(mac_tx_axis_tlast),
    .m_axis_tuser(mac_tx_axis_tuser),
    // Status signals
    .busy()
);

udp_complete_64
udp_complete_inst (
    .clk(clk),
    .rst(rst),
    // Ethernet frame input
    .s_eth_hdr_valid(rx_eth_hdr_valid),
    .s_eth_hdr_ready(rx_eth_hdr_ready),
    .s_eth_dest_mac(rx_eth_dest_mac),
    .s_eth_src_mac(rx_eth_src_mac),
    .s_eth_type(rx_eth_type),
    .s_eth_payload_axis_tdata(rx_eth_payload_axis_tdata),
    .s_eth_payload_axis_tkeep(rx_eth_payload_axis_tkeep),
    .s_eth_payload_axis_tvalid(rx_eth_payload_axis_tvalid),
    .s_eth_payload_axis_tready(rx_eth_payload_axis_tready),
    .s_eth_payload_axis_tlast(rx_eth_payload_axis_tlast),
    .s_eth_payload_axis_tuser(rx_eth_payload_axis_tuser),
    // Ethernet frame output
    .m_eth_hdr_valid(tx_eth_hdr_valid),
    .m_eth_hdr_ready(tx_eth_hdr_ready),
    .m_eth_dest_mac(tx_eth_dest_mac),
    .m_eth_src_mac(tx_eth_src_mac),
    .m_eth_type(tx_eth_type),
    .m_eth_payload_axis_tdata(tx_eth_payload_axis_tdata),
    .m_eth_payload_axis_tkeep(tx_eth_payload_axis_tkeep),
    .m_eth_payload_axis_tvalid(tx_eth_payload_axis_tvalid),
    .m_eth_payload_axis_tready(tx_eth_payload_axis_tready),
    .m_eth_payload_axis_tlast(tx_eth_payload_axis_tlast),
    .m_eth_payload_axis_tuser(tx_eth_payload_axis_tuser),
    // IP frame input
    .s_ip_hdr_valid(tx_ip_hdr_valid),
    .s_ip_hdr_ready(tx_ip_hdr_ready),
    .s_ip_dscp(tx_ip_dscp),
    .s_ip_ecn(tx_ip_ecn),
    .s_ip_length(tx_ip_length),
    .s_ip_ttl(tx_ip_ttl),
    .s_ip_protocol(tx_ip_protocol),
    .s_ip_source_ip(tx_ip_source_ip),
    .s_ip_dest_ip(tx_ip_dest_ip),
    .s_ip_payload_axis_tdata(tx_ip_payload_axis_tdata),
    .s_ip_payload_axis_tkeep(tx_ip_payload_axis_tkeep),
    .s_ip_payload_axis_tvalid(tx_ip_payload_axis_tvalid),
    .s_ip_payload_axis_tready(tx_ip_payload_axis_tready),
    .s_ip_payload_axis_tlast(tx_ip_payload_axis_tlast),
    .s_ip_payload_axis_tuser(tx_ip_payload_axis_tuser),
    // IP frame output
    .m_ip_hdr_valid(rx_ip_hdr_valid),
    .m_ip_hdr_ready(rx_ip_hdr_ready),
    .m_ip_eth_dest_mac(rx_ip_eth_dest_mac),
    .m_ip_eth_src_mac(rx_ip_eth_src_mac),
    .m_ip_eth_type(rx_ip_eth_type),
    .m_ip_version(rx_ip_version),
    .m_ip_ihl(rx_ip_ihl),
    .m_ip_dscp(rx_ip_dscp),
    .m_ip_ecn(rx_ip_ecn),
    .m_ip_length(rx_ip_length),
    .m_ip_identification(rx_ip_identification),
    .m_ip_flags(rx_ip_flags),
    .m_ip_fragment_offset(rx_ip_fragment_offset),
    .m_ip_ttl(rx_ip_ttl),
    .m_ip_protocol(rx_ip_protocol),
    .m_ip_header_checksum(rx_ip_header_checksum),
    .m_ip_source_ip(rx_ip_source_ip),
    .m_ip_dest_ip(rx_ip_dest_ip),
    .m_ip_payload_axis_tdata(rx_ip_payload_axis_tdata),
    .m_ip_payload_axis_tkeep(rx_ip_payload_axis_tkeep),
    .m_ip_payload_axis_tvalid(rx_ip_payload_axis_tvalid),
    .m_ip_payload_axis_tready(rx_ip_payload_axis_tready),
    .m_ip_payload_axis_tlast(rx_ip_payload_axis_tlast),
    .m_ip_payload_axis_tuser(rx_ip_payload_axis_tuser),
    // UDP frame input
    .s_udp_hdr_valid(tx_udp_hdr_valid),
    .s_udp_hdr_ready(tx_udp_hdr_ready),
    .s_udp_ip_dscp(tx_udp_ip_dscp),
    .s_udp_ip_ecn(tx_udp_ip_ecn),
    .s_udp_ip_ttl(tx_udp_ip_ttl),
    .s_udp_ip_source_ip(tx_udp_ip_source_ip),
    .s_udp_ip_dest_ip(tx_udp_ip_dest_ip),
    .s_udp_source_port(tx_udp_source_port),
    .s_udp_dest_port(tx_udp_dest_port),
    .s_udp_length(tx_udp_length),
    .s_udp_checksum(tx_udp_checksum),
    .s_udp_payload_axis_tdata(tx_udp_payload_axis_tdata),
    .s_udp_payload_axis_tkeep(tx_udp_payload_axis_tkeep),
    .s_udp_payload_axis_tvalid(tx_udp_payload_axis_tvalid),
    .s_udp_payload_axis_tready(tx_udp_payload_axis_tready),
    .s_udp_payload_axis_tlast(tx_udp_payload_axis_tlast),
    .s_udp_payload_axis_tuser(tx_udp_payload_axis_tuser),
    // UDP frame output
    .m_udp_hdr_valid(rx_udp_hdr_valid),
    .m_udp_hdr_ready(rx_udp_hdr_ready),
    .m_udp_eth_dest_mac(rx_udp_eth_dest_mac),
    .m_udp_eth_src_mac(rx_udp_eth_src_mac),
    .m_udp_eth_type(rx_udp_eth_type),
    .m_udp_ip_version(rx_udp_ip_version),
    .m_udp_ip_ihl(rx_udp_ip_ihl),
    .m_udp_ip_dscp(rx_udp_ip_dscp),
    .m_udp_ip_ecn(rx_udp_ip_ecn),
    .m_udp_ip_length(rx_udp_ip_length),
    .m_udp_ip_identification(rx_udp_ip_identification),
    .m_udp_ip_flags(rx_udp_ip_flags),
    .m_udp_ip_fragment_offset(rx_udp_ip_fragment_offset),
    .m_udp_ip_ttl(rx_udp_ip_ttl),
    .m_udp_ip_protocol(rx_udp_ip_protocol),
    .m_udp_ip_header_checksum(rx_udp_ip_header_checksum),
    .m_udp_ip_source_ip(rx_udp_ip_source_ip),
    .m_udp_ip_dest_ip(rx_udp_ip_dest_ip),
    .m_udp_source_port(rx_udp_source_port),
    .m_udp_dest_port(rx_udp_dest_port),
    .m_udp_length(rx_udp_length),
    .m_udp_checksum(rx_udp_checksum),
    .m_udp_payload_axis_tdata(rx_udp_payload_axis_tdata),
    .m_udp_payload_axis_tkeep(rx_udp_payload_axis_tkeep),
    .m_udp_payload_axis_tvalid(rx_udp_payload_axis_tvalid),
    .m_udp_payload_axis_tready(rx_udp_payload_axis_tready),
    .m_udp_payload_axis_tlast(rx_udp_payload_axis_tlast),
    .m_udp_payload_axis_tuser(rx_udp_payload_axis_tuser),
    // Status signals
    .ip_rx_busy(),
    .ip_tx_busy(),
    .udp_rx_busy(),
    .udp_tx_busy(),
    .ip_rx_error_header_early_termination(),
    .ip_rx_error_payload_early_termination(),
    .ip_rx_error_invalid_header(),
    .ip_rx_error_invalid_checksum(),
    .ip_tx_error_payload_early_termination(),
    .ip_tx_error_arp_failed(),
    .udp_rx_error_header_early_termination(),
    .udp_rx_error_payload_early_termination(),
    .udp_tx_error_payload_early_termination(),
    // Configuration
    .local_mac(local_mac),
    .local_ip(local_ip),
    .gateway_ip(gateway_ip),
    .subnet_mask(subnet_mask),
    .clear_arp_cache(1'b0)
);

//udp_fragmentation #(

//)
//udp_frag (
//    .clk(clk),
//    .rst(rst),

//    // AXI input
//    .s_udp_payload_axis_tdata(rx_fifo_udp_payload_axis_tdata),
//    .s_udp_payload_axis_tkeep(rx_fifo_udp_payload_axis_tkeep),
//    .s_udp_payload_axis_tvalid(rx_fifo_udp_payload_axis_tvalid),
//    .s_udp_payload_axis_tready(rx_fifo_udp_payload_axis_tready),
//    .s_udp_payload_axis_tlast(rx_fifo_udp_payload_axis_tlast),
//    .s_udp_payload_axis_tuser(rx_fifo_udp_payload_axis_tuser),
    
    
//    .s_axis_tdata(s00_axis_tdata),
//    .s_axis_tkeep(s00_axis_tkeep),
//    .s_axis_tvalid(s00_axis_tvalid),
//    .s_axis_tready(s00_axis_tready),
//    .s_axis_tlast(s00_axis_tlast),
//    .s_axis_tuser(s00_axis_tuser),

//    // AXI output
//    .m_axis_tdata(tx_udp_payload_axis_tdata),
//    .m_axis_tkeep(tx_udp_payload_axis_tkeep),
//    .m_axis_tvalid(tx_udp_payload_axis_tvalid),
//    .m_axis_tready(tx_udp_payload_axis_tready),
//    .m_axis_tlast(tx_udp_payload_axis_tlast),
//    .m_axis_tuser(tx_udp_payload_axis_tuser),
    
//    .udp_length(tx_udp_length),
//    .control_dma(control_dma),
    
//    .mss(mss_reg),
//    .ifg(ifg_reg)
//);

//    ila_0 ila_0
//    (
//        .clk (clk),
        
//        //1
//        .probe0 (tx_udp_payload_axis_tdata),
//        .probe1 (tx_udp_payload_axis_tkeep),
//        .probe2 (tx_udp_payload_axis_tvalid),
//        .probe3 (tx_udp_payload_axis_tready),
//        .probe4 (tx_udp_payload_axis_tlast),
//        .probe5 (tx_udp_payload_axis_tuser),
        
//        //2
//        .probe6 (rx_udp_payload_axis_tdata),
//        .probe7 (rx_udp_payload_axis_tkeep),
//        .probe8 (rx_udp_payload_axis_tvalid),
//        .probe9 (rx_udp_payload_axis_tready),
//        .probe10 (rx_udp_payload_axis_tlast),
//        .probe11 (rx_udp_payload_axis_tuser),
        
  
//        //Control signals
//        .probe12 (tx_udp_hdr_valid),
//        .probe13 (tx_udp_hdr_ready),
//        .probe14 (rx_udp_dest_port),
//        .probe15 (tx_udp_source_port)
                   
        
//    );
        
genvar index;
generate
    for (index=0; index < 32; index=index+1)
    begin: vt_single_sync_0
        vt_single_sync #(2'd2, 1'b0) vt_single_sync_100_to_300
        (
        .clk(clk),
        .port_i(ip[index]),
        .port_o(local_ip[index])
        );
    end
endgenerate


generate
    for (index=0; index < 32; index=index+1)
    begin: vt_single_sync_1
        vt_single_sync #(2'd2, 1'b0) vt_single_sync_100_to_300
        (
        .clk(clk),
        .port_i(gw[index]),
        .port_o(gateway_ip[index])
        );
    end
endgenerate    

generate
    for (index=0; index < 32; index=index+1)
    begin: vt_single_sync_2
        vt_single_sync #(2'd2, 1'b0) vt_single_sync_100_to_300
        (
        .clk(clk),
        .port_i(ifg[index]),
        .port_o(ifg_reg[index])
        );
    end
endgenerate

generate
    for (index=0; index < 32; index=index+1)
    begin: vt_single_sync_3
        vt_single_sync #(2'd2, 1'b0) vt_single_sync_100_to_300
        (
        .clk(clk),
        .port_i(mss[index]),
        .port_o(mss_reg[index])
        );
    end
endgenerate 


   


endmodule

`resetall
