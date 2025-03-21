-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2022.2_AR000035739_AR000034905 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
-- Date        : Thu Mar  6 11:51:59 2025
-- Host        : srv-wng-avocado running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ axis_data_fifo_0_sim_netlist.vhdl
-- Design      : axis_data_fifo_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu48dr-fsvg1517-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst is
  port (
    src_rst : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_rst : out STD_LOGIC
  );
  attribute DEF_VAL : string;
  attribute DEF_VAL of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is "1'b0";
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is 4;
  attribute INIT : string;
  attribute INIT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is "0";
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is 1;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is "true";
  attribute xpm_cdc : string;
  attribute xpm_cdc of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst : entity is "SYNC_RST";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst is
  signal syncstages_ff : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of syncstages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of syncstages_ff : signal is "true";
  attribute xpm_cdc of syncstages_ff : signal is "SYNC_RST";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \syncstages_ff_reg[0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0]\ : label is "SYNC_RST";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1]\ : label is "SYNC_RST";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2]\ : label is "SYNC_RST";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3]\ : label is "SYNC_RST";
begin
  dest_rst <= syncstages_ff(3);
\syncstages_ff_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => src_rst,
      Q => syncstages_ff(0),
      R => '0'
    );
\syncstages_ff_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(0),
      Q => syncstages_ff(1),
      R => '0'
    );
\syncstages_ff_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(1),
      Q => syncstages_ff(2),
      R => '0'
    );
\syncstages_ff_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(2),
      Q => syncstages_ff(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized0\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 13 downto 0 );
    \FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\ : out STD_LOGIC;
    leaving_empty0 : out STD_LOGIC;
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\ : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 5 downto 0 );
    \count_value_i_reg[7]_0\ : out STD_LOGIC_VECTOR ( 6 downto 0 );
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\ : out STD_LOGIC;
    \count_value_i_reg[0]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rd_en : in STD_LOGIC;
    ram_empty_i : in STD_LOGIC;
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\ : in STD_LOGIC_VECTOR ( 13 downto 0 );
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\ : in STD_LOGIC_VECTOR ( 13 downto 0 );
    clr_full : in STD_LOGIC;
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg\ : in STD_LOGIC;
    ram_wr_en_i : in STD_LOGIC;
    \count_value_i_reg[0]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized0\ : entity is "xpm_counter_updn";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized0\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized0\ is
  signal \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \count_value_i[0]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[10]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[11]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[11]_i_2__0_n_0\ : STD_LOGIC;
  signal \count_value_i[12]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[13]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[13]_i_2__0_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_2__0_n_0\ : STD_LOGIC;
  signal \count_value_i[7]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[8]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[9]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[9]_i_2__0_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_10_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_11_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_12_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_13_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_14_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_5_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_6_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_7_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_8_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_9_n_0\ : STD_LOGIC;
  signal going_full1 : STD_LOGIC;
  signal \^leaving_empty0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[0]_i_1__1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \count_value_i[12]_i_1__0\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \count_value_i[13]_i_1__0\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \count_value_i[1]_i_1__1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1__1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1__1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \count_value_i[7]_i_1__0\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \count_value_i[8]_i_1__0\ : label is "soft_lutpair70";
begin
  \FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\ <= \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\;
  Q(13 downto 0) <= \^q\(13 downto 0);
  leaving_empty0 <= \^leaving_empty0\;
\count_value_i[0]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"10EF"
    )
        port map (
      I0 => rd_en,
      I1 => \count_value_i_reg[0]_0\(0),
      I2 => \count_value_i_reg[0]_0\(1),
      I3 => \^q\(0),
      O => \count_value_i[0]_i_1__1_n_0\
    );
\count_value_i[10]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(8),
      I1 => \count_value_i[11]_i_2__0_n_0\,
      I2 => \^q\(7),
      I3 => \^q\(9),
      I4 => \^q\(10),
      O => \count_value_i[10]_i_1__0_n_0\
    );
\count_value_i[11]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(9),
      I1 => \^q\(7),
      I2 => \count_value_i[11]_i_2__0_n_0\,
      I3 => \^q\(8),
      I4 => \^q\(10),
      I5 => \^q\(11),
      O => \count_value_i[11]_i_1__0_n_0\
    );
\count_value_i[11]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(4),
      I2 => \^q\(2),
      I3 => \count_value_i[6]_i_2__0_n_0\,
      I4 => \^q\(3),
      I5 => \^q\(5),
      O => \count_value_i[11]_i_2__0_n_0\
    );
\count_value_i[12]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(10),
      I1 => \count_value_i[13]_i_2__0_n_0\,
      I2 => \^q\(11),
      I3 => \^q\(12),
      O => \count_value_i[12]_i_1__0_n_0\
    );
\count_value_i[13]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(11),
      I1 => \count_value_i[13]_i_2__0_n_0\,
      I2 => \^q\(10),
      I3 => \^q\(12),
      I4 => \^q\(13),
      O => \count_value_i[13]_i_1__0_n_0\
    );
\count_value_i[13]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(9),
      I1 => \^q\(7),
      I2 => \^q\(5),
      I3 => \count_value_i[9]_i_2__0_n_0\,
      I4 => \^q\(6),
      I5 => \^q\(8),
      O => \count_value_i[13]_i_2__0_n_0\
    );
\count_value_i[1]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02FFFD00"
    )
        port map (
      I0 => \count_value_i_reg[0]_0\(1),
      I1 => \count_value_i_reg[0]_0\(0),
      I2 => rd_en,
      I3 => \^q\(0),
      I4 => \^q\(1),
      O => \count_value_i[1]_i_1__1_n_0\
    );
\count_value_i[2]_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1__1_n_0\
    );
\count_value_i[3]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1__1_n_0\
    );
\count_value_i[4]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1__1_n_0\
    );
\count_value_i[5]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[6]_i_2__0_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \count_value_i[5]_i_1__0_n_0\
    );
\count_value_i[6]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \count_value_i[6]_i_2__0_n_0\,
      I3 => \^q\(3),
      I4 => \^q\(5),
      I5 => \^q\(6),
      O => \count_value_i[6]_i_1__0_n_0\
    );
\count_value_i[6]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AAA200000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \count_value_i_reg[0]_0\(1),
      I2 => \count_value_i_reg[0]_0\(0),
      I3 => rd_en,
      I4 => ram_empty_i,
      I5 => \^q\(0),
      O => \count_value_i[6]_i_2__0_n_0\
    );
\count_value_i[7]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(5),
      I1 => \count_value_i[9]_i_2__0_n_0\,
      I2 => \^q\(6),
      I3 => \^q\(7),
      O => \count_value_i[7]_i_1__0_n_0\
    );
\count_value_i[8]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_value_i[9]_i_2__0_n_0\,
      I2 => \^q\(5),
      I3 => \^q\(7),
      I4 => \^q\(8),
      O => \count_value_i[8]_i_1__0_n_0\
    );
\count_value_i[9]_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(7),
      I1 => \^q\(5),
      I2 => \count_value_i[9]_i_2__0_n_0\,
      I3 => \^q\(6),
      I4 => \^q\(8),
      I5 => \^q\(9),
      O => \count_value_i[9]_i_1__0_n_0\
    );
\count_value_i[9]_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      I4 => \^q\(1),
      I5 => \^q\(3),
      O => \count_value_i[9]_i_2__0_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[0]_i_1__1_n_0\,
      Q => \^q\(0),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[10]_i_1__0_n_0\,
      Q => \^q\(10),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[11]_i_1__0_n_0\,
      Q => \^q\(11),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[12]_i_1__0_n_0\,
      Q => \^q\(12),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[13]_i_1__0_n_0\,
      Q => \^q\(13),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[1]_i_1__1_n_0\,
      Q => \^q\(1),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[2]_i_1__1_n_0\,
      Q => \^q\(2),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[3]_i_1__1_n_0\,
      Q => \^q\(3),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[4]_i_1__1_n_0\,
      Q => \^q\(4),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[5]_i_1__0_n_0\,
      Q => \^q\(5),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[6]_i_1__0_n_0\,
      Q => \^q\(6),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[7]_i_1__0_n_0\,
      Q => \^q\(7),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[8]_i_1__0_n_0\,
      Q => \^q\(8),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      D => \count_value_i[9]_i_1__0_n_0\,
      Q => \^q\(9),
      R => \count_value_i_reg[0]_1\(0)
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0545044404440444"
    )
        port map (
      I0 => clr_full,
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg\,
      I2 => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      I3 => \^leaving_empty0\,
      I4 => going_full1,
      I5 => ram_wr_en_i,
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FABAFBBBFBBBFBBB"
    )
        port map (
      I0 => clr_full,
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg\,
      I2 => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\,
      I3 => \^leaving_empty0\,
      I4 => going_full1,
      I5 => ram_wr_en_i,
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(6),
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(6),
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(8),
      I3 => \^q\(8),
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(7),
      I5 => \^q\(7),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_10_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \^q\(12),
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(12),
      I2 => \^q\(13),
      I3 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(13),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_11_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(3),
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(3),
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(5),
      I3 => \^q\(5),
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(4),
      I5 => \^q\(4),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_12_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(0),
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(0),
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(2),
      I3 => \^q\(2),
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(1),
      I5 => \^q\(1),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_13_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(9),
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(9),
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(11),
      I3 => \^q\(11),
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(10),
      I5 => \^q\(10),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_14_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_5_n_0\,
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_6_n_0\,
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_7_n_0\,
      I3 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_8_n_0\,
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_9_n_0\,
      O => \^leaving_empty0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_10_n_0\,
      I1 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_11_n_0\,
      I2 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_12_n_0\,
      I3 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_13_n_0\,
      I4 => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_14_n_0\,
      O => going_full1
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(6),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(6),
      I2 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(8),
      I3 => \^q\(8),
      I4 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(7),
      I5 => \^q\(7),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_5_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \^q\(12),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(12),
      I2 => \^q\(13),
      I3 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(13),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_6_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(3),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(3),
      I2 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(5),
      I3 => \^q\(5),
      I4 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(4),
      I5 => \^q\(4),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_7_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(0),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(0),
      I2 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(2),
      I3 => \^q\(2),
      I4 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(1),
      I5 => \^q\(1),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_8_n_0\
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(9),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(9),
      I2 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(11),
      I3 => \^q\(11),
      I4 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(10),
      I5 => \^q\(10),
      O => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_9_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[13]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(13),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(13),
      O => S(5)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[13]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(12),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(12),
      O => S(4)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[13]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(11),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(11),
      O => S(3)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[13]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(10),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(10),
      O => S(2)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[13]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(9),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(9),
      O => S(1)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[13]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(8),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(8),
      O => S(0)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(7),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(7),
      O => \count_value_i_reg[7]_0\(6)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(6),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(6),
      O => \count_value_i_reg[7]_0\(5)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(5),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(5),
      O => \count_value_i_reg[7]_0\(4)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(4),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(4),
      O => \count_value_i_reg[7]_0\(3)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(3),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(3),
      O => \count_value_i_reg[7]_0\(2)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(2),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(2),
      O => \count_value_i_reg[7]_0\(1)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \^q\(1),
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(1),
      O => \count_value_i_reg[7]_0\(0)
    );
\gen_sdpram.xpm_memory_base_inst_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00FD"
    )
        port map (
      I0 => \count_value_i_reg[0]_0\(1),
      I1 => \count_value_i_reg[0]_0\(0),
      I2 => rd_en,
      I3 => ram_empty_i,
      O => \^fsm_sequential_gen_fwft.curr_fwft_state_reg[1]\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized0_0\ is
  port (
    ram_empty_i0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 13 downto 0 );
    D : out STD_LOGIC_VECTOR ( 13 downto 0 );
    \gen_pntr_flags_cc.ram_empty_i_reg\ : in STD_LOGIC;
    leaving_empty0 : in STD_LOGIC;
    ram_wr_en_i : in STD_LOGIC;
    ram_empty_i : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    \count_value_i_reg[6]_0\ : in STD_LOGIC;
    \count_value_i_reg[13]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    rst_d1 : in STD_LOGIC;
    \gen_pntr_flags_cc.ram_empty_i_i_2_0\ : in STD_LOGIC_VECTOR ( 13 downto 0 );
    DI : in STD_LOGIC_VECTOR ( 0 to 0 );
    S : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\ : in STD_LOGIC_VECTOR ( 5 downto 0 );
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized0_0\ : entity is "xpm_counter_updn";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized0_0\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized0_0\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \count_value_i[0]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[10]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[11]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[11]_i_2__1_n_0\ : STD_LOGIC;
  signal \count_value_i[12]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[13]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[13]_i_2__1_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_2__1_n_0\ : STD_LOGIC;
  signal \count_value_i[7]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[8]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[9]_i_1__1_n_0\ : STD_LOGIC;
  signal \count_value_i[9]_i_2__1_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_i_3_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_i_4_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_i_5_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_i_6_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.ram_empty_i_i_7_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_3\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_4\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_5\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_6\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_7\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal going_empty1 : STD_LOGIC;
  signal \NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 5 );
  signal \NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 6 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[12]_i_1__1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \count_value_i[13]_i_1__1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \count_value_i[1]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \count_value_i[2]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \count_value_i[7]_i_1__1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \count_value_i[8]_i_1__1\ : label is "soft_lutpair78";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1\ : label is "{SYNTH-8 {cell *THIS*}}";
  attribute ADDER_THRESHOLD of \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1\ : label is "{SYNTH-8 {cell *THIS*}}";
begin
  Q(13 downto 0) <= \^q\(13 downto 0);
\count_value_i[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \count_value_i[0]_i_1_n_0\
    );
\count_value_i[10]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(8),
      I1 => \count_value_i[11]_i_2__1_n_0\,
      I2 => \^q\(7),
      I3 => \^q\(9),
      I4 => \^q\(10),
      O => \count_value_i[10]_i_1__1_n_0\
    );
\count_value_i[11]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(9),
      I1 => \^q\(7),
      I2 => \count_value_i[11]_i_2__1_n_0\,
      I3 => \^q\(8),
      I4 => \^q\(10),
      I5 => \^q\(11),
      O => \count_value_i[11]_i_1__1_n_0\
    );
\count_value_i[11]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(4),
      I2 => \^q\(2),
      I3 => \count_value_i[6]_i_2__1_n_0\,
      I4 => \^q\(3),
      I5 => \^q\(5),
      O => \count_value_i[11]_i_2__1_n_0\
    );
\count_value_i[12]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(10),
      I1 => \count_value_i[13]_i_2__1_n_0\,
      I2 => \^q\(11),
      I3 => \^q\(12),
      O => \count_value_i[12]_i_1__1_n_0\
    );
\count_value_i[13]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(11),
      I1 => \count_value_i[13]_i_2__1_n_0\,
      I2 => \^q\(10),
      I3 => \^q\(12),
      I4 => \^q\(13),
      O => \count_value_i[13]_i_1__1_n_0\
    );
\count_value_i[13]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(9),
      I1 => \^q\(7),
      I2 => \^q\(5),
      I3 => \count_value_i[9]_i_2__1_n_0\,
      I4 => \^q\(6),
      I5 => \^q\(8),
      O => \count_value_i[13]_i_2__1_n_0\
    );
\count_value_i[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \count_value_i[1]_i_1_n_0\
    );
\count_value_i[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1_n_0\
    );
\count_value_i[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1_n_0\
    );
\count_value_i[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1_n_0\
    );
\count_value_i[5]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[6]_i_2__1_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \count_value_i[5]_i_1__1_n_0\
    );
\count_value_i[6]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \count_value_i[6]_i_2__1_n_0\,
      I3 => \^q\(3),
      I4 => \^q\(5),
      I5 => \^q\(6),
      O => \count_value_i[6]_i_1__1_n_0\
    );
\count_value_i[6]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => wr_en,
      I2 => \count_value_i_reg[6]_0\,
      I3 => \count_value_i_reg[13]_0\(0),
      I4 => rst_d1,
      I5 => \^q\(0),
      O => \count_value_i[6]_i_2__1_n_0\
    );
\count_value_i[7]_i_1__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(5),
      I1 => \count_value_i[9]_i_2__1_n_0\,
      I2 => \^q\(6),
      I3 => \^q\(7),
      O => \count_value_i[7]_i_1__1_n_0\
    );
\count_value_i[8]_i_1__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_value_i[9]_i_2__1_n_0\,
      I2 => \^q\(5),
      I3 => \^q\(7),
      I4 => \^q\(8),
      O => \count_value_i[8]_i_1__1_n_0\
    );
\count_value_i[9]_i_1__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(7),
      I1 => \^q\(5),
      I2 => \count_value_i[9]_i_2__1_n_0\,
      I3 => \^q\(6),
      I4 => \^q\(8),
      I5 => \^q\(9),
      O => \count_value_i[9]_i_1__1_n_0\
    );
\count_value_i[9]_i_2__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => ram_wr_en_i,
      I4 => \^q\(1),
      I5 => \^q\(3),
      O => \count_value_i[9]_i_2__1_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[0]_i_1_n_0\,
      Q => \^q\(0),
      R => \count_value_i_reg[13]_0\(0)
    );
\count_value_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[10]_i_1__1_n_0\,
      Q => \^q\(10),
      R => \count_value_i_reg[13]_0\(0)
    );
\count_value_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[11]_i_1__1_n_0\,
      Q => \^q\(11),
      R => \count_value_i_reg[13]_0\(0)
    );
\count_value_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[12]_i_1__1_n_0\,
      Q => \^q\(12),
      R => \count_value_i_reg[13]_0\(0)
    );
\count_value_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[13]_i_1__1_n_0\,
      Q => \^q\(13),
      R => \count_value_i_reg[13]_0\(0)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[1]_i_1_n_0\,
      Q => \^q\(1),
      R => \count_value_i_reg[13]_0\(0)
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[2]_i_1_n_0\,
      Q => \^q\(2),
      R => \count_value_i_reg[13]_0\(0)
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[3]_i_1_n_0\,
      Q => \^q\(3),
      R => \count_value_i_reg[13]_0\(0)
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[4]_i_1_n_0\,
      Q => \^q\(4),
      R => \count_value_i_reg[13]_0\(0)
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[5]_i_1__1_n_0\,
      Q => \^q\(5),
      R => \count_value_i_reg[13]_0\(0)
    );
\count_value_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[6]_i_1__1_n_0\,
      Q => \^q\(6),
      R => \count_value_i_reg[13]_0\(0)
    );
\count_value_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[7]_i_1__1_n_0\,
      Q => \^q\(7),
      R => \count_value_i_reg[13]_0\(0)
    );
\count_value_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[8]_i_1__1_n_0\,
      Q => \^q\(8),
      R => \count_value_i_reg[13]_0\(0)
    );
\count_value_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[9]_i_1__1_n_0\,
      Q => \^q\(9),
      R => \count_value_i_reg[13]_0\(0)
    );
\gen_pntr_flags_cc.ram_empty_i_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FFF0088"
    )
        port map (
      I0 => \gen_pntr_flags_cc.ram_empty_i_reg\,
      I1 => going_empty1,
      I2 => leaving_empty0,
      I3 => ram_wr_en_i,
      I4 => ram_empty_i,
      O => ram_empty_i0
    );
\gen_pntr_flags_cc.ram_empty_i_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => \gen_pntr_flags_cc.ram_empty_i_i_3_n_0\,
      I1 => \gen_pntr_flags_cc.ram_empty_i_i_4_n_0\,
      I2 => \gen_pntr_flags_cc.ram_empty_i_i_5_n_0\,
      I3 => \gen_pntr_flags_cc.ram_empty_i_i_6_n_0\,
      I4 => \gen_pntr_flags_cc.ram_empty_i_i_7_n_0\,
      O => going_empty1
    );
\gen_pntr_flags_cc.ram_empty_i_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(6),
      I1 => \gen_pntr_flags_cc.ram_empty_i_i_2_0\(6),
      I2 => \gen_pntr_flags_cc.ram_empty_i_i_2_0\(8),
      I3 => \^q\(8),
      I4 => \gen_pntr_flags_cc.ram_empty_i_i_2_0\(7),
      I5 => \^q\(7),
      O => \gen_pntr_flags_cc.ram_empty_i_i_3_n_0\
    );
\gen_pntr_flags_cc.ram_empty_i_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6FF6"
    )
        port map (
      I0 => \^q\(12),
      I1 => \gen_pntr_flags_cc.ram_empty_i_i_2_0\(12),
      I2 => \^q\(13),
      I3 => \gen_pntr_flags_cc.ram_empty_i_i_2_0\(13),
      O => \gen_pntr_flags_cc.ram_empty_i_i_4_n_0\
    );
\gen_pntr_flags_cc.ram_empty_i_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(3),
      I1 => \gen_pntr_flags_cc.ram_empty_i_i_2_0\(3),
      I2 => \gen_pntr_flags_cc.ram_empty_i_i_2_0\(5),
      I3 => \^q\(5),
      I4 => \gen_pntr_flags_cc.ram_empty_i_i_2_0\(4),
      I5 => \^q\(4),
      O => \gen_pntr_flags_cc.ram_empty_i_i_5_n_0\
    );
\gen_pntr_flags_cc.ram_empty_i_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(0),
      I1 => \gen_pntr_flags_cc.ram_empty_i_i_2_0\(0),
      I2 => \gen_pntr_flags_cc.ram_empty_i_i_2_0\(2),
      I3 => \^q\(2),
      I4 => \gen_pntr_flags_cc.ram_empty_i_i_2_0\(1),
      I5 => \^q\(1),
      O => \gen_pntr_flags_cc.ram_empty_i_i_6_n_0\
    );
\gen_pntr_flags_cc.ram_empty_i_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => \^q\(9),
      I1 => \gen_pntr_flags_cc.ram_empty_i_i_2_0\(9),
      I2 => \gen_pntr_flags_cc.ram_empty_i_i_2_0\(11),
      I3 => \^q\(11),
      I4 => \gen_pntr_flags_cc.ram_empty_i_i_2_0\(10),
      I5 => \^q\(10),
      O => \gen_pntr_flags_cc.ram_empty_i_i_7_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 5) => \NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_CO_UNCONNECTED\(7 downto 5),
      CO(4) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_3\,
      CO(3) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_4\,
      CO(2) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_5\,
      CO(1) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_6\,
      CO(0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_7\,
      DI(7 downto 5) => B"000",
      DI(4 downto 0) => \^q\(12 downto 8),
      O(7 downto 6) => \NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_O_UNCONNECTED\(7 downto 6),
      O(5 downto 0) => D(13 downto 8),
      S(7 downto 6) => B"00",
      S(5 downto 0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(5 downto 0)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \^q\(0),
      CI_TOP => '0',
      CO(7) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_0\,
      CO(6) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_1\,
      CO(5) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_2\,
      CO(4) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_3\,
      CO(3) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_4\,
      CO(2) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_5\,
      CO(1) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_6\,
      CO(0) => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_7\,
      DI(7 downto 1) => \^q\(7 downto 1),
      DI(0) => DI(0),
      O(7 downto 0) => D(7 downto 0),
      S(7 downto 0) => S(7 downto 0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 13 downto 0 );
    \count_value_i_reg[0]_0\ : in STD_LOGIC;
    \count_value_i_reg[1]_0\ : in STD_LOGIC_VECTOR ( 1 downto 0 );
    rd_en : in STD_LOGIC;
    ram_empty_i : in STD_LOGIC;
    \count_value_i_reg[0]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1\ : entity is "xpm_counter_updn";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \count_value_i[0]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[10]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[11]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[11]_i_2_n_0\ : STD_LOGIC;
  signal \count_value_i[12]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[13]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[13]_i_2_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_2_n_0\ : STD_LOGIC;
  signal \count_value_i[7]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[8]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[9]_i_1_n_0\ : STD_LOGIC;
  signal \count_value_i[9]_i_2_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[12]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \count_value_i[13]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1__2\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1__2\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \count_value_i[7]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \count_value_i[8]_i_1\ : label is "soft_lutpair74";
begin
  Q(13 downto 0) <= \^q\(13 downto 0);
\count_value_i[0]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"10EF"
    )
        port map (
      I0 => rd_en,
      I1 => \count_value_i_reg[1]_0\(0),
      I2 => \count_value_i_reg[1]_0\(1),
      I3 => \^q\(0),
      O => \count_value_i[0]_i_1__2_n_0\
    );
\count_value_i[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(8),
      I1 => \count_value_i[11]_i_2_n_0\,
      I2 => \^q\(7),
      I3 => \^q\(9),
      I4 => \^q\(10),
      O => \count_value_i[10]_i_1_n_0\
    );
\count_value_i[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(9),
      I1 => \^q\(7),
      I2 => \count_value_i[11]_i_2_n_0\,
      I3 => \^q\(8),
      I4 => \^q\(10),
      I5 => \^q\(11),
      O => \count_value_i[11]_i_1_n_0\
    );
\count_value_i[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(4),
      I2 => \^q\(2),
      I3 => \count_value_i[6]_i_2_n_0\,
      I4 => \^q\(3),
      I5 => \^q\(5),
      O => \count_value_i[11]_i_2_n_0\
    );
\count_value_i[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(10),
      I1 => \count_value_i[13]_i_2_n_0\,
      I2 => \^q\(11),
      I3 => \^q\(12),
      O => \count_value_i[12]_i_1_n_0\
    );
\count_value_i[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(11),
      I1 => \count_value_i[13]_i_2_n_0\,
      I2 => \^q\(10),
      I3 => \^q\(12),
      I4 => \^q\(13),
      O => \count_value_i[13]_i_1_n_0\
    );
\count_value_i[13]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(9),
      I1 => \^q\(7),
      I2 => \^q\(5),
      I3 => \count_value_i[9]_i_2_n_0\,
      I4 => \^q\(6),
      I5 => \^q\(8),
      O => \count_value_i[13]_i_2_n_0\
    );
\count_value_i[1]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02FFFD00"
    )
        port map (
      I0 => \count_value_i_reg[1]_0\(1),
      I1 => \count_value_i_reg[1]_0\(0),
      I2 => rd_en,
      I3 => \^q\(0),
      I4 => \^q\(1),
      O => \count_value_i[1]_i_1__2_n_0\
    );
\count_value_i[2]_i_1__2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1__2_n_0\
    );
\count_value_i[3]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1__2_n_0\
    );
\count_value_i[4]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1__2_n_0\
    );
\count_value_i[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[6]_i_2_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \count_value_i[5]_i_1_n_0\
    );
\count_value_i[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \count_value_i[6]_i_2_n_0\,
      I3 => \^q\(3),
      I4 => \^q\(5),
      I5 => \^q\(6),
      O => \count_value_i[6]_i_1_n_0\
    );
\count_value_i[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000AAA200000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => \count_value_i_reg[1]_0\(1),
      I2 => \count_value_i_reg[1]_0\(0),
      I3 => rd_en,
      I4 => ram_empty_i,
      I5 => \^q\(0),
      O => \count_value_i[6]_i_2_n_0\
    );
\count_value_i[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(5),
      I1 => \count_value_i[9]_i_2_n_0\,
      I2 => \^q\(6),
      I3 => \^q\(7),
      O => \count_value_i[7]_i_1_n_0\
    );
\count_value_i[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_value_i[9]_i_2_n_0\,
      I2 => \^q\(5),
      I3 => \^q\(7),
      I4 => \^q\(8),
      O => \count_value_i[8]_i_1_n_0\
    );
\count_value_i[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(7),
      I1 => \^q\(5),
      I2 => \count_value_i[9]_i_2_n_0\,
      I3 => \^q\(6),
      I4 => \^q\(8),
      I5 => \^q\(9),
      O => \count_value_i[9]_i_1_n_0\
    );
\count_value_i[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => \count_value_i_reg[0]_0\,
      I4 => \^q\(1),
      I5 => \^q\(3),
      O => \count_value_i[9]_i_2_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => \count_value_i_reg[0]_0\,
      D => \count_value_i[0]_i_1__2_n_0\,
      Q => \^q\(0),
      S => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \count_value_i_reg[0]_0\,
      D => \count_value_i[10]_i_1_n_0\,
      Q => \^q\(10),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \count_value_i_reg[0]_0\,
      D => \count_value_i[11]_i_1_n_0\,
      Q => \^q\(11),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \count_value_i_reg[0]_0\,
      D => \count_value_i[12]_i_1_n_0\,
      Q => \^q\(12),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \count_value_i_reg[0]_0\,
      D => \count_value_i[13]_i_1_n_0\,
      Q => \^q\(13),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \count_value_i_reg[0]_0\,
      D => \count_value_i[1]_i_1__2_n_0\,
      Q => \^q\(1),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \count_value_i_reg[0]_0\,
      D => \count_value_i[2]_i_1__2_n_0\,
      Q => \^q\(2),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \count_value_i_reg[0]_0\,
      D => \count_value_i[3]_i_1__2_n_0\,
      Q => \^q\(3),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \count_value_i_reg[0]_0\,
      D => \count_value_i[4]_i_1__2_n_0\,
      Q => \^q\(4),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \count_value_i_reg[0]_0\,
      D => \count_value_i[5]_i_1_n_0\,
      Q => \^q\(5),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \count_value_i_reg[0]_0\,
      D => \count_value_i[6]_i_1_n_0\,
      Q => \^q\(6),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \count_value_i_reg[0]_0\,
      D => \count_value_i[7]_i_1_n_0\,
      Q => \^q\(7),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \count_value_i_reg[0]_0\,
      D => \count_value_i[8]_i_1_n_0\,
      Q => \^q\(8),
      R => \count_value_i_reg[0]_1\(0)
    );
\count_value_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => \count_value_i_reg[0]_0\,
      D => \count_value_i[9]_i_1_n_0\,
      Q => \^q\(9),
      R => \count_value_i_reg[0]_1\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1_1\ is
  port (
    Q : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ram_wr_en_i : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    \count_value_i_reg[6]_0\ : in STD_LOGIC;
    \count_value_i_reg[0]_0\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    rst_d1 : in STD_LOGIC;
    wr_clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1_1\ : entity is "xpm_counter_updn";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1_1\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1_1\ is
  signal \^q\ : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \count_value_i[0]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[10]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[11]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[11]_i_2__2_n_0\ : STD_LOGIC;
  signal \count_value_i[12]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[13]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[13]_i_2__2_n_0\ : STD_LOGIC;
  signal \count_value_i[1]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[2]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[3]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[4]_i_1__0_n_0\ : STD_LOGIC;
  signal \count_value_i[5]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[6]_i_2__2_n_0\ : STD_LOGIC;
  signal \count_value_i[7]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[8]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[9]_i_1__2_n_0\ : STD_LOGIC;
  signal \count_value_i[9]_i_2__2_n_0\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \count_value_i[12]_i_1__2\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \count_value_i[13]_i_1__2\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \count_value_i[1]_i_1__0\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \count_value_i[2]_i_1__0\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \count_value_i[3]_i_1__0\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \count_value_i[4]_i_1__0\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \count_value_i[7]_i_1__2\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \count_value_i[8]_i_1__2\ : label is "soft_lutpair82";
begin
  Q(13 downto 0) <= \^q\(13 downto 0);
\count_value_i[0]_i_1__0\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => \count_value_i[0]_i_1__0_n_0\
    );
\count_value_i[10]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(8),
      I1 => \count_value_i[11]_i_2__2_n_0\,
      I2 => \^q\(7),
      I3 => \^q\(9),
      I4 => \^q\(10),
      O => \count_value_i[10]_i_1__2_n_0\
    );
\count_value_i[11]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(9),
      I1 => \^q\(7),
      I2 => \count_value_i[11]_i_2__2_n_0\,
      I3 => \^q\(8),
      I4 => \^q\(10),
      I5 => \^q\(11),
      O => \count_value_i[11]_i_1__2_n_0\
    );
\count_value_i[11]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(4),
      I2 => \^q\(2),
      I3 => \count_value_i[6]_i_2__2_n_0\,
      I4 => \^q\(3),
      I5 => \^q\(5),
      O => \count_value_i[11]_i_2__2_n_0\
    );
\count_value_i[12]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(10),
      I1 => \count_value_i[13]_i_2__2_n_0\,
      I2 => \^q\(11),
      I3 => \^q\(12),
      O => \count_value_i[12]_i_1__2_n_0\
    );
\count_value_i[13]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(11),
      I1 => \count_value_i[13]_i_2__2_n_0\,
      I2 => \^q\(10),
      I3 => \^q\(12),
      I4 => \^q\(13),
      O => \count_value_i[13]_i_1__2_n_0\
    );
\count_value_i[13]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(9),
      I1 => \^q\(7),
      I2 => \^q\(5),
      I3 => \count_value_i[9]_i_2__2_n_0\,
      I4 => \^q\(6),
      I5 => \^q\(8),
      O => \count_value_i[13]_i_2__2_n_0\
    );
\count_value_i[1]_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => \count_value_i[1]_i_1__0_n_0\
    );
\count_value_i[2]_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => \count_value_i[2]_i_1__0_n_0\
    );
\count_value_i[3]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => \count_value_i[3]_i_1__0_n_0\
    );
\count_value_i[4]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => \count_value_i[4]_i_1__0_n_0\
    );
\count_value_i[5]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \count_value_i[6]_i_2__2_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(4),
      I4 => \^q\(5),
      O => \count_value_i[5]_i_1__2_n_0\
    );
\count_value_i[6]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \count_value_i[6]_i_2__2_n_0\,
      I3 => \^q\(3),
      I4 => \^q\(5),
      I5 => \^q\(6),
      O => \count_value_i[6]_i_1__2_n_0\
    );
\count_value_i[6]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000800000000"
    )
        port map (
      I0 => \^q\(1),
      I1 => wr_en,
      I2 => \count_value_i_reg[6]_0\,
      I3 => \count_value_i_reg[0]_0\(0),
      I4 => rst_d1,
      I5 => \^q\(0),
      O => \count_value_i[6]_i_2__2_n_0\
    );
\count_value_i[7]_i_1__2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(5),
      I1 => \count_value_i[9]_i_2__2_n_0\,
      I2 => \^q\(6),
      I3 => \^q\(7),
      O => \count_value_i[7]_i_1__2_n_0\
    );
\count_value_i[8]_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(6),
      I1 => \count_value_i[9]_i_2__2_n_0\,
      I2 => \^q\(5),
      I3 => \^q\(7),
      I4 => \^q\(8),
      O => \count_value_i[8]_i_1__2_n_0\
    );
\count_value_i[9]_i_1__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(7),
      I1 => \^q\(5),
      I2 => \count_value_i[9]_i_2__2_n_0\,
      I3 => \^q\(6),
      I4 => \^q\(8),
      I5 => \^q\(9),
      O => \count_value_i[9]_i_1__2_n_0\
    );
\count_value_i[9]_i_2__2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(0),
      I3 => ram_wr_en_i,
      I4 => \^q\(1),
      I5 => \^q\(3),
      O => \count_value_i[9]_i_2__2_n_0\
    );
\count_value_i_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[0]_i_1__0_n_0\,
      Q => \^q\(0),
      S => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[10]_i_1__2_n_0\,
      Q => \^q\(10),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[11]_i_1__2_n_0\,
      Q => \^q\(11),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[12]_i_1__2_n_0\,
      Q => \^q\(12),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[13]_i_1__2_n_0\,
      Q => \^q\(13),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[1]_i_1__0_n_0\,
      Q => \^q\(1),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[2]_i_1__0_n_0\,
      Q => \^q\(2),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[3]_i_1__0_n_0\,
      Q => \^q\(3),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[4]_i_1__0_n_0\,
      Q => \^q\(4),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[5]_i_1__2_n_0\,
      Q => \^q\(5),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[6]_i_1__2_n_0\,
      Q => \^q\(6),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[7]_i_1__2_n_0\,
      Q => \^q\(7),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[8]_i_1__2_n_0\,
      Q => \^q\(8),
      R => \count_value_i_reg[0]_0\(0)
    );
\count_value_i_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => ram_wr_en_i,
      D => \count_value_i[9]_i_1__2_n_0\,
      Q => \^q\(9),
      R => \count_value_i_reg[0]_0\(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_reg_bit is
  port (
    rst_d1 : out STD_LOGIC;
    DI : out STD_LOGIC_VECTOR ( 0 to 0 );
    clr_full : out STD_LOGIC;
    write_only : out STD_LOGIC;
    read_only : out STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg\ : in STD_LOGIC;
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_0\ : in STD_LOGIC;
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_1\ : in STD_LOGIC;
    rst : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_reg_bit;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_reg_bit is
  signal \^rst_d1\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.read_only_q_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_i_1\ : label is "soft_lutpair76";
begin
  rst_d1 <= \^rst_d1\;
d_out_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => Q(0),
      Q => \^rst_d1\,
      R => '0'
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => rst,
      I1 => \^rst_d1\,
      I2 => Q(0),
      O => clr_full
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0010FFFF"
    )
        port map (
      I0 => \^rst_d1\,
      I1 => Q(0),
      I2 => wr_en,
      I3 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg\,
      I4 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_0\,
      I5 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_1\,
      O => DI(0)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.read_only_q_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44444044"
    )
        port map (
      I0 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_1\,
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_0\,
      I2 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg\,
      I3 => wr_en,
      I4 => \^rst_d1\,
      O => read_only
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000404"
    )
        port map (
      I0 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg\,
      I1 => wr_en,
      I2 => \^rst_d1\,
      I3 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_1\,
      I4 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_0\,
      O => write_only
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_rst is
  port (
    ram_wr_en_i : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 0 to 0 );
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg\ : out STD_LOGIC;
    S : out STD_LOGIC_VECTOR ( 0 to 0 );
    rst : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    \count_value_i_reg[13]\ : in STD_LOGIC;
    rst_d1 : in STD_LOGIC;
    write_only_q : in STD_LOGIC;
    prog_empty : in STD_LOGIC;
    prog_empty_i1 : in STD_LOGIC;
    read_only_q : in STD_LOGIC;
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]\ : in STD_LOGIC;
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_0\ : in STD_LOGIC;
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_1\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    wr_clk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_rst;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_rst is
  signal \^q\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \gen_rst_cc.fifo_wr_rst_cc\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal p_0_in : STD_LOGIC;
  signal \power_on_rst_reg_n_0_[0]\ : STD_LOGIC;
  signal \^ram_wr_en_i\ : STD_LOGIC;
  signal rst_i : STD_LOGIC;
begin
  Q(0) <= \^q\(0);
  ram_wr_en_i <= \^ram_wr_en_i\;
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF2F00D0"
    )
        port map (
      I0 => \^ram_wr_en_i\,
      I1 => \count_value_i_reg[13]\,
      I2 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]\,
      I3 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_0\,
      I4 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_1\(0),
      O => S(0)
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFC4C"
    )
        port map (
      I0 => write_only_q,
      I1 => prog_empty,
      I2 => prog_empty_i1,
      I3 => read_only_q,
      I4 => \^q\(0),
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg\
    );
\gen_rst_cc.fifo_wr_rst_cc[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => p_0_in,
      I1 => rst,
      O => rst_i
    );
\gen_rst_cc.fifo_wr_rst_cc_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      Q => \gen_rst_cc.fifo_wr_rst_cc\(0),
      S => rst_i
    );
\gen_rst_cc.fifo_wr_rst_cc_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \gen_rst_cc.fifo_wr_rst_cc\(0),
      Q => \gen_rst_cc.fifo_wr_rst_cc\(1),
      S => rst_i
    );
\gen_rst_cc.fifo_wr_rst_cc_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \gen_rst_cc.fifo_wr_rst_cc\(1),
      Q => \^q\(0),
      S => rst_i
    );
\gen_sdpram.xpm_memory_base_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => wr_en,
      I1 => \count_value_i_reg[13]\,
      I2 => \^q\(0),
      I3 => rst_d1,
      O => \^ram_wr_en_i\
    );
\power_on_rst_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => '0',
      Q => \power_on_rst_reg_n_0_[0]\,
      R => '0'
    );
\power_on_rst_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \power_on_rst_reg_n_0_[0]\,
      Q => p_0_in,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base is
  port (
    sleep : in STD_LOGIC;
    clka : in STD_LOGIC;
    rsta : in STD_LOGIC;
    ena : in STD_LOGIC;
    regcea : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 13 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 83 downto 0 );
    injectsbiterra : in STD_LOGIC;
    injectdbiterra : in STD_LOGIC;
    douta : out STD_LOGIC_VECTOR ( 83 downto 0 );
    sbiterra : out STD_LOGIC;
    dbiterra : out STD_LOGIC;
    clkb : in STD_LOGIC;
    rstb : in STD_LOGIC;
    enb : in STD_LOGIC;
    regceb : in STD_LOGIC;
    web : in STD_LOGIC_VECTOR ( 0 to 0 );
    addrb : in STD_LOGIC_VECTOR ( 13 downto 0 );
    dinb : in STD_LOGIC_VECTOR ( 83 downto 0 );
    injectsbiterrb : in STD_LOGIC;
    injectdbiterrb : in STD_LOGIC;
    doutb : out STD_LOGIC_VECTOR ( 83 downto 0 );
    sbiterrb : out STD_LOGIC;
    dbiterrb : out STD_LOGIC
  );
  attribute ADDR_WIDTH_A : integer;
  attribute ADDR_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 14;
  attribute ADDR_WIDTH_B : integer;
  attribute ADDR_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 14;
  attribute AUTO_SLEEP_TIME : integer;
  attribute AUTO_SLEEP_TIME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute BYTE_WRITE_WIDTH_A : integer;
  attribute BYTE_WRITE_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
  attribute BYTE_WRITE_WIDTH_B : integer;
  attribute BYTE_WRITE_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute CLOCKING_MODE : integer;
  attribute CLOCKING_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute ECC_BIT_RANGE : string;
  attribute ECC_BIT_RANGE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "[7:0]";
  attribute ECC_MODE : integer;
  attribute ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute ECC_TYPE : string;
  attribute ECC_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "NONE";
  attribute IGNORE_INIT_SYNTH : integer;
  attribute IGNORE_INIT_SYNTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute MAX_NUM_CHAR : integer;
  attribute MAX_NUM_CHAR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute MEMORY_INIT_FILE : string;
  attribute MEMORY_INIT_FILE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "none";
  attribute MEMORY_INIT_PARAM : string;
  attribute MEMORY_INIT_PARAM of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "";
  attribute MEMORY_OPTIMIZATION : string;
  attribute MEMORY_OPTIMIZATION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "true";
  attribute MEMORY_PRIMITIVE : integer;
  attribute MEMORY_PRIMITIVE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute MEMORY_SIZE : integer;
  attribute MEMORY_SIZE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1376256;
  attribute MEMORY_TYPE : integer;
  attribute MEMORY_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute MESSAGE_CONTROL : integer;
  attribute MESSAGE_CONTROL of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute NUM_CHAR_LOC : integer;
  attribute NUM_CHAR_LOC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_ECC_MODE : string;
  attribute P_ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "no_ecc";
  attribute P_ENABLE_BYTE_WRITE_A : integer;
  attribute P_ENABLE_BYTE_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_ENABLE_BYTE_WRITE_B : integer;
  attribute P_ENABLE_BYTE_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_MAX_DEPTH_DATA : integer;
  attribute P_MAX_DEPTH_DATA of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 16384;
  attribute P_MEMORY_OPT : string;
  attribute P_MEMORY_OPT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "yes";
  attribute P_MEMORY_PRIMITIVE : string;
  attribute P_MEMORY_PRIMITIVE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "auto";
  attribute P_MIN_WIDTH_DATA : integer;
  attribute P_MIN_WIDTH_DATA of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
  attribute P_MIN_WIDTH_DATA_A : integer;
  attribute P_MIN_WIDTH_DATA_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
  attribute P_MIN_WIDTH_DATA_B : integer;
  attribute P_MIN_WIDTH_DATA_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
  attribute P_MIN_WIDTH_DATA_ECC : integer;
  attribute P_MIN_WIDTH_DATA_ECC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
  attribute P_MIN_WIDTH_DATA_LDW : integer;
  attribute P_MIN_WIDTH_DATA_LDW of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 4;
  attribute P_MIN_WIDTH_DATA_SHFT : integer;
  attribute P_MIN_WIDTH_DATA_SHFT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
  attribute P_NUM_COLS_WRITE_A : integer;
  attribute P_NUM_COLS_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_COLS_WRITE_B : integer;
  attribute P_NUM_COLS_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_READ_A : integer;
  attribute P_NUM_ROWS_READ_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_READ_B : integer;
  attribute P_NUM_ROWS_READ_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_WRITE_A : integer;
  attribute P_NUM_ROWS_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_NUM_ROWS_WRITE_B : integer;
  attribute P_NUM_ROWS_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute P_SDP_WRITE_MODE : string;
  attribute P_SDP_WRITE_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "yes";
  attribute P_WIDTH_ADDR_LSB_READ_A : integer;
  attribute P_WIDTH_ADDR_LSB_READ_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_READ_B : integer;
  attribute P_WIDTH_ADDR_LSB_READ_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_A : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_B : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute P_WIDTH_ADDR_READ_A : integer;
  attribute P_WIDTH_ADDR_READ_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 14;
  attribute P_WIDTH_ADDR_READ_B : integer;
  attribute P_WIDTH_ADDR_READ_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 14;
  attribute P_WIDTH_ADDR_WRITE_A : integer;
  attribute P_WIDTH_ADDR_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 14;
  attribute P_WIDTH_ADDR_WRITE_B : integer;
  attribute P_WIDTH_ADDR_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 14;
  attribute P_WIDTH_COL_WRITE_A : integer;
  attribute P_WIDTH_COL_WRITE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
  attribute P_WIDTH_COL_WRITE_B : integer;
  attribute P_WIDTH_COL_WRITE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
  attribute READ_DATA_WIDTH_A : integer;
  attribute READ_DATA_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
  attribute READ_DATA_WIDTH_B : integer;
  attribute READ_DATA_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
  attribute READ_LATENCY_A : integer;
  attribute READ_LATENCY_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 2;
  attribute READ_LATENCY_B : integer;
  attribute READ_LATENCY_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 2;
  attribute READ_RESET_VALUE_A : string;
  attribute READ_RESET_VALUE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "0";
  attribute READ_RESET_VALUE_B : string;
  attribute READ_RESET_VALUE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "SYNC";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute USE_EMBEDDED_CONSTRAINT : integer;
  attribute USE_EMBEDDED_CONSTRAINT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute USE_MEM_INIT : integer;
  attribute USE_MEM_INIT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute USE_MEM_INIT_MMI : integer;
  attribute USE_MEM_INIT_MMI of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 0;
  attribute WRITE_DATA_WIDTH_A : integer;
  attribute WRITE_DATA_WIDTH_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
  attribute WRITE_DATA_WIDTH_B : integer;
  attribute WRITE_DATA_WIDTH_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
  attribute WRITE_MODE_A : integer;
  attribute WRITE_MODE_A of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 2;
  attribute WRITE_MODE_B : integer;
  attribute WRITE_MODE_B of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 2;
  attribute WRITE_PROTECT : integer;
  attribute WRITE_PROTECT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 1;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is "soft";
  attribute rsta_loop_iter : integer;
  attribute rsta_loop_iter of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
  attribute rstb_loop_iter : integer;
  attribute rstb_loop_iter of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base : entity is 84;
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base is
  signal \<const0>\ : STD_LOGIC;
  signal \^doutb\ : STD_LOGIC_VECTOR ( 83 downto 0 );
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][0]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][10]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][11]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][12]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][13]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][14]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][15]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][16]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][17]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][18]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][19]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][1]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][20]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][21]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][22]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][23]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][24]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][25]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][26]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][27]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][28]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][29]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][2]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][30]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][31]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][32]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][33]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][34]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][35]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][3]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][4]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][5]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][6]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][7]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][8]_i_1_n_0\ : STD_LOGIC;
  signal \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][9]_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_mux_sel_b_pos_0_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_136\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_137\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_36\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_37\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_38\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_39\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_40\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_41\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_42\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_43\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_44\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_45\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_46\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_47\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_48\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_49\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_50\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_51\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_136\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_137\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_36\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_37\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_38\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_39\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_40\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_41\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_42\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_43\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_44\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_45\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_46\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_47\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_48\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_49\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_50\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_51\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_136\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_137\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_36\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_37\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_38\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_39\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_40\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_41\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_42\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_43\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_44\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_45\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_46\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_47\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_48\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_49\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_50\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_51\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_136\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_137\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_36\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_37\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_38\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_39\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_40\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_41\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_42\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_43\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_44\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_45\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_46\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_47\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_48\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_49\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_50\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_51\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_136\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_137\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_36\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_37\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_38\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_39\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_40\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_41\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_42\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_43\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_44\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_45\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_46\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_47\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_48\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_49\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_50\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_51\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_136\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_137\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_36\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_37\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_38\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_39\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_40\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_41\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_42\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_43\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_44\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_45\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_46\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_47\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_48\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_49\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_50\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_51\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_100\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_101\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_102\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_103\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_104\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_105\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_106\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_107\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_108\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_109\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_110\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_111\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_112\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_113\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_114\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_115\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_116\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_117\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_118\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_119\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_120\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_121\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_122\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_123\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_124\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_125\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_126\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_127\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_128\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_129\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_130\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_131\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_144\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_145\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_146\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_147\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_136\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_137\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_36\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_37\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_38\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_39\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_40\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_41\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_42\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_43\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_44\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_45\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_46\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_47\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_48\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_49\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_50\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_51\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_136\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_137\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_36\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_37\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_38\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_39\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_40\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_41\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_42\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_43\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_44\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_45\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_46\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_47\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_48\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_49\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_50\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_51\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_136\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_137\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_36\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_37\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_38\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_39\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_40\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_41\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_42\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_43\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_44\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_45\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_46\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_47\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_48\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_49\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_50\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_51\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_136\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_137\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_36\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_37\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_38\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_39\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_40\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_41\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_42\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_43\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_44\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_45\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_46\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_47\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_48\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_49\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_50\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_51\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_136\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_137\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_36\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_37\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_38\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_39\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_40\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_41\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_42\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_43\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_44\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_45\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_46\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_47\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_48\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_49\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_50\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_51\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_136\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_137\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_36\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_37\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_38\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_39\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_40\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_41\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_42\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_43\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_44\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_45\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_46\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_47\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_48\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_49\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_50\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_51\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_100\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_101\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_102\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_103\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_104\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_105\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_106\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_107\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_108\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_109\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_110\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_111\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_112\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_113\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_114\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_115\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_116\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_117\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_118\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_119\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_120\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_121\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_122\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_123\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_124\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_125\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_126\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_127\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_128\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_129\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_130\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_131\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_144\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_145\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_146\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_147\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_136\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_137\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_36\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_37\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_38\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_39\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_40\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_41\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_42\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_43\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_44\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_45\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_46\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_47\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_48\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_49\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_50\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_51\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_1_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_2_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_0\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_1\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_136\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_137\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_138\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_139\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_36\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_37\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_38\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_39\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_40\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_41\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_42\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_43\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_44\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_45\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_46\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_47\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_48\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_49\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_50\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_51\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_52\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_53\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_54\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_55\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_56\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_57\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_58\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_59\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_60\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_61\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_62\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_63\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_64\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_65\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_66\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_67\ : STD_LOGIC;
  signal \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASOUTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASOUTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASOUTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASOUTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 16 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASOUTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASOUTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 8 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASOUTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASOUTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASOUTDBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASOUTSBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTPB_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_SBITERR_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_CASDOUTA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_CASDOUTPA_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTADOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTBDOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTPADOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTPBDOUTP_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_ECCPARITY_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_RDADDRECC_UNCONNECTED\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][0]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][10]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][11]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][12]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][13]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][14]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][15]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][16]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][17]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][18]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][19]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][1]_i_1\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][20]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][21]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][22]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][23]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][24]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][25]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][26]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][27]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][28]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][29]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][2]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][30]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][31]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][32]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][33]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][34]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][35]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][3]_i_1\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][4]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][5]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][6]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][7]_i_1\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][8]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][9]_i_1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_mux_sel_b_pos_0_i_1\ : label is "soft_lutpair65";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ : integer;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ : integer;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is 1023;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ : integer;
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ : integer;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ : integer;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ : integer;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is 1023;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ : integer;
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ : integer;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG : string;
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is 1376256;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_0";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is 1023;
  attribute ram_offset : integer;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_0\ : label is 35;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3\ : label is "soft_lutpair12";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is 1024;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is 2047;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is 1024;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is 2047;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_1";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is 1024;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is 2047;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_1\ : label is 35;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is 10240;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is 11263;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is 10240;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is 11263;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_10";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is 10240;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is 11263;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_10\ : label is 35;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3\ : label is "soft_lutpair11";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is 11264;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is 12287;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is 11264;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is 12287;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_11";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is 11264;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is 12287;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_11\ : label is 35;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_1\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3\ : label is "soft_lutpair11";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is 12288;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is 13311;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is 12288;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is 13311;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_12";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is 12288;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is 13311;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_12\ : label is 35;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3\ : label is "soft_lutpair14";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is 13312;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is 14335;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is 13312;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is 14335;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_13";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is 13312;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is 14335;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_13\ : label is 35;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3\ : label is "soft_lutpair15";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is 14336;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is 15359;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is 14336;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is 15359;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_14";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is 14336;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is 15359;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_14\ : label is 35;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3\ : label is "soft_lutpair15";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is 15360;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is 16383;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is 15360;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is 16383;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_15";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is 15360;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is 16383;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_15\ : label is 35;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3\ : label is "soft_lutpair12";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is 2047;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is "p2_d16";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is 36;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is 53;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is 2047;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is "p2_d16";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is 36;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is 53;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_16";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is 0;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is 2047;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is 36;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_16\ : label is 53;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3\ : label is "soft_lutpair22";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is 2048;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is 4095;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is "p2_d16";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is 36;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is 53;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is 2048;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is 4095;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is "p2_d16";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is 36;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is 53;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_17";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is 2048;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is 4095;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is 36;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_17\ : label is 53;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_2\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_3\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4\ : label is "soft_lutpair20";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is 4096;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is 6143;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is "p2_d16";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is 36;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is 53;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is 4096;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is 6143;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is "p2_d16";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is 36;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is 53;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_18";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is 4096;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is 6143;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is 36;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_18\ : label is 53;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_2\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_3\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4\ : label is "soft_lutpair23";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is 6144;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is 8191;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is "p2_d16";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is 36;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is 53;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is 6144;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is 8191;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is "p2_d16";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is 36;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is 53;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_19";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is 6144;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is 8191;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is 36;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_19\ : label is 53;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_2\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_3\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_2\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4\ : label is "soft_lutpair13";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is 2048;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is 3071;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is 2048;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is 3071;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_2";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is 2048;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is 3071;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_2\ : label is 35;
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is 8192;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is 10239;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is "p2_d16";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is 36;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is 53;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is 8192;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is 10239;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is "p2_d16";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is 36;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is 53;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_20";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is 8192;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is 10239;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is 36;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_20\ : label is 53;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_1\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_2\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_3\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4\ : label is "soft_lutpair21";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is 10240;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is 12287;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is "p2_d16";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is 36;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is 53;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is 10240;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is 12287;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is "p2_d16";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is 36;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is 53;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_21";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is 10240;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is 12287;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is 36;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_21\ : label is 53;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_2\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_3\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4\ : label is "soft_lutpair21";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is 12288;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is 14335;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is "p2_d16";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is 36;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is 53;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is 12288;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is 14335;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is "p2_d16";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is 36;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is 53;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_22";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is 12288;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is 14335;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is 36;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_22\ : label is 53;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_2\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_3\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4\ : label is "soft_lutpair23";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is 14336;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is 16383;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is "p2_d16";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is 36;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is 53;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is 14336;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is 16383;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is "p2_d16";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is 36;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is 53;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_23";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is 14336;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is 16383;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is 36;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_23\ : label is 53;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_2\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_3\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4\ : label is "soft_lutpair22";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is 4095;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is "p1_d8";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is 54;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is 62;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is 4095;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is "p1_d8";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is 54;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is 62;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_24";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is 0;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is 4095;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is 54;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_24\ : label is 62;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_2\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3\ : label is "soft_lutpair52";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is 4096;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is 8191;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is "p1_d8";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is 54;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is 62;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is 4096;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is 8191;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is "p1_d8";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is 54;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is 62;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_25";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is 4096;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is 8191;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is 54;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_25\ : label is 62;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_2\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_3\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4\ : label is "soft_lutpair53";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is 8192;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is 12287;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is "p1_d8";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is 54;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is 62;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is 8192;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is 12287;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is "p1_d8";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is 54;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is 62;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_26";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is 8192;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is 12287;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is 54;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_26\ : label is 62;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_2\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_3\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4\ : label is "soft_lutpair53";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is 12288;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is 16383;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is "p1_d8";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is 54;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is 62;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is 12288;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is 16383;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is "p1_d8";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is 54;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is 62;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_27";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is 12288;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is 16383;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is 54;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_27\ : label is 62;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_2\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_3\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4\ : label is "soft_lutpair52";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is 0;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is 16383;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is "p0_d2";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is 63;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is 64;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is 0;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is 16383;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is "p0_d2";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is 63;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is 64;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_28";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is 0;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is 16383;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is 63;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_28\ : label is 64;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_2\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4\ : label is "soft_lutpair13";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is 3072;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is 4095;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is 3072;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is 4095;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_3";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is 3072;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is 4095;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_3\ : label is 35;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4\ : label is "soft_lutpair8";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is 4096;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is 5119;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is 4096;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is 5119;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_4";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is 4096;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is 5119;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_4\ : label is 35;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4\ : label is "soft_lutpair8";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is 5120;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is 6143;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is 5120;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is 6143;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_5";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is 5120;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is 6143;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_5\ : label is 35;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_2\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4\ : label is "soft_lutpair9";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is 6144;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is 7167;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is 6144;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is 7167;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_6";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is 6144;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is 7167;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_6\ : label is 35;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_2\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4\ : label is "soft_lutpair9";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is 7168;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is 8191;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is 7168;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is 8191;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_7";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is 7168;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is 8191;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_7\ : label is 35;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4\ : label is "soft_lutpair10";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is 8192;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is 9215;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is 8192;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is 9215;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_8";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is 8192;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is 9215;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_8\ : label is 35;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3\ : label is "soft_lutpair14";
  attribute \MEM.PORTA.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is 9216;
  attribute \MEM.PORTA.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is 10239;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is "p4_d32";
  attribute \MEM.PORTA.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is 0;
  attribute \MEM.PORTA.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is 35;
  attribute \MEM.PORTB.ADDRESS_BEGIN\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is 9216;
  attribute \MEM.PORTB.ADDRESS_END\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is 10239;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is "p4_d32";
  attribute \MEM.PORTB.DATA_LSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is 0;
  attribute \MEM.PORTB.DATA_MSB\ of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is 35;
  attribute METHODOLOGY_DRC_VIOS of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is "";
  attribute RDADDR_COLLISION_HWCONFIG of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is "DELAYED_WRITE";
  attribute RTL_RAM_BITS of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is 1376256;
  attribute RTL_RAM_NAME of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_9";
  attribute RTL_RAM_TYPE of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is "RAM_SDP";
  attribute ram_addr_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is 9216;
  attribute ram_addr_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is 10239;
  attribute ram_offset of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is 0;
  attribute ram_slice_begin of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is 0;
  attribute ram_slice_end of \gen_wr_a.gen_word_narrow.mem_reg_bram_9\ : label is 35;
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3\ : label is "soft_lutpair10";
begin
  dbiterra <= \<const0>\;
  dbiterrb <= \<const0>\;
  douta(83) <= \<const0>\;
  douta(82) <= \<const0>\;
  douta(81) <= \<const0>\;
  douta(80) <= \<const0>\;
  douta(79) <= \<const0>\;
  douta(78) <= \<const0>\;
  douta(77) <= \<const0>\;
  douta(76) <= \<const0>\;
  douta(75) <= \<const0>\;
  douta(74) <= \<const0>\;
  douta(73) <= \<const0>\;
  douta(72) <= \<const0>\;
  douta(71) <= \<const0>\;
  douta(70) <= \<const0>\;
  douta(69) <= \<const0>\;
  douta(68) <= \<const0>\;
  douta(67) <= \<const0>\;
  douta(66) <= \<const0>\;
  douta(65) <= \<const0>\;
  douta(64) <= \<const0>\;
  douta(63) <= \<const0>\;
  douta(62) <= \<const0>\;
  douta(61) <= \<const0>\;
  douta(60) <= \<const0>\;
  douta(59) <= \<const0>\;
  douta(58) <= \<const0>\;
  douta(57) <= \<const0>\;
  douta(56) <= \<const0>\;
  douta(55) <= \<const0>\;
  douta(54) <= \<const0>\;
  douta(53) <= \<const0>\;
  douta(52) <= \<const0>\;
  douta(51) <= \<const0>\;
  douta(50) <= \<const0>\;
  douta(49) <= \<const0>\;
  douta(48) <= \<const0>\;
  douta(47) <= \<const0>\;
  douta(46) <= \<const0>\;
  douta(45) <= \<const0>\;
  douta(44) <= \<const0>\;
  douta(43) <= \<const0>\;
  douta(42) <= \<const0>\;
  douta(41) <= \<const0>\;
  douta(40) <= \<const0>\;
  douta(39) <= \<const0>\;
  douta(38) <= \<const0>\;
  douta(37) <= \<const0>\;
  douta(36) <= \<const0>\;
  douta(35) <= \<const0>\;
  douta(34) <= \<const0>\;
  douta(33) <= \<const0>\;
  douta(32) <= \<const0>\;
  douta(31) <= \<const0>\;
  douta(30) <= \<const0>\;
  douta(29) <= \<const0>\;
  douta(28) <= \<const0>\;
  douta(27) <= \<const0>\;
  douta(26) <= \<const0>\;
  douta(25) <= \<const0>\;
  douta(24) <= \<const0>\;
  douta(23) <= \<const0>\;
  douta(22) <= \<const0>\;
  douta(21) <= \<const0>\;
  douta(20) <= \<const0>\;
  douta(19) <= \<const0>\;
  douta(18) <= \<const0>\;
  douta(17) <= \<const0>\;
  douta(16) <= \<const0>\;
  douta(15) <= \<const0>\;
  douta(14) <= \<const0>\;
  douta(13) <= \<const0>\;
  douta(12) <= \<const0>\;
  douta(11) <= \<const0>\;
  douta(10) <= \<const0>\;
  douta(9) <= \<const0>\;
  douta(8) <= \<const0>\;
  douta(7) <= \<const0>\;
  douta(6) <= \<const0>\;
  douta(5) <= \<const0>\;
  douta(4) <= \<const0>\;
  douta(3) <= \<const0>\;
  douta(2) <= \<const0>\;
  douta(1) <= \<const0>\;
  douta(0) <= \<const0>\;
  doutb(83) <= \^doutb\(83);
  doutb(82) <= \<const0>\;
  doutb(81) <= \<const0>\;
  doutb(80) <= \<const0>\;
  doutb(79) <= \<const0>\;
  doutb(78) <= \<const0>\;
  doutb(77) <= \<const0>\;
  doutb(76) <= \<const0>\;
  doutb(75) <= \<const0>\;
  doutb(74) <= \<const0>\;
  doutb(73) <= \<const0>\;
  doutb(72) <= \<const0>\;
  doutb(71) <= \<const0>\;
  doutb(70) <= \<const0>\;
  doutb(69) <= \<const0>\;
  doutb(68) <= \<const0>\;
  doutb(67) <= \<const0>\;
  doutb(66) <= \<const0>\;
  doutb(65) <= \<const0>\;
  doutb(64) <= \<const0>\;
  doutb(63 downto 0) <= \^doutb\(63 downto 0);
  sbiterra <= \<const0>\;
  sbiterrb <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_131\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_131\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][0]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_121\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_121\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][10]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_120\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_120\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][11]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_119\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_119\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][12]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_118\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_118\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][13]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_117\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_117\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][14]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_116\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_116\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][15]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_115\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_115\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][16]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_114\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_114\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][17]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_113\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_113\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][18]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_112\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_112\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][19]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_130\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_130\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][1]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_111\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_111\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][20]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_110\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_110\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][21]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_109\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_109\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][22]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_108\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_108\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][23]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_107\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_107\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][24]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_106\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_106\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][25]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_105\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_105\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][26]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_104\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_104\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][27]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_103\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_103\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][28]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_102\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_102\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][29]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_129\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_129\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][2]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_101\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_101\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][30]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][31]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_100\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_100\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][31]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][32]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_147\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_147\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][32]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][33]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_146\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_146\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][33]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][34]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_145\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_145\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][34]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][35]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_144\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_144\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][35]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_128\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_128\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][3]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_127\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_127\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][4]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_126\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_126\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][5]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_125\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_125\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][6]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_124\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_124\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][7]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_123\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_123\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][8]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_122\,
      I1 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_122\,
      O => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][9]_i_1_n_0\
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][0]_i_1_n_0\,
      Q => \^doutb\(0),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][10]_i_1_n_0\,
      Q => \^doutb\(10),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][11]_i_1_n_0\,
      Q => \^doutb\(11),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][12]_i_1_n_0\,
      Q => \^doutb\(12),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][13]_i_1_n_0\,
      Q => \^doutb\(13),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][14]_i_1_n_0\,
      Q => \^doutb\(14),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][15]_i_1_n_0\,
      Q => \^doutb\(15),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][16]_i_1_n_0\,
      Q => \^doutb\(16),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][17]_i_1_n_0\,
      Q => \^doutb\(17),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][18]_i_1_n_0\,
      Q => \^doutb\(18),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][19]_i_1_n_0\,
      Q => \^doutb\(19),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][1]_i_1_n_0\,
      Q => \^doutb\(1),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][20]_i_1_n_0\,
      Q => \^doutb\(20),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][21]_i_1_n_0\,
      Q => \^doutb\(21),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][22]_i_1_n_0\,
      Q => \^doutb\(22),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][23]_i_1_n_0\,
      Q => \^doutb\(23),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][24]_i_1_n_0\,
      Q => \^doutb\(24),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][25]_i_1_n_0\,
      Q => \^doutb\(25),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][26]_i_1_n_0\,
      Q => \^doutb\(26),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][27]_i_1_n_0\,
      Q => \^doutb\(27),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][28]_i_1_n_0\,
      Q => \^doutb\(28),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][29]_i_1_n_0\,
      Q => \^doutb\(29),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][2]_i_1_n_0\,
      Q => \^doutb\(2),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][30]_i_1_n_0\,
      Q => \^doutb\(30),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][31]_i_1_n_0\,
      Q => \^doutb\(31),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][32]_i_1_n_0\,
      Q => \^doutb\(32),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][33]_i_1_n_0\,
      Q => \^doutb\(33),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][34]_i_1_n_0\,
      Q => \^doutb\(34),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][35]_i_1_n_0\,
      Q => \^doutb\(35),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][3]_i_1_n_0\,
      Q => \^doutb\(3),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][4]_i_1_n_0\,
      Q => \^doutb\(4),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][5]_i_1_n_0\,
      Q => \^doutb\(5),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][6]_i_1_n_0\,
      Q => \^doutb\(6),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][7]_i_1_n_0\,
      Q => \^doutb\(7),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][8]_i_1_n_0\,
      Q => \^doutb\(8),
      R => rstb
    );
\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clka,
      CE => regceb,
      D => \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][9]_i_1_n_0\,
      Q => \^doutb\(9),
      R => rstb
    );
\gen_wr_a.gen_word_narrow.mem_mux_sel_b_pos_0_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addrb(13),
      I1 => enb,
      I2 => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      O => \gen_wr_a.gen_word_narrow.mem_mux_sel_b_pos_0_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_0\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "FIRST",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_36\,
      CASDOUTB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_37\,
      CASDOUTB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_38\,
      CASDOUTB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_39\,
      CASDOUTB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_40\,
      CASDOUTB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_41\,
      CASDOUTB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_42\,
      CASDOUTB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_43\,
      CASDOUTB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_44\,
      CASDOUTB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_45\,
      CASDOUTB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_46\,
      CASDOUTB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_47\,
      CASDOUTB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_48\,
      CASDOUTB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_49\,
      CASDOUTB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_50\,
      CASDOUTB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_51\,
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_136\,
      CASDOUTPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_137\,
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_139\,
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_1_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_2_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => addra(13),
      I1 => addra(12),
      I2 => addra(11),
      I3 => addra(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => enb,
      I1 => addrb(12),
      I2 => addrb(13),
      I3 => addrb(10),
      I4 => addrb(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => wea(0),
      I1 => addra(10),
      I2 => addra(11),
      I3 => addra(12),
      I4 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_1\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_36\,
      CASDINB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_37\,
      CASDINB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_38\,
      CASDINB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_39\,
      CASDINB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_40\,
      CASDINB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_41\,
      CASDINB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_42\,
      CASDINB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_43\,
      CASDINB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_44\,
      CASDINB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_45\,
      CASDINB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_46\,
      CASDINB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_47\,
      CASDINB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_48\,
      CASDINB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_49\,
      CASDINB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_50\,
      CASDINB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_51\,
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_136\,
      CASDINPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_137\,
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_36\,
      CASDOUTB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_37\,
      CASDOUTB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_38\,
      CASDOUTB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_39\,
      CASDOUTB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_40\,
      CASDOUTB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_41\,
      CASDOUTB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_42\,
      CASDOUTB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_43\,
      CASDOUTB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_44\,
      CASDOUTB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_45\,
      CASDOUTB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_46\,
      CASDOUTB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_47\,
      CASDOUTB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_48\,
      CASDOUTB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_49\,
      CASDOUTB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_50\,
      CASDOUTB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_51\,
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_136\,
      CASDOUTPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_137\,
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_10\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_36\,
      CASDINB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_37\,
      CASDINB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_38\,
      CASDINB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_39\,
      CASDINB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_40\,
      CASDINB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_41\,
      CASDINB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_42\,
      CASDINB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_43\,
      CASDINB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_44\,
      CASDINB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_45\,
      CASDINB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_46\,
      CASDINB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_47\,
      CASDINB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_48\,
      CASDINB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_49\,
      CASDINB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_50\,
      CASDINB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_51\,
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_136\,
      CASDINPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_137\,
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_36\,
      CASDOUTB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_37\,
      CASDOUTB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_38\,
      CASDOUTB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_39\,
      CASDOUTB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_40\,
      CASDOUTB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_41\,
      CASDOUTB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_42\,
      CASDOUTB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_43\,
      CASDOUTB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_44\,
      CASDOUTB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_45\,
      CASDOUTB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_46\,
      CASDOUTB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_47\,
      CASDOUTB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_48\,
      CASDOUTB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_49\,
      CASDOUTB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_50\,
      CASDOUTB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_51\,
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_136\,
      CASDOUTPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_137\,
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_1_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_2_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => addra(12),
      I1 => addra(10),
      I2 => addra(13),
      I3 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => enb,
      I1 => addrb(11),
      I2 => addrb(13),
      I3 => addrb(12),
      I4 => addrb(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => wea(0),
      I1 => addra(11),
      I2 => addra(13),
      I3 => addra(10),
      I4 => addra(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_11\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_36\,
      CASDINB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_37\,
      CASDINB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_38\,
      CASDINB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_39\,
      CASDINB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_40\,
      CASDINB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_41\,
      CASDINB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_42\,
      CASDINB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_43\,
      CASDINB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_44\,
      CASDINB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_45\,
      CASDINB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_46\,
      CASDINB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_47\,
      CASDINB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_48\,
      CASDINB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_49\,
      CASDINB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_50\,
      CASDINB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_51\,
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_136\,
      CASDINPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_137\,
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_36\,
      CASDOUTB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_37\,
      CASDOUTB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_38\,
      CASDOUTB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_39\,
      CASDOUTB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_40\,
      CASDOUTB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_41\,
      CASDOUTB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_42\,
      CASDOUTB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_43\,
      CASDOUTB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_44\,
      CASDOUTB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_45\,
      CASDOUTB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_46\,
      CASDOUTB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_47\,
      CASDOUTB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_48\,
      CASDOUTB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_49\,
      CASDOUTB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_50\,
      CASDOUTB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_51\,
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_136\,
      CASDOUTPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_137\,
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_1_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_2_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => addra(10),
      I1 => addra(12),
      I2 => addra(13),
      I3 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => enb,
      I1 => addrb(11),
      I2 => addrb(13),
      I3 => addrb(12),
      I4 => addrb(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => wea(0),
      I1 => addra(11),
      I2 => addra(13),
      I3 => addra(12),
      I4 => addra(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_12\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_36\,
      CASDINB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_37\,
      CASDINB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_38\,
      CASDINB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_39\,
      CASDINB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_40\,
      CASDINB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_41\,
      CASDINB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_42\,
      CASDINB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_43\,
      CASDINB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_44\,
      CASDINB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_45\,
      CASDINB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_46\,
      CASDINB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_47\,
      CASDINB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_48\,
      CASDINB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_49\,
      CASDINB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_50\,
      CASDINB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_51\,
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_136\,
      CASDINPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_137\,
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_36\,
      CASDOUTB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_37\,
      CASDOUTB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_38\,
      CASDOUTB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_39\,
      CASDOUTB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_40\,
      CASDOUTB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_41\,
      CASDOUTB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_42\,
      CASDOUTB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_43\,
      CASDOUTB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_44\,
      CASDOUTB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_45\,
      CASDOUTB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_46\,
      CASDOUTB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_47\,
      CASDOUTB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_48\,
      CASDOUTB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_49\,
      CASDOUTB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_50\,
      CASDOUTB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_51\,
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_136\,
      CASDOUTPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_137\,
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_1_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_2_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => addra(13),
      I1 => addra(12),
      I2 => addra(11),
      I3 => addra(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => enb,
      I1 => addrb(11),
      I2 => addrb(10),
      I3 => addrb(12),
      I4 => addrb(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => wea(0),
      I1 => addra(10),
      I2 => addra(11),
      I3 => addra(12),
      I4 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_13\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_36\,
      CASDINB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_37\,
      CASDINB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_38\,
      CASDINB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_39\,
      CASDINB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_40\,
      CASDINB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_41\,
      CASDINB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_42\,
      CASDINB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_43\,
      CASDINB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_44\,
      CASDINB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_45\,
      CASDINB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_46\,
      CASDINB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_47\,
      CASDINB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_48\,
      CASDINB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_49\,
      CASDINB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_50\,
      CASDINB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_51\,
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_136\,
      CASDINPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_137\,
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_36\,
      CASDOUTB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_37\,
      CASDOUTB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_38\,
      CASDOUTB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_39\,
      CASDOUTB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_40\,
      CASDOUTB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_41\,
      CASDOUTB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_42\,
      CASDOUTB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_43\,
      CASDOUTB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_44\,
      CASDOUTB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_45\,
      CASDOUTB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_46\,
      CASDOUTB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_47\,
      CASDOUTB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_48\,
      CASDOUTB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_49\,
      CASDOUTB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_50\,
      CASDOUTB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_51\,
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_136\,
      CASDOUTPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_137\,
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_1_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_2_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => addra(13),
      I1 => addra(12),
      I2 => addra(10),
      I3 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => enb,
      I1 => addrb(11),
      I2 => addrb(10),
      I3 => addrb(12),
      I4 => addrb(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => wea(0),
      I1 => addra(11),
      I2 => addra(10),
      I3 => addra(12),
      I4 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_14\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_36\,
      CASDINB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_37\,
      CASDINB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_38\,
      CASDINB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_39\,
      CASDINB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_40\,
      CASDINB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_41\,
      CASDINB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_42\,
      CASDINB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_43\,
      CASDINB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_44\,
      CASDINB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_45\,
      CASDINB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_46\,
      CASDINB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_47\,
      CASDINB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_48\,
      CASDINB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_49\,
      CASDINB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_50\,
      CASDINB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_51\,
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_136\,
      CASDINPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_137\,
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_36\,
      CASDOUTB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_37\,
      CASDOUTB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_38\,
      CASDOUTB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_39\,
      CASDOUTB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_40\,
      CASDOUTB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_41\,
      CASDOUTB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_42\,
      CASDOUTB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_43\,
      CASDOUTB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_44\,
      CASDOUTB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_45\,
      CASDOUTB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_46\,
      CASDOUTB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_47\,
      CASDOUTB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_48\,
      CASDOUTB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_49\,
      CASDOUTB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_50\,
      CASDOUTB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_51\,
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_136\,
      CASDOUTPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_137\,
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_1_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_2_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => addra(13),
      I1 => addra(12),
      I2 => addra(11),
      I3 => addra(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => enb,
      I1 => addrb(10),
      I2 => addrb(11),
      I3 => addrb(12),
      I4 => addrb(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => wea(0),
      I1 => addra(10),
      I2 => addra(11),
      I3 => addra(12),
      I4 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_15\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "LAST",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_36\,
      CASDINB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_37\,
      CASDINB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_38\,
      CASDINB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_39\,
      CASDINB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_40\,
      CASDINB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_41\,
      CASDINB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_42\,
      CASDINB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_43\,
      CASDINB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_44\,
      CASDINB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_45\,
      CASDINB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_46\,
      CASDINB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_47\,
      CASDINB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_48\,
      CASDINB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_49\,
      CASDINB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_50\,
      CASDINB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_51\,
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_136\,
      CASDINPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_137\,
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTB_UNCONNECTED\(31 downto 0),
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTPB_UNCONNECTED\(3 downto 0),
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASOUTDBITERR_UNCONNECTED\,
      CASOUTSBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASOUTSBITERR_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_100\,
      DOUTBDOUT(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_101\,
      DOUTBDOUT(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_102\,
      DOUTBDOUT(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_103\,
      DOUTBDOUT(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_104\,
      DOUTBDOUT(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_105\,
      DOUTBDOUT(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_106\,
      DOUTBDOUT(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_107\,
      DOUTBDOUT(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_108\,
      DOUTBDOUT(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_109\,
      DOUTBDOUT(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_110\,
      DOUTBDOUT(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_111\,
      DOUTBDOUT(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_112\,
      DOUTBDOUT(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_113\,
      DOUTBDOUT(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_114\,
      DOUTBDOUT(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_115\,
      DOUTBDOUT(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_116\,
      DOUTBDOUT(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_117\,
      DOUTBDOUT(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_118\,
      DOUTBDOUT(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_119\,
      DOUTBDOUT(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_120\,
      DOUTBDOUT(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_121\,
      DOUTBDOUT(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_122\,
      DOUTBDOUT(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_123\,
      DOUTBDOUT(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_124\,
      DOUTBDOUT(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_125\,
      DOUTBDOUT(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_126\,
      DOUTBDOUT(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_127\,
      DOUTBDOUT(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_128\,
      DOUTBDOUT(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_129\,
      DOUTBDOUT(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_130\,
      DOUTBDOUT(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_131\,
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_144\,
      DOUTPBDOUTP(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_145\,
      DOUTPBDOUTP(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_146\,
      DOUTPBDOUTP(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_147\,
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_1_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_2_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => addra(13),
      I1 => addra(12),
      I2 => addra(11),
      I3 => addra(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => enb,
      I1 => addrb(10),
      I2 => addrb(11),
      I3 => addrb(12),
      I4 => addrb(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => wea(0),
      I1 => addra(10),
      I2 => addra(11),
      I3 => addra(12),
      I4 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_16\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "FIRST",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(14 downto 4) => addra(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 4) => addrb(10 downto 0),
      ADDRBWRADDR(3 downto 0) => B"0000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 16) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTB_UNCONNECTED\(31 downto 16),
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 2) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTPB_UNCONNECTED\(3 downto 2),
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_139\,
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => dina(51 downto 36),
      DINBDIN(31 downto 0) => B"00000000000000001111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => dina(53 downto 52),
      DINPBDINP(3 downto 0) => B"0011",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_1_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_2_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => addra(13),
      I1 => addra(12),
      I2 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => enb,
      I1 => addrb(11),
      I2 => addrb(12),
      I3 => addrb(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => wea(0),
      I1 => addra(11),
      I2 => addra(12),
      I3 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_17\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(14 downto 4) => addra(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 4) => addrb(10 downto 0),
      ADDRBWRADDR(3 downto 0) => B"0000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 16) => B"0000000000000000",
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 2) => B"00",
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 16) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTB_UNCONNECTED\(31 downto 16),
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 2) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTPB_UNCONNECTED\(3 downto 2),
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => dina(51 downto 36),
      DINBDIN(31 downto 0) => B"00000000000000001111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => dina(53 downto 52),
      DINPBDINP(3 downto 0) => B"0011",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => addrb(12),
      I1 => addrb(13),
      I2 => addrb(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => addra(11),
      I1 => addra(13),
      I2 => addra(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => enb,
      I1 => addrb(12),
      I2 => addrb(13),
      I3 => addrb(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => wea(0),
      I1 => addra(12),
      I2 => addra(13),
      I3 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_18\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(14 downto 4) => addra(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 4) => addrb(10 downto 0),
      ADDRBWRADDR(3 downto 0) => B"0000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 16) => B"0000000000000000",
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 2) => B"00",
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 16) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTB_UNCONNECTED\(31 downto 16),
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 2) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTPB_UNCONNECTED\(3 downto 2),
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => dina(51 downto 36),
      DINBDIN(31 downto 0) => B"00000000000000001111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => dina(53 downto 52),
      DINPBDINP(3 downto 0) => B"0011",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => addrb(11),
      I1 => addrb(13),
      I2 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => addra(12),
      I1 => addra(13),
      I2 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => enb,
      I1 => addrb(11),
      I2 => addrb(13),
      I3 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => wea(0),
      I1 => addra(11),
      I2 => addra(13),
      I3 => addra(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_19\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(14 downto 4) => addra(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 4) => addrb(10 downto 0),
      ADDRBWRADDR(3 downto 0) => B"0000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 16) => B"0000000000000000",
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 2) => B"00",
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 16) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTB_UNCONNECTED\(31 downto 16),
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 2) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTPB_UNCONNECTED\(3 downto 2),
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => dina(51 downto 36),
      DINBDIN(31 downto 0) => B"00000000000000001111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => dina(53 downto 52),
      DINPBDINP(3 downto 0) => B"0011",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => addrb(13),
      I1 => addrb(11),
      I2 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => addra(13),
      I1 => addra(12),
      I2 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => enb,
      I1 => addrb(13),
      I2 => addrb(11),
      I3 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => wea(0),
      I1 => addra(11),
      I2 => addra(12),
      I3 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => addrb(10),
      I1 => addrb(12),
      I2 => addrb(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => addra(13),
      I1 => addra(12),
      I2 => addra(10),
      I3 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => enb,
      I1 => addrb(11),
      I2 => addrb(10),
      I3 => addrb(12),
      I4 => addrb(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => wea(0),
      I1 => addra(11),
      I2 => addra(10),
      I3 => addra(12),
      I4 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_2\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_36\,
      CASDINB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_37\,
      CASDINB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_38\,
      CASDINB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_39\,
      CASDINB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_40\,
      CASDINB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_41\,
      CASDINB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_42\,
      CASDINB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_43\,
      CASDINB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_44\,
      CASDINB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_45\,
      CASDINB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_46\,
      CASDINB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_47\,
      CASDINB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_48\,
      CASDINB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_49\,
      CASDINB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_50\,
      CASDINB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_51\,
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_136\,
      CASDINPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_137\,
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_36\,
      CASDOUTB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_37\,
      CASDOUTB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_38\,
      CASDOUTB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_39\,
      CASDOUTB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_40\,
      CASDOUTB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_41\,
      CASDOUTB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_42\,
      CASDOUTB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_43\,
      CASDOUTB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_44\,
      CASDOUTB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_45\,
      CASDOUTB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_46\,
      CASDOUTB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_47\,
      CASDOUTB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_48\,
      CASDOUTB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_49\,
      CASDOUTB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_50\,
      CASDOUTB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_51\,
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_136\,
      CASDOUTPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_137\,
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_20\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(14 downto 4) => addra(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 4) => addrb(10 downto 0),
      ADDRBWRADDR(3 downto 0) => B"0000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 16) => B"0000000000000000",
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 2) => B"00",
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 16) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTB_UNCONNECTED\(31 downto 16),
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 2) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTPB_UNCONNECTED\(3 downto 2),
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => dina(51 downto 36),
      DINBDIN(31 downto 0) => B"00000000000000001111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => dina(53 downto 52),
      DINPBDINP(3 downto 0) => B"0011",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => addrb(11),
      I1 => addrb(12),
      I2 => addrb(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => addra(13),
      I1 => addra(12),
      I2 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => enb,
      I1 => addrb(11),
      I2 => addrb(12),
      I3 => addrb(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => wea(0),
      I1 => addra(11),
      I2 => addra(12),
      I3 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_21\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(14 downto 4) => addra(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 4) => addrb(10 downto 0),
      ADDRBWRADDR(3 downto 0) => B"0000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 16) => B"0000000000000000",
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 2) => B"00",
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 16) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTB_UNCONNECTED\(31 downto 16),
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 2) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTPB_UNCONNECTED\(3 downto 2),
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => dina(51 downto 36),
      DINBDIN(31 downto 0) => B"00000000000000001111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => dina(53 downto 52),
      DINPBDINP(3 downto 0) => B"0011",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => addrb(11),
      I1 => addrb(13),
      I2 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => addra(12),
      I1 => addra(13),
      I2 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => enb,
      I1 => addrb(11),
      I2 => addrb(13),
      I3 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0080"
    )
        port map (
      I0 => wea(0),
      I1 => addra(11),
      I2 => addra(13),
      I3 => addra(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_22\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(14 downto 4) => addra(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 4) => addrb(10 downto 0),
      ADDRBWRADDR(3 downto 0) => B"0000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 16) => B"0000000000000000",
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 2) => B"00",
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 16) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTB_UNCONNECTED\(31 downto 16),
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 2) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTPB_UNCONNECTED\(3 downto 2),
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => dina(51 downto 36),
      DINBDIN(31 downto 0) => B"00000000000000001111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => dina(53 downto 52),
      DINPBDINP(3 downto 0) => B"0011",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => addrb(11),
      I1 => addrb(12),
      I2 => addrb(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => addra(13),
      I1 => addra(12),
      I2 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => enb,
      I1 => addrb(11),
      I2 => addrb(12),
      I3 => addrb(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => wea(0),
      I1 => addra(11),
      I2 => addra(12),
      I3 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_23\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "LAST",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(14 downto 4) => addra(10 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(14 downto 4) => addrb(10 downto 0),
      ADDRBWRADDR(3 downto 0) => B"0000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 16) => B"0000000000000000",
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 2) => B"00",
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '0',
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTB_UNCONNECTED\(31 downto 0),
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTPB_UNCONNECTED\(3 downto 0),
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_1_n_0\,
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => enb,
      CASOUTDBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASOUTDBITERR_UNCONNECTED\,
      CASOUTSBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASOUTSBITERR_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 16) => B"0000000000000000",
      DINADIN(15 downto 0) => dina(51 downto 36),
      DINBDIN(31 downto 0) => B"00000000000000001111111111111111",
      DINPADINP(3 downto 2) => B"00",
      DINPADINP(1 downto 0) => dina(53 downto 52),
      DINPBDINP(3 downto 0) => B"0011",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 16) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTBDOUT_UNCONNECTED\(31 downto 16),
      DOUTBDOUT(15 downto 0) => \^doutb\(51 downto 36),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 2) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTPBDOUTP_UNCONNECTED\(3 downto 2),
      DOUTPBDOUTP(1 downto 0) => \^doutb\(53 downto 52),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => regceb,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => rstb,
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => addrb(12),
      I1 => addrb(13),
      I2 => addrb(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => addra(11),
      I1 => addra(13),
      I2 => addra(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => enb,
      I1 => addrb(12),
      I2 => addrb(13),
      I3 => addrb(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => wea(0),
      I1 => addra(12),
      I2 => addra(13),
      I3 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_24\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "FIRST",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(14 downto 3) => addrb(11 downto 0),
      ADDRBWRADDR(2 downto 0) => B"000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 8) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTB_UNCONNECTED\(31 downto 8),
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 1) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTPB_UNCONNECTED\(3 downto 1),
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_139\,
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 8) => B"000000000000000000000000",
      DINADIN(7 downto 0) => dina(61 downto 54),
      DINBDIN(31 downto 0) => B"00000000000000000000000011111111",
      DINPADINP(3 downto 1) => B"000",
      DINPADINP(0) => dina(62),
      DINPBDINP(3 downto 0) => B"0001",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_1_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_2_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => addra(12),
      I1 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => enb,
      I1 => addrb(13),
      I2 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => wea(0),
      I1 => addra(13),
      I2 => addra(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_25\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(14 downto 3) => addrb(11 downto 0),
      ADDRBWRADDR(2 downto 0) => B"000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 8) => B"000000000000000000000000",
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 1) => B"000",
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 8) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTB_UNCONNECTED\(31 downto 8),
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 1) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTPB_UNCONNECTED\(3 downto 1),
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 8) => B"000000000000000000000000",
      DINADIN(7 downto 0) => dina(61 downto 54),
      DINBDIN(31 downto 0) => B"00000000000000000000000011111111",
      DINPADINP(3 downto 1) => B"000",
      DINPADINP(0) => dina(62),
      DINPBDINP(3 downto 0) => B"0001",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => addrb(13),
      I1 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addra(12),
      I1 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => enb,
      I1 => addrb(13),
      I2 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => wea(0),
      I1 => addra(13),
      I2 => addra(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_26\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(14 downto 3) => addrb(11 downto 0),
      ADDRBWRADDR(2 downto 0) => B"000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 8) => B"000000000000000000000000",
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 1) => B"000",
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 8) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTB_UNCONNECTED\(31 downto 8),
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 1) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTPB_UNCONNECTED\(3 downto 1),
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 8) => B"000000000000000000000000",
      DINADIN(7 downto 0) => dina(61 downto 54),
      DINBDIN(31 downto 0) => B"00000000000000000000000011111111",
      DINPADINP(3 downto 1) => B"000",
      DINPADINP(0) => dina(62),
      DINPBDINP(3 downto 0) => B"0001",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => addrb(12),
      I1 => addrb(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => addra(13),
      I1 => addra(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => enb,
      I1 => addrb(12),
      I2 => addrb(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => wea(0),
      I1 => addra(12),
      I2 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_27\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "LAST",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 9,
      READ_WIDTH_B => 9,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 9,
      WRITE_WIDTH_B => 9
    )
        port map (
      ADDRARDADDR(14 downto 3) => addra(11 downto 0),
      ADDRARDADDR(2 downto 0) => B"000",
      ADDRBWRADDR(14 downto 3) => addrb(11 downto 0),
      ADDRBWRADDR(2 downto 0) => B"000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 8) => B"000000000000000000000000",
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 1) => B"000",
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '0',
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTB_UNCONNECTED\(31 downto 0),
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTPB_UNCONNECTED\(3 downto 0),
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_1_n_0\,
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => enb,
      CASOUTDBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASOUTDBITERR_UNCONNECTED\,
      CASOUTSBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASOUTSBITERR_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 8) => B"000000000000000000000000",
      DINADIN(7 downto 0) => dina(61 downto 54),
      DINBDIN(31 downto 0) => B"00000000000000000000000011111111",
      DINPADINP(3 downto 1) => B"000",
      DINPADINP(0) => dina(62),
      DINPBDINP(3 downto 0) => B"0001",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 8) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTBDOUT_UNCONNECTED\(31 downto 8),
      DOUTBDOUT(7 downto 0) => \^doutb\(61 downto 54),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 1) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTPBDOUTP_UNCONNECTED\(3 downto 1),
      DOUTPBDOUTP(0) => \^doutb\(62),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => regceb,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => rstb,
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => addrb(13),
      I1 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => addra(12),
      I1 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => enb,
      I1 => addrb(13),
      I2 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => wea(0),
      I1 => addra(13),
      I2 => addra(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_28\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "NONE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 1,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 2,
      READ_WIDTH_B => 2,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 2,
      WRITE_WIDTH_B => 2
    )
        port map (
      ADDRARDADDR(14 downto 1) => addra(13 downto 0),
      ADDRARDADDR(0) => '0',
      ADDRBWRADDR(14 downto 1) => addrb(13 downto 0),
      ADDRBWRADDR(0) => '0',
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTB_UNCONNECTED\(31 downto 0),
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTPB_UNCONNECTED\(3 downto 0),
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASOUTDBITERR_UNCONNECTED\,
      CASOUTSBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASOUTSBITERR_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 2) => B"000000000000000000000000000000",
      DINADIN(1) => dina(83),
      DINADIN(0) => dina(63),
      DINBDIN(31 downto 0) => B"00000000000000000000000000000011",
      DINPADINP(3 downto 0) => B"0000",
      DINPBDINP(3 downto 0) => B"0000",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 2) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTBDOUT_UNCONNECTED\(31 downto 2),
      DOUTBDOUT(1) => \^doutb\(83),
      DOUTBDOUT(0) => \^doutb\(63),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => '1',
      ENBWREN => enb,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => regceb,
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => rstb,
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => wea(0),
      WEA(2) => wea(0),
      WEA(1) => wea(0),
      WEA(0) => wea(0),
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => addrb(11),
      I1 => addrb(12),
      I2 => addrb(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => addra(13),
      I1 => addra(12),
      I2 => addra(11),
      I3 => addra(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => enb,
      I1 => addrb(10),
      I2 => addrb(11),
      I3 => addrb(12),
      I4 => addrb(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => wea(0),
      I1 => addra(10),
      I2 => addra(11),
      I3 => addra(12),
      I4 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_3\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_36\,
      CASDINB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_37\,
      CASDINB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_38\,
      CASDINB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_39\,
      CASDINB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_40\,
      CASDINB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_41\,
      CASDINB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_42\,
      CASDINB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_43\,
      CASDINB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_44\,
      CASDINB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_45\,
      CASDINB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_46\,
      CASDINB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_47\,
      CASDINB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_48\,
      CASDINB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_49\,
      CASDINB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_50\,
      CASDINB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_51\,
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_136\,
      CASDINPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_137\,
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_36\,
      CASDOUTB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_37\,
      CASDOUTB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_38\,
      CASDOUTB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_39\,
      CASDOUTB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_40\,
      CASDOUTB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_41\,
      CASDOUTB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_42\,
      CASDOUTB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_43\,
      CASDOUTB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_44\,
      CASDOUTB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_45\,
      CASDOUTB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_46\,
      CASDOUTB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_47\,
      CASDOUTB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_48\,
      CASDOUTB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_49\,
      CASDOUTB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_50\,
      CASDOUTB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_51\,
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_136\,
      CASDOUTPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_137\,
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => addrb(12),
      I1 => addrb(11),
      I2 => addrb(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => addra(12),
      I1 => addra(13),
      I2 => addra(11),
      I3 => addra(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => enb,
      I1 => addrb(10),
      I2 => addrb(11),
      I3 => addrb(13),
      I4 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => wea(0),
      I1 => addra(10),
      I2 => addra(11),
      I3 => addra(13),
      I4 => addra(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_4\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_36\,
      CASDINB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_37\,
      CASDINB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_38\,
      CASDINB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_39\,
      CASDINB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_40\,
      CASDINB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_41\,
      CASDINB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_42\,
      CASDINB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_43\,
      CASDINB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_44\,
      CASDINB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_45\,
      CASDINB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_46\,
      CASDINB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_47\,
      CASDINB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_48\,
      CASDINB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_49\,
      CASDINB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_50\,
      CASDINB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_51\,
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_136\,
      CASDINPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_137\,
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_36\,
      CASDOUTB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_37\,
      CASDOUTB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_38\,
      CASDOUTB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_39\,
      CASDOUTB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_40\,
      CASDOUTB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_41\,
      CASDOUTB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_42\,
      CASDOUTB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_43\,
      CASDOUTB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_44\,
      CASDOUTB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_45\,
      CASDOUTB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_46\,
      CASDOUTB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_47\,
      CASDOUTB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_48\,
      CASDOUTB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_49\,
      CASDOUTB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_50\,
      CASDOUTB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_51\,
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_136\,
      CASDOUTPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_137\,
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FD"
    )
        port map (
      I0 => addrb(12),
      I1 => addrb(11),
      I2 => addrb(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => addra(12),
      I1 => addra(10),
      I2 => addra(13),
      I3 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => enb,
      I1 => addrb(11),
      I2 => addrb(13),
      I3 => addrb(10),
      I4 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00020000"
    )
        port map (
      I0 => wea(0),
      I1 => addra(11),
      I2 => addra(13),
      I3 => addra(10),
      I4 => addra(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_5\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_36\,
      CASDINB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_37\,
      CASDINB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_38\,
      CASDINB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_39\,
      CASDINB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_40\,
      CASDINB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_41\,
      CASDINB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_42\,
      CASDINB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_43\,
      CASDINB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_44\,
      CASDINB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_45\,
      CASDINB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_46\,
      CASDINB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_47\,
      CASDINB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_48\,
      CASDINB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_49\,
      CASDINB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_50\,
      CASDINB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_51\,
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_136\,
      CASDINPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_137\,
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_36\,
      CASDOUTB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_37\,
      CASDOUTB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_38\,
      CASDOUTB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_39\,
      CASDOUTB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_40\,
      CASDOUTB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_41\,
      CASDOUTB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_42\,
      CASDOUTB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_43\,
      CASDOUTB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_44\,
      CASDOUTB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_45\,
      CASDOUTB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_46\,
      CASDOUTB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_47\,
      CASDOUTB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_48\,
      CASDOUTB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_49\,
      CASDOUTB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_50\,
      CASDOUTB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_51\,
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_136\,
      CASDOUTPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_137\,
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => addrb(11),
      I1 => addrb(12),
      I2 => addrb(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => addra(13),
      I1 => addra(11),
      I2 => addra(12),
      I3 => addra(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => enb,
      I1 => addrb(10),
      I2 => addrb(12),
      I3 => addrb(11),
      I4 => addrb(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => wea(0),
      I1 => addra(10),
      I2 => addra(12),
      I3 => addra(11),
      I4 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_6\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_36\,
      CASDINB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_37\,
      CASDINB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_38\,
      CASDINB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_39\,
      CASDINB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_40\,
      CASDINB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_41\,
      CASDINB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_42\,
      CASDINB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_43\,
      CASDINB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_44\,
      CASDINB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_45\,
      CASDINB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_46\,
      CASDINB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_47\,
      CASDINB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_48\,
      CASDINB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_49\,
      CASDINB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_50\,
      CASDINB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_51\,
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_136\,
      CASDINPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_137\,
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_36\,
      CASDOUTB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_37\,
      CASDOUTB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_38\,
      CASDOUTB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_39\,
      CASDOUTB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_40\,
      CASDOUTB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_41\,
      CASDOUTB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_42\,
      CASDOUTB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_43\,
      CASDOUTB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_44\,
      CASDOUTB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_45\,
      CASDOUTB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_46\,
      CASDOUTB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_47\,
      CASDOUTB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_48\,
      CASDOUTB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_49\,
      CASDOUTB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_50\,
      CASDOUTB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_51\,
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_136\,
      CASDOUTPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_137\,
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => addrb(10),
      I1 => addrb(12),
      I2 => addrb(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => addra(13),
      I1 => addra(10),
      I2 => addra(12),
      I3 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"02000000"
    )
        port map (
      I0 => enb,
      I1 => addrb(10),
      I2 => addrb(13),
      I3 => addrb(11),
      I4 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => wea(0),
      I1 => addra(11),
      I2 => addra(12),
      I3 => addra(10),
      I4 => addra(13),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_7\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "LAST",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_36\,
      CASDINB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_37\,
      CASDINB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_38\,
      CASDINB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_39\,
      CASDINB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_40\,
      CASDINB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_41\,
      CASDINB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_42\,
      CASDINB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_43\,
      CASDINB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_44\,
      CASDINB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_45\,
      CASDINB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_46\,
      CASDINB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_47\,
      CASDINB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_48\,
      CASDINB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_49\,
      CASDINB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_50\,
      CASDINB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_51\,
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_136\,
      CASDINPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_137\,
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTB_UNCONNECTED\(31 downto 0),
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTPB_UNCONNECTED\(3 downto 0),
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASOUTDBITERR_UNCONNECTED\,
      CASOUTSBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASOUTSBITERR_UNCONNECTED\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_100\,
      DOUTBDOUT(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_101\,
      DOUTBDOUT(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_102\,
      DOUTBDOUT(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_103\,
      DOUTBDOUT(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_104\,
      DOUTBDOUT(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_105\,
      DOUTBDOUT(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_106\,
      DOUTBDOUT(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_107\,
      DOUTBDOUT(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_108\,
      DOUTBDOUT(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_109\,
      DOUTBDOUT(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_110\,
      DOUTBDOUT(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_111\,
      DOUTBDOUT(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_112\,
      DOUTBDOUT(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_113\,
      DOUTBDOUT(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_114\,
      DOUTBDOUT(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_115\,
      DOUTBDOUT(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_116\,
      DOUTBDOUT(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_117\,
      DOUTBDOUT(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_118\,
      DOUTBDOUT(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_119\,
      DOUTBDOUT(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_120\,
      DOUTBDOUT(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_121\,
      DOUTBDOUT(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_122\,
      DOUTBDOUT(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_123\,
      DOUTBDOUT(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_124\,
      DOUTBDOUT(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_125\,
      DOUTBDOUT(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_126\,
      DOUTBDOUT(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_127\,
      DOUTBDOUT(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_128\,
      DOUTBDOUT(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_129\,
      DOUTBDOUT(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_130\,
      DOUTBDOUT(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_131\,
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_144\,
      DOUTPBDOUTP(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_145\,
      DOUTPBDOUTP(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_146\,
      DOUTPBDOUTP(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_147\,
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_2_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_3_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => addrb(10),
      I1 => addrb(12),
      I2 => addrb(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => addra(10),
      I1 => addra(13),
      I2 => addra(12),
      I3 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => enb,
      I1 => addrb(13),
      I2 => addrb(10),
      I3 => addrb(11),
      I4 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800000"
    )
        port map (
      I0 => wea(0),
      I1 => addra(11),
      I2 => addra(12),
      I3 => addra(13),
      I4 => addra(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_8\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "FIRST",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31 downto 0) => B"00000000000000000000000000000000",
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3 downto 0) => B"0000",
      CASDOMUXA => '0',
      CASDOMUXB => '0',
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => '1',
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_36\,
      CASDOUTB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_37\,
      CASDOUTB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_38\,
      CASDOUTB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_39\,
      CASDOUTB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_40\,
      CASDOUTB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_41\,
      CASDOUTB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_42\,
      CASDOUTB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_43\,
      CASDOUTB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_44\,
      CASDOUTB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_45\,
      CASDOUTB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_46\,
      CASDOUTB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_47\,
      CASDOUTB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_48\,
      CASDOUTB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_49\,
      CASDOUTB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_50\,
      CASDOUTB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_51\,
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_136\,
      CASDOUTPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_137\,
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_139\,
      CASINDBITERR => '0',
      CASINSBITERR => '0',
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_1_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_2_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => addra(12),
      I1 => addra(11),
      I2 => addra(13),
      I3 => addra(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => enb,
      I1 => addrb(10),
      I2 => addrb(13),
      I3 => addrb(11),
      I4 => addrb(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000020"
    )
        port map (
      I0 => wea(0),
      I1 => addra(10),
      I2 => addra(13),
      I3 => addra(11),
      I4 => addra(12),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_9\: unisim.vcomponents.RAMB36E2
    generic map(
      CASCADE_ORDER_A => "NONE",
      CASCADE_ORDER_B => "MIDDLE",
      CLOCK_DOMAINS => "COMMON",
      DOA_REG => 0,
      DOB_REG => 0,
      ENADDRENA => "FALSE",
      ENADDRENB => "FALSE",
      EN_ECC_PIPE => "FALSE",
      EN_ECC_READ => "FALSE",
      EN_ECC_WRITE => "FALSE",
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RDADDRCHANGEA => "FALSE",
      RDADDRCHANGEB => "FALSE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SLEEP_ASYNC => "FALSE",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
        port map (
      ADDRARDADDR(14 downto 5) => addra(9 downto 0),
      ADDRARDADDR(4 downto 0) => B"00000",
      ADDRBWRADDR(14 downto 5) => addrb(9 downto 0),
      ADDRBWRADDR(4 downto 0) => B"00000",
      ADDRENA => '1',
      ADDRENB => '1',
      CASDIMUXA => '0',
      CASDIMUXB => '0',
      CASDINA(31 downto 0) => B"00000000000000000000000000000000",
      CASDINB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_36\,
      CASDINB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_37\,
      CASDINB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_38\,
      CASDINB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_39\,
      CASDINB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_40\,
      CASDINB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_41\,
      CASDINB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_42\,
      CASDINB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_43\,
      CASDINB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_44\,
      CASDINB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_45\,
      CASDINB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_46\,
      CASDINB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_47\,
      CASDINB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_48\,
      CASDINB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_49\,
      CASDINB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_50\,
      CASDINB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_51\,
      CASDINB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_52\,
      CASDINB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_53\,
      CASDINB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_54\,
      CASDINB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_55\,
      CASDINB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_56\,
      CASDINB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_57\,
      CASDINB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_58\,
      CASDINB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_59\,
      CASDINB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_60\,
      CASDINB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_61\,
      CASDINB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_62\,
      CASDINB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_63\,
      CASDINB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_64\,
      CASDINB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_65\,
      CASDINB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_66\,
      CASDINB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_67\,
      CASDINPA(3 downto 0) => B"0000",
      CASDINPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_136\,
      CASDINPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_137\,
      CASDINPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_138\,
      CASDINPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_139\,
      CASDOMUXA => '0',
      CASDOMUXB => \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_1_n_0\,
      CASDOMUXEN_A => '1',
      CASDOMUXEN_B => enb,
      CASDOUTA(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_CASDOUTA_UNCONNECTED\(31 downto 0),
      CASDOUTB(31) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_36\,
      CASDOUTB(30) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_37\,
      CASDOUTB(29) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_38\,
      CASDOUTB(28) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_39\,
      CASDOUTB(27) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_40\,
      CASDOUTB(26) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_41\,
      CASDOUTB(25) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_42\,
      CASDOUTB(24) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_43\,
      CASDOUTB(23) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_44\,
      CASDOUTB(22) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_45\,
      CASDOUTB(21) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_46\,
      CASDOUTB(20) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_47\,
      CASDOUTB(19) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_48\,
      CASDOUTB(18) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_49\,
      CASDOUTB(17) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_50\,
      CASDOUTB(16) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_51\,
      CASDOUTB(15) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_52\,
      CASDOUTB(14) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_53\,
      CASDOUTB(13) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_54\,
      CASDOUTB(12) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_55\,
      CASDOUTB(11) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_56\,
      CASDOUTB(10) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_57\,
      CASDOUTB(9) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_58\,
      CASDOUTB(8) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_59\,
      CASDOUTB(7) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_60\,
      CASDOUTB(6) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_61\,
      CASDOUTB(5) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_62\,
      CASDOUTB(4) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_63\,
      CASDOUTB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_64\,
      CASDOUTB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_65\,
      CASDOUTB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_66\,
      CASDOUTB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_67\,
      CASDOUTPA(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_CASDOUTPA_UNCONNECTED\(3 downto 0),
      CASDOUTPB(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_136\,
      CASDOUTPB(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_137\,
      CASDOUTPB(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_138\,
      CASDOUTPB(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_139\,
      CASINDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_0\,
      CASINSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_1\,
      CASOREGIMUXA => '0',
      CASOREGIMUXB => '0',
      CASOREGIMUXEN_A => '1',
      CASOREGIMUXEN_B => '1',
      CASOUTDBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_0\,
      CASOUTSBITERR => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_1\,
      CLKARDCLK => clka,
      CLKBWRCLK => clka,
      DBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DBITERR_UNCONNECTED\,
      DINADIN(31 downto 0) => dina(31 downto 0),
      DINBDIN(31 downto 0) => B"11111111111111111111111111111111",
      DINPADINP(3 downto 0) => dina(35 downto 32),
      DINPBDINP(3 downto 0) => B"1111",
      DOUTADOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTADOUT_UNCONNECTED\(31 downto 0),
      DOUTBDOUT(31 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTBDOUT_UNCONNECTED\(31 downto 0),
      DOUTPADOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTPADOUTP_UNCONNECTED\(3 downto 0),
      DOUTPBDOUTP(3 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTPBDOUTP_UNCONNECTED\(3 downto 0),
      ECCPARITY(7 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_ECCPARITY_UNCONNECTED\(7 downto 0),
      ECCPIPECE => '1',
      ENARDEN => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_1_n_0\,
      ENBWREN => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_2_n_0\,
      INJECTDBITERR => '0',
      INJECTSBITERR => '0',
      RDADDRECC(8 downto 0) => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_RDADDRECC_UNCONNECTED\(8 downto 0),
      REGCEAREGCE => '1',
      REGCEB => '1',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      SBITERR => \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_SBITERR_UNCONNECTED\,
      SLEEP => '0',
      WEA(3) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3_n_0\,
      WEA(2) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3_n_0\,
      WEA(1) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3_n_0\,
      WEA(0) => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3_n_0\,
      WEBWE(7 downto 0) => B"00000000"
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1000"
    )
        port map (
      I0 => addra(11),
      I1 => addra(12),
      I2 => addra(13),
      I3 => addra(10),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_1_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => enb,
      I1 => addrb(10),
      I2 => addrb(13),
      I3 => addrb(12),
      I4 => addrb(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_2_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000080"
    )
        port map (
      I0 => wea(0),
      I1 => addra(10),
      I2 => addra(13),
      I3 => addra(12),
      I4 => addra(11),
      O => \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3_n_0\
    );
\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0\: unisim.vcomponents.FDRE
     port map (
      C => clka,
      CE => '1',
      D => \gen_wr_a.gen_word_narrow.mem_mux_sel_b_pos_0_i_1_n_0\,
      Q => \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base is
  port (
    sleep : in STD_LOGIC;
    rst : in STD_LOGIC;
    wr_clk : in STD_LOGIC;
    wr_en : in STD_LOGIC;
    din : in STD_LOGIC_VECTOR ( 83 downto 0 );
    full : out STD_LOGIC;
    full_n : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    wr_data_count : out STD_LOGIC_VECTOR ( 14 downto 0 );
    overflow : out STD_LOGIC;
    wr_rst_busy : out STD_LOGIC;
    almost_full : out STD_LOGIC;
    wr_ack : out STD_LOGIC;
    rd_clk : in STD_LOGIC;
    rd_en : in STD_LOGIC;
    dout : out STD_LOGIC_VECTOR ( 83 downto 0 );
    empty : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    rd_data_count : out STD_LOGIC_VECTOR ( 14 downto 0 );
    underflow : out STD_LOGIC;
    rd_rst_busy : out STD_LOGIC;
    almost_empty : out STD_LOGIC;
    data_valid : out STD_LOGIC;
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC
  );
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute CDC_DEST_SYNC_FF : integer;
  attribute CDC_DEST_SYNC_FF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 3;
  attribute COMMON_CLOCK : integer;
  attribute COMMON_CLOCK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1;
  attribute DOUT_RESET_VALUE : string;
  attribute DOUT_RESET_VALUE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "";
  attribute ECC_MODE : integer;
  attribute ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute ENABLE_ECC : integer;
  attribute ENABLE_ECC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute EN_ADV_FEATURE : string;
  attribute EN_ADV_FEATURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "16'b0001001000000000";
  attribute EN_AE : string;
  attribute EN_AE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b0";
  attribute EN_AF : string;
  attribute EN_AF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b0";
  attribute EN_DVLD : string;
  attribute EN_DVLD of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b1";
  attribute EN_OF : string;
  attribute EN_OF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b0";
  attribute EN_PE : string;
  attribute EN_PE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b1";
  attribute EN_PF : string;
  attribute EN_PF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b0";
  attribute EN_RDC : string;
  attribute EN_RDC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b0";
  attribute EN_UF : string;
  attribute EN_UF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b0";
  attribute EN_WACK : string;
  attribute EN_WACK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b0";
  attribute EN_WDC : string;
  attribute EN_WDC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b0";
  attribute FG_EQ_ASYM_DOUT : string;
  attribute FG_EQ_ASYM_DOUT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b0";
  attribute FIFO_MEMORY_TYPE : integer;
  attribute FIFO_MEMORY_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute FIFO_MEM_TYPE : integer;
  attribute FIFO_MEM_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute FIFO_READ_DEPTH : integer;
  attribute FIFO_READ_DEPTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 16384;
  attribute FIFO_READ_LATENCY : integer;
  attribute FIFO_READ_LATENCY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute FIFO_SIZE : integer;
  attribute FIFO_SIZE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1376256;
  attribute FIFO_WRITE_DEPTH : integer;
  attribute FIFO_WRITE_DEPTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 16384;
  attribute FULL_RESET_VALUE : integer;
  attribute FULL_RESET_VALUE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1;
  attribute FULL_RST_VAL : string;
  attribute FULL_RST_VAL of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "1'b1";
  attribute PE_THRESH_ADJ : integer;
  attribute PE_THRESH_ADJ of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1398;
  attribute PE_THRESH_MAX : integer;
  attribute PE_THRESH_MAX of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 16379;
  attribute PE_THRESH_MIN : integer;
  attribute PE_THRESH_MIN of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 5;
  attribute PF_THRESH_ADJ : integer;
  attribute PF_THRESH_ADJ of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 9;
  attribute PF_THRESH_MAX : integer;
  attribute PF_THRESH_MAX of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 16379;
  attribute PF_THRESH_MIN : integer;
  attribute PF_THRESH_MIN of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 5;
  attribute PROG_EMPTY_THRESH : integer;
  attribute PROG_EMPTY_THRESH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1400;
  attribute PROG_FULL_THRESH : integer;
  attribute PROG_FULL_THRESH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 11;
  attribute RD_DATA_COUNT_WIDTH : integer;
  attribute RD_DATA_COUNT_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 15;
  attribute RD_DC_WIDTH_EXT : integer;
  attribute RD_DC_WIDTH_EXT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 15;
  attribute RD_LATENCY : integer;
  attribute RD_LATENCY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 2;
  attribute RD_MODE : integer;
  attribute RD_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1;
  attribute RD_PNTR_WIDTH : integer;
  attribute RD_PNTR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 14;
  attribute READ_DATA_WIDTH : integer;
  attribute READ_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 84;
  attribute READ_MODE : integer;
  attribute READ_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1;
  attribute READ_MODE_LL : integer;
  attribute READ_MODE_LL of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1;
  attribute RELATED_CLOCKS : integer;
  attribute RELATED_CLOCKS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute REMOVE_WR_RD_PROT_LOGIC : integer;
  attribute REMOVE_WR_RD_PROT_LOGIC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute USE_ADV_FEATURES : integer;
  attribute USE_ADV_FEATURES of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 825372720;
  attribute VERSION : integer;
  attribute VERSION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute WIDTH_RATIO : integer;
  attribute WIDTH_RATIO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1;
  attribute WRITE_DATA_WIDTH : integer;
  attribute WRITE_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 84;
  attribute WR_DATA_COUNT_WIDTH : integer;
  attribute WR_DATA_COUNT_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 15;
  attribute WR_DC_WIDTH_EXT : integer;
  attribute WR_DC_WIDTH_EXT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 15;
  attribute WR_DEPTH_LOG : integer;
  attribute WR_DEPTH_LOG of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 14;
  attribute WR_PNTR_WIDTH : integer;
  attribute WR_PNTR_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 14;
  attribute WR_RD_RATIO : integer;
  attribute WR_RD_RATIO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute WR_WIDTH_LOG : integer;
  attribute WR_WIDTH_LOG of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 7;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "TRUE";
  attribute both_stages_valid : integer;
  attribute both_stages_valid of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 3;
  attribute invalid : integer;
  attribute invalid of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 0;
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is "soft";
  attribute stage1_valid : integer;
  attribute stage1_valid of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 2;
  attribute stage2_valid : integer;
  attribute stage2_valid of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base : entity is 1;
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base is
  signal \<const0>\ : STD_LOGIC;
  signal clr_full : STD_LOGIC;
  signal \count_value_i__0\ : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal curr_fwft_state : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal data_valid_fwft1 : STD_LOGIC;
  signal diff_pntr_pe : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \^dout\ : STD_LOGIC_VECTOR ( 83 downto 0 );
  signal \gen_fwft.empty_fwft_i_reg_n_0\ : STD_LOGIC;
  signal \gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0\ : STD_LOGIC;
  signal \gen_fwft.ram_regout_en\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[0]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[10]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[11]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[12]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[13]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[1]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[2]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[3]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[4]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[5]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[6]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[7]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[8]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[9]\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_3_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_4_n_0\ : STD_LOGIC;
  signal \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_5_n_0\ : STD_LOGIC;
  signal leaving_empty0 : STD_LOGIC;
  signal \next_fwft_state__0\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^prog_empty\ : STD_LOGIC;
  signal prog_empty_i1 : STD_LOGIC;
  signal ram_empty_i : STD_LOGIC;
  signal ram_empty_i0 : STD_LOGIC;
  signal ram_wr_en_i : STD_LOGIC;
  signal rd_pntr_ext : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal rdp_inst_n_14 : STD_LOGIC;
  signal rdp_inst_n_16 : STD_LOGIC;
  signal rdp_inst_n_17 : STD_LOGIC;
  signal rdp_inst_n_18 : STD_LOGIC;
  signal rdp_inst_n_19 : STD_LOGIC;
  signal rdp_inst_n_20 : STD_LOGIC;
  signal rdp_inst_n_21 : STD_LOGIC;
  signal rdp_inst_n_22 : STD_LOGIC;
  signal rdp_inst_n_23 : STD_LOGIC;
  signal rdp_inst_n_24 : STD_LOGIC;
  signal rdp_inst_n_25 : STD_LOGIC;
  signal rdp_inst_n_26 : STD_LOGIC;
  signal rdp_inst_n_27 : STD_LOGIC;
  signal rdp_inst_n_28 : STD_LOGIC;
  signal rdp_inst_n_29 : STD_LOGIC;
  signal rdp_inst_n_30 : STD_LOGIC;
  signal rdpp1_inst_n_0 : STD_LOGIC;
  signal rdpp1_inst_n_1 : STD_LOGIC;
  signal rdpp1_inst_n_10 : STD_LOGIC;
  signal rdpp1_inst_n_11 : STD_LOGIC;
  signal rdpp1_inst_n_12 : STD_LOGIC;
  signal rdpp1_inst_n_13 : STD_LOGIC;
  signal rdpp1_inst_n_2 : STD_LOGIC;
  signal rdpp1_inst_n_3 : STD_LOGIC;
  signal rdpp1_inst_n_4 : STD_LOGIC;
  signal rdpp1_inst_n_5 : STD_LOGIC;
  signal rdpp1_inst_n_6 : STD_LOGIC;
  signal rdpp1_inst_n_7 : STD_LOGIC;
  signal rdpp1_inst_n_8 : STD_LOGIC;
  signal rdpp1_inst_n_9 : STD_LOGIC;
  signal read_only : STD_LOGIC;
  signal read_only_q : STD_LOGIC;
  signal rst_d1 : STD_LOGIC;
  signal rst_d1_inst_n_1 : STD_LOGIC;
  signal wr_pntr_ext : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal write_only : STD_LOGIC;
  signal write_only_q : STD_LOGIC;
  signal xpm_fifo_rst_inst_n_1 : STD_LOGIC;
  signal xpm_fifo_rst_inst_n_2 : STD_LOGIC;
  signal xpm_fifo_rst_inst_n_3 : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_dbiterra_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_dbiterrb_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_sbiterra_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_sbiterrb_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_gen_sdpram.xpm_memory_base_inst_douta_UNCONNECTED\ : STD_LOGIC_VECTOR ( 83 downto 0 );
  signal \NLW_gen_sdpram.xpm_memory_base_inst_doutb_UNCONNECTED\ : STD_LOGIC_VECTOR ( 82 downto 64 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_gen_fwft.curr_fwft_state[0]_i_1\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \FSM_sequential_gen_fwft.curr_fwft_state[1]_i_1\ : label is "soft_lutpair86";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_gen_fwft.curr_fwft_state_reg[0]\ : label is "invalid:00,stage1_valid:01,both_stages_valid:10,stage2_valid:11";
  attribute FSM_ENCODED_STATES of \FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\ : label is "invalid:00,stage1_valid:01,both_stages_valid:10,stage2_valid:11";
  attribute SOFT_HLUTNM of \gen_fwft.empty_fwft_i_i_1\ : label is "soft_lutpair85";
  attribute ADDR_WIDTH_A : integer;
  attribute ADDR_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 14;
  attribute ADDR_WIDTH_B : integer;
  attribute ADDR_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 14;
  attribute AUTO_SLEEP_TIME : integer;
  attribute AUTO_SLEEP_TIME of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute BYTE_WRITE_WIDTH_A : integer;
  attribute BYTE_WRITE_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute BYTE_WRITE_WIDTH_B : integer;
  attribute BYTE_WRITE_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute CASCADE_HEIGHT of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute CLOCKING_MODE : integer;
  attribute CLOCKING_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute ECC_BIT_RANGE : string;
  attribute ECC_BIT_RANGE of \gen_sdpram.xpm_memory_base_inst\ : label is "[7:0]";
  attribute ECC_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute ECC_TYPE : string;
  attribute ECC_TYPE of \gen_sdpram.xpm_memory_base_inst\ : label is "NONE";
  attribute IGNORE_INIT_SYNTH : integer;
  attribute IGNORE_INIT_SYNTH of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute KEEP_HIERARCHY of \gen_sdpram.xpm_memory_base_inst\ : label is "soft";
  attribute MAX_NUM_CHAR : integer;
  attribute MAX_NUM_CHAR of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute \MEM.ADDRESS_SPACE\ : boolean;
  attribute \MEM.ADDRESS_SPACE\ of \gen_sdpram.xpm_memory_base_inst\ : label is std.standard.true;
  attribute \MEM.ADDRESS_SPACE_BEGIN\ : integer;
  attribute \MEM.ADDRESS_SPACE_BEGIN\ of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute \MEM.ADDRESS_SPACE_DATA_LSB\ : integer;
  attribute \MEM.ADDRESS_SPACE_DATA_LSB\ of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute \MEM.ADDRESS_SPACE_DATA_MSB\ : integer;
  attribute \MEM.ADDRESS_SPACE_DATA_MSB\ of \gen_sdpram.xpm_memory_base_inst\ : label is 64;
  attribute \MEM.ADDRESS_SPACE_END\ : integer;
  attribute \MEM.ADDRESS_SPACE_END\ of \gen_sdpram.xpm_memory_base_inst\ : label is 16383;
  attribute \MEM.CORE_MEMORY_WIDTH\ : integer;
  attribute \MEM.CORE_MEMORY_WIDTH\ of \gen_sdpram.xpm_memory_base_inst\ : label is 65;
  attribute MEMORY_INIT_FILE : string;
  attribute MEMORY_INIT_FILE of \gen_sdpram.xpm_memory_base_inst\ : label is "none";
  attribute MEMORY_INIT_PARAM : string;
  attribute MEMORY_INIT_PARAM of \gen_sdpram.xpm_memory_base_inst\ : label is "";
  attribute MEMORY_OPTIMIZATION : string;
  attribute MEMORY_OPTIMIZATION of \gen_sdpram.xpm_memory_base_inst\ : label is "true";
  attribute MEMORY_PRIMITIVE : integer;
  attribute MEMORY_PRIMITIVE of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute MEMORY_SIZE : integer;
  attribute MEMORY_SIZE of \gen_sdpram.xpm_memory_base_inst\ : label is 1376256;
  attribute MEMORY_TYPE : integer;
  attribute MEMORY_TYPE of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute MESSAGE_CONTROL : integer;
  attribute MESSAGE_CONTROL of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute NUM_CHAR_LOC : integer;
  attribute NUM_CHAR_LOC of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_ECC_MODE : string;
  attribute P_ECC_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is "no_ecc";
  attribute P_ENABLE_BYTE_WRITE_A : integer;
  attribute P_ENABLE_BYTE_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_ENABLE_BYTE_WRITE_B : integer;
  attribute P_ENABLE_BYTE_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_MAX_DEPTH_DATA : integer;
  attribute P_MAX_DEPTH_DATA of \gen_sdpram.xpm_memory_base_inst\ : label is 16384;
  attribute P_MEMORY_OPT : string;
  attribute P_MEMORY_OPT of \gen_sdpram.xpm_memory_base_inst\ : label is "yes";
  attribute P_MEMORY_PRIMITIVE : string;
  attribute P_MEMORY_PRIMITIVE of \gen_sdpram.xpm_memory_base_inst\ : label is "auto";
  attribute P_MIN_WIDTH_DATA : integer;
  attribute P_MIN_WIDTH_DATA of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute P_MIN_WIDTH_DATA_A : integer;
  attribute P_MIN_WIDTH_DATA_A of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute P_MIN_WIDTH_DATA_B : integer;
  attribute P_MIN_WIDTH_DATA_B of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute P_MIN_WIDTH_DATA_ECC : integer;
  attribute P_MIN_WIDTH_DATA_ECC of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute P_MIN_WIDTH_DATA_LDW : integer;
  attribute P_MIN_WIDTH_DATA_LDW of \gen_sdpram.xpm_memory_base_inst\ : label is 4;
  attribute P_MIN_WIDTH_DATA_SHFT : integer;
  attribute P_MIN_WIDTH_DATA_SHFT of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute P_NUM_COLS_WRITE_A : integer;
  attribute P_NUM_COLS_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_COLS_WRITE_B : integer;
  attribute P_NUM_COLS_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_READ_A : integer;
  attribute P_NUM_ROWS_READ_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_READ_B : integer;
  attribute P_NUM_ROWS_READ_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_WRITE_A : integer;
  attribute P_NUM_ROWS_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_NUM_ROWS_WRITE_B : integer;
  attribute P_NUM_ROWS_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute P_SDP_WRITE_MODE : string;
  attribute P_SDP_WRITE_MODE of \gen_sdpram.xpm_memory_base_inst\ : label is "yes";
  attribute P_WIDTH_ADDR_LSB_READ_A : integer;
  attribute P_WIDTH_ADDR_LSB_READ_A of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_LSB_READ_B : integer;
  attribute P_WIDTH_ADDR_LSB_READ_B of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_A : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_LSB_WRITE_B : integer;
  attribute P_WIDTH_ADDR_LSB_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute P_WIDTH_ADDR_READ_A : integer;
  attribute P_WIDTH_ADDR_READ_A of \gen_sdpram.xpm_memory_base_inst\ : label is 14;
  attribute P_WIDTH_ADDR_READ_B : integer;
  attribute P_WIDTH_ADDR_READ_B of \gen_sdpram.xpm_memory_base_inst\ : label is 14;
  attribute P_WIDTH_ADDR_WRITE_A : integer;
  attribute P_WIDTH_ADDR_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 14;
  attribute P_WIDTH_ADDR_WRITE_B : integer;
  attribute P_WIDTH_ADDR_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 14;
  attribute P_WIDTH_COL_WRITE_A : integer;
  attribute P_WIDTH_COL_WRITE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute P_WIDTH_COL_WRITE_B : integer;
  attribute P_WIDTH_COL_WRITE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute READ_DATA_WIDTH_A : integer;
  attribute READ_DATA_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute READ_DATA_WIDTH_B : integer;
  attribute READ_DATA_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute READ_LATENCY_A : integer;
  attribute READ_LATENCY_A of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute READ_LATENCY_B : integer;
  attribute READ_LATENCY_B of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute READ_RESET_VALUE_A : string;
  attribute READ_RESET_VALUE_A of \gen_sdpram.xpm_memory_base_inst\ : label is "0";
  attribute READ_RESET_VALUE_B : string;
  attribute READ_RESET_VALUE_B of \gen_sdpram.xpm_memory_base_inst\ : label is "";
  attribute RST_MODE_A : string;
  attribute RST_MODE_A of \gen_sdpram.xpm_memory_base_inst\ : label is "SYNC";
  attribute RST_MODE_B : string;
  attribute RST_MODE_B of \gen_sdpram.xpm_memory_base_inst\ : label is "SYNC";
  attribute SIM_ASSERT_CHK of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute USE_EMBEDDED_CONSTRAINT : integer;
  attribute USE_EMBEDDED_CONSTRAINT of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute USE_MEM_INIT : integer;
  attribute USE_MEM_INIT of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute USE_MEM_INIT_MMI : integer;
  attribute USE_MEM_INIT_MMI of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute VERSION of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute WAKEUP_TIME of \gen_sdpram.xpm_memory_base_inst\ : label is 0;
  attribute WRITE_DATA_WIDTH_A : integer;
  attribute WRITE_DATA_WIDTH_A of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute WRITE_DATA_WIDTH_B : integer;
  attribute WRITE_DATA_WIDTH_B of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute WRITE_MODE_A : integer;
  attribute WRITE_MODE_A of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute WRITE_MODE_B : integer;
  attribute WRITE_MODE_B of \gen_sdpram.xpm_memory_base_inst\ : label is 2;
  attribute WRITE_PROTECT : integer;
  attribute WRITE_PROTECT of \gen_sdpram.xpm_memory_base_inst\ : label is 1;
  attribute XPM_MODULE of \gen_sdpram.xpm_memory_base_inst\ : label is "TRUE";
  attribute rsta_loop_iter : integer;
  attribute rsta_loop_iter of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute rstb_loop_iter : integer;
  attribute rstb_loop_iter of \gen_sdpram.xpm_memory_base_inst\ : label is 84;
  attribute SOFT_HLUTNM of \gen_sdpram.xpm_memory_base_inst_i_3\ : label is "soft_lutpair85";
begin
  almost_empty <= \<const0>\;
  almost_full <= \<const0>\;
  dbiterr <= \<const0>\;
  dout(83) <= \^dout\(83);
  dout(82) <= \<const0>\;
  dout(81) <= \<const0>\;
  dout(80) <= \<const0>\;
  dout(79) <= \<const0>\;
  dout(78) <= \<const0>\;
  dout(77) <= \<const0>\;
  dout(76) <= \<const0>\;
  dout(75) <= \<const0>\;
  dout(74) <= \<const0>\;
  dout(73) <= \<const0>\;
  dout(72) <= \<const0>\;
  dout(71) <= \<const0>\;
  dout(70) <= \<const0>\;
  dout(69) <= \<const0>\;
  dout(68) <= \<const0>\;
  dout(67) <= \<const0>\;
  dout(66) <= \<const0>\;
  dout(65) <= \<const0>\;
  dout(64) <= \<const0>\;
  dout(63 downto 0) <= \^dout\(63 downto 0);
  empty <= \<const0>\;
  full <= \<const0>\;
  overflow <= \<const0>\;
  prog_empty <= \^prog_empty\;
  prog_full <= \<const0>\;
  rd_data_count(14) <= \<const0>\;
  rd_data_count(13) <= \<const0>\;
  rd_data_count(12) <= \<const0>\;
  rd_data_count(11) <= \<const0>\;
  rd_data_count(10) <= \<const0>\;
  rd_data_count(9) <= \<const0>\;
  rd_data_count(8) <= \<const0>\;
  rd_data_count(7) <= \<const0>\;
  rd_data_count(6) <= \<const0>\;
  rd_data_count(5) <= \<const0>\;
  rd_data_count(4) <= \<const0>\;
  rd_data_count(3) <= \<const0>\;
  rd_data_count(2) <= \<const0>\;
  rd_data_count(1) <= \<const0>\;
  rd_data_count(0) <= \<const0>\;
  rd_rst_busy <= \<const0>\;
  sbiterr <= \<const0>\;
  underflow <= \<const0>\;
  wr_ack <= \<const0>\;
  wr_data_count(14) <= \<const0>\;
  wr_data_count(13) <= \<const0>\;
  wr_data_count(12) <= \<const0>\;
  wr_data_count(11) <= \<const0>\;
  wr_data_count(10) <= \<const0>\;
  wr_data_count(9) <= \<const0>\;
  wr_data_count(8) <= \<const0>\;
  wr_data_count(7) <= \<const0>\;
  wr_data_count(6) <= \<const0>\;
  wr_data_count(5) <= \<const0>\;
  wr_data_count(4) <= \<const0>\;
  wr_data_count(3) <= \<const0>\;
  wr_data_count(2) <= \<const0>\;
  wr_data_count(1) <= \<const0>\;
  wr_data_count(0) <= \<const0>\;
  wr_rst_busy <= \<const0>\;
\FSM_sequential_gen_fwft.curr_fwft_state[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6A85"
    )
        port map (
      I0 => curr_fwft_state(0),
      I1 => rd_en,
      I2 => curr_fwft_state(1),
      I3 => ram_empty_i,
      O => \next_fwft_state__0\(0)
    );
\FSM_sequential_gen_fwft.curr_fwft_state[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3FF0"
    )
        port map (
      I0 => ram_empty_i,
      I1 => rd_en,
      I2 => curr_fwft_state(1),
      I3 => curr_fwft_state(0),
      O => \next_fwft_state__0\(1)
    );
\FSM_sequential_gen_fwft.curr_fwft_state_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \next_fwft_state__0\(0),
      Q => curr_fwft_state(0),
      R => xpm_fifo_rst_inst_n_1
    );
\FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \next_fwft_state__0\(1),
      Q => curr_fwft_state(1),
      R => xpm_fifo_rst_inst_n_1
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gen_fwft.empty_fwft_i_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F380"
    )
        port map (
      I0 => rd_en,
      I1 => curr_fwft_state(0),
      I2 => curr_fwft_state(1),
      I3 => \gen_fwft.empty_fwft_i_reg_n_0\,
      O => data_valid_fwft1
    );
\gen_fwft.empty_fwft_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => data_valid_fwft1,
      Q => \gen_fwft.empty_fwft_i_reg_n_0\,
      S => xpm_fifo_rst_inst_n_1
    );
\gen_fwft.gdvld_fwft.data_valid_fwft_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3575"
    )
        port map (
      I0 => \gen_fwft.empty_fwft_i_reg_n_0\,
      I1 => curr_fwft_state(1),
      I2 => curr_fwft_state(0),
      I3 => rd_en,
      O => \gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0\
    );
\gen_fwft.gdvld_fwft.data_valid_fwft_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => \gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0\,
      Q => data_valid,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => rdp_inst_n_30,
      Q => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0\,
      S => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => rdp_inst_n_16,
      Q => full_n,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.ram_empty_i_reg\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => ram_empty_i0,
      Q => ram_empty_i,
      S => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pe(0),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[0]\,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pe(10),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[10]\,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pe(11),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[11]\,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pe(12),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[12]\,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pe(13),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[13]\,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pe(1),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[1]\,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pe(2),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[2]\,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pe(3),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[3]\,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pe(4),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[4]\,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pe(5),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[5]\,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pe(6),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[6]\,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pe(7),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[7]\,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pe(8),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[8]\,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => diff_pntr_pe(9),
      Q => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[9]\,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_3_n_0\,
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[13]\,
      I2 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[11]\,
      I3 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[12]\,
      I4 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_4_n_0\,
      I5 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_5_n_0\,
      O => prog_empty_i1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[3]\,
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[0]\,
      I2 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[9]\,
      I3 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[7]\,
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_3_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[10]\,
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[8]\,
      I2 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[6]\,
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_4_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[2]\,
      I1 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[1]\,
      I2 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[5]\,
      I3 => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[4]\,
      O => \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_5_n_0\
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_reg\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => wr_clk,
      CE => '1',
      D => xpm_fifo_rst_inst_n_2,
      Q => \^prog_empty\,
      R => '0'
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.read_only_q_reg\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => read_only,
      Q => read_only_q,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg\: unisim.vcomponents.FDRE
     port map (
      C => wr_clk,
      CE => '1',
      D => write_only,
      Q => write_only_q,
      R => xpm_fifo_rst_inst_n_1
    );
\gen_sdpram.xpm_memory_base_inst\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_memory_base
     port map (
      addra(13 downto 0) => wr_pntr_ext(13 downto 0),
      addrb(13 downto 0) => rd_pntr_ext(13 downto 0),
      clka => wr_clk,
      clkb => '0',
      dbiterra => \NLW_gen_sdpram.xpm_memory_base_inst_dbiterra_UNCONNECTED\,
      dbiterrb => \NLW_gen_sdpram.xpm_memory_base_inst_dbiterrb_UNCONNECTED\,
      dina(83) => din(83),
      dina(82 downto 64) => B"0000000000000000000",
      dina(63 downto 0) => din(63 downto 0),
      dinb(83 downto 0) => B"000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
      douta(83 downto 0) => \NLW_gen_sdpram.xpm_memory_base_inst_douta_UNCONNECTED\(83 downto 0),
      doutb(83) => \^dout\(83),
      doutb(82 downto 64) => \NLW_gen_sdpram.xpm_memory_base_inst_doutb_UNCONNECTED\(82 downto 64),
      doutb(63 downto 0) => \^dout\(63 downto 0),
      ena => '0',
      enb => rdp_inst_n_14,
      injectdbiterra => '0',
      injectdbiterrb => '0',
      injectsbiterra => '0',
      injectsbiterrb => '0',
      regcea => '0',
      regceb => \gen_fwft.ram_regout_en\,
      rsta => '0',
      rstb => xpm_fifo_rst_inst_n_1,
      sbiterra => \NLW_gen_sdpram.xpm_memory_base_inst_sbiterra_UNCONNECTED\,
      sbiterrb => \NLW_gen_sdpram.xpm_memory_base_inst_sbiterrb_UNCONNECTED\,
      sleep => sleep,
      wea(0) => ram_wr_en_i,
      web(0) => '0'
    );
\gen_sdpram.xpm_memory_base_inst_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"62"
    )
        port map (
      I0 => curr_fwft_state(0),
      I1 => curr_fwft_state(1),
      I2 => rd_en,
      O => \gen_fwft.ram_regout_en\
    );
rdp_inst: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized0\
     port map (
      \FSM_sequential_gen_fwft.curr_fwft_state_reg[1]\ => rdp_inst_n_14,
      Q(13 downto 0) => rd_pntr_ext(13 downto 0),
      S(5) => rdp_inst_n_17,
      S(4) => rdp_inst_n_18,
      S(3) => rdp_inst_n_19,
      S(2) => rdp_inst_n_20,
      S(1) => rdp_inst_n_21,
      S(0) => rdp_inst_n_22,
      clr_full => clr_full,
      \count_value_i_reg[0]_0\(1 downto 0) => curr_fwft_state(1 downto 0),
      \count_value_i_reg[0]_1\(0) => xpm_fifo_rst_inst_n_1,
      \count_value_i_reg[7]_0\(6) => rdp_inst_n_23,
      \count_value_i_reg[7]_0\(5) => rdp_inst_n_24,
      \count_value_i_reg[7]_0\(4) => rdp_inst_n_25,
      \count_value_i_reg[7]_0\(3) => rdp_inst_n_26,
      \count_value_i_reg[7]_0\(2) => rdp_inst_n_27,
      \count_value_i_reg[7]_0\(1) => rdp_inst_n_28,
      \count_value_i_reg[7]_0\(0) => rdp_inst_n_29,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg\ => rdp_inst_n_16,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0\ => rdp_inst_n_30,
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0\(13 downto 0) => \count_value_i__0\(13 downto 0),
      \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg\ => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0\,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(13 downto 0) => wr_pntr_ext(13 downto 0),
      leaving_empty0 => leaving_empty0,
      ram_empty_i => ram_empty_i,
      ram_wr_en_i => ram_wr_en_i,
      rd_en => rd_en,
      wr_clk => wr_clk
    );
rdpp1_inst: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1\
     port map (
      Q(13) => rdpp1_inst_n_0,
      Q(12) => rdpp1_inst_n_1,
      Q(11) => rdpp1_inst_n_2,
      Q(10) => rdpp1_inst_n_3,
      Q(9) => rdpp1_inst_n_4,
      Q(8) => rdpp1_inst_n_5,
      Q(7) => rdpp1_inst_n_6,
      Q(6) => rdpp1_inst_n_7,
      Q(5) => rdpp1_inst_n_8,
      Q(4) => rdpp1_inst_n_9,
      Q(3) => rdpp1_inst_n_10,
      Q(2) => rdpp1_inst_n_11,
      Q(1) => rdpp1_inst_n_12,
      Q(0) => rdpp1_inst_n_13,
      \count_value_i_reg[0]_0\ => rdp_inst_n_14,
      \count_value_i_reg[0]_1\(0) => xpm_fifo_rst_inst_n_1,
      \count_value_i_reg[1]_0\(1 downto 0) => curr_fwft_state(1 downto 0),
      ram_empty_i => ram_empty_i,
      rd_en => rd_en,
      wr_clk => wr_clk
    );
rst_d1_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_reg_bit
     port map (
      DI(0) => rst_d1_inst_n_1,
      Q(0) => xpm_fifo_rst_inst_n_1,
      clr_full => clr_full,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg\ => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0\,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_0\ => rdp_inst_n_14,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_1\ => \gen_fwft.empty_fwft_i_reg_n_0\,
      read_only => read_only,
      rst => rst,
      rst_d1 => rst_d1,
      wr_clk => wr_clk,
      wr_en => wr_en,
      write_only => write_only
    );
wrp_inst: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized0_0\
     port map (
      D(13 downto 0) => diff_pntr_pe(13 downto 0),
      DI(0) => rst_d1_inst_n_1,
      Q(13 downto 0) => wr_pntr_ext(13 downto 0),
      S(7) => rdp_inst_n_23,
      S(6) => rdp_inst_n_24,
      S(5) => rdp_inst_n_25,
      S(4) => rdp_inst_n_26,
      S(3) => rdp_inst_n_27,
      S(2) => rdp_inst_n_28,
      S(1) => rdp_inst_n_29,
      S(0) => xpm_fifo_rst_inst_n_3,
      \count_value_i_reg[13]_0\(0) => xpm_fifo_rst_inst_n_1,
      \count_value_i_reg[6]_0\ => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0\,
      \gen_pntr_flags_cc.ram_empty_i_i_2_0\(13) => rdpp1_inst_n_0,
      \gen_pntr_flags_cc.ram_empty_i_i_2_0\(12) => rdpp1_inst_n_1,
      \gen_pntr_flags_cc.ram_empty_i_i_2_0\(11) => rdpp1_inst_n_2,
      \gen_pntr_flags_cc.ram_empty_i_i_2_0\(10) => rdpp1_inst_n_3,
      \gen_pntr_flags_cc.ram_empty_i_i_2_0\(9) => rdpp1_inst_n_4,
      \gen_pntr_flags_cc.ram_empty_i_i_2_0\(8) => rdpp1_inst_n_5,
      \gen_pntr_flags_cc.ram_empty_i_i_2_0\(7) => rdpp1_inst_n_6,
      \gen_pntr_flags_cc.ram_empty_i_i_2_0\(6) => rdpp1_inst_n_7,
      \gen_pntr_flags_cc.ram_empty_i_i_2_0\(5) => rdpp1_inst_n_8,
      \gen_pntr_flags_cc.ram_empty_i_i_2_0\(4) => rdpp1_inst_n_9,
      \gen_pntr_flags_cc.ram_empty_i_i_2_0\(3) => rdpp1_inst_n_10,
      \gen_pntr_flags_cc.ram_empty_i_i_2_0\(2) => rdpp1_inst_n_11,
      \gen_pntr_flags_cc.ram_empty_i_i_2_0\(1) => rdpp1_inst_n_12,
      \gen_pntr_flags_cc.ram_empty_i_i_2_0\(0) => rdpp1_inst_n_13,
      \gen_pntr_flags_cc.ram_empty_i_reg\ => rdp_inst_n_14,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(5) => rdp_inst_n_17,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(4) => rdp_inst_n_18,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(3) => rdp_inst_n_19,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(2) => rdp_inst_n_20,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(1) => rdp_inst_n_21,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]\(0) => rdp_inst_n_22,
      leaving_empty0 => leaving_empty0,
      ram_empty_i => ram_empty_i,
      ram_empty_i0 => ram_empty_i0,
      ram_wr_en_i => ram_wr_en_i,
      rst_d1 => rst_d1,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
wrpp1_inst: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_counter_updn__parameterized1_1\
     port map (
      Q(13 downto 0) => \count_value_i__0\(13 downto 0),
      \count_value_i_reg[0]_0\(0) => xpm_fifo_rst_inst_n_1,
      \count_value_i_reg[6]_0\ => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0\,
      ram_wr_en_i => ram_wr_en_i,
      rst_d1 => rst_d1,
      wr_clk => wr_clk,
      wr_en => wr_en
    );
xpm_fifo_rst_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_rst
     port map (
      Q(0) => xpm_fifo_rst_inst_n_1,
      S(0) => xpm_fifo_rst_inst_n_3,
      \count_value_i_reg[13]\ => \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0\,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]\ => rdp_inst_n_14,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_0\ => \gen_fwft.empty_fwft_i_reg_n_0\,
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_1\(0) => rd_pntr_ext(0),
      \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg\ => xpm_fifo_rst_inst_n_2,
      prog_empty => \^prog_empty\,
      prog_empty_i1 => prog_empty_i1,
      ram_wr_en_i => ram_wr_en_i,
      read_only_q => read_only_q,
      rst => rst,
      rst_d1 => rst_d1,
      wr_clk => wr_clk,
      wr_en => wr_en,
      write_only_q => write_only_q
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis is
  port (
    s_aresetn : in STD_LOGIC;
    s_aclk : in STD_LOGIC;
    m_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    prog_full_axis : out STD_LOGIC;
    wr_data_count_axis : out STD_LOGIC_VECTOR ( 14 downto 0 );
    almost_full_axis : out STD_LOGIC;
    prog_empty_axis : out STD_LOGIC;
    rd_data_count_axis : out STD_LOGIC_VECTOR ( 14 downto 0 );
    almost_empty_axis : out STD_LOGIC;
    injectsbiterr_axis : in STD_LOGIC;
    injectdbiterr_axis : in STD_LOGIC;
    sbiterr_axis : out STD_LOGIC;
    dbiterr_axis : out STD_LOGIC
  );
  attribute AXIS_DATA_WIDTH : integer;
  attribute AXIS_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 84;
  attribute AXIS_FINAL_DATA_WIDTH : integer;
  attribute AXIS_FINAL_DATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 84;
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 0;
  attribute CDC_SYNC_STAGES : integer;
  attribute CDC_SYNC_STAGES of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 3;
  attribute CLOCKING_MODE : string;
  attribute CLOCKING_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is "common_clock";
  attribute ECC_MODE : string;
  attribute ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is "no_ecc";
  attribute EN_ADV_FEATURE_AXIS : string;
  attribute EN_ADV_FEATURE_AXIS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is "16'b0001001000000000";
  attribute EN_ADV_FEATURE_AXIS_INT : string;
  attribute EN_ADV_FEATURE_AXIS_INT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is "16'b0001001000000000";
  attribute EN_ALMOST_EMPTY_INT : string;
  attribute EN_ALMOST_EMPTY_INT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is "1'b0";
  attribute EN_ALMOST_FULL_INT : string;
  attribute EN_ALMOST_FULL_INT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is "1'b0";
  attribute EN_DATA_VALID_INT : string;
  attribute EN_DATA_VALID_INT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is "1'b1";
  attribute FIFO_DEPTH : integer;
  attribute FIFO_DEPTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 16384;
  attribute FIFO_MEMORY_TYPE : string;
  attribute FIFO_MEMORY_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is "auto";
  attribute LOG_DEPTH_AXIS : integer;
  attribute LOG_DEPTH_AXIS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 14;
  attribute PACKET_FIFO : string;
  attribute PACKET_FIFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is "false";
  attribute PKT_SIZE_LT8 : string;
  attribute PKT_SIZE_LT8 of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is "1'b0";
  attribute PROG_EMPTY_THRESH : integer;
  attribute PROG_EMPTY_THRESH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 1400;
  attribute PROG_FULL_THRESH : integer;
  attribute PROG_FULL_THRESH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 11;
  attribute P_COMMON_CLOCK : integer;
  attribute P_COMMON_CLOCK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 1;
  attribute P_ECC_MODE : integer;
  attribute P_ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 0;
  attribute P_FIFO_MEMORY_TYPE : integer;
  attribute P_FIFO_MEMORY_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 0;
  attribute P_PKT_MODE : integer;
  attribute P_PKT_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 0;
  attribute RD_DATA_COUNT_WIDTH : integer;
  attribute RD_DATA_COUNT_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 15;
  attribute RELATED_CLOCKS : integer;
  attribute RELATED_CLOCKS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 0;
  attribute TDATA_OFFSET : integer;
  attribute TDATA_OFFSET of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 64;
  attribute TDATA_WIDTH : integer;
  attribute TDATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 64;
  attribute TDEST_OFFSET : integer;
  attribute TDEST_OFFSET of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 82;
  attribute TDEST_WIDTH : integer;
  attribute TDEST_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 1;
  attribute TID_OFFSET : integer;
  attribute TID_OFFSET of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 81;
  attribute TID_WIDTH : integer;
  attribute TID_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 1;
  attribute TKEEP_OFFSET : integer;
  attribute TKEEP_OFFSET of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 80;
  attribute TSTRB_OFFSET : integer;
  attribute TSTRB_OFFSET of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 72;
  attribute TUSER_MAX_WIDTH : integer;
  attribute TUSER_MAX_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 4013;
  attribute TUSER_OFFSET : integer;
  attribute TUSER_OFFSET of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 83;
  attribute TUSER_WIDTH : integer;
  attribute TUSER_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 1;
  attribute USE_ADV_FEATURES : integer;
  attribute USE_ADV_FEATURES of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 825372720;
  attribute USE_ADV_FEATURES_INT : integer;
  attribute USE_ADV_FEATURES_INT of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 825372720;
  attribute WR_DATA_COUNT_WIDTH : integer;
  attribute WR_DATA_COUNT_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is 15;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is "TRUE";
  attribute dont_touch : string;
  attribute dont_touch of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis : entity is "true";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis is
  signal \<const0>\ : STD_LOGIC;
  signal \gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1_n_0\ : STD_LOGIC;
  signal \^m_axis_tvalid\ : STD_LOGIC;
  signal rst_axis : STD_LOGIC;
  signal xpm_fifo_base_inst_i_1_n_0 : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_full_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_overflow_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_rd_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_underflow_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_wr_ack_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_wr_rst_busy_UNCONNECTED : STD_LOGIC;
  signal NLW_xpm_fifo_base_inst_dout_UNCONNECTED : STD_LOGIC_VECTOR ( 82 downto 64 );
  signal NLW_xpm_fifo_base_inst_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal NLW_xpm_fifo_base_inst_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 14 downto 0 );
  attribute DEF_VAL : string;
  attribute DEF_VAL of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is "1'b0";
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is 4;
  attribute INIT : string;
  attribute INIT of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is "0";
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is 1;
  attribute SIM_ASSERT_CHK of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is 0;
  attribute VERSION : integer;
  attribute VERSION of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is 0;
  attribute XPM_CDC : string;
  attribute XPM_CDC of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is "SYNC_RST";
  attribute XPM_MODULE of \gaxis_rst_sync.xpm_cdc_sync_rst_inst\ : label is "TRUE";
  attribute CASCADE_HEIGHT of xpm_fifo_base_inst : label is 0;
  attribute CDC_DEST_SYNC_FF : integer;
  attribute CDC_DEST_SYNC_FF of xpm_fifo_base_inst : label is 3;
  attribute COMMON_CLOCK : integer;
  attribute COMMON_CLOCK of xpm_fifo_base_inst : label is 1;
  attribute DOUT_RESET_VALUE : string;
  attribute DOUT_RESET_VALUE of xpm_fifo_base_inst : label is "";
  attribute ECC_MODE_integer : integer;
  attribute ECC_MODE_integer of xpm_fifo_base_inst : label is 0;
  attribute ENABLE_ECC : integer;
  attribute ENABLE_ECC of xpm_fifo_base_inst : label is 0;
  attribute EN_ADV_FEATURE : string;
  attribute EN_ADV_FEATURE of xpm_fifo_base_inst : label is "16'b0001001000000000";
  attribute EN_AE : string;
  attribute EN_AE of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_AF : string;
  attribute EN_AF of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_DVLD : string;
  attribute EN_DVLD of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_OF : string;
  attribute EN_OF of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_PE : string;
  attribute EN_PE of xpm_fifo_base_inst : label is "1'b1";
  attribute EN_PF : string;
  attribute EN_PF of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_RDC : string;
  attribute EN_RDC of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_UF : string;
  attribute EN_UF of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_WACK : string;
  attribute EN_WACK of xpm_fifo_base_inst : label is "1'b0";
  attribute EN_WDC : string;
  attribute EN_WDC of xpm_fifo_base_inst : label is "1'b0";
  attribute FG_EQ_ASYM_DOUT : string;
  attribute FG_EQ_ASYM_DOUT of xpm_fifo_base_inst : label is "1'b0";
  attribute FIFO_MEMORY_TYPE_integer : integer;
  attribute FIFO_MEMORY_TYPE_integer of xpm_fifo_base_inst : label is 0;
  attribute FIFO_MEM_TYPE : integer;
  attribute FIFO_MEM_TYPE of xpm_fifo_base_inst : label is 0;
  attribute FIFO_READ_DEPTH : integer;
  attribute FIFO_READ_DEPTH of xpm_fifo_base_inst : label is 16384;
  attribute FIFO_READ_LATENCY : integer;
  attribute FIFO_READ_LATENCY of xpm_fifo_base_inst : label is 0;
  attribute FIFO_SIZE : integer;
  attribute FIFO_SIZE of xpm_fifo_base_inst : label is 1376256;
  attribute FIFO_WRITE_DEPTH : integer;
  attribute FIFO_WRITE_DEPTH of xpm_fifo_base_inst : label is 16384;
  attribute FULL_RESET_VALUE : integer;
  attribute FULL_RESET_VALUE of xpm_fifo_base_inst : label is 1;
  attribute FULL_RST_VAL : string;
  attribute FULL_RST_VAL of xpm_fifo_base_inst : label is "1'b1";
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of xpm_fifo_base_inst : label is "soft";
  attribute PE_THRESH_ADJ : integer;
  attribute PE_THRESH_ADJ of xpm_fifo_base_inst : label is 1398;
  attribute PE_THRESH_MAX : integer;
  attribute PE_THRESH_MAX of xpm_fifo_base_inst : label is 16379;
  attribute PE_THRESH_MIN : integer;
  attribute PE_THRESH_MIN of xpm_fifo_base_inst : label is 5;
  attribute PF_THRESH_ADJ : integer;
  attribute PF_THRESH_ADJ of xpm_fifo_base_inst : label is 9;
  attribute PF_THRESH_MAX : integer;
  attribute PF_THRESH_MAX of xpm_fifo_base_inst : label is 16379;
  attribute PF_THRESH_MIN : integer;
  attribute PF_THRESH_MIN of xpm_fifo_base_inst : label is 5;
  attribute PROG_EMPTY_THRESH of xpm_fifo_base_inst : label is 1400;
  attribute PROG_FULL_THRESH of xpm_fifo_base_inst : label is 11;
  attribute RD_DATA_COUNT_WIDTH of xpm_fifo_base_inst : label is 15;
  attribute RD_DC_WIDTH_EXT : integer;
  attribute RD_DC_WIDTH_EXT of xpm_fifo_base_inst : label is 15;
  attribute RD_LATENCY : integer;
  attribute RD_LATENCY of xpm_fifo_base_inst : label is 2;
  attribute RD_MODE : integer;
  attribute RD_MODE of xpm_fifo_base_inst : label is 1;
  attribute RD_PNTR_WIDTH : integer;
  attribute RD_PNTR_WIDTH of xpm_fifo_base_inst : label is 14;
  attribute READ_DATA_WIDTH : integer;
  attribute READ_DATA_WIDTH of xpm_fifo_base_inst : label is 84;
  attribute READ_MODE : integer;
  attribute READ_MODE of xpm_fifo_base_inst : label is 1;
  attribute READ_MODE_LL : integer;
  attribute READ_MODE_LL of xpm_fifo_base_inst : label is 1;
  attribute RELATED_CLOCKS of xpm_fifo_base_inst : label is 0;
  attribute REMOVE_WR_RD_PROT_LOGIC : integer;
  attribute REMOVE_WR_RD_PROT_LOGIC of xpm_fifo_base_inst : label is 0;
  attribute SIM_ASSERT_CHK of xpm_fifo_base_inst : label is 0;
  attribute USE_ADV_FEATURES of xpm_fifo_base_inst : label is 825372720;
  attribute VERSION of xpm_fifo_base_inst : label is 0;
  attribute WAKEUP_TIME : integer;
  attribute WAKEUP_TIME of xpm_fifo_base_inst : label is 0;
  attribute WIDTH_RATIO : integer;
  attribute WIDTH_RATIO of xpm_fifo_base_inst : label is 1;
  attribute WRITE_DATA_WIDTH : integer;
  attribute WRITE_DATA_WIDTH of xpm_fifo_base_inst : label is 84;
  attribute WR_DATA_COUNT_WIDTH of xpm_fifo_base_inst : label is 15;
  attribute WR_DC_WIDTH_EXT : integer;
  attribute WR_DC_WIDTH_EXT of xpm_fifo_base_inst : label is 15;
  attribute WR_DEPTH_LOG : integer;
  attribute WR_DEPTH_LOG of xpm_fifo_base_inst : label is 14;
  attribute WR_PNTR_WIDTH : integer;
  attribute WR_PNTR_WIDTH of xpm_fifo_base_inst : label is 14;
  attribute WR_RD_RATIO : integer;
  attribute WR_RD_RATIO of xpm_fifo_base_inst : label is 0;
  attribute WR_WIDTH_LOG : integer;
  attribute WR_WIDTH_LOG of xpm_fifo_base_inst : label is 7;
  attribute XPM_MODULE of xpm_fifo_base_inst : label is "TRUE";
  attribute both_stages_valid : integer;
  attribute both_stages_valid of xpm_fifo_base_inst : label is 3;
  attribute invalid : integer;
  attribute invalid of xpm_fifo_base_inst : label is 0;
  attribute stage1_valid : integer;
  attribute stage1_valid of xpm_fifo_base_inst : label is 2;
  attribute stage2_valid : integer;
  attribute stage2_valid of xpm_fifo_base_inst : label is 1;
begin
  almost_empty_axis <= \<const0>\;
  almost_full_axis <= \<const0>\;
  dbiterr_axis <= \<const0>\;
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tkeep(7) <= \<const0>\;
  m_axis_tkeep(6) <= \<const0>\;
  m_axis_tkeep(5) <= \<const0>\;
  m_axis_tkeep(4) <= \<const0>\;
  m_axis_tkeep(3) <= \<const0>\;
  m_axis_tkeep(2) <= \<const0>\;
  m_axis_tkeep(1) <= \<const0>\;
  m_axis_tkeep(0) <= \<const0>\;
  m_axis_tstrb(7) <= \<const0>\;
  m_axis_tstrb(6) <= \<const0>\;
  m_axis_tstrb(5) <= \<const0>\;
  m_axis_tstrb(4) <= \<const0>\;
  m_axis_tstrb(3) <= \<const0>\;
  m_axis_tstrb(2) <= \<const0>\;
  m_axis_tstrb(1) <= \<const0>\;
  m_axis_tstrb(0) <= \<const0>\;
  m_axis_tuser(0) <= \<const0>\;
  m_axis_tvalid <= \^m_axis_tvalid\;
  prog_full_axis <= \<const0>\;
  rd_data_count_axis(14) <= \<const0>\;
  rd_data_count_axis(13) <= \<const0>\;
  rd_data_count_axis(12) <= \<const0>\;
  rd_data_count_axis(11) <= \<const0>\;
  rd_data_count_axis(10) <= \<const0>\;
  rd_data_count_axis(9) <= \<const0>\;
  rd_data_count_axis(8) <= \<const0>\;
  rd_data_count_axis(7) <= \<const0>\;
  rd_data_count_axis(6) <= \<const0>\;
  rd_data_count_axis(5) <= \<const0>\;
  rd_data_count_axis(4) <= \<const0>\;
  rd_data_count_axis(3) <= \<const0>\;
  rd_data_count_axis(2) <= \<const0>\;
  rd_data_count_axis(1) <= \<const0>\;
  rd_data_count_axis(0) <= \<const0>\;
  sbiterr_axis <= \<const0>\;
  wr_data_count_axis(14) <= \<const0>\;
  wr_data_count_axis(13) <= \<const0>\;
  wr_data_count_axis(12) <= \<const0>\;
  wr_data_count_axis(11) <= \<const0>\;
  wr_data_count_axis(10) <= \<const0>\;
  wr_data_count_axis(9) <= \<const0>\;
  wr_data_count_axis(8) <= \<const0>\;
  wr_data_count_axis(7) <= \<const0>\;
  wr_data_count_axis(6) <= \<const0>\;
  wr_data_count_axis(5) <= \<const0>\;
  wr_data_count_axis(4) <= \<const0>\;
  wr_data_count_axis(3) <= \<const0>\;
  wr_data_count_axis(2) <= \<const0>\;
  wr_data_count_axis(1) <= \<const0>\;
  wr_data_count_axis(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gaxis_rst_sync.xpm_cdc_sync_rst_inst\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_sync_rst
     port map (
      dest_clk => s_aclk,
      dest_rst => rst_axis,
      src_rst => \gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1_n_0\
    );
\gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_aresetn,
      O => \gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1_n_0\
    );
xpm_fifo_base_inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_base
     port map (
      almost_empty => NLW_xpm_fifo_base_inst_almost_empty_UNCONNECTED,
      almost_full => NLW_xpm_fifo_base_inst_almost_full_UNCONNECTED,
      data_valid => \^m_axis_tvalid\,
      dbiterr => NLW_xpm_fifo_base_inst_dbiterr_UNCONNECTED,
      din(83) => s_axis_tlast,
      din(82 downto 64) => B"0000000000000000000",
      din(63 downto 0) => s_axis_tdata(63 downto 0),
      dout(83) => m_axis_tlast,
      dout(82 downto 64) => NLW_xpm_fifo_base_inst_dout_UNCONNECTED(82 downto 64),
      dout(63 downto 0) => m_axis_tdata(63 downto 0),
      empty => NLW_xpm_fifo_base_inst_empty_UNCONNECTED,
      full => NLW_xpm_fifo_base_inst_full_UNCONNECTED,
      full_n => s_axis_tready,
      injectdbiterr => '0',
      injectsbiterr => '0',
      overflow => NLW_xpm_fifo_base_inst_overflow_UNCONNECTED,
      prog_empty => prog_empty_axis,
      prog_full => NLW_xpm_fifo_base_inst_prog_full_UNCONNECTED,
      rd_clk => '0',
      rd_data_count(14 downto 0) => NLW_xpm_fifo_base_inst_rd_data_count_UNCONNECTED(14 downto 0),
      rd_en => xpm_fifo_base_inst_i_1_n_0,
      rd_rst_busy => NLW_xpm_fifo_base_inst_rd_rst_busy_UNCONNECTED,
      rst => rst_axis,
      sbiterr => NLW_xpm_fifo_base_inst_sbiterr_UNCONNECTED,
      sleep => '0',
      underflow => NLW_xpm_fifo_base_inst_underflow_UNCONNECTED,
      wr_ack => NLW_xpm_fifo_base_inst_wr_ack_UNCONNECTED,
      wr_clk => s_aclk,
      wr_data_count(14 downto 0) => NLW_xpm_fifo_base_inst_wr_data_count_UNCONNECTED(14 downto 0),
      wr_en => s_axis_tvalid,
      wr_rst_busy => NLW_xpm_fifo_base_inst_wr_rst_busy_UNCONNECTED
    );
xpm_fifo_base_inst_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^m_axis_tvalid\,
      I1 => m_axis_tready,
      O => xpm_fifo_base_inst_i_1_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top is
  port (
    s_axis_aclk : in STD_LOGIC;
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclken : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tstrb : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tkeep : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    s_axis_tid : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tdest : in STD_LOGIC_VECTOR ( 0 to 0 );
    s_axis_tuser : in STD_LOGIC_VECTOR ( 0 to 0 );
    almost_full : out STD_LOGIC;
    prog_full : out STD_LOGIC;
    axis_wr_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    injectsbiterr : in STD_LOGIC;
    injectdbiterr : in STD_LOGIC;
    m_axis_aclk : in STD_LOGIC;
    m_axis_aclken : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tstrb : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tkeep : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    m_axis_tid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tdest : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axis_tuser : out STD_LOGIC_VECTOR ( 0 to 0 );
    almost_empty : out STD_LOGIC;
    prog_empty : out STD_LOGIC;
    axis_rd_data_count : out STD_LOGIC_VECTOR ( 31 downto 0 );
    sbiterr : out STD_LOGIC;
    dbiterr : out STD_LOGIC
  );
  attribute C_ACLKEN_CONV_MODE : integer;
  attribute C_ACLKEN_CONV_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 0;
  attribute C_AXIS_SIGNAL_SET : integer;
  attribute C_AXIS_SIGNAL_SET of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 19;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 64;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 1;
  attribute C_ECC_MODE : integer;
  attribute C_ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is "zynquplus";
  attribute C_FIFO_DEPTH : integer;
  attribute C_FIFO_DEPTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 16384;
  attribute C_FIFO_MEMORY_TYPE : string;
  attribute C_FIFO_MEMORY_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is "auto";
  attribute C_FIFO_MODE : integer;
  attribute C_FIFO_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 1;
  attribute C_IS_ACLK_ASYNC : integer;
  attribute C_IS_ACLK_ASYNC of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 0;
  attribute C_PROG_EMPTY_THRESH : integer;
  attribute C_PROG_EMPTY_THRESH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 1400;
  attribute C_PROG_FULL_THRESH : integer;
  attribute C_PROG_FULL_THRESH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 11;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 3;
  attribute C_USE_ADV_FEATURES : integer;
  attribute C_USE_ADV_FEATURES of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 825372720;
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 1;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 6;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 5;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 4;
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 0;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 2;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 7;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 2;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 64;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 32;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 16;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 1;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 4;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 2;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 0;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 1;
  attribute LP_CDC_SYNC_STAGES : integer;
  attribute LP_CDC_SYNC_STAGES of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 3;
  attribute LP_CLOCKING_MODE : string;
  attribute LP_CLOCKING_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is "common_clock";
  attribute LP_ECC_MODE : string;
  attribute LP_ECC_MODE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is "no_ecc";
  attribute LP_FIFO_DEPTH : integer;
  attribute LP_FIFO_DEPTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 16384;
  attribute LP_FIFO_MEMORY_TYPE : string;
  attribute LP_FIFO_MEMORY_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is "auto";
  attribute LP_M_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_M_ACLKEN_CAN_TOGGLE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 0;
  attribute LP_PACKET_FIFO : string;
  attribute LP_PACKET_FIFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is "false";
  attribute LP_PROG_EMPTY_THRESH : integer;
  attribute LP_PROG_EMPTY_THRESH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 1400;
  attribute LP_PROG_FULL_THRESH : integer;
  attribute LP_PROG_FULL_THRESH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 11;
  attribute LP_RD_DATA_COUNT_WIDTH : integer;
  attribute LP_RD_DATA_COUNT_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 15;
  attribute LP_RELATED_CLOCKS : integer;
  attribute LP_RELATED_CLOCKS of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 0;
  attribute LP_S_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_S_ACLKEN_CAN_TOGGLE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 0;
  attribute LP_TDATA_WIDTH : integer;
  attribute LP_TDATA_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 64;
  attribute LP_TDEST_WIDTH : integer;
  attribute LP_TDEST_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 1;
  attribute LP_TID_WIDTH : integer;
  attribute LP_TID_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 1;
  attribute LP_TUSER_WIDTH : integer;
  attribute LP_TUSER_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 1;
  attribute LP_USE_ADV_FEATURES : integer;
  attribute LP_USE_ADV_FEATURES of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 825372720;
  attribute LP_WR_DATA_COUNT_WIDTH : integer;
  attribute LP_WR_DATA_COUNT_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top : entity is 15;
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top is
  signal \<const0>\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_100\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_101\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_102\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_104\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_105\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_106\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_107\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_108\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_109\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_110\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_111\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_112\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_113\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_114\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_115\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_116\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_117\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_118\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_119\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_120\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_121\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_86\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_87\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_88\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_89\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_90\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_91\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_92\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_93\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_94\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_95\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_96\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_97\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_98\ : STD_LOGIC;
  signal \gen_fifo.xpm_fifo_axis_inst_n_99\ : STD_LOGIC;
  signal \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tdest_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tid_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tkeep_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tstrb_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tuser_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute AXIS_DATA_WIDTH : integer;
  attribute AXIS_DATA_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 84;
  attribute AXIS_FINAL_DATA_WIDTH : integer;
  attribute AXIS_FINAL_DATA_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 84;
  attribute CASCADE_HEIGHT : integer;
  attribute CASCADE_HEIGHT of \gen_fifo.xpm_fifo_axis_inst\ : label is 0;
  attribute CDC_SYNC_STAGES : integer;
  attribute CDC_SYNC_STAGES of \gen_fifo.xpm_fifo_axis_inst\ : label is 3;
  attribute CLOCKING_MODE : string;
  attribute CLOCKING_MODE of \gen_fifo.xpm_fifo_axis_inst\ : label is "common_clock";
  attribute ECC_MODE : string;
  attribute ECC_MODE of \gen_fifo.xpm_fifo_axis_inst\ : label is "no_ecc";
  attribute EN_ADV_FEATURE_AXIS : string;
  attribute EN_ADV_FEATURE_AXIS of \gen_fifo.xpm_fifo_axis_inst\ : label is "16'b0001001000000000";
  attribute EN_ADV_FEATURE_AXIS_INT : string;
  attribute EN_ADV_FEATURE_AXIS_INT of \gen_fifo.xpm_fifo_axis_inst\ : label is "16'b0001001000000000";
  attribute EN_ALMOST_EMPTY_INT : string;
  attribute EN_ALMOST_EMPTY_INT of \gen_fifo.xpm_fifo_axis_inst\ : label is "1'b0";
  attribute EN_ALMOST_FULL_INT : string;
  attribute EN_ALMOST_FULL_INT of \gen_fifo.xpm_fifo_axis_inst\ : label is "1'b0";
  attribute EN_DATA_VALID_INT : string;
  attribute EN_DATA_VALID_INT of \gen_fifo.xpm_fifo_axis_inst\ : label is "1'b1";
  attribute FIFO_DEPTH : integer;
  attribute FIFO_DEPTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 16384;
  attribute FIFO_MEMORY_TYPE : string;
  attribute FIFO_MEMORY_TYPE of \gen_fifo.xpm_fifo_axis_inst\ : label is "auto";
  attribute LOG_DEPTH_AXIS : integer;
  attribute LOG_DEPTH_AXIS of \gen_fifo.xpm_fifo_axis_inst\ : label is 14;
  attribute PACKET_FIFO : string;
  attribute PACKET_FIFO of \gen_fifo.xpm_fifo_axis_inst\ : label is "false";
  attribute PKT_SIZE_LT8 : string;
  attribute PKT_SIZE_LT8 of \gen_fifo.xpm_fifo_axis_inst\ : label is "1'b0";
  attribute PROG_EMPTY_THRESH : integer;
  attribute PROG_EMPTY_THRESH of \gen_fifo.xpm_fifo_axis_inst\ : label is 1400;
  attribute PROG_FULL_THRESH : integer;
  attribute PROG_FULL_THRESH of \gen_fifo.xpm_fifo_axis_inst\ : label is 11;
  attribute P_COMMON_CLOCK : integer;
  attribute P_COMMON_CLOCK of \gen_fifo.xpm_fifo_axis_inst\ : label is 1;
  attribute P_ECC_MODE : integer;
  attribute P_ECC_MODE of \gen_fifo.xpm_fifo_axis_inst\ : label is 0;
  attribute P_FIFO_MEMORY_TYPE : integer;
  attribute P_FIFO_MEMORY_TYPE of \gen_fifo.xpm_fifo_axis_inst\ : label is 0;
  attribute P_PKT_MODE : integer;
  attribute P_PKT_MODE of \gen_fifo.xpm_fifo_axis_inst\ : label is 0;
  attribute RD_DATA_COUNT_WIDTH : integer;
  attribute RD_DATA_COUNT_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 15;
  attribute RELATED_CLOCKS : integer;
  attribute RELATED_CLOCKS of \gen_fifo.xpm_fifo_axis_inst\ : label is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of \gen_fifo.xpm_fifo_axis_inst\ : label is 0;
  attribute TDATA_OFFSET : integer;
  attribute TDATA_OFFSET of \gen_fifo.xpm_fifo_axis_inst\ : label is 64;
  attribute TDATA_WIDTH : integer;
  attribute TDATA_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 64;
  attribute TDEST_OFFSET : integer;
  attribute TDEST_OFFSET of \gen_fifo.xpm_fifo_axis_inst\ : label is 82;
  attribute TDEST_WIDTH : integer;
  attribute TDEST_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 1;
  attribute TID_OFFSET : integer;
  attribute TID_OFFSET of \gen_fifo.xpm_fifo_axis_inst\ : label is 81;
  attribute TID_WIDTH : integer;
  attribute TID_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 1;
  attribute TKEEP_OFFSET : integer;
  attribute TKEEP_OFFSET of \gen_fifo.xpm_fifo_axis_inst\ : label is 80;
  attribute TSTRB_OFFSET : integer;
  attribute TSTRB_OFFSET of \gen_fifo.xpm_fifo_axis_inst\ : label is 72;
  attribute TUSER_MAX_WIDTH : integer;
  attribute TUSER_MAX_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 4013;
  attribute TUSER_OFFSET : integer;
  attribute TUSER_OFFSET of \gen_fifo.xpm_fifo_axis_inst\ : label is 83;
  attribute TUSER_WIDTH : integer;
  attribute TUSER_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 1;
  attribute USE_ADV_FEATURES : integer;
  attribute USE_ADV_FEATURES of \gen_fifo.xpm_fifo_axis_inst\ : label is 825372720;
  attribute USE_ADV_FEATURES_INT : integer;
  attribute USE_ADV_FEATURES_INT of \gen_fifo.xpm_fifo_axis_inst\ : label is 825372720;
  attribute WR_DATA_COUNT_WIDTH : integer;
  attribute WR_DATA_COUNT_WIDTH of \gen_fifo.xpm_fifo_axis_inst\ : label is 15;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of \gen_fifo.xpm_fifo_axis_inst\ : label is "TRUE";
begin
  almost_empty <= \<const0>\;
  almost_full <= \<const0>\;
  axis_rd_data_count(31) <= \<const0>\;
  axis_rd_data_count(30) <= \<const0>\;
  axis_rd_data_count(29) <= \<const0>\;
  axis_rd_data_count(28) <= \<const0>\;
  axis_rd_data_count(27) <= \<const0>\;
  axis_rd_data_count(26) <= \<const0>\;
  axis_rd_data_count(25) <= \<const0>\;
  axis_rd_data_count(24) <= \<const0>\;
  axis_rd_data_count(23) <= \<const0>\;
  axis_rd_data_count(22) <= \<const0>\;
  axis_rd_data_count(21) <= \<const0>\;
  axis_rd_data_count(20) <= \<const0>\;
  axis_rd_data_count(19) <= \<const0>\;
  axis_rd_data_count(18) <= \<const0>\;
  axis_rd_data_count(17) <= \<const0>\;
  axis_rd_data_count(16) <= \<const0>\;
  axis_rd_data_count(15) <= \<const0>\;
  axis_rd_data_count(14) <= \<const0>\;
  axis_rd_data_count(13) <= \<const0>\;
  axis_rd_data_count(12) <= \<const0>\;
  axis_rd_data_count(11) <= \<const0>\;
  axis_rd_data_count(10) <= \<const0>\;
  axis_rd_data_count(9) <= \<const0>\;
  axis_rd_data_count(8) <= \<const0>\;
  axis_rd_data_count(7) <= \<const0>\;
  axis_rd_data_count(6) <= \<const0>\;
  axis_rd_data_count(5) <= \<const0>\;
  axis_rd_data_count(4) <= \<const0>\;
  axis_rd_data_count(3) <= \<const0>\;
  axis_rd_data_count(2) <= \<const0>\;
  axis_rd_data_count(1) <= \<const0>\;
  axis_rd_data_count(0) <= \<const0>\;
  axis_wr_data_count(31) <= \<const0>\;
  axis_wr_data_count(30) <= \<const0>\;
  axis_wr_data_count(29) <= \<const0>\;
  axis_wr_data_count(28) <= \<const0>\;
  axis_wr_data_count(27) <= \<const0>\;
  axis_wr_data_count(26) <= \<const0>\;
  axis_wr_data_count(25) <= \<const0>\;
  axis_wr_data_count(24) <= \<const0>\;
  axis_wr_data_count(23) <= \<const0>\;
  axis_wr_data_count(22) <= \<const0>\;
  axis_wr_data_count(21) <= \<const0>\;
  axis_wr_data_count(20) <= \<const0>\;
  axis_wr_data_count(19) <= \<const0>\;
  axis_wr_data_count(18) <= \<const0>\;
  axis_wr_data_count(17) <= \<const0>\;
  axis_wr_data_count(16) <= \<const0>\;
  axis_wr_data_count(15) <= \<const0>\;
  axis_wr_data_count(14) <= \<const0>\;
  axis_wr_data_count(13) <= \<const0>\;
  axis_wr_data_count(12) <= \<const0>\;
  axis_wr_data_count(11) <= \<const0>\;
  axis_wr_data_count(10) <= \<const0>\;
  axis_wr_data_count(9) <= \<const0>\;
  axis_wr_data_count(8) <= \<const0>\;
  axis_wr_data_count(7) <= \<const0>\;
  axis_wr_data_count(6) <= \<const0>\;
  axis_wr_data_count(5) <= \<const0>\;
  axis_wr_data_count(4) <= \<const0>\;
  axis_wr_data_count(3) <= \<const0>\;
  axis_wr_data_count(2) <= \<const0>\;
  axis_wr_data_count(1) <= \<const0>\;
  axis_wr_data_count(0) <= \<const0>\;
  dbiterr <= \<const0>\;
  m_axis_tdest(0) <= \<const0>\;
  m_axis_tid(0) <= \<const0>\;
  m_axis_tkeep(7) <= \<const0>\;
  m_axis_tkeep(6) <= \<const0>\;
  m_axis_tkeep(5) <= \<const0>\;
  m_axis_tkeep(4) <= \<const0>\;
  m_axis_tkeep(3) <= \<const0>\;
  m_axis_tkeep(2) <= \<const0>\;
  m_axis_tkeep(1) <= \<const0>\;
  m_axis_tkeep(0) <= \<const0>\;
  m_axis_tstrb(7) <= \<const0>\;
  m_axis_tstrb(6) <= \<const0>\;
  m_axis_tstrb(5) <= \<const0>\;
  m_axis_tstrb(4) <= \<const0>\;
  m_axis_tstrb(3) <= \<const0>\;
  m_axis_tstrb(2) <= \<const0>\;
  m_axis_tstrb(1) <= \<const0>\;
  m_axis_tstrb(0) <= \<const0>\;
  m_axis_tuser(0) <= \<const0>\;
  prog_full <= \<const0>\;
  sbiterr <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\gen_fifo.xpm_fifo_axis_inst\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_fifo_axis
     port map (
      almost_empty_axis => \gen_fifo.xpm_fifo_axis_inst_n_119\,
      almost_full_axis => \gen_fifo.xpm_fifo_axis_inst_n_102\,
      dbiterr_axis => \gen_fifo.xpm_fifo_axis_inst_n_121\,
      injectdbiterr_axis => '0',
      injectsbiterr_axis => '0',
      m_aclk => s_axis_aclk,
      m_axis_tdata(63 downto 0) => m_axis_tdata(63 downto 0),
      m_axis_tdest(0) => \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tdest_UNCONNECTED\(0),
      m_axis_tid(0) => \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tid_UNCONNECTED\(0),
      m_axis_tkeep(7 downto 0) => \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tkeep_UNCONNECTED\(7 downto 0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      m_axis_tstrb(7 downto 0) => \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tstrb_UNCONNECTED\(7 downto 0),
      m_axis_tuser(0) => \NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tuser_UNCONNECTED\(0),
      m_axis_tvalid => m_axis_tvalid,
      prog_empty_axis => prog_empty,
      prog_full_axis => \gen_fifo.xpm_fifo_axis_inst_n_86\,
      rd_data_count_axis(14) => \gen_fifo.xpm_fifo_axis_inst_n_104\,
      rd_data_count_axis(13) => \gen_fifo.xpm_fifo_axis_inst_n_105\,
      rd_data_count_axis(12) => \gen_fifo.xpm_fifo_axis_inst_n_106\,
      rd_data_count_axis(11) => \gen_fifo.xpm_fifo_axis_inst_n_107\,
      rd_data_count_axis(10) => \gen_fifo.xpm_fifo_axis_inst_n_108\,
      rd_data_count_axis(9) => \gen_fifo.xpm_fifo_axis_inst_n_109\,
      rd_data_count_axis(8) => \gen_fifo.xpm_fifo_axis_inst_n_110\,
      rd_data_count_axis(7) => \gen_fifo.xpm_fifo_axis_inst_n_111\,
      rd_data_count_axis(6) => \gen_fifo.xpm_fifo_axis_inst_n_112\,
      rd_data_count_axis(5) => \gen_fifo.xpm_fifo_axis_inst_n_113\,
      rd_data_count_axis(4) => \gen_fifo.xpm_fifo_axis_inst_n_114\,
      rd_data_count_axis(3) => \gen_fifo.xpm_fifo_axis_inst_n_115\,
      rd_data_count_axis(2) => \gen_fifo.xpm_fifo_axis_inst_n_116\,
      rd_data_count_axis(1) => \gen_fifo.xpm_fifo_axis_inst_n_117\,
      rd_data_count_axis(0) => \gen_fifo.xpm_fifo_axis_inst_n_118\,
      s_aclk => s_axis_aclk,
      s_aresetn => s_axis_aresetn,
      s_axis_tdata(63 downto 0) => s_axis_tdata(63 downto 0),
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(7 downto 0) => B"00000000",
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tstrb(7 downto 0) => B"00000000",
      s_axis_tuser(0) => '0',
      s_axis_tvalid => s_axis_tvalid,
      sbiterr_axis => \gen_fifo.xpm_fifo_axis_inst_n_120\,
      wr_data_count_axis(14) => \gen_fifo.xpm_fifo_axis_inst_n_87\,
      wr_data_count_axis(13) => \gen_fifo.xpm_fifo_axis_inst_n_88\,
      wr_data_count_axis(12) => \gen_fifo.xpm_fifo_axis_inst_n_89\,
      wr_data_count_axis(11) => \gen_fifo.xpm_fifo_axis_inst_n_90\,
      wr_data_count_axis(10) => \gen_fifo.xpm_fifo_axis_inst_n_91\,
      wr_data_count_axis(9) => \gen_fifo.xpm_fifo_axis_inst_n_92\,
      wr_data_count_axis(8) => \gen_fifo.xpm_fifo_axis_inst_n_93\,
      wr_data_count_axis(7) => \gen_fifo.xpm_fifo_axis_inst_n_94\,
      wr_data_count_axis(6) => \gen_fifo.xpm_fifo_axis_inst_n_95\,
      wr_data_count_axis(5) => \gen_fifo.xpm_fifo_axis_inst_n_96\,
      wr_data_count_axis(4) => \gen_fifo.xpm_fifo_axis_inst_n_97\,
      wr_data_count_axis(3) => \gen_fifo.xpm_fifo_axis_inst_n_98\,
      wr_data_count_axis(2) => \gen_fifo.xpm_fifo_axis_inst_n_99\,
      wr_data_count_axis(1) => \gen_fifo.xpm_fifo_axis_inst_n_100\,
      wr_data_count_axis(0) => \gen_fifo.xpm_fifo_axis_inst_n_101\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 63 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axis_tlast : out STD_LOGIC;
    prog_empty : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "axis_data_fifo_0,axis_data_fifo_v2_0_9_top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "axis_data_fifo_v2_0_9_top,Vivado 2022.2_AR000035739_AR000034905";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal NLW_inst_almost_empty_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_almost_full_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_dbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_prog_full_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_sbiterr_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_axis_rd_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_axis_wr_data_count_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_m_axis_tdest_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axis_tid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_inst_m_axis_tkeep_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_axis_tstrb_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_inst_m_axis_tuser_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_ACLKEN_CONV_MODE : integer;
  attribute C_ACLKEN_CONV_MODE of inst : label is 0;
  attribute C_AXIS_SIGNAL_SET : integer;
  attribute C_AXIS_SIGNAL_SET of inst : label is 19;
  attribute C_AXIS_TDATA_WIDTH : integer;
  attribute C_AXIS_TDATA_WIDTH of inst : label is 64;
  attribute C_AXIS_TDEST_WIDTH : integer;
  attribute C_AXIS_TDEST_WIDTH of inst : label is 1;
  attribute C_AXIS_TID_WIDTH : integer;
  attribute C_AXIS_TID_WIDTH of inst : label is 1;
  attribute C_AXIS_TUSER_WIDTH : integer;
  attribute C_AXIS_TUSER_WIDTH of inst : label is 1;
  attribute C_ECC_MODE : integer;
  attribute C_ECC_MODE of inst : label is 0;
  attribute C_FAMILY : string;
  attribute C_FAMILY of inst : label is "zynquplus";
  attribute C_FIFO_DEPTH : integer;
  attribute C_FIFO_DEPTH of inst : label is 16384;
  attribute C_FIFO_MEMORY_TYPE : string;
  attribute C_FIFO_MEMORY_TYPE of inst : label is "auto";
  attribute C_FIFO_MODE : integer;
  attribute C_FIFO_MODE of inst : label is 1;
  attribute C_IS_ACLK_ASYNC : integer;
  attribute C_IS_ACLK_ASYNC of inst : label is 0;
  attribute C_PROG_EMPTY_THRESH : integer;
  attribute C_PROG_EMPTY_THRESH of inst : label is 1400;
  attribute C_PROG_FULL_THRESH : integer;
  attribute C_PROG_FULL_THRESH of inst : label is 11;
  attribute C_SYNCHRONIZER_STAGE : integer;
  attribute C_SYNCHRONIZER_STAGE of inst : label is 3;
  attribute C_USE_ADV_FEATURES : integer;
  attribute C_USE_ADV_FEATURES of inst : label is 825372720;
  attribute G_INDX_SS_TDATA : integer;
  attribute G_INDX_SS_TDATA of inst : label is 1;
  attribute G_INDX_SS_TDEST : integer;
  attribute G_INDX_SS_TDEST of inst : label is 6;
  attribute G_INDX_SS_TID : integer;
  attribute G_INDX_SS_TID of inst : label is 5;
  attribute G_INDX_SS_TKEEP : integer;
  attribute G_INDX_SS_TKEEP of inst : label is 3;
  attribute G_INDX_SS_TLAST : integer;
  attribute G_INDX_SS_TLAST of inst : label is 4;
  attribute G_INDX_SS_TREADY : integer;
  attribute G_INDX_SS_TREADY of inst : label is 0;
  attribute G_INDX_SS_TSTRB : integer;
  attribute G_INDX_SS_TSTRB of inst : label is 2;
  attribute G_INDX_SS_TUSER : integer;
  attribute G_INDX_SS_TUSER of inst : label is 7;
  attribute G_MASK_SS_TDATA : integer;
  attribute G_MASK_SS_TDATA of inst : label is 2;
  attribute G_MASK_SS_TDEST : integer;
  attribute G_MASK_SS_TDEST of inst : label is 64;
  attribute G_MASK_SS_TID : integer;
  attribute G_MASK_SS_TID of inst : label is 32;
  attribute G_MASK_SS_TKEEP : integer;
  attribute G_MASK_SS_TKEEP of inst : label is 8;
  attribute G_MASK_SS_TLAST : integer;
  attribute G_MASK_SS_TLAST of inst : label is 16;
  attribute G_MASK_SS_TREADY : integer;
  attribute G_MASK_SS_TREADY of inst : label is 1;
  attribute G_MASK_SS_TSTRB : integer;
  attribute G_MASK_SS_TSTRB of inst : label is 4;
  attribute G_MASK_SS_TUSER : integer;
  attribute G_MASK_SS_TUSER of inst : label is 128;
  attribute G_TASK_SEVERITY_ERR : integer;
  attribute G_TASK_SEVERITY_ERR of inst : label is 2;
  attribute G_TASK_SEVERITY_INFO : integer;
  attribute G_TASK_SEVERITY_INFO of inst : label is 0;
  attribute G_TASK_SEVERITY_WARNING : integer;
  attribute G_TASK_SEVERITY_WARNING of inst : label is 1;
  attribute LP_CDC_SYNC_STAGES : integer;
  attribute LP_CDC_SYNC_STAGES of inst : label is 3;
  attribute LP_CLOCKING_MODE : string;
  attribute LP_CLOCKING_MODE of inst : label is "common_clock";
  attribute LP_ECC_MODE : string;
  attribute LP_ECC_MODE of inst : label is "no_ecc";
  attribute LP_FIFO_DEPTH : integer;
  attribute LP_FIFO_DEPTH of inst : label is 16384;
  attribute LP_FIFO_MEMORY_TYPE : string;
  attribute LP_FIFO_MEMORY_TYPE of inst : label is "auto";
  attribute LP_M_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_M_ACLKEN_CAN_TOGGLE of inst : label is 0;
  attribute LP_PACKET_FIFO : string;
  attribute LP_PACKET_FIFO of inst : label is "false";
  attribute LP_PROG_EMPTY_THRESH : integer;
  attribute LP_PROG_EMPTY_THRESH of inst : label is 1400;
  attribute LP_PROG_FULL_THRESH : integer;
  attribute LP_PROG_FULL_THRESH of inst : label is 11;
  attribute LP_RD_DATA_COUNT_WIDTH : integer;
  attribute LP_RD_DATA_COUNT_WIDTH of inst : label is 15;
  attribute LP_RELATED_CLOCKS : integer;
  attribute LP_RELATED_CLOCKS of inst : label is 0;
  attribute LP_S_ACLKEN_CAN_TOGGLE : integer;
  attribute LP_S_ACLKEN_CAN_TOGGLE of inst : label is 0;
  attribute LP_TDATA_WIDTH : integer;
  attribute LP_TDATA_WIDTH of inst : label is 64;
  attribute LP_TDEST_WIDTH : integer;
  attribute LP_TDEST_WIDTH of inst : label is 1;
  attribute LP_TID_WIDTH : integer;
  attribute LP_TID_WIDTH of inst : label is 1;
  attribute LP_TUSER_WIDTH : integer;
  attribute LP_TUSER_WIDTH of inst : label is 1;
  attribute LP_USE_ADV_FEATURES : integer;
  attribute LP_USE_ADV_FEATURES of inst : label is 825372720;
  attribute LP_WR_DATA_COUNT_WIDTH : integer;
  attribute LP_WR_DATA_COUNT_WIDTH of inst : label is 15;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of m_axis_tlast : signal is "xilinx.com:interface:axis:1.0 M_AXIS TLAST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of m_axis_tlast : signal is "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axis_tready : signal is "xilinx.com:interface:axis:1.0 M_AXIS TREADY";
  attribute X_INTERFACE_INFO of m_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
  attribute X_INTERFACE_INFO of s_axis_aclk : signal is "xilinx.com:signal:clock:1.0 S_CLKIF CLK";
  attribute X_INTERFACE_PARAMETER of s_axis_aclk : signal is "XIL_INTERFACENAME S_CLKIF, ASSOCIATED_BUSIF S_AXIS, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_aresetn : signal is "xilinx.com:signal:reset:1.0 S_RSTIF RST";
  attribute X_INTERFACE_PARAMETER of s_axis_aresetn : signal is "XIL_INTERFACENAME S_RSTIF, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tlast : signal is "xilinx.com:interface:axis:1.0 S_AXIS TLAST";
  attribute X_INTERFACE_PARAMETER of s_axis_tlast : signal is "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axis_tready : signal is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
  attribute X_INTERFACE_INFO of s_axis_tvalid : signal is "xilinx.com:interface:axis:1.0 S_AXIS TVALID";
  attribute X_INTERFACE_INFO of m_axis_tdata : signal is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute X_INTERFACE_INFO of s_axis_tdata : signal is "xilinx.com:interface:axis:1.0 S_AXIS TDATA";
begin
inst: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_axis_data_fifo_v2_0_9_top
     port map (
      almost_empty => NLW_inst_almost_empty_UNCONNECTED,
      almost_full => NLW_inst_almost_full_UNCONNECTED,
      axis_rd_data_count(31 downto 0) => NLW_inst_axis_rd_data_count_UNCONNECTED(31 downto 0),
      axis_wr_data_count(31 downto 0) => NLW_inst_axis_wr_data_count_UNCONNECTED(31 downto 0),
      dbiterr => NLW_inst_dbiterr_UNCONNECTED,
      injectdbiterr => '0',
      injectsbiterr => '0',
      m_axis_aclk => '0',
      m_axis_aclken => '1',
      m_axis_tdata(63 downto 0) => m_axis_tdata(63 downto 0),
      m_axis_tdest(0) => NLW_inst_m_axis_tdest_UNCONNECTED(0),
      m_axis_tid(0) => NLW_inst_m_axis_tid_UNCONNECTED(0),
      m_axis_tkeep(7 downto 0) => NLW_inst_m_axis_tkeep_UNCONNECTED(7 downto 0),
      m_axis_tlast => m_axis_tlast,
      m_axis_tready => m_axis_tready,
      m_axis_tstrb(7 downto 0) => NLW_inst_m_axis_tstrb_UNCONNECTED(7 downto 0),
      m_axis_tuser(0) => NLW_inst_m_axis_tuser_UNCONNECTED(0),
      m_axis_tvalid => m_axis_tvalid,
      prog_empty => prog_empty,
      prog_full => NLW_inst_prog_full_UNCONNECTED,
      s_axis_aclk => s_axis_aclk,
      s_axis_aclken => '1',
      s_axis_aresetn => s_axis_aresetn,
      s_axis_tdata(63 downto 0) => s_axis_tdata(63 downto 0),
      s_axis_tdest(0) => '0',
      s_axis_tid(0) => '0',
      s_axis_tkeep(7 downto 0) => B"11111111",
      s_axis_tlast => s_axis_tlast,
      s_axis_tready => s_axis_tready,
      s_axis_tstrb(7 downto 0) => B"11111111",
      s_axis_tuser(0) => '0',
      s_axis_tvalid => s_axis_tvalid,
      sbiterr => NLW_inst_sbiterr_UNCONNECTED
    );
end STRUCTURE;
