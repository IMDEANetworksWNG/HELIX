--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
--Date        : Wed Apr 24 11:47:36 2024
--Host        : tomato running 64-bit Ubuntu 18.04.6 LTS
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
  port (
    GPIO_0_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    pl_clk_clk_n : in STD_LOGIC_VECTOR ( 0 to 0 );
    pl_clk_clk_p : in STD_LOGIC_VECTOR ( 0 to 0 );
    pl_sysref_clk_n : in STD_LOGIC_VECTOR ( 0 to 0 );
    pl_sysref_clk_p : in STD_LOGIC_VECTOR ( 0 to 0 );
    user_mgt_si570_sysclk_clk_n : in STD_LOGIC_VECTOR ( 0 to 0 );
    user_mgt_si570_sysclk_clk_p : in STD_LOGIC_VECTOR ( 0 to 0 );
    xcvr_rxn_0 : in STD_LOGIC;
    xcvr_rxp_0 : in STD_LOGIC;
    xcvr_txn_0 : out STD_LOGIC;
    xcvr_txp_0 : out STD_LOGIC
  );
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    pl_clk_clk_p : in STD_LOGIC_VECTOR ( 0 to 0 );
    pl_clk_clk_n : in STD_LOGIC_VECTOR ( 0 to 0 );
    pl_sysref_clk_p : in STD_LOGIC_VECTOR ( 0 to 0 );
    pl_sysref_clk_n : in STD_LOGIC_VECTOR ( 0 to 0 );
    user_mgt_si570_sysclk_clk_p : in STD_LOGIC_VECTOR ( 0 to 0 );
    user_mgt_si570_sysclk_clk_n : in STD_LOGIC_VECTOR ( 0 to 0 );
    GPIO_0_tri_o : out STD_LOGIC_VECTOR ( 1 downto 0 );
    xcvr_rxn_0 : in STD_LOGIC;
    xcvr_rxp_0 : in STD_LOGIC;
    xcvr_txn_0 : out STD_LOGIC;
    xcvr_txp_0 : out STD_LOGIC
  );
  end component design_1;
begin
design_1_i: component design_1
     port map (
      GPIO_0_tri_o(1 downto 0) => GPIO_0_tri_o(1 downto 0),
      pl_clk_clk_n(0) => pl_clk_clk_n(0),
      pl_clk_clk_p(0) => pl_clk_clk_p(0),
      pl_sysref_clk_n(0) => pl_sysref_clk_n(0),
      pl_sysref_clk_p(0) => pl_sysref_clk_p(0),
      user_mgt_si570_sysclk_clk_n(0) => user_mgt_si570_sysclk_clk_n(0),
      user_mgt_si570_sysclk_clk_p(0) => user_mgt_si570_sysclk_clk_p(0),
      xcvr_rxn_0 => xcvr_rxn_0,
      xcvr_rxp_0 => xcvr_rxp_0,
      xcvr_txn_0 => xcvr_txn_0,
      xcvr_txp_0 => xcvr_txp_0
    );
end STRUCTURE;
