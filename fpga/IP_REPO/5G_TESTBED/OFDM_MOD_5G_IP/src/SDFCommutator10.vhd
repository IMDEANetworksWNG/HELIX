-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\FFTHDLOptimizedExample_Streaming\SDFCommutator10.vhd
-- Created: 2022-05-04 13:42:43
-- 
-- Generated by MATLAB 9.11 and HDL Coder 3.19
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: SDFCommutator10
-- Source Path: FFTHDLOptimizedExample_Streaming/FFT HDL Optimized Streaming/FFT HDL Optimized/RADIX22FFT_SDF2_10/SDFCommutator10
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY SDFCommutator10 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        dout_9_1_vld                      :   IN    std_logic;
        xf_re                             :   IN    std_logic_vector(25 DOWNTO 0);  -- sfix26_En13
        xf_im                             :   IN    std_logic_vector(25 DOWNTO 0);  -- sfix26_En13
        xf_vld                            :   IN    std_logic;
        dinf_re                           :   IN    std_logic_vector(25 DOWNTO 0);  -- sfix26_En13
        dinf_im                           :   IN    std_logic_vector(25 DOWNTO 0);  -- sfix26_En13
        dinf_vld                          :   IN    std_logic;
        btf1_re                           :   IN    std_logic_vector(25 DOWNTO 0);  -- sfix26_En13
        btf1_im                           :   IN    std_logic_vector(25 DOWNTO 0);  -- sfix26_En13
        btf2_re                           :   IN    std_logic_vector(25 DOWNTO 0);  -- sfix26_En13
        btf2_im                           :   IN    std_logic_vector(25 DOWNTO 0);  -- sfix26_En13
        btfout_vld                        :   IN    std_logic;
        wrData_re                         :   OUT   std_logic_vector(25 DOWNTO 0);  -- sfix26_En13
        wrData_im                         :   OUT   std_logic_vector(25 DOWNTO 0);  -- sfix26_En13
        wrAddr                            :   OUT   std_logic;  -- ufix1
        wrEnb                             :   OUT   std_logic;
        dout_10_1_re                      :   OUT   std_logic_vector(25 DOWNTO 0);  -- sfix26_En13
        dout_10_1_im                      :   OUT   std_logic_vector(25 DOWNTO 0);  -- sfix26_En13
        dout_10_1_vld                     :   OUT   std_logic
        );
END SDFCommutator10;


ARCHITECTURE rtl OF SDFCommutator10 IS

  -- Component Declarations
  COMPONENT SimpleDualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          rd_dout                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : SimpleDualPortRAM_generic
    USE ENTITY work.SimpleDualPortRAM_generic(rtl);

  -- Signals
  SIGNAL xf_re_signed                     : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL xf_im_signed                     : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL dinf_re_signed                   : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL dinf_im_signed                   : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL btf1_re_signed                   : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL btf1_im_signed                   : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL btf2_re_signed                   : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL btf2_im_signed                   : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL SDFCummutator_out_re             : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL SDFCummutator_out_im             : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL SDFCummutator_out_vld            : std_logic;
  SIGNAL SDFCummutator_wrAddr_reg         : std_logic;  -- ufix1
  SIGNAL SDFCummutator_wrState            : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_wrData_re_reg      : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL SDFCummutator_wrData_im_reg      : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL SDFCummutator_wrEnb_reg          : std_logic;
  SIGNAL SDFCummutator_wrXData_re_reg     : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL SDFCummutator_wrXData_im_reg     : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL SDFCummutator_xWrAddr            : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_wrxEnb_reg         : std_logic;
  SIGNAL SDFCummutator_xRdAddr            : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_XState             : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_xX_vld_reg         : std_logic;
  SIGNAL SDFCummutator_btf1_re_dly        : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL SDFCummutator_btf1_im_dly        : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL SDFCummutator_btf1_vld_dly       : std_logic;
  SIGNAL SDFCummutator_out_re_next        : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL SDFCummutator_out_im_next        : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL SDFCummutator_out_vld_next       : std_logic;
  SIGNAL SDFCummutator_wrAddr_reg_next    : std_logic;  -- ufix1
  SIGNAL SDFCummutator_wrState_next       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_wrData_re_reg_next : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL SDFCummutator_wrData_im_reg_next : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL SDFCummutator_wrEnb_reg_next     : std_logic;
  SIGNAL SDFCummutator_wrXData_re_reg_next : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL SDFCummutator_wrXData_im_reg_next : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL SDFCummutator_xWrAddr_next       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_wrxEnb_reg_next    : std_logic;
  SIGNAL SDFCummutator_xRdAddr_next       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_XState_next        : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL SDFCummutator_xX_vld_reg_next    : std_logic;
  SIGNAL SDFCummutator_btf1_re_dly_next   : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL SDFCummutator_btf1_im_dly_next   : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL SDFCummutator_btf1_vld_dly_next  : std_logic;
  SIGNAL wrData_re_tmp                    : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL wrData_im_tmp                    : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL xData_re                         : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL xData_im                         : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL wrXAddr                          : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL wrXEnb                           : std_logic;
  SIGNAL rdXAddr                          : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL xX_vld                           : std_logic;
  SIGNAL dout0_re                         : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL dout0_im                         : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL dout0_vld                        : std_logic;
  SIGNAL xX_re                            : std_logic_vector(25 DOWNTO 0);  -- ufix26
  SIGNAL xX_re_signed                     : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL xX_im                            : std_logic_vector(25 DOWNTO 0);  -- ufix26
  SIGNAL xX_im_signed                     : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL SDFOutmux_btf2Pipe_re            : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL SDFOutmux_btf2Pipe_im            : signed(25 DOWNTO 0);  -- sfix26
  SIGNAL SDFOutmux_btfPipe_vld            : std_logic;
  SIGNAL SDFOutmux_btf2Pipe_re_next       : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL SDFOutmux_btf2Pipe_im_next       : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL SDFOutmux_btfPipe_vld_next       : std_logic;
  SIGNAL dout_10_1_re_tmp                 : signed(25 DOWNTO 0);  -- sfix26_En13
  SIGNAL dout_10_1_im_tmp                 : signed(25 DOWNTO 0);  -- sfix26_En13

BEGIN
  u_dataXMEM_re_0_10 : SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 3,
                 DataWidth => 26
                 )
    PORT MAP( clk => clk,
              wr_din => std_logic_vector(xData_re),
              wr_addr => std_logic_vector(wrXAddr),
              wr_en => wrXEnb,
              rd_addr => std_logic_vector(rdXAddr),
              rd_dout => xX_re
              );

  u_dataXMEM_im_0_10 : SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 3,
                 DataWidth => 26
                 )
    PORT MAP( clk => clk,
              wr_din => std_logic_vector(xData_im),
              wr_addr => std_logic_vector(wrXAddr),
              wr_en => wrXEnb,
              rd_addr => std_logic_vector(rdXAddr),
              rd_dout => xX_im
              );

  xf_re_signed <= signed(xf_re);

  xf_im_signed <= signed(xf_im);

  dinf_re_signed <= signed(dinf_re);

  dinf_im_signed <= signed(dinf_im);

  btf1_re_signed <= signed(btf1_re);

  btf1_im_signed <= signed(btf1_im);

  btf2_re_signed <= signed(btf2_re);

  btf2_im_signed <= signed(btf2_im);

  -- SDFCummutator
  SDFCummutator_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      SDFCummutator_out_re <= to_signed(16#0000000#, 26);
      SDFCummutator_out_im <= to_signed(16#0000000#, 26);
      SDFCummutator_wrData_re_reg <= to_signed(16#0000000#, 26);
      SDFCummutator_wrData_im_reg <= to_signed(16#0000000#, 26);
      SDFCummutator_wrEnb_reg <= '0';
      SDFCummutator_out_vld <= '0';
      SDFCummutator_wrState <= to_unsigned(16#0#, 3);
      SDFCummutator_wrAddr_reg <= '0';
      SDFCummutator_wrXData_re_reg <= to_signed(16#0000000#, 26);
      SDFCummutator_wrXData_im_reg <= to_signed(16#0000000#, 26);
      SDFCummutator_xWrAddr <= to_unsigned(16#0#, 3);
      SDFCummutator_wrxEnb_reg <= '0';
      SDFCummutator_xRdAddr <= to_unsigned(16#0#, 3);
      SDFCummutator_XState <= to_unsigned(16#0#, 3);
      SDFCummutator_xX_vld_reg <= '0';
      SDFCummutator_btf1_re_dly <= to_signed(16#0000000#, 26);
      SDFCummutator_btf1_im_dly <= to_signed(16#0000000#, 26);
      SDFCummutator_btf1_vld_dly <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      SDFCummutator_out_re <= SDFCummutator_out_re_next;
      SDFCummutator_out_im <= SDFCummutator_out_im_next;
      SDFCummutator_out_vld <= SDFCummutator_out_vld_next;
      SDFCummutator_wrAddr_reg <= SDFCummutator_wrAddr_reg_next;
      SDFCummutator_wrState <= SDFCummutator_wrState_next;
      SDFCummutator_wrData_re_reg <= SDFCummutator_wrData_re_reg_next;
      SDFCummutator_wrData_im_reg <= SDFCummutator_wrData_im_reg_next;
      SDFCummutator_wrEnb_reg <= SDFCummutator_wrEnb_reg_next;
      SDFCummutator_wrXData_re_reg <= SDFCummutator_wrXData_re_reg_next;
      SDFCummutator_wrXData_im_reg <= SDFCummutator_wrXData_im_reg_next;
      SDFCummutator_xWrAddr <= SDFCummutator_xWrAddr_next;
      SDFCummutator_wrxEnb_reg <= SDFCummutator_wrxEnb_reg_next;
      SDFCummutator_xRdAddr <= SDFCummutator_xRdAddr_next;
      SDFCummutator_XState <= SDFCummutator_XState_next;
      SDFCummutator_xX_vld_reg <= SDFCummutator_xX_vld_reg_next;
      SDFCummutator_btf1_re_dly <= SDFCummutator_btf1_re_dly_next;
      SDFCummutator_btf1_im_dly <= SDFCummutator_btf1_im_dly_next;
      SDFCummutator_btf1_vld_dly <= SDFCummutator_btf1_vld_dly_next;
    END IF;
  END PROCESS SDFCummutator_process;

  SDFCummutator_output : PROCESS (SDFCummutator_XState, SDFCummutator_btf1_im_dly, SDFCummutator_btf1_re_dly,
       SDFCummutator_btf1_vld_dly, SDFCummutator_out_im, SDFCummutator_out_re,
       SDFCummutator_out_vld, SDFCummutator_wrAddr_reg,
       SDFCummutator_wrData_im_reg, SDFCummutator_wrData_re_reg,
       SDFCummutator_wrEnb_reg, SDFCummutator_wrState,
       SDFCummutator_wrXData_im_reg, SDFCummutator_wrXData_re_reg,
       SDFCummutator_wrxEnb_reg, SDFCummutator_xRdAddr, SDFCummutator_xWrAddr,
       SDFCummutator_xX_vld_reg, btf1_im_signed, btf1_re_signed, btf2_im_signed,
       btf2_re_signed, btfout_vld, dinf_im_signed, dinf_re_signed, dinf_vld)
  BEGIN
    SDFCummutator_wrAddr_reg_next <= SDFCummutator_wrAddr_reg;
    SDFCummutator_wrState_next <= SDFCummutator_wrState;
    SDFCummutator_wrData_re_reg_next <= SDFCummutator_wrData_re_reg;
    SDFCummutator_wrData_im_reg_next <= SDFCummutator_wrData_im_reg;
    SDFCummutator_wrEnb_reg_next <= SDFCummutator_wrEnb_reg;
    SDFCummutator_wrXData_re_reg_next <= SDFCummutator_wrXData_re_reg;
    SDFCummutator_wrXData_im_reg_next <= SDFCummutator_wrXData_im_reg;
    SDFCummutator_xWrAddr_next <= SDFCummutator_xWrAddr;
    SDFCummutator_wrxEnb_reg_next <= SDFCummutator_wrxEnb_reg;
    SDFCummutator_xRdAddr_next <= SDFCummutator_xRdAddr;
    SDFCummutator_XState_next <= SDFCummutator_XState;
    SDFCummutator_xX_vld_reg_next <= SDFCummutator_xX_vld_reg;
    CASE SDFCummutator_XState IS
      WHEN "000" =>
        SDFCummutator_xRdAddr_next <= to_unsigned(16#0#, 3);
        SDFCummutator_xX_vld_reg_next <= '0';
        SDFCummutator_XState_next <= to_unsigned(16#0#, 3);
        SDFCummutator_wrXData_re_reg_next <= btf2_re_signed;
        SDFCummutator_wrXData_im_reg_next <= btf2_im_signed;
        SDFCummutator_xWrAddr_next <= to_unsigned(16#0#, 3);
        IF btfout_vld = '1' THEN 
          SDFCummutator_wrxEnb_reg_next <= '1';
          SDFCummutator_XState_next <= to_unsigned(16#2#, 3);
        END IF;
      WHEN "010" =>
        SDFCummutator_xX_vld_reg_next <= '0';
        SDFCummutator_wrxEnb_reg_next <= '0';
        SDFCummutator_XState_next <= to_unsigned(16#4#, 3);
      WHEN "100" =>
        SDFCummutator_xX_vld_reg_next <= '1';
        IF btfout_vld = '1' THEN 
          SDFCummutator_wrXData_re_reg_next <= btf2_re_signed;
          SDFCummutator_wrXData_im_reg_next <= btf2_im_signed;
          SDFCummutator_wrxEnb_reg_next <= '1';
          SDFCummutator_XState_next <= to_unsigned(16#2#, 3);
        ELSE 
          SDFCummutator_wrxEnb_reg_next <= '0';
          SDFCummutator_XState_next <= to_unsigned(16#0#, 3);
        END IF;
      WHEN OTHERS => 
        SDFCummutator_wrXData_re_reg_next <= to_signed(16#0000000#, 26);
        SDFCummutator_wrXData_im_reg_next <= to_signed(16#0000000#, 26);
        SDFCummutator_xWrAddr_next <= to_unsigned(16#0#, 3);
        SDFCummutator_xRdAddr_next <= to_unsigned(16#0#, 3);
        SDFCummutator_wrxEnb_reg_next <= '0';
        SDFCummutator_XState_next <= to_unsigned(16#0#, 3);
    END CASE;
    SDFCummutator_out_re_next <= SDFCummutator_btf1_re_dly;
    SDFCummutator_out_im_next <= SDFCummutator_btf1_im_dly;
    SDFCummutator_out_vld_next <= SDFCummutator_btf1_vld_dly;
    SDFCummutator_btf1_re_dly_next <= btf1_re_signed;
    SDFCummutator_btf1_im_dly_next <= btf1_im_signed;
    SDFCummutator_btf1_vld_dly_next <= btfout_vld;
    CASE SDFCummutator_wrState IS
      WHEN "000" =>
        SDFCummutator_wrState_next <= to_unsigned(16#0#, 3);
        SDFCummutator_wrAddr_reg_next <= '0';
        SDFCummutator_wrData_re_reg_next <= dinf_re_signed;
        SDFCummutator_wrData_im_reg_next <= dinf_im_signed;
        IF dinf_vld = '1' THEN 
          SDFCummutator_wrState_next <= to_unsigned(16#1#, 3);
          SDFCummutator_wrAddr_reg_next <= '0';
          SDFCummutator_wrEnb_reg_next <= '1';
        END IF;
      WHEN "001" =>
        SDFCummutator_wrState_next <= to_unsigned(16#3#, 3);
        SDFCummutator_wrAddr_reg_next <= '0';
        SDFCummutator_wrEnb_reg_next <= '0';
        SDFCummutator_wrData_re_reg_next <= dinf_re_signed;
        SDFCummutator_wrData_im_reg_next <= dinf_im_signed;
      WHEN "011" =>
        SDFCummutator_wrAddr_reg_next <= '0';
        IF dinf_vld = '1' THEN 
          SDFCummutator_wrState_next <= to_unsigned(16#1#, 3);
        ELSE 
          SDFCummutator_wrState_next <= to_unsigned(16#0#, 3);
        END IF;
        SDFCummutator_wrEnb_reg_next <= dinf_vld;
        SDFCummutator_wrData_re_reg_next <= dinf_re_signed;
        SDFCummutator_wrData_im_reg_next <= dinf_im_signed;
      WHEN OTHERS => 
        SDFCummutator_wrState_next <= to_unsigned(16#0#, 3);
        SDFCummutator_wrAddr_reg_next <= '0';
        SDFCummutator_wrEnb_reg_next <= dinf_vld;
        SDFCummutator_wrData_re_reg_next <= dinf_re_signed;
        SDFCummutator_wrData_im_reg_next <= dinf_im_signed;
    END CASE;
    wrData_re_tmp <= SDFCummutator_wrData_re_reg;
    wrData_im_tmp <= SDFCummutator_wrData_im_reg;
    wrAddr <= SDFCummutator_wrAddr_reg;
    wrEnb <= SDFCummutator_wrEnb_reg;
    xData_re <= SDFCummutator_wrXData_re_reg;
    xData_im <= SDFCummutator_wrXData_im_reg;
    wrXAddr <= SDFCummutator_xWrAddr;
    wrXEnb <= SDFCummutator_wrxEnb_reg;
    rdXAddr <= SDFCummutator_xRdAddr;
    xX_vld <= SDFCummutator_xX_vld_reg;
    dout0_re <= SDFCummutator_out_re;
    dout0_im <= SDFCummutator_out_im;
    dout0_vld <= SDFCummutator_out_vld;
  END PROCESS SDFCummutator_output;


  wrData_re <= std_logic_vector(wrData_re_tmp);

  wrData_im <= std_logic_vector(wrData_im_tmp);

  xX_re_signed <= signed(xX_re);

  xX_im_signed <= signed(xX_im);

  -- SDFOutmux
  SDFOutmux_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      SDFOutmux_btf2Pipe_re <= to_signed(16#0000000#, 26);
      SDFOutmux_btf2Pipe_im <= to_signed(16#0000000#, 26);
      SDFOutmux_btfPipe_vld <= '0';
    ELSIF clk'EVENT AND clk = '1' THEN
      SDFOutmux_btf2Pipe_re <= SDFOutmux_btf2Pipe_re_next;
      SDFOutmux_btf2Pipe_im <= SDFOutmux_btf2Pipe_im_next;
      SDFOutmux_btfPipe_vld <= SDFOutmux_btfPipe_vld_next;
    END IF;
  END PROCESS SDFOutmux_process;

  SDFOutmux_output : PROCESS (SDFOutmux_btf2Pipe_im, SDFOutmux_btf2Pipe_re, SDFOutmux_btfPipe_vld, dout0_im,
       dout0_re, dout0_vld, xX_im_signed, xX_re_signed, xX_vld)
  BEGIN
    SDFOutmux_btf2Pipe_re_next <= SDFOutmux_btf2Pipe_re;
    SDFOutmux_btf2Pipe_im_next <= SDFOutmux_btf2Pipe_im;
    SDFOutmux_btfPipe_vld_next <= SDFOutmux_btfPipe_vld;
    IF dout0_vld = '1' THEN 
      SDFOutmux_btf2Pipe_re_next <= dout0_re;
      SDFOutmux_btf2Pipe_im_next <= dout0_im;
      SDFOutmux_btfPipe_vld_next <= '1';
    ELSIF xX_vld = '1' THEN 
      SDFOutmux_btf2Pipe_re_next <= xX_re_signed;
      SDFOutmux_btf2Pipe_im_next <= xX_im_signed;
      SDFOutmux_btfPipe_vld_next <= '1';
    ELSE 
      SDFOutmux_btfPipe_vld_next <= '0';
    END IF;
    dout_10_1_re_tmp <= SDFOutmux_btf2Pipe_re;
    dout_10_1_im_tmp <= SDFOutmux_btf2Pipe_im;
    dout_10_1_vld <= SDFOutmux_btfPipe_vld;
  END PROCESS SDFOutmux_output;


  dout_10_1_re <= std_logic_vector(dout_10_1_re_tmp);

  dout_10_1_im <= std_logic_vector(dout_10_1_im_tmp);

END rtl;

