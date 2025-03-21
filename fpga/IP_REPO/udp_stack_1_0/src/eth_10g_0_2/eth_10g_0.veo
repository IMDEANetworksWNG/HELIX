// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
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

// IP VLNV: user.org:user:eth_10g:1.0
// IP Revision: 9

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
eth_10g_0 your_instance_name (
  .xcvr_ctrl_clk(xcvr_ctrl_clk),                      // input wire xcvr_ctrl_clk
  .xcvr_ctrl_rst(xcvr_ctrl_rst),                      // input wire xcvr_ctrl_rst
  .xcvr_gtpowergood_out(xcvr_gtpowergood_out),        // output wire xcvr_gtpowergood_out
  .xcvr_gtrefclk00_in(xcvr_gtrefclk00_in),            // input wire xcvr_gtrefclk00_in
  .xcvr_qpll0lock_out(xcvr_qpll0lock_out),            // output wire xcvr_qpll0lock_out
  .xcvr_qpll0outclk_out(xcvr_qpll0outclk_out),        // output wire xcvr_qpll0outclk_out
  .xcvr_qpll0outrefclk_out(xcvr_qpll0outrefclk_out),  // output wire xcvr_qpll0outrefclk_out
  .xcvr_qpll0lock_in(xcvr_qpll0lock_in),              // input wire xcvr_qpll0lock_in
  .xcvr_qpll0reset_out(xcvr_qpll0reset_out),          // output wire xcvr_qpll0reset_out
  .xcvr_qpll0clk_in(xcvr_qpll0clk_in),                // input wire xcvr_qpll0clk_in
  .xcvr_qpll0refclk_in(xcvr_qpll0refclk_in),          // input wire xcvr_qpll0refclk_in
  .xcvr_txp(xcvr_txp),                                // output wire xcvr_txp
  .xcvr_txn(xcvr_txn),                                // output wire xcvr_txn
  .xcvr_rxp(xcvr_rxp),                                // input wire xcvr_rxp
  .xcvr_rxn(xcvr_rxn),                                // input wire xcvr_rxn
  .phy_tx_clk(phy_tx_clk),                            // output wire phy_tx_clk
  .phy_tx_rst(phy_tx_rst),                            // output wire phy_tx_rst
  .phy_xgmii_txd(phy_xgmii_txd),                      // input wire [63 : 0] phy_xgmii_txd
  .phy_xgmii_txc(phy_xgmii_txc),                      // input wire [7 : 0] phy_xgmii_txc
  .phy_rx_clk(phy_rx_clk),                            // output wire phy_rx_clk
  .phy_rx_rst(phy_rx_rst),                            // output wire phy_rx_rst
  .phy_xgmii_rxd(phy_xgmii_rxd),                      // output wire [63 : 0] phy_xgmii_rxd
  .phy_xgmii_rxc(phy_xgmii_rxc),                      // output wire [7 : 0] phy_xgmii_rxc
  .phy_tx_bad_block(phy_tx_bad_block),                // output wire phy_tx_bad_block
  .phy_rx_error_count(phy_rx_error_count),            // output wire [6 : 0] phy_rx_error_count
  .phy_rx_bad_block(phy_rx_bad_block),                // output wire phy_rx_bad_block
  .phy_rx_sequence_error(phy_rx_sequence_error),      // output wire phy_rx_sequence_error
  .phy_rx_block_lock(phy_rx_block_lock),              // output wire phy_rx_block_lock
  .phy_rx_high_ber(phy_rx_high_ber),                  // output wire phy_rx_high_ber
  .phy_tx_prbs31_enable(phy_tx_prbs31_enable),        // input wire phy_tx_prbs31_enable
  .phy_rx_prbs31_enable(phy_rx_prbs31_enable)        // input wire phy_rx_prbs31_enable
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

