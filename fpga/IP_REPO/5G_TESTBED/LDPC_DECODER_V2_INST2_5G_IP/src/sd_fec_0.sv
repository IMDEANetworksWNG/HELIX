// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:ip:sd_fec:1.1
// IP Revision: 3

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module sd_fec_0 (
  reset_n,
  core_clk,
  s_axi_aclk,
  s_axi_awaddr,
  s_axi_awvalid,
  s_axi_awready,
  s_axi_wdata,
  s_axi_wvalid,
  s_axi_wready,
  s_axi_bready,
  s_axi_bvalid,
  s_axi_araddr,
  s_axi_arvalid,
  s_axi_arready,
  s_axi_rready,
  s_axi_rdata,
  s_axi_rvalid,
  interrupt,
  s_axis_din_words_aclk,
  s_axis_din_words_tready,
  s_axis_din_words_tvalid,
  s_axis_din_words_tlast,
  s_axis_din_words_tdata,
  s_axis_ctrl_aclk,
  s_axis_ctrl_tready,
  s_axis_ctrl_tvalid,
  s_axis_ctrl_tdata,
  s_axis_din_aclk,
  s_axis_din_tready,
  s_axis_din_tvalid,
  s_axis_din_tlast,
  s_axis_din_tdata,
  m_axis_status_aclk,
  m_axis_status_tready,
  m_axis_status_tvalid,
  m_axis_status_tdata,
  m_axis_dout_aclk,
  m_axis_dout_tready,
  m_axis_dout_tvalid,
  m_axis_dout_tlast,
  m_axis_dout_tdata
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset_n_intf, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 reset_n_intf RST" *)
input wire reset_n;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clock_intf, FREQ_HZ 666000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clock_intf CLK" *)
input wire core_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_aclk_intf, ASSOCIATED_BUSIF S_AXI, FREQ_HZ 200000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axi_aclk_intf CLK" *)
input wire s_axi_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *)
input wire [17 : 0] s_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *)
input wire s_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *)
output wire s_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *)
input wire [31 : 0] s_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *)
input wire s_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *)
output wire s_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *)
input wire s_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *)
output wire s_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *)
input wire [17 : 0] s_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *)
input wire s_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *)
output wire s_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *)
input wire s_axi_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *)
output wire [31 : 0] s_axi_rdata;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXI, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 18, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 0, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 0, HAS_BRESP 0, HAS_RRESP 0, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER\
_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *)
output wire s_axi_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt_intf, SENSITIVITY EDGE_RISING, PortWidth 1" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt_intf INTERRUPT" *)
output wire interrupt;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_din_words_aclk_intf, ASSOCIATED_BUSIF S_AXIS_DIN_WORDS, FREQ_HZ 200000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_din_words_aclk_intf CLK" *)
input wire s_axis_din_words_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_DIN_WORDS TREADY" *)
output wire s_axis_din_words_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_DIN_WORDS TVALID" *)
input wire s_axis_din_words_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_DIN_WORDS TLAST" *)
input wire s_axis_din_words_tlast;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_DIN_WORDS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_DIN_WORDS TDATA" *)
input wire [7 : 0] s_axis_din_words_tdata;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_ctrl_aclk_intf, ASSOCIATED_BUSIF S_AXIS_CTRL, FREQ_HZ 200000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_ctrl_aclk_intf CLK" *)
input wire s_axis_ctrl_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CTRL TREADY" *)
output wire s_axis_ctrl_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CTRL TVALID" *)
input wire s_axis_ctrl_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_CTRL, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_CTRL TDATA" *)
input wire [39 : 0] s_axis_ctrl_tdata;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axis_din_aclk_intf, ASSOCIATED_BUSIF S_AXIS_DIN, FREQ_HZ 200000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 s_axis_din_aclk_intf CLK" *)
input wire s_axis_din_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_DIN TREADY" *)
output wire s_axis_din_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_DIN TVALID" *)
input wire s_axis_din_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_DIN TLAST" *)
input wire s_axis_din_tlast;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_DIN, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_DIN TDATA" *)
input wire [127 : 0] s_axis_din_tdata;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_status_aclk_intf, ASSOCIATED_BUSIF M_AXIS_STATUS, FREQ_HZ 200000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axis_status_aclk_intf CLK" *)
input wire m_axis_status_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_STATUS TREADY" *)
input wire m_axis_status_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_STATUS TVALID" *)
output wire m_axis_status_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_STATUS, TDATA_NUM_BYTES 5, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_STATUS TDATA" *)
output wire [39 : 0] m_axis_status_tdata;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_dout_aclk_intf, ASSOCIATED_BUSIF M_AXIS_DOUT, FREQ_HZ 200000000, PHASE 0.000, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axis_dout_aclk_intf CLK" *)
input wire m_axis_dout_aclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_DOUT TREADY" *)
input wire m_axis_dout_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_DOUT TVALID" *)
output wire m_axis_dout_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_DOUT TLAST" *)
output wire m_axis_dout_tlast;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_DOUT, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_DOUT TDATA" *)
output wire [127 : 0] m_axis_dout_tdata;

  sd_fec_v1_1_3 #(
    .C_SIM_DEVICE("ULTRASCALE_PLUS"),
    .C_ELABORATION_DIR("./"),
    .C_S_AXI_MODE(1),
    .C_S_DIN_WORDS_MODE(2),
    .C_S_DIN_WORDS_VALUE(16),
    .C_S_DIN_WORDS_TDATA_WIDTH(8),
    .C_S_DOUT_WORDS_TDATA_WIDTH(8),
    .C_S_DOUT_WORDS_MODE(0),
    .C_S_DOUT_WORDS_VALUE(8),
    .C_S_DIN_TDATA_WIDTH(128),
    .C_M_DOUT_TDATA_WIDTH(128),
    .C_STANDARD("5G"),
    .C_MODE("LDPC_DECODE"),
    .C_PHYSICAL_UTILIZATION(100),
    .C_THROUGHPUT_UTILIZATION(100),
    .C_CTRL_TDATA_WIDTH(40),
    .ENCODE(0),
    .ONLY_5G(1),
    .CORE_AXI_WR_PROTECT(32'H00000000),
    .CORE_CODE_WR_PROTECT(32'H00000000),
    .CORE_AXIS_WIDTH(32'H00000004),
    .CORE_AXIS_ENABLE(32'H00000009),
    .CORE_ORDER(32'H00000000),
    .CORE_IER(32'H00000000),
    .CORE_ECC_IER(32'H00000000),
    .CORE_BYPASS(32'H00000000),
    .TURBO_INIT(32'H00000000),
    .SC_TABLE_FILENAME("decode_sc_table.mif"),
    .LA_TABLE_FILENAME("decode_la_table.mif"),
    .QC_TABLE_FILENAME("decode_qc_table0.mif"),
    .QC_TABLE_FILENAME_T("decode_qc_table0_t.mif"),
    .NM_NMQC_FILENAME("decode_nm_nmqc.mif"),
    .CODE_REG_FILENAME("NO_INIT"),
    .MERGED_FILENAME("NO_INIT"),
    .MERGED_CODE_REG_SIZE(0),
    .MERGED_SC_TABLE_SIZE(0),
    .MERGED_LA_TABLE_SIZE(0),
    .MERGED_QC_TABLE_SIZE(0)
  ) inst (
    .reset_n(reset_n),
    .core_clk(core_clk),
    .s_axi_aclk(s_axi_aclk),
    .s_axi_awaddr(s_axi_awaddr),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awready(s_axi_awready),
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wready(s_axi_wready),
    .s_axi_bready(s_axi_bready),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_araddr(s_axi_araddr),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_arready(s_axi_arready),
    .s_axi_rready(s_axi_rready),
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rvalid(s_axi_rvalid),
    .interrupt(interrupt),
    .s_axis_din_words_aclk(s_axis_din_words_aclk),
    .s_axis_din_words_tready(s_axis_din_words_tready),
    .s_axis_din_words_tvalid(s_axis_din_words_tvalid),
    .s_axis_din_words_tlast(s_axis_din_words_tlast),
    .s_axis_din_words_tdata(s_axis_din_words_tdata),
    .s_axis_ctrl_aclk(s_axis_ctrl_aclk),
    .s_axis_ctrl_tready(s_axis_ctrl_tready),
    .s_axis_ctrl_tvalid(s_axis_ctrl_tvalid),
    .s_axis_ctrl_tdata(s_axis_ctrl_tdata),
    .s_axis_din_aclk(s_axis_din_aclk),
    .s_axis_din_tready(s_axis_din_tready),
    .s_axis_din_tvalid(s_axis_din_tvalid),
    .s_axis_din_tlast(s_axis_din_tlast),
    .s_axis_din_tdata(s_axis_din_tdata),
    .m_axis_status_aclk(m_axis_status_aclk),
    .m_axis_status_tready(m_axis_status_tready),
    .m_axis_status_tvalid(m_axis_status_tvalid),
    .m_axis_status_tdata(m_axis_status_tdata),
    .s_axis_dout_words_aclk(1'B0),
    .s_axis_dout_words_tready(),
    .s_axis_dout_words_tvalid(1'B0),
    .s_axis_dout_words_tlast(1'B0),
    .s_axis_dout_words_tdata(8'B0),
    .m_axis_dout_aclk(m_axis_dout_aclk),
    .m_axis_dout_tready(m_axis_dout_tready),
    .m_axis_dout_tvalid(m_axis_dout_tvalid),
    .m_axis_dout_tlast(m_axis_dout_tlast),
    .m_axis_dout_tdata(m_axis_dout_tdata)
  );
endmodule
