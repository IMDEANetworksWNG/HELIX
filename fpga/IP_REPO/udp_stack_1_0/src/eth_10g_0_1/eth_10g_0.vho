-- (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: user.org:user:eth_10g:1.0
-- IP Revision: 7

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT eth_10g_0
  PORT (
    xcvr_ctrl_clk : IN STD_LOGIC;
    xcvr_ctrl_rst : IN STD_LOGIC;
    xcvr_gtpowergood_out : OUT STD_LOGIC;
    xcvr_gtrefclk00_in : IN STD_LOGIC;
    xcvr_qpll0lock_out : OUT STD_LOGIC;
    xcvr_qpll0outclk_out : OUT STD_LOGIC;
    xcvr_qpll0outrefclk_out : OUT STD_LOGIC;
    xcvr_qpll0lock_in : IN STD_LOGIC;
    xcvr_qpll0reset_out : OUT STD_LOGIC;
    xcvr_qpll0clk_in : IN STD_LOGIC;
    xcvr_qpll0refclk_in : IN STD_LOGIC;
    xcvr_txp : OUT STD_LOGIC;
    xcvr_txn : OUT STD_LOGIC;
    xcvr_rxp : IN STD_LOGIC;
    xcvr_rxn : IN STD_LOGIC;
    phy_tx_clk : OUT STD_LOGIC;
    phy_tx_rst : OUT STD_LOGIC;
    phy_xgmii_txd : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    phy_xgmii_txc : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    phy_rx_clk : OUT STD_LOGIC;
    phy_rx_rst : OUT STD_LOGIC;
    phy_xgmii_rxd : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    phy_xgmii_rxc : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    phy_tx_bad_block : OUT STD_LOGIC;
    phy_rx_error_count : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    phy_rx_bad_block : OUT STD_LOGIC;
    phy_rx_sequence_error : OUT STD_LOGIC;
    phy_rx_block_lock : OUT STD_LOGIC;
    phy_rx_high_ber : OUT STD_LOGIC;
    phy_tx_prbs31_enable : IN STD_LOGIC;
    phy_rx_prbs31_enable : IN STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : eth_10g_0
  PORT MAP (
    xcvr_ctrl_clk => xcvr_ctrl_clk,
    xcvr_ctrl_rst => xcvr_ctrl_rst,
    xcvr_gtpowergood_out => xcvr_gtpowergood_out,
    xcvr_gtrefclk00_in => xcvr_gtrefclk00_in,
    xcvr_qpll0lock_out => xcvr_qpll0lock_out,
    xcvr_qpll0outclk_out => xcvr_qpll0outclk_out,
    xcvr_qpll0outrefclk_out => xcvr_qpll0outrefclk_out,
    xcvr_qpll0lock_in => xcvr_qpll0lock_in,
    xcvr_qpll0reset_out => xcvr_qpll0reset_out,
    xcvr_qpll0clk_in => xcvr_qpll0clk_in,
    xcvr_qpll0refclk_in => xcvr_qpll0refclk_in,
    xcvr_txp => xcvr_txp,
    xcvr_txn => xcvr_txn,
    xcvr_rxp => xcvr_rxp,
    xcvr_rxn => xcvr_rxn,
    phy_tx_clk => phy_tx_clk,
    phy_tx_rst => phy_tx_rst,
    phy_xgmii_txd => phy_xgmii_txd,
    phy_xgmii_txc => phy_xgmii_txc,
    phy_rx_clk => phy_rx_clk,
    phy_rx_rst => phy_rx_rst,
    phy_xgmii_rxd => phy_xgmii_rxd,
    phy_xgmii_rxc => phy_xgmii_rxc,
    phy_tx_bad_block => phy_tx_bad_block,
    phy_rx_error_count => phy_rx_error_count,
    phy_rx_bad_block => phy_rx_bad_block,
    phy_rx_sequence_error => phy_rx_sequence_error,
    phy_rx_block_lock => phy_rx_block_lock,
    phy_rx_high_ber => phy_rx_high_ber,
    phy_tx_prbs31_enable => phy_tx_prbs31_enable,
    phy_rx_prbs31_enable => phy_rx_prbs31_enable
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

