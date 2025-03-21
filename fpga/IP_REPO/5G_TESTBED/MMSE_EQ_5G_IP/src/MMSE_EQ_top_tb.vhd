----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/28/2022 11:09:01 AM
-- Design Name: 
-- Module Name: MMSE_EQ_top_tb - Behavioral
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

entity MMSE_EQ_top_tb is
end MMSE_EQ_top_tb;

architecture Behavioral of MMSE_EQ_top_tb is

constant clk_P_100 : time := 10 ns;

signal clk : std_logic := '0';
signal rstn, reset : std_logic := '0';

component MMSE_EQ_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        dataIn_Re : in std_logic_vector(31 downto 0);
        dataIn_Im : in std_logic_vector(31 downto 0);
        dataIn_Valid : in std_logic;
        triggerIn : in std_logic;
        CE_In_re : in std_logic_vector(31 downto 0);
        CE_In_im : in std_logic_vector(31 downto 0);
        CE_In_Valid : in std_logic;
        CE_triggerIn : in std_logic;
        nVar_In : in std_logic_vector(31 downto 0);
        nVar_In_Valid : in std_logic;
        triggerOut : out std_logic;
        --
        numSC : in std_logic_vector(11 downto 0);
        numOFDMm1 : in std_logic_vector(4 downto 0);
        --
        dataOut_Re : out std_logic_vector(31 downto 0);
        dataOut_Im : out std_logic_vector(31 downto 0);
        dataOut_Valid : out std_logic
);
end component;

signal dataIn_Re : std_logic_vector(31 downto 0);
signal dataIn_Im :  std_logic_vector(31 downto 0);
signal dataIn_Valid :  std_logic;
signal triggerIn :  std_logic;
signal CE_In_re :  std_logic_vector(31 downto 0);
signal CE_In_im :  std_logic_vector(31 downto 0);
signal CE_In_Valid :  std_logic;
signal CE_triggerIn :  std_logic;
signal nVar_In :  std_logic_vector(31 downto 0);
signal nVar_In_Valid :  std_logic;
signal dataOut_Re :  std_logic_vector(31 downto 0);
signal dataOut_Im :  std_logic_vector(31 downto 0);
signal dataOut_Valid :  std_logic;
signal triggerOut : std_logic;

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
    file FILE1: text open read_mode is "dataInRe.txt";
    file FILE2: text open read_mode is "dataInIm.txt";
    file FILE3: text open read_mode is "dataValid.txt";
    file FILE4: text open read_mode is "Hest_dataRe.txt";
    file FILE5: text open read_mode is "Hest_dataIm.txt";
    file FILE6: text open read_mode is "Hest_dataValid.txt";
    file FILE7: text open read_mode is "triggerIN.txt";
    file FILE8: text open read_mode is "CE_ready.txt";
    file FILE9: text open read_mode is "nVar.txt";
    file FILE10: text open read_mode is "nVarValid.txt";

    variable line1 : line;
    variable dataIn : std_logic_vector(32-1 downto 0);
    variable dataIn16 : std_logic_vector(16-1 downto 0);
    variable validInVar : std_logic;
    
begin
    if rising_edge(clk) then
        if rstn = '0' then
            file_close(FILE1); file_open(FILE1,"dataInRe.txt",read_mode);
            file_close(FILE2); file_open(FILE2,"dataInIm.txt",read_mode);
            file_close(FILE3); file_open(FILE3,"dataValid.txt",read_mode);
            file_close(FILE4); file_open(FILE4,"Hest_dataRe.txt",read_mode);
            file_close(FILE5); file_open(FILE5,"Hest_dataIm.txt",read_mode);
            file_close(FILE6); file_open(FILE6,"Hest_dataValid.txt",read_mode);
            file_close(FILE7); file_open(FILE7,"triggerIN.txt",read_mode);
            file_close(FILE8); file_open(FILE8,"CE_ready.txt",read_mode);
            file_close(FILE9); file_open(FILE9,"nVar.txt",read_mode);
            file_close(FILE10); file_open(FILE10,"nVarValid.txt",read_mode);
            dataIn_Re <= (others => '0');
            dataIn_Im <= (others => '0');
            dataIn_Valid <= '0';
            triggerIn <= '0';
            CE_In_re <= (others => '0');
            CE_In_im <= (others => '0');
            CE_In_valid <= '0';
            CE_triggerIn <= '0';
            nVar_In <= (others => '0');
            nVar_In_Valid <= '0';
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
            read(line1,dataIn);
            CE_In_re <= dataIn;

            readline(FILE5,line1);
            read(line1,dataIn);
            CE_In_im <= dataIn;

            readline(FILE6,line1);
            read(line1,validInVar);
            CE_In_valid <= validInVar;

            readline(FILE7,line1);
            read(line1,validInVar);
            triggerIn <= validInVar;

            readline(FILE8,line1);
            read(line1,validInVar);
            CE_triggerIn <= validInVar;
            
            readline(FILE9,line1);
            read(line1,dataIn);
            nVar_In <= dataIn;

            readline(FILE10,line1);
            read(line1,validInVar);
            nVar_In_Valid <= validInVar;

        end if;
    end if;
end process;

UUT:  MMSE_EQ_top
Port map (  clk => clk,
            rstn => rstn,
            dataIn_Re => dataIn_Re,
            dataIn_Im => dataIn_Im,
            dataIn_Valid => dataIn_Valid,
            triggerIn => triggerIn,
            CE_In_re => CE_In_re,
            CE_In_im => CE_In_im,
            CE_In_Valid => CE_In_Valid,
            CE_triggerIn => CE_triggerIn,
            nVar_In => nVar_In,
            nVar_In_Valid => nVar_In_Valid,
            triggerOut => triggerOut,
            --
            numSC => "001101100110", -- 1740/2
            --numSCm1 => "001101100101", -- 1740/2 - 1
            numOFDMm1 => "01101", -- 13
            --
            dataOut_Re => dataOut_Re,
            dataOut_Im => dataOut_Im,
            dataOut_Valid => dataOut_Valid
);

--process(clk)
--    variable v_OLINE     : line;
--    variable v_SPACE     : character;
--    file FILE1: text open write_mode is "csiOut1.txt";
--    file FILE2: text open write_mode is "csiOut2.txt";
--begin
--    if rising_edge(clk) then
--        if rstn = '0' then
--            file_close(FILE1);
--            file_open(FILE1, "csiOut1.txt", write_mode);
--            file_close(FILE2);
--            file_open(FILE2, "csiOut2.txt", write_mode);
--        else
--            if dataOut_Valid = '1' then
--                write(v_OLINE, (to_integer(signed((dataOut_re(31 downto 0))))), left, 32);
--                writeline(FILE1, v_OLINE);
--                write(v_OLINE, (to_integer(signed((dataOut_im(31 downto 0))))), left, 32);
--                writeline(FILE2, v_OLINE);
--            end if;
--        end if;
--    end if;
--end process;

--process(clk)
--    variable v_OLINE     : line;
--    variable v_SPACE     : character;
--    file FILE1: text open write_mode is "Hdash_RxSym_re.txt";
--    file FILE2: text open write_mode is "Hdash_RxSym_im.txt";
--begin
--    if rising_edge(clk) then
--        if rstn = '0' then
--            file_close(FILE1);
--            file_open(FILE1, "Hdash_RxSym_re.txt", write_mode);
--            file_close(FILE2);
--            file_open(FILE2, "Hdash_RxSym_im.txt", write_mode);
--        else
--            if dataOut_Valid = '1' then
--                write(v_OLINE, (to_integer(signed((dataOut_re(15 downto 0))))), left, 16);
--                writeline(FILE1, v_OLINE);
--                write(v_OLINE, (to_integer(signed((dataOut_re(31 downto 16))))), left, 16);
--                writeline(FILE1, v_OLINE);
                
--                write(v_OLINE, (to_integer(signed((dataOut_im(15 downto 0))))), left, 16);
--                writeline(FILE2, v_OLINE);
--                write(v_OLINE, (to_integer(signed((dataOut_im(31 downto 16))))), left, 16);
--                writeline(FILE2, v_OLINE);
--            end if;
--        end if;
--    end if;
--end process;

--process(clk)
--    variable v_OLINE     : line;
--    variable v_SPACE     : character;
--    file FILE1: text open write_mode is "INVcsiOut1.txt";
--    file FILE2: text open write_mode is "INVcsiOut2.txt";
--begin
--    if rising_edge(clk) then
--        if rstn = '0' then
--            file_close(FILE1);
--            file_open(FILE1, "INVcsiOut1.txt", write_mode);
--            file_close(FILE2);
--            file_open(FILE2, "INVcsiOut2.txt", write_mode);
--        else
--            if dataOut_Valid = '1' then
--                write(v_OLINE, (to_integer(signed((dataOut_re(31 downto 0))))), left, 32);
--                writeline(FILE1, v_OLINE);
--                write(v_OLINE, (to_integer(signed((dataOut_im(31 downto 0))))), left, 32);
--                writeline(FILE2, v_OLINE);
--            end if;
--        end if;
--    end if;
--end process;

process(clk)
    variable v_OLINE     : line;
    variable v_SPACE     : character;
    file FILE1: text open write_mode is "dataOut_re.txt";
    file FILE2: text open write_mode is "dataOut_im.txt";
begin
    if rising_edge(clk) then
        if rstn = '0' then
            file_close(FILE1);
            file_open(FILE1, "dataOut_re.txt", write_mode);
            file_close(FILE2);
            file_open(FILE2, "dataOut_im.txt", write_mode);
        else
            if dataOut_Valid = '1' then
                write(v_OLINE, (to_integer(signed((dataOut_re(15 downto 0))))), left, 16);
                writeline(FILE1, v_OLINE);
                write(v_OLINE, (to_integer(signed((dataOut_re(31 downto 16))))), left, 16);
                writeline(FILE1, v_OLINE);
                
                write(v_OLINE, (to_integer(signed((dataOut_im(15 downto 0))))), left, 16);
                writeline(FILE2, v_OLINE);
                write(v_OLINE, (to_integer(signed((dataOut_im(31 downto 16))))), left, 16);
                writeline(FILE2, v_OLINE);
            end if;
        end if;
    end if;
end process;

end Behavioral;
