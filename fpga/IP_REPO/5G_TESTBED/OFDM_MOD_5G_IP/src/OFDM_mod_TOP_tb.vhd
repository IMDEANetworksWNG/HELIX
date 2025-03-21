----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/05/2022 11:41:34 AM
-- Design Name: 
-- Module Name: OFDM_demod_TOP_v2_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use std.textio.all;
use ieee.std_logic_textio.all;

entity OFDM_mod_TOP_tb is
end OFDM_mod_TOP_tb;

architecture Behavioral of OFDM_mod_TOP_tb is

constant clk_P_100 : time := 10 ns;

signal clk : std_logic := '0';
signal rstn : std_logic := '0';
signal b0_valid : std_logic := '0';
signal b0_data_I, b0_data_Q : std_logic_vector(2*16-1 downto 0);
signal dataOut_re, dataOut_im : std_logic_vector(2*16-1 downto 0);
signal validOut, readyOut, readyIn : std_logic;
signal b0_trigger, lastOut : std_logic;
--signal startOut,endOut : std_logic;
signal CP_lengths : std_logic_vector(17 downto 0);
signal numOFDMSyms : std_logic_vector(6 downto 0);
signal numDataSC_div2 : std_logic_vector(9 downto 0);
signal numNullSC_div2 : std_logic_vector(9 downto 0);
signal symPerSlot : integer := 0;
--signal triggerOut : std_logic;

component FFT_mod_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        triggerIn : in std_logic;
        dataIn_re : in std_logic_vector(31 downto 0);
        dataIn_im : in std_logic_vector(31 downto 0);
        validIn : in std_logic;
        readyIn : out std_logic;
        cpLengths : in std_logic_vector(9*2-1 downto 0);
        numOFDMSyms : in std_logic_vector(6 downto 0);
        numDataSC_div2 : in std_logic_vector(9 downto 0);
        numNullSC_div2 : in std_logic_vector(9 downto 0);
        triggerOut : out std_logic;
        dataOut_re : out std_logic_vector(31 downto 0);
        dataOut_im : out std_logic_vector(31 downto 0);
        validOut : out std_logic;
        readyOut : in std_logic;
        lastOut : out std_logic
);
end component;

file F0, F1 : text;

begin


clk100_process :process
begin
    clk <= '0';
    wait for clk_P_100/2;
    clk <= '1';
    wait for clk_P_100/2;
end process;

-- hold reset for 8 clock periods 
rstn <= '1' after clk_P_100*8;

---- INPUT DATA: -- after nulling and fftshift
--process(clk)
--    file FILE1: text open read_mode is "dataIn_HBW_I.txt";
--    file FILE2: text open read_mode is "dataIn_HBW_Q.txt";
--    file FILE3: text open read_mode is "validIn_HBW.txt";
--    variable line1 : line;
--    variable dataIn : std_logic_vector(16-1 downto 0);
--    variable validIn : std_logic;
--    variable count : integer;
    
--begin
--    if rising_edge(clk) then
--        if rstn = '0' then
--            b0_valid <= '0';
--            file_close(FILE1); file_open(FILE1,"dataIn_HBW_I.txt",read_mode);
--            file_close(FILE2); file_open(FILE2,"dataIn_HBW_Q.txt",read_mode);
--            file_close(FILE3); file_open(FILE3,"validIn_HBW.txt",read_mode);
--            b0_data_I <= ((others => '0'));
--            b0_data_Q <= ((others => '0'));
--            b0_valid <= '0';
--            count := 0;
--            b0_trigger <= '0';
--        else
--            b0_trigger <= '0';
--            readline(FILE1,line1);
--            read(line1,dataIn);
--            b0_data_I(16-1 downto 0) <= dataIn;
--            readline(FILE1,line1);
--            read(line1,dataIn);
--            b0_data_I(2*16-1 downto 16) <= dataIn;
            
--            readline(FILE2,line1);
--            read(line1,dataIn);
--            b0_data_Q(16-1 downto 0) <= dataIn;
--            readline(FILE2,line1);
--            read(line1,dataIn);
--            b0_data_Q(2*16-1 downto 16) <= dataIn;

--            readline(FILE3,line1);
--            read(line1,validIn);
--            b0_valid <= validIn;
--            readline(FILE3,line1);
--            read(line1,validIn);
--            --b0_valid <= validIn;

--            if count = 512 or count = 14872 or count = 14872*2-48 or count = 14872*3+4096 then
--                b0_trigger <= '1';
--            end if;                
--            count := count + 1;
            
--        end if;
--    end if;
--end process;

-- INPUT DATA: -- before nulling and ifftshift
process(clk)
    file FILE1: text open read_mode is "dataIn_HBW_I_3.txt";
    file FILE2: text open read_mode is "dataIn_HBW_Q_3.txt";
    file FILE3: text open read_mode is "validIn_HBW_3.txt";
    variable line1 : line;
    variable dataIn : std_logic_vector(16-1 downto 0);
    variable validIn : std_logic;
    variable count : integer;
    
begin
    if rising_edge(clk) then
        if rstn = '0' then
            b0_valid <= '0';
            file_close(FILE1); file_open(FILE1,"dataIn_HBW_I_3.txt",read_mode);
            file_close(FILE2); file_open(FILE2,"dataIn_HBW_Q_3.txt",read_mode);
            file_close(FILE3); file_open(FILE3,"validIn_HBW_3.txt",read_mode);
            b0_data_I <= ((others => '0'));
            b0_data_Q <= ((others => '0'));
            b0_valid <= '0';
            count := 0;
            b0_trigger <= '0';
        elsif readyIn = '1' then
            b0_trigger <= '0';
            readline(FILE1,line1);
            read(line1,dataIn);
            b0_data_I(16-1 downto 0) <= dataIn;
            readline(FILE1,line1);
            read(line1,dataIn);
            b0_data_I(2*16-1 downto 16) <= dataIn;
            
            readline(FILE2,line1);
            read(line1,dataIn);
            b0_data_Q(16-1 downto 0) <= dataIn;
            readline(FILE2,line1);
            read(line1,dataIn);
            b0_data_Q(2*16-1 downto 16) <= dataIn;

            readline(FILE3,line1);
            read(line1,validIn);
            b0_valid <= validIn;
            readline(FILE3,line1);
            read(line1,validIn);

            if  count = 512 or 
                count = 2*512+symPerSlot*14/2 or 
                count = 2*512+2*symPerSlot*14/2 or 
                count = 2*512+3*symPerSlot*14/2 or 
                count = 2*512+4*symPerSlot*14/2 or 
                count = 2*512+5*symPerSlot*14/2 or 
                count = 1024*16+2*512+6*symPerSlot*14/2 
            then
                b0_trigger <= '1';
            end if;                
            count := count + 1;
        else
            b0_data_I <= ((others => '0'));
            b0_data_Q <= ((others => '0'));
            b0_valid <= '0';
            b0_trigger <= '0';
        end if;
    end if;
end process;

symPerSlot <= 1740; -- 876;
CP_lengths <= std_logic_vector(to_unsigned(144/2,9)) & std_logic_vector(to_unsigned(400/2,9));
numOFDMSyms <= std_logic_vector(to_unsigned(14,numOFDMSyms'length));
numDataSC_div2 <= std_logic_vector(to_unsigned(symPerSlot/2,numDataSC_div2'length));
numNullSC_div2 <= std_logic_vector(to_unsigned(2048/2-symPerSlot/2,numNullSC_div2'length));

UUT: FFT_mod_top
Port map(   clk => clk,
            rstn => rstn,
            --
            dataIn_re => b0_data_I,
            dataIn_im => b0_data_Q,
            validIn => b0_valid,
            readyIn => readyIn,
            triggerIn => b0_trigger,
            --
            cpLengths => CP_lengths,
            numOFDMSyms => numOFDMSyms,
            numDataSC_div2 => numDataSC_div2,
            numNullSC_div2 => numNullSC_div2,
            --
            triggerOut => open,
            dataOut_re => dataOut_re,
            dataOut_im => dataOut_im,
            validOut => validOut,
            readyOut => readyOut,
            lastOut => lastOut
);

--OUTPUT DATA
process(clk)
    variable v_OLINE     : line;
    variable v_SPACE     : character;
begin
    if rising_edge(clk) then
        if rstn = '0' then
            file_close(F0);
            file_open(F0, "dataOut_HBW_re_3.txt", write_mode);
            file_close(F1);
            file_open(F1, "dataOut_HBW_im_3.txt", write_mode);
        else
            if validOut = '1' then
                write(v_OLINE, to_integer(signed(dataOut_re(16-1 downto 0))), left, 16);
                writeline(F0, v_OLINE);
                write(v_OLINE, to_integer(signed(dataOut_re(2*16-1 downto 16))), left, 16);
                writeline(F0, v_OLINE);

                write(v_OLINE, to_integer(signed(dataOut_im(16-1 downto 0))), left, 16);
                writeline(F1, v_OLINE);
                write(v_OLINE, to_integer(signed(dataOut_im(2*16-1 downto 16))), left, 16);
                writeline(F1, v_OLINE);
            end if;
        end if;
    end if;
end process;

process
begin
    readyOut <= '1';
    wait for clk_P_100 * 876*14;
    readyOut <= '0';
    wait for clk_P_100 * 2000;
    readyOut <= '1';
    wait;
end process;

end Behavioral;
