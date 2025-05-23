-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\HBF_64_test_simulink\FIRDecimInteg_block.vhd
-- Created: 2021-12-08 13:38:15
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: FIRDecimInteg_block
-- Source Path: HBF_64_test_simulink/HBF_x8/hb0c/FIR Decimation HDL Optimized/FIRDecimInteg
-- Hierarchy Level: 3
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY FIRDecimInteg_block IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        filterOut_cmplx_re                :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En22
        filterOut_cmplx_im                :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En22
        filterOut_vld                     :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En22
        dataOut_im                        :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En22
        validOut                          :   OUT   std_logic
        );
END FIRDecimInteg_block;


ARCHITECTURE rtl OF FIRDecimInteg_block IS

  -- Signals
  SIGNAL filterOut_cmplx_re_signed        : signed(23 DOWNTO 0);  -- sfix24_En22
  SIGNAL filterOut_cmplx_im_signed        : signed(23 DOWNTO 0);  -- sfix24_En22
  SIGNAL FIRdDecimInteg_state             : std_logic;  -- ufix1
  SIGNAL FIRdDecimInteg_cnt               : std_logic;  -- ufix1
  SIGNAL FIRdDecimInteg_integReg_re       : signed(23 DOWNTO 0);  -- sfix24_En22
  SIGNAL FIRdDecimInteg_integReg_im       : signed(23 DOWNTO 0);  -- sfix24_En22
  SIGNAL FIRdDecimInteg_integVldReg       : std_logic;
  SIGNAL FIRdDecimInteg_doutReg_re        : signed(23 DOWNTO 0);  -- sfix24_En22
  SIGNAL FIRdDecimInteg_doutReg_im        : signed(23 DOWNTO 0);  -- sfix24_En22
  SIGNAL FIRdDecimInteg_doutVldReg        : std_logic;
  SIGNAL FIRdDecimInteg_state_next        : std_logic;  -- ufix1
  SIGNAL FIRdDecimInteg_cnt_next          : std_logic;  -- ufix1
  SIGNAL FIRdDecimInteg_integReg_next_re  : signed(23 DOWNTO 0);  -- sfix24_En22
  SIGNAL FIRdDecimInteg_integReg_next_im  : signed(23 DOWNTO 0);  -- sfix24_En22
  SIGNAL FIRdDecimInteg_integVldReg_next  : std_logic;
  SIGNAL FIRdDecimInteg_doutReg_next_re   : signed(23 DOWNTO 0);  -- sfix24_En22
  SIGNAL FIRdDecimInteg_doutReg_next_im   : signed(23 DOWNTO 0);  -- sfix24_En22
  SIGNAL FIRdDecimInteg_doutVldReg_next   : std_logic;
  SIGNAL dataOut_re_tmp                   : signed(23 DOWNTO 0);  -- sfix24_En22
  SIGNAL dataOut_im_tmp                   : signed(23 DOWNTO 0);  -- sfix24_En22

BEGIN
  filterOut_cmplx_re_signed <= signed(filterOut_cmplx_re);

  filterOut_cmplx_im_signed <= signed(filterOut_cmplx_im);

  -- FIRDecimInteg
  FIRdDecimInteg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      FIRdDecimInteg_state <= '0';
      FIRdDecimInteg_integVldReg <= '0';
      FIRdDecimInteg_doutVldReg <= '0';
      FIRdDecimInteg_cnt <= '1';
      FIRdDecimInteg_integReg_re <= to_signed(16#000000#, 24);
      FIRdDecimInteg_integReg_im <= to_signed(16#000000#, 24);
      FIRdDecimInteg_doutReg_re <= to_signed(16#000000#, 24);
      FIRdDecimInteg_doutReg_im <= to_signed(16#000000#, 24);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        FIRdDecimInteg_state <= FIRdDecimInteg_state_next;
        FIRdDecimInteg_cnt <= FIRdDecimInteg_cnt_next;
        FIRdDecimInteg_integReg_re <= FIRdDecimInteg_integReg_next_re;
        FIRdDecimInteg_integReg_im <= FIRdDecimInteg_integReg_next_im;
        FIRdDecimInteg_integVldReg <= FIRdDecimInteg_integVldReg_next;
        FIRdDecimInteg_doutReg_re <= FIRdDecimInteg_doutReg_next_re;
        FIRdDecimInteg_doutReg_im <= FIRdDecimInteg_doutReg_next_im;
        FIRdDecimInteg_doutVldReg <= FIRdDecimInteg_doutVldReg_next;
      END IF;
    END IF;
  END PROCESS FIRdDecimInteg_process;

  FIRdDecimInteg_output : PROCESS (FIRdDecimInteg_cnt, FIRdDecimInteg_doutReg_im, FIRdDecimInteg_doutReg_re,
       FIRdDecimInteg_doutVldReg, FIRdDecimInteg_integReg_im,
       FIRdDecimInteg_integReg_re, FIRdDecimInteg_integVldReg,
       FIRdDecimInteg_state, filterOut_cmplx_im_signed,
       filterOut_cmplx_re_signed, filterOut_vld)
    VARIABLE sub_cast : unsigned(1 DOWNTO 0);
    VARIABLE sub_temp : unsigned(1 DOWNTO 0);
  BEGIN
    sub_temp := to_unsigned(16#0#, 2);
    sub_cast := to_unsigned(16#0#, 2);
    FIRdDecimInteg_cnt_next <= FIRdDecimInteg_cnt;
    FIRdDecimInteg_state_next <= FIRdDecimInteg_state;
    FIRdDecimInteg_integReg_next_re <= FIRdDecimInteg_integReg_re;
    FIRdDecimInteg_integReg_next_im <= FIRdDecimInteg_integReg_im;
    FIRdDecimInteg_integVldReg_next <= FIRdDecimInteg_integVldReg;
    FIRdDecimInteg_doutReg_next_re <= FIRdDecimInteg_doutReg_re;
    FIRdDecimInteg_doutReg_next_im <= FIRdDecimInteg_doutReg_im;
    IF FIRdDecimInteg_integVldReg = '1' THEN 
      FIRdDecimInteg_doutReg_next_re <= FIRdDecimInteg_integReg_re;
      FIRdDecimInteg_doutReg_next_im <= FIRdDecimInteg_integReg_im;
    ELSE 
      FIRdDecimInteg_doutReg_next_re <= to_signed(16#000000#, 24);
      FIRdDecimInteg_doutReg_next_im <= to_signed(16#000000#, 24);
    END IF;
    FIRdDecimInteg_doutVldReg_next <= FIRdDecimInteg_integVldReg;
    CASE FIRdDecimInteg_state IS
      WHEN '0' =>
        FIRdDecimInteg_state_next <= '0';
        FIRdDecimInteg_cnt_next <= '1';
        FIRdDecimInteg_integReg_next_re <= to_signed(16#000000#, 24);
        FIRdDecimInteg_integReg_next_im <= to_signed(16#000000#, 24);
        FIRdDecimInteg_integVldReg_next <= '0';
        IF filterOut_vld = '1' THEN 
          FIRdDecimInteg_state_next <= '1';
          FIRdDecimInteg_integReg_next_re <= filterOut_cmplx_re_signed;
          FIRdDecimInteg_integReg_next_im <= filterOut_cmplx_im_signed;
          FIRdDecimInteg_cnt_next <= '0';
        END IF;
      WHEN '1' =>
        FIRdDecimInteg_state_next <= '1';
        IF filterOut_vld = '1' THEN 
          FIRdDecimInteg_integReg_next_re <= FIRdDecimInteg_integReg_re + filterOut_cmplx_re_signed;
          FIRdDecimInteg_integReg_next_im <= FIRdDecimInteg_integReg_im + filterOut_cmplx_im_signed;
          IF FIRdDecimInteg_cnt = '0' THEN 
            FIRdDecimInteg_state_next <= '0';
            FIRdDecimInteg_integVldReg_next <= '1';
            FIRdDecimInteg_cnt_next <= '1';
          ELSE 
            sub_cast := '0' & FIRdDecimInteg_cnt;
            sub_temp := sub_cast - to_unsigned(16#1#, 2);
            FIRdDecimInteg_cnt_next <= sub_temp(0);
          END IF;
        END IF;
      WHEN OTHERS => 
        FIRdDecimInteg_state_next <= '0';
        FIRdDecimInteg_cnt_next <= '1';
        FIRdDecimInteg_integReg_next_re <= to_signed(16#000000#, 24);
        FIRdDecimInteg_integReg_next_im <= to_signed(16#000000#, 24);
        FIRdDecimInteg_integVldReg_next <= '0';
    END CASE;
    dataOut_re_tmp <= FIRdDecimInteg_doutReg_re;
    dataOut_im_tmp <= FIRdDecimInteg_doutReg_im;
    validOut <= FIRdDecimInteg_doutVldReg;
  END PROCESS FIRdDecimInteg_output;


  dataOut_re <= std_logic_vector(dataOut_re_tmp);

  dataOut_im <= std_logic_vector(dataOut_im_tmp);

END rtl;

