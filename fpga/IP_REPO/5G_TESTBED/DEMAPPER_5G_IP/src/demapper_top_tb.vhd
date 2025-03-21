----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2022 12:49:42 PM
-- Design Name: 
-- Module Name: demapper_top_tb - Behavioral
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

entity demapper_top_tb is
end demapper_top_tb;

architecture Behavioral of demapper_top_tb is

constant clk_P_100 : time := 10 ns;

signal clk : std_logic := '0';
signal rstn, reset : std_logic := '0';

signal dataIn_Re : std_logic_vector(31 downto 0) := (others => '0');
signal dataIn_Im :  std_logic_vector(31 downto 0) := (others => '0');
signal dataIn_Valid :  std_logic := '0';
signal triggerIn :  std_logic := '0';
signal dataOut_Re :  std_logic_vector(31 downto 0);
signal dataOut_Im :  std_logic_vector(31 downto 0);
--signal dataOut_Valid :  std_logic;
signal validOut :  std_logic_vector(1 downto 0);
signal triggerOut : std_logic;
signal lastOut : std_logic;

component demapper_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        triggerIn : in std_logic;
        dataIn_re : in std_logic_vector(2*16-1 downto 0); -- s[16 14]
        dataIn_im : in std_logic_vector(2*16-1 downto 0); -- s[16 14]
        validIn : in std_logic;
        NumBLK : in std_logic_vector(13 downto 0);  -- number of blocks of 4 bits in the slot. 
        triggerOut : out std_logic;
        lastOut : out std_logic;
        dataOut_re : out std_logic_vector(2*16-1 downto 0);  -- s[16 13] : {X_MSB[n+1],X_MSB[n]}
        dataOut_im : out std_logic_vector(2*16-1 downto 0);  -- s[16 13] : {X_LSB[n+1],X_LSB[n]}
        --validOut : out std_logic
        validOut : out std_logic_vector(1 downto 0)
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
    file FILE1: text open read_mode is "demapper_dataIn_re.txt";
    file FILE2: text open read_mode is "demapper_dataIn_im.txt";
    file FILE3: text open read_mode is "demapper_validIn.txt";
    file FILE4: text open read_mode is "demapper_triggerIn.txt";

    variable line1 : line;
    variable dataIn : std_logic_vector(32-1 downto 0);
    variable validInVar : std_logic;
    
begin
    if rising_edge(clk) then
        if rstn = '0' then
            file_close(FILE1); file_open(FILE1,"demapper_dataIn_re.txt",read_mode);
            file_close(FILE2); file_open(FILE2,"demapper_dataIn_im.txt",read_mode);
            file_close(FILE3); file_open(FILE3,"demapper_validIn.txt",read_mode);
            file_close(FILE4); file_open(FILE4,"demapper_triggerIn.txt",read_mode);
            dataIn_Re <= (others => '0');
            dataIn_Im <= (others => '0');
            dataIn_Valid <= '0';
            triggerIn <= '0';
        else
            readline(FILE1,line1);
            read(line1,dataIn);
            dataIn_Re(32-1 downto 0) <= dataIn;
            
            readline(FILE2,line1);
            read(line1,dataIn);
            dataIn_Im(32-1 downto 0) <= dataIn;

            readline(FILE3,line1);
            read(line1,validInVar);
            dataIn_Valid <= validInVar;

            readline(FILE4,line1);
            read(line1,validInVar);
            triggerIn <= validInVar;

        end if;
    end if;
end process;

UUT:  demapper_top
Port map (  clk => clk,
            rstn => rstn,
            triggerIn => triggerIn,
            dataIn_Re => dataIn_Re,
            dataIn_Im => dataIn_Im,
            validIn => dataIn_Valid,
            --
            NumBLK => "10101010110110", -- 10934
            triggerOut => triggerOut,
            lastOut => lastOut,
            dataOut_re => dataOut_re,
            dataOut_im => dataOut_im,
            validOut => validOut
);

process(clk)
    variable v_OLINE     : line;
    variable v_SPACE     : character;
    file FILE1: text open write_mode is "demapper_HBW_Out_re.txt";
    file FILE2: text open write_mode is "demapper_HBW_Out_im.txt";
begin
    if rising_edge(clk) then
        if rstn = '0' then
            file_close(FILE1);
            file_open(FILE1, "demapper_HBW_Out_re.txt", write_mode);
            file_close(FILE2);
            file_open(FILE2, "demapper_HBW_Out_im.txt", write_mode);
        else
            if validOut(0) = '1' then
                write(v_OLINE, (to_integer(signed((dataOut_re(15 downto 0))))), left, 16);
                writeline(FILE1, v_OLINE);
                write(v_OLINE, (to_integer(signed((dataOut_im(15 downto 0))))), left, 16);
                writeline(FILE2, v_OLINE);
            end if;
            if validOut(1) = '1' then                
                write(v_OLINE, (to_integer(signed((dataOut_re(31 downto 16))))), left, 16);
                writeline(FILE1, v_OLINE);
                write(v_OLINE, (to_integer(signed((dataOut_im(31 downto 16))))), left, 16);
                writeline(FILE2, v_OLINE);
            end if;
        end if;
    end if;
end process;

end Behavioral;
