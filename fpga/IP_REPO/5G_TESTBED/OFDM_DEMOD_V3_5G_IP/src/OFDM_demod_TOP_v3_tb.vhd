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

entity OFDM_demod_TOP_v3_tb is
end OFDM_demod_TOP_v3_tb;

architecture Behavioral of OFDM_demod_TOP_v3_tb is

constant clk_P_100 : time := 10 ns;

signal clk : std_logic := '0';
signal rstn, reset : std_logic := '0';
signal b0_valid, b0_trigger : std_logic := '0';
signal b0_data_I, b0_data_Q : std_logic_vector(2*16-1 downto 0);
signal dataOut_re, dataOut_im : std_logic_vector(2*16-1 downto 0);
signal validOut : std_logic;
signal startOut : std_logic;
signal endOut : std_logic;
signal CP_lengths : std_logic_vector(17 downto 0);
signal numOFDMSyms : std_logic_vector(6 downto 0);
signal triggerOut : std_logic;

file F0, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11 : text;

component OFDM_demod_TOP_v3 is
Port (  clk : in std_logic;
        rstn : in std_logic;
        --
        dataIn_re : in std_logic_vector(2*16-1 downto 0); -- s[16 15]
        dataIn_im : in std_logic_vector(2*16-1 downto 0); -- s[16 15]
        validIn : in std_logic;
        triggerIn : in std_logic;
        triggerIn_TEMP : in std_logic;
        --
        cpLengths : in std_logic_vector(17 downto 0);
        numOFDMSyms : in std_logic_vector(6 downto 0);
        nullFirst : in std_logic_vector(11 downto 0); -- Index of the first null subcarrier = Num Data subcarriers (no fftshift)
        nullLast : in std_logic_vector(11 downto 0); -- NumDataSC/2 + NumNullSC - 1 (no fftshift)  
        --
        countSCOut : out std_logic_vector(11 downto 0);
        countOFDMOut : out std_logic_vector(4 downto 0);
        fifoErrorOut : out std_logic;
        triggerOut : out std_logic;
        dataOut_re : out std_logic_vector(2*16-1 downto 0); -- s[16 10] (when configFFT = "0000001010101011")
        dataOut_im : out std_logic_vector(2*16-1 downto 0); -- s[16 10] (when configFFT = "0000001010101011")
        validOut : out std_logic
);
end component;

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
reset <= not rstn;

-- INPUT DATA: 
process(clk)
    file FILE1: text open read_mode is "dataIn_HBW_I.txt";
    file FILE2: text open read_mode is "dataIn_HBW_Q.txt";
    variable line1 : line;
    variable dataIn : std_logic_vector(16-1 downto 0);
    variable count : integer;
    
begin
    if rising_edge(clk) then
        if rstn = '0' then
            b0_valid <= '0';
            file_close(FILE1); file_open(FILE1,"dataIn_HBW_I.txt",read_mode);
            file_close(FILE2); file_open(FILE2,"dataIn_HBW_Q.txt",read_mode);
            b0_data_I <= ((others => '0'));
            b0_data_Q <= ((others => '0'));
            b0_valid <= '0';
            count := 0;
            b0_trigger <= '0';
        else
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

            b0_valid <= '1';
            
            if count = 512 or count = 512+15472+512 then
                b0_trigger <= '1';
            end if;                
            count := count + 1;
            
        end if;
    end if;
end process;

CP_lengths <= std_logic_vector(to_unsigned(144,9)) & std_logic_vector(to_unsigned(400,9));
numOFDMSyms <= std_logic_vector(to_unsigned(14,numOFDMSyms'length));

UUT: OFDM_demod_TOP_v3
Port map(   clk => clk,
            rstn => rstn,
            --
            dataIn_re => b0_data_I,
            dataIn_im => b0_data_Q,
            validIn => b0_valid,
            triggerIn => b0_trigger,
            triggerIn_TEMP => '0',
            --
            cpLengths => CP_lengths,
            numOFDMSyms => numOFDMSyms,
            nullFirst => "000010011001", -- 153 "001101100110", -- 870
            nullLast => "011101100110", -- 1894 "010010011001", -- 1177
            --
            countSCOut => open,
            countOFDMOut => open,
            dataOut_re => dataOut_re,
            dataOut_im => dataOut_im,
            triggerOut => triggerOut,
            fifoErrorOut => open,
            validOut => validOut
);

--OUTPUT DATA
process(clk)
    variable v_OLINE     : line;
    variable v_SPACE     : character;
begin
    if rising_edge(clk) then
        if rstn = '0' then
            file_close(F0);
            file_open(F0, "dataOut_HBW_re3.txt", write_mode);
            file_close(F1);
            file_open(F1, "dataOut_HBW_im3.txt", write_mode);
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

end Behavioral;
