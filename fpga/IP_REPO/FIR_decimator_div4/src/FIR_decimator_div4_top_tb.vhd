----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2023 07:13:57 PM
-- Design Name: 
-- Module Name: FIR_decimator_div4_top_tb - Behavioral
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

entity FIR_decimator_div4_top_tb is
end FIR_decimator_div4_top_tb;

architecture Behavioral of FIR_decimator_div4_top_tb is

component FIR_decimator_div4_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        dataIn_re : in std_logic_vector(16*8-1 downto 0);
        dataIn_im : in std_logic_vector(16*8-1 downto 0);
        validIn : in std_logic;
        BW_sel : in std_logic;
        dataOut_re : out std_logic_vector(16*8-1 downto 0);
        dataOut_im : out std_logic_vector(16*8-1 downto 0);
        validOut : out std_logic
);
end component;

-- Clock period definitions
constant clk_P : time := 10 ns;
signal clk, rstn : std_logic := '0';
signal b0_validIn : std_logic;
signal b0_dataIn_re, b0_dataIn_im : std_logic_vector(16*8-1 downto 0);
signal b1_validOut : std_logic;
signal b1_dataOut_re, b1_dataOut_im : std_logic_vector(16*8-1 downto 0);

begin

-- Clock process definitions
clk100_process :process
begin
    clk <= '0';
    wait for clk_P/2;
    clk <= '1';
    wait for clk_P/2;
end process;

-- hold reset for 8 clock periods 
rstn <= '1' after clk_P*8;

--b0: INPUT DATA: 
process(clk)
    file F1: text open read_mode is "decimator_div4_IN_re.txt";
    file F2: text open read_mode is "decimator_div4_IN_im.txt";
    variable lineIn : line;
    variable i_INPUT_VAR : std_logic_vector(16-1 downto 0);
    
begin
    if rising_edge(clk) then
        if rstn = '0' then
            b0_validIn <= '0';
            file_close(F1);
            file_open(F1,"decimator_div4_IN_re.txt",read_mode);
            file_close(F2);
            file_open(F2,"decimator_div4_IN_im.txt",read_mode);
        else
            b0_validIn <= '1';
            for jj in 0 to 7 loop
                -- real part
                readline(F1,lineIn);
                read(lineIn,i_INPUT_VAR);
                b0_dataIn_re(16*(jj+1)-1 downto 16*jj) <= i_INPUT_VAR;
            end loop;
            for jj in 0 to 7 loop
                -- imag part
                readline(F2,lineIn);
                read(lineIn,i_INPUT_VAR);
                b0_dataIn_Im(16*(jj+1)-1 downto 16*jj) <= i_INPUT_VAR;
            end loop;
        end if;
    end if;
end process;	

b1: FIR_decimator_div4_top
Port map (  clk => clk,
            rstn => rstn,
            dataIn_re => b0_dataIn_re,
            dataIn_im => b0_dataIn_im,
            validIn => b0_validIn,
            BW_sel => '1',
            dataOut_re => b1_dataOut_re,
            dataOut_im => b1_dataOut_im,
            validOut => b1_validOut
);

--b2: OUTPUT DATA: 
process(clk)
    file file_REAL: text open write_mode is "decimator_div4_OUT_re.txt";
    file file_IMAG: text open write_mode is "decimator_div4_OUT_im.txt";
    variable lineOut : line;
begin
    if rising_edge(clk) then
        if rstn = '0' then
            file_close(file_REAL);
            file_open(file_REAL,"decimator_div4_OUT_re.txt",write_mode);
            file_close(file_IMAG);
            file_open(file_IMAG,"decimator_div4_OUT_im.txt",write_mode);
        else
            if b1_validOut ='1' then
                for jj in 0 to 8-1 loop
                    write(lineOut,to_integer(signed(b1_dataOut_re((jj+1)*16-1 downto jj*16))));
                    writeline(file_REAL,lineOut);
                    write(lineOut,to_integer(signed(b1_dataOut_im((jj+1)*16-1 downto jj*16))));
                    writeline(file_IMAG,lineOut);
                end loop;
            end if;
        end if;
    end if;
end process;	


end Behavioral;
