----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2022 02:21:16 PM
-- Design Name: 
-- Module Name: CE_5G_NR_top_TEST_tb - Behavioral
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

entity CE_5G_NR_top_TEST_tb is
end CE_5G_NR_top_TEST_tb;

architecture Behavioral of CE_5G_NR_top_TEST_tb is

constant clk_P_100 : time := 10 ns;

signal clk : std_logic := '0';
signal rstn, reset : std_logic := '0';

signal b0_triggerIn : std_logic := '0';
signal dataOut_re, dataOut_im : std_logic_vector(2*16-1 downto 0);
signal validOut : std_logic;
signal dataOut_re_LStemp :  std_logic_vector(2*16-1 downto 0); 
signal dataOut_im_LStemp :  std_logic_vector(2*16-1 downto 0); 
signal validOut_LStemp :  std_logic;

component CE_5G_NR_top_TEST is
Port (  clk : in std_logic;
        rstn : in std_logic;
        --
        b2_FiltInterpIn_re : in std_logic_vector(2*16-1 downto 0); 
        b2_FiltInterpIn_im : in std_logic_vector(2*16-1 downto 0); 
        b1_validOut : in std_logic;
        b6_dataIn_re : in std_logic_vector(2*16-1 downto 0); 
        b6_dataIn_im : in std_logic_vector(2*16-1 downto 0); 
        b5_validOut : in std_logic;
        triggerIn : in std_logic;
        --
        Num_DMRS_inv : in std_logic_vector(15 downto 0); -- Inv of Number of DM_RS symbols s[16 15]
        scaling_nVar : in std_logic_vector(15 downto 0); -- s * (1/(numDMRS-1)) s[16 15]
        offsetIn : in std_logic_vector(3 downto 0);
        SCspacingIn : in std_logic_vector(4 downto 0)
        --
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
    file FILE1: text open read_mode is "dataOut_CE_I.txt";
    file FILE2: text open read_mode is "dataOut_CE_Q.txt";
    file FILE3: text open read_mode is "dataOut_CE_Valid.txt";
    file FILE4: text open read_mode is "dataOut_LS_I.txt";
    file FILE5: text open read_mode is "dataOut_LS_Q.txt";
    file FILE6: text open read_mode is "dataOut_LS_Valid.txt";

    variable line1 : line;
    variable dataIn : std_logic_vector(32-1 downto 0);
    variable validInVar : std_logic;
    
begin
    if rising_edge(clk) then
        if rstn = '0' then
            file_close(FILE1); file_open(FILE1,"dataOut_CE_I.txt",read_mode);
            file_close(FILE2); file_open(FILE2,"dataOut_CE_Q.txt",read_mode);
            file_close(FILE3); file_open(FILE3,"dataOut_CE_Valid.txt",read_mode);
            file_close(FILE4); file_open(FILE4,"dataOut_LS_I.txt",read_mode);
            file_close(FILE5); file_open(FILE5,"dataOut_LS_Q.txt",read_mode);
            file_close(FILE6); file_open(FILE6,"dataOut_LS_Valid.txt",read_mode);
            dataOut_re <= (others => '0');
            dataOut_im <= (others => '0');
            dataOut_re_LStemp <= (others => '0');
            dataOut_im_LStemp <= (others => '0');
            validOut <= '0';
            validOut_LStemp <= '0';
        else
            readline(FILE1,line1);
            read(line1,dataIn);
            dataOut_re(32-1 downto 0) <= dataIn;
            
            readline(FILE2,line1);
            read(line1,dataIn);
            dataOut_im(32-1 downto 0) <= dataIn;

            readline(FILE3,line1);
            read(line1,validInVar);
            validOut <= validInVar;

            readline(FILE4,line1);
            read(line1,dataIn);
            dataOut_re_LStemp <= dataIn;

            readline(FILE5,line1);
            read(line1,dataIn);
            dataOut_im_LStemp <= dataIn;

            readline(FILE6,line1);
            read(line1,validInVar);
            validOut_LStemp <= validInVar;

        end if;
    end if;
end process;

process
begin
    b0_triggerIn <= '0';
    wait for clk_P_100*1000;
    b0_triggerIn <= '1';
    wait for clk_P_100;
    b0_triggerIn <= '0';
    wait;    
end process;

UUT: CE_5G_NR_top_TEST
Port map(   clk => clk,
            rstn => rstn,
            --
            b6_dataIn_re => dataOut_re,
            b6_dataIn_im => dataOut_im,
            b5_validOut => validOut,
            triggerIn => b0_triggerIn,
            b2_FiltInterpIn_re => dataOut_re_LStemp,
            b2_FiltInterpIn_im => dataOut_im_LStemp,
            b1_validOut => validOut_LStemp,
            --
            Num_DMRS_inv => "0000000000111000", -- 1/580
            scaling_nVar => "0000000000111111", -- 1.1161/(580-1) s[16 15] -- s * (1/dmRS-1)
            offsetIn => "0000", -- 
            SCspacingIn => "00010" 
);

end Behavioral;
