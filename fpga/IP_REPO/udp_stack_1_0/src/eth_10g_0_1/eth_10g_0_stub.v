// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Fri May 26 13:40:24 2023
// Host        : .-System running 64-bit Ubuntu 18.04.3 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/./Documents/RFSoC_Vivado/TESTBED_TWC23_./IP_REPO/udp_stack_64b_1.0/src/eth_10g_0_1/eth_10g_0_stub.v
// Design      : eth_10g_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu28dr-ffvg1517-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "eth_10g_v1_0,Vivado 2019.1" *)
module eth_10g_0(xcvr_ctrl_clk, xcvr_ctrl_rst, 
  xcvr_gtpowergood_out, xcvr_gtrefclk00_in, xcvr_qpll0lock_out, xcvr_qpll0outclk_out, 
  xcvr_qpll0outrefclk_out, xcvr_qpll0lock_in, xcvr_qpll0reset_out, xcvr_qpll0clk_in, 
  xcvr_qpll0refclk_in, xcvr_txp, xcvr_txn, xcvr_rxp, xcvr_rxn, phy_tx_clk, phy_tx_rst, 
  phy_xgmii_txd, phy_xgmii_txc, phy_rx_clk, phy_rx_rst, phy_xgmii_rxd, phy_xgmii_rxc, 
  phy_tx_bad_block, phy_rx_error_count, phy_rx_bad_block, phy_rx_sequence_error, 
  phy_rx_block_lock, phy_rx_high_ber, phy_tx_prbs31_enable, phy_rx_prbs31_enable)
/* synthesis syn_black_box black_box_pad_pin="xcvr_ctrl_clk,xcvr_ctrl_rst,xcvr_gtpowergood_out,xcvr_gtrefclk00_in,xcvr_qpll0lock_out,xcvr_qpll0outclk_out,xcvr_qpll0outrefclk_out,xcvr_qpll0lock_in,xcvr_qpll0reset_out,xcvr_qpll0clk_in,xcvr_qpll0refclk_in,xcvr_txp,xcvr_txn,xcvr_rxp,xcvr_rxn,phy_tx_clk,phy_tx_rst,phy_xgmii_txd[63:0],phy_xgmii_txc[7:0],phy_rx_clk,phy_rx_rst,phy_xgmii_rxd[63:0],phy_xgmii_rxc[7:0],phy_tx_bad_block,phy_rx_error_count[6:0],phy_rx_bad_block,phy_rx_sequence_error,phy_rx_block_lock,phy_rx_high_ber,phy_tx_prbs31_enable,phy_rx_prbs31_enable" */;
  input xcvr_ctrl_clk;
  input xcvr_ctrl_rst;
  output xcvr_gtpowergood_out;
  input xcvr_gtrefclk00_in;
  output xcvr_qpll0lock_out;
  output xcvr_qpll0outclk_out;
  output xcvr_qpll0outrefclk_out;
  input xcvr_qpll0lock_in;
  output xcvr_qpll0reset_out;
  input xcvr_qpll0clk_in;
  input xcvr_qpll0refclk_in;
  output xcvr_txp;
  output xcvr_txn;
  input xcvr_rxp;
  input xcvr_rxn;
  output phy_tx_clk;
  output phy_tx_rst;
  input [63:0]phy_xgmii_txd;
  input [7:0]phy_xgmii_txc;
  output phy_rx_clk;
  output phy_rx_rst;
  output [63:0]phy_xgmii_rxd;
  output [7:0]phy_xgmii_rxc;
  output phy_tx_bad_block;
  output [6:0]phy_rx_error_count;
  output phy_rx_bad_block;
  output phy_rx_sequence_error;
  output phy_rx_block_lock;
  output phy_rx_high_ber;
  input phy_tx_prbs31_enable;
  input phy_rx_prbs31_enable;
endmodule
