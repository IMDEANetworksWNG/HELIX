-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Fri May 26 13:40:25 2023
-- Host        : .-System running 64-bit Ubuntu 18.04.3 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/./Documents/RFSoC_Vivado/TESTBED_TWC23_./IP_REPO/udp_stack_64b_1.0/src/eth_10g_0_1/eth_10g_0_stub.vhdl
-- Design      : eth_10g_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu28dr-ffvg1517-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eth_10g_0 is
  Port ( 
    xcvr_ctrl_clk : in STD_LOGIC;
    xcvr_ctrl_rst : in STD_LOGIC;
    xcvr_gtpowergood_out : out STD_LOGIC;
    xcvr_gtrefclk00_in : in STD_LOGIC;
    xcvr_qpll0lock_out : out STD_LOGIC;
    xcvr_qpll0outclk_out : out STD_LOGIC;
    xcvr_qpll0outrefclk_out : out STD_LOGIC;
    xcvr_qpll0lock_in : in STD_LOGIC;
    xcvr_qpll0reset_out : out STD_LOGIC;
    xcvr_qpll0clk_in : in STD_LOGIC;
    xcvr_qpll0refclk_in : in STD_LOGIC;
    xcvr_txp : out STD_LOGIC;
    xcvr_txn : out STD_LOGIC;
    xcvr_rxp : in STD_LOGIC;
    xcvr_rxn : in STD_LOGIC;
    phy_tx_clk : out STD_LOGIC;
    phy_tx_rst : out STD_LOGIC;
    phy_xgmii_txd : in STD_LOGIC_VECTOR ( 63 downto 0 );
    phy_xgmii_txc : in STD_LOGIC_VECTOR ( 7 downto 0 );
    phy_rx_clk : out STD_LOGIC;
    phy_rx_rst : out STD_LOGIC;
    phy_xgmii_rxd : out STD_LOGIC_VECTOR ( 63 downto 0 );
    phy_xgmii_rxc : out STD_LOGIC_VECTOR ( 7 downto 0 );
    phy_tx_bad_block : out STD_LOGIC;
    phy_rx_error_count : out STD_LOGIC_VECTOR ( 6 downto 0 );
    phy_rx_bad_block : out STD_LOGIC;
    phy_rx_sequence_error : out STD_LOGIC;
    phy_rx_block_lock : out STD_LOGIC;
    phy_rx_high_ber : out STD_LOGIC;
    phy_tx_prbs31_enable : in STD_LOGIC;
    phy_rx_prbs31_enable : in STD_LOGIC
  );

end eth_10g_0;

architecture stub of eth_10g_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "xcvr_ctrl_clk,xcvr_ctrl_rst,xcvr_gtpowergood_out,xcvr_gtrefclk00_in,xcvr_qpll0lock_out,xcvr_qpll0outclk_out,xcvr_qpll0outrefclk_out,xcvr_qpll0lock_in,xcvr_qpll0reset_out,xcvr_qpll0clk_in,xcvr_qpll0refclk_in,xcvr_txp,xcvr_txn,xcvr_rxp,xcvr_rxn,phy_tx_clk,phy_tx_rst,phy_xgmii_txd[63:0],phy_xgmii_txc[7:0],phy_rx_clk,phy_rx_rst,phy_xgmii_rxd[63:0],phy_xgmii_rxc[7:0],phy_tx_bad_block,phy_rx_error_count[6:0],phy_rx_bad_block,phy_rx_sequence_error,phy_rx_block_lock,phy_rx_high_ber,phy_tx_prbs31_enable,phy_rx_prbs31_enable";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "eth_10g_v1_0,Vivado 2019.1";
begin
end;
