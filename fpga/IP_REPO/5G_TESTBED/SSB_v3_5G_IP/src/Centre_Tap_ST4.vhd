-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\nrhdlSSBDetectionFR1Core\Centre_Tap.vhd
-- Created: 2021-11-30 14:26:21
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Centre_Tap
-- Source Path: nrhdlSSBDetectionFR1Core/ssbDetectionCore/Frequency Correction and DDC/DDC/FR1/Stage 4/Centre Tap
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Stage_4_pkg.ALL;

ENTITY Centre_Tap_ST4 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validIn                           :   IN    std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En16
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En16
        );
END Centre_Tap_ST4;


ARCHITECTURE rtl OF Centre_Tap_ST4 IS

  -- Signals
  SIGNAL dataIn_re_signed                 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataIn_im_signed                 : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Enabled_Delay_reg_re             : vector_of_signed16(0 TO 25);  -- sfix16_En15 [26]
  SIGNAL Enabled_Delay_reg_im             : vector_of_signed16(0 TO 25);  -- sfix16_En15 [26]
  SIGNAL Enabled_Delay_out1_re            : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Enabled_Delay_out1_im            : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Data_Type_Conversion_out1_re     : signed(15 DOWNTO 0);  -- sfix16_En16
  SIGNAL Data_Type_Conversion_out1_im     : signed(15 DOWNTO 0);  -- sfix16_En16
  SIGNAL Delay_reg_re                     : vector_of_signed16(0 TO 18);  -- sfix16_En16 [19]
  SIGNAL Delay_reg_im                     : vector_of_signed16(0 TO 18);  -- sfix16_En16 [19]
  SIGNAL Delay_out1_re                    : signed(15 DOWNTO 0);  -- sfix16_En16
  SIGNAL Delay_out1_im                    : signed(15 DOWNTO 0);  -- sfix16_En16

BEGIN
  -- Match the latency of the HDL FIR used to implement polyphase filter 0.
  -- 
  -- Multiply by 0.5 by simply reinterpreting the sfix16_En15 as an sfix16_En16.

  dataIn_re_signed <= signed(dataIn_re);

  dataIn_im_signed <= signed(dataIn_im);

  Enabled_Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Enabled_Delay_reg_re <= (OTHERS => to_signed(16#0000#, 16));
      Enabled_Delay_reg_im <= (OTHERS => to_signed(16#0000#, 16));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND validIn = '1' THEN
        Enabled_Delay_reg_im(0) <= dataIn_im_signed;
        Enabled_Delay_reg_im(1 TO 25) <= Enabled_Delay_reg_im(0 TO 24);
        Enabled_Delay_reg_re(0) <= dataIn_re_signed;
        Enabled_Delay_reg_re(1 TO 25) <= Enabled_Delay_reg_re(0 TO 24);
      END IF;
    END IF;
  END PROCESS Enabled_Delay_process;

  Enabled_Delay_out1_re <= Enabled_Delay_reg_re(25);
  Enabled_Delay_out1_im <= Enabled_Delay_reg_im(25);

  Data_Type_Conversion_out1_re <= Enabled_Delay_out1_re;
  Data_Type_Conversion_out1_im <= Enabled_Delay_out1_im;

  Delay_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      Delay_reg_re <= (OTHERS => to_signed(16#0000#, 16));
      Delay_reg_im <= (OTHERS => to_signed(16#0000#, 16));
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        Delay_reg_im(0) <= Data_Type_Conversion_out1_im;
        Delay_reg_im(1 TO 18) <= Delay_reg_im(0 TO 17);
        Delay_reg_re(0) <= Data_Type_Conversion_out1_re;
        Delay_reg_re(1 TO 18) <= Delay_reg_re(0 TO 17);
      END IF;
    END IF;
  END PROCESS Delay_process;

  Delay_out1_re <= Delay_reg_re(18);
  Delay_out1_im <= Delay_reg_im(18);

  dataOut_re <= std_logic_vector(Delay_out1_re);

  dataOut_im <= std_logic_vector(Delay_out1_im);

END rtl;

