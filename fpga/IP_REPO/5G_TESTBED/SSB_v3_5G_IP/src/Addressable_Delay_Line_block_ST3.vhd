-- -------------------------------------------------------------
-- 
-- File Name: hdlsrc\nrhdlSSBDetectionFR1Core\Addressable_Delay_Line_block.vhd
-- Created: 2021-11-30 14:25:27
-- 
-- Generated by MATLAB 9.10 and HDL Coder 3.18
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Addressable_Delay_Line_block
-- Source Path: nrhdlSSBDetectionFR1Core/ssbDetectionCore/Frequency Correction and DDC/DDC/FR1/Stage 3/FIR 1/Addressable 
-- Delay Lin
-- Hierarchy Level: 2
-- 
-- Addressable Delay Line
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Addressable_Delay_Line_block_ST3 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validIn                           :   IN    std_logic;
        shiftEn                           :   IN    std_logic;
        rdAddr                            :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        dataOut                           :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En15
        );
END Addressable_Delay_Line_block_ST3;


ARCHITECTURE rtl OF Addressable_Delay_Line_block_ST3 IS

  -- Signals
  SIGNAL rdAddr_unsigned                  : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL dataIn_signed                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL delayedSignals0                  : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL delayedSignals1                  : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL delayedSignals2                  : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL switchDataOut                    : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL dataOut_tmp                      : signed(15 DOWNTO 0);  -- sfix16_En15

BEGIN
  rdAddr_unsigned <= unsigned(rdAddr);

  dataIn_signed <= signed(dataIn);

  delay0_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayedSignals0 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND validIn = '1' THEN
        delayedSignals0 <= dataIn_signed;
      END IF;
    END IF;
  END PROCESS delay0_process;


  delay1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayedSignals1 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND shiftEn = '1' THEN
        delayedSignals1 <= delayedSignals0;
      END IF;
    END IF;
  END PROCESS delay1_process;


  delay2_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      delayedSignals2 <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' AND shiftEn = '1' THEN
        delayedSignals2 <= delayedSignals1;
      END IF;
    END IF;
  END PROCESS delay2_process;


  
  switchDataOut <= delayedSignals2 WHEN rdAddr_unsigned = to_unsigned(16#0#, 2) ELSE
      delayedSignals1 WHEN rdAddr_unsigned = to_unsigned(16#1#, 2) ELSE
      delayedSignals0 WHEN rdAddr_unsigned = to_unsigned(16#2#, 2) ELSE
      delayedSignals0;

  dataOutReg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      dataOut_tmp <= to_signed(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb = '1' THEN
        dataOut_tmp <= switchDataOut;
      END IF;
    END IF;
  END PROCESS dataOutReg_process;


  dataOut <= std_logic_vector(dataOut_tmp);

END rtl;

