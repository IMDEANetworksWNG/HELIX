----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2022 04:49:46 PM
-- Design Name: 
-- Module Name: PT_RS_5G_top_tb - Behavioral
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

entity PT_RS_5G_top_tb is
end PT_RS_5G_top_tb;

architecture Behavioral of PT_RS_5G_top_tb is

component PT_RS_5G_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        --
        dataIn_re : in std_logic_vector(2*16-1 downto 0); -- s[16 10] : {X_re[n+1],X_re[n]}
        dataIn_im : in std_logic_vector(2*16-1 downto 0); -- s[16 10] : {X_im[n+1],X_im[n]}
        validIn : in std_logic;
        triggerIn : in std_logic;
        --
        BW_MODE : in std_logic_vector(0 downto 0);
        offsetDMRSIn : in std_logic_vector(4 downto 0);
        offsetPTRSIn : in std_logic_vector(4 downto 0);
        DMRSSCspacingIn : in std_logic_vector(4 downto 0);
        PTRSSCspacingIn : in std_logic_vector(4 downto 0);
        DMRSSymbolIn : in std_logic_vector(4 downto 0); -- 1'based
        numSC : in std_logic_vector(11 downto 0);
        numOFDM : in std_logic_vector(5 downto 0);
        Even_PTRS : in std_logic;
        SSBSymbolIn1 : in std_logic_vector(4 downto 0); -- 1'based
        SSBSymbolIn2 : in std_logic_vector(4 downto 0); -- 1'based
        SSBSymbolIn3 : in std_logic_vector(4 downto 0); -- 1'based
        SSBSymbolIn4 : in std_logic_vector(4 downto 0); -- 1'based
        SSB_SCinit : in std_logic_vector(11 downto 0);
        SSB_SCend : in std_logic_vector(11 downto 0);
        --
        triggerOut : out std_logic;
        dataOut_re : out std_logic_vector(2*16-1 downto 0);  -- s[16 14] : {X_re[n+1],X_re[n]}
        dataOut_im : out std_logic_vector(2*16-1 downto 0);  -- s[16 14] : {X_im[n+1],X_im[n]}
        --validOut : out std_logic
        validOut : out std_logic_vector(1 downto 0)
);
end component;

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
signal dataOut_Valid :  std_logic_vector(1 downto 0);
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
--    file FILE1: text open read_mode is "PTRS_dataIn_re.txt";
--    file FILE2: text open read_mode is "PTRS_dataIn_im.txt";
--    file FILE3: text open read_mode is "PTRS_dataIn_valid.txt";
--    file FILE4: text open read_mode is "PTRS_triggerIn.txt";
    file FILE1: text open read_mode is "PTRS_HBW_dataInRe.txt";
    file FILE2: text open read_mode is "PTRS_HBW_dataInIm.txt";
    file FILE3: text open read_mode is "PTRS_HBW_dataValid.txt";
    file FILE4: text open read_mode is "PTRS_HBW_triggerIN.txt";

    variable line1 : line;
    variable dataIn : std_logic_vector(32-1 downto 0);
    variable dataIn16 : std_logic_vector(16-1 downto 0);
    variable validInVar : std_logic;
    
begin
    if rising_edge(clk) then
        if rstn = '0' then
--            file_close(FILE1); file_open(FILE1,"PTRS_dataIn_re.txt",read_mode);
--            file_close(FILE2); file_open(FILE2,"PTRS_dataIn_im.txt",read_mode);
--            file_close(FILE3); file_open(FILE3,"PTRS_dataIn_valid.txt",read_mode);
--            file_close(FILE4); file_open(FILE4,"PTRS_triggerIn.txt",read_mode);
            file_close(FILE1); file_open(FILE1,"PTRS_HBW_dataInRe.txt",read_mode);
            file_close(FILE2); file_open(FILE2,"PTRS_HBW_dataInIm.txt",read_mode);
            file_close(FILE3); file_open(FILE3,"PTRS_HBW_dataValid.txt",read_mode);
            file_close(FILE4); file_open(FILE4,"PTRS_HBW_triggerIN.txt",read_mode);
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

UUT:  PT_RS_5G_top
Port map (  clk => clk,
            rstn => rstn,
            dataIn_Re => dataIn_Re,
            dataIn_Im => dataIn_Im,
            validIn => dataIn_Valid,
            triggerIn => triggerIn,
            --
            BW_MODE(0) => '0',
            DMRSSymbolIn => "00011", -- 3 
            offsetPTRSIn => "01011", -- 24/2-1 - offsetPTRS
            offsetDMRSIn => "00010", -- 6/2-1 - offsetDMRS
            PTRSSCspacingIn => "01011", -- 24/2-1
            DMRSSCspacingIn => "00010", -- 6/2-1
            numSC => "001101100110", -- 1740/2
            numOFDM => "001110", -- 14
            Even_PTRS => '0', -- 0: PT-RS symbols at even positions in the OFDM symbols 
            SSBSymbolIn1 => "01001", -- 9 (FR2)  -- "00101", -- 5 (FR1) -- 
            SSBSymbolIn2 => "01010", -- 10 (FR2) -- "00110", -- 6 (FR1) -- 
            SSBSymbolIn3 => "01011", -- 11 (FR2) -- "00111", -- 7 (FR1) -- 
            SSBSymbolIn4 => "01100", -- 12 (FR2) -- "01000", -- 8 (FR1) -- 
            SSB_SCinit => "000101110100", -- 744/2
            SSB_SCend => "000111110001", -- 996/2-1
            --
            dataOut_Re => dataOut_Re,
            dataOut_Im => dataOut_Im,
            validOut => dataOut_Valid,
            triggerOut => triggerOut
);

--process(clk)
--    variable v_OLINE     : line;
--    variable v_SPACE     : character;
----    file FILE1: text open write_mode is "dataOut_re.txt";
----    file FILE2: text open write_mode is "dataOut_im.txt";
--    file FILE1: text open write_mode is "dataOut_HBW_re.txt";
--    file FILE2: text open write_mode is "dataOut_HBW_im.txt";
--begin
--    if rising_edge(clk) then
--        if rstn = '0' then
----            file_close(FILE1);
----            file_open(FILE1, "dataOut_re.txt", write_mode);
----            file_close(FILE2);
----            file_open(FILE2, "dataOut_im.txt", write_mode);
--            file_close(FILE1);
--            file_open(FILE1, "dataOut_HBW_re.txt", write_mode);
--            file_close(FILE2);
--            file_open(FILE2, "dataOut_HBW_im.txt", write_mode);
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
----    file FILE1: text open write_mode is "PTRS_Symbs_Out_re.txt";
----    file FILE2: text open write_mode is "PTRS_Symbs_Out_im.txt";
--    file FILE1: text open write_mode is "PTRS_HBW_Symbs_Out_re.txt";
--    file FILE2: text open write_mode is "PTRS_HBW_Symbs_Out_im.txt";
--begin
--    if rising_edge(clk) then
--        if rstn = '0' then
----            file_close(FILE1);
----            file_open(FILE1, "PTRS_Symbs_Out_re.txt", write_mode);
----            file_close(FILE2);
----            file_open(FILE2, "PTRS_Symbs_Out_im.txt", write_mode);
--            file_close(FILE1);
--            file_open(FILE1, "PTRS_HBW_Symbs_Out_re.txt", write_mode);
--            file_close(FILE2);
--            file_open(FILE2, "PTRS_HBW_Symbs_Out_im.txt", write_mode);
--        else
--            if dataOut_Valid = '1' then
--                write(v_OLINE, (to_integer(signed((dataOut_re(15 downto 0))))), left, 16);
--                writeline(FILE1, v_OLINE);
--                --write(v_OLINE, (to_integer(signed((dataOut_re(31 downto 16))))), left, 16);
--                --writeline(FILE1, v_OLINE);
                
--                write(v_OLINE, (to_integer(signed((dataOut_im(15 downto 0))))), left, 16);
--                writeline(FILE2, v_OLINE);
--                --write(v_OLINE, (to_integer(signed((dataOut_im(31 downto 16))))), left, 16);
--                --writeline(FILE2, v_OLINE);
--            end if;
--        end if;
--    end if;
--end process;

--process(clk)
--    variable v_OLINE     : line;
--    variable v_SPACE     : character;
----    file FILE1: text open write_mode is "PTRS_LS_Out_re.txt";
----    file FILE2: text open write_mode is "PTRS_LS_Out_im.txt";
--    file FILE1: text open write_mode is "PTRS_HBW_LS_Out_re.txt";
--    file FILE2: text open write_mode is "PTRS_HBW_LS_Out_im.txt";
--begin
--    if rising_edge(clk) then
--        if rstn = '0' then
--            file_close(FILE1);
--            --file_open(FILE1, "PTRS_LS_Out_re.txt", write_mode);
--            file_open(FILE1, "PTRS_HBW_LS_Out_re.txt", write_mode);
--            file_close(FILE2);
--            --file_open(FILE2, "PTRS_LS_Out_im.txt", write_mode);
--            file_open(FILE2, "PTRS_HBW_LS_Out_im.txt", write_mode);
--        else
--            if dataOut_Valid = '1' then
--                write(v_OLINE, (to_integer(signed((dataOut_re(31 downto 0))))), left, 16);
--                writeline(FILE1, v_OLINE);
--                --write(v_OLINE, (to_integer(signed((dataOut_re(31 downto 16))))), left, 16);
--                --writeline(FILE1, v_OLINE);
                
--                write(v_OLINE, (to_integer(signed((dataOut_im(31 downto 0))))), left, 16);
--                writeline(FILE2, v_OLINE);
--                --write(v_OLINE, (to_integer(signed((dataOut_im(31 downto 16))))), left, 16);
--                --writeline(FILE2, v_OLINE);
--            end if;
--        end if;
--    end if;
--end process;

--process(clk)
--    variable v_OLINE     : line;
--    variable v_SPACE     : character;
----    file FILE1: text open write_mode is "PTRS_Inter_Out_re.txt";
----    file FILE2: text open write_mode is "PTRS_Inter_Out_im.txt";
--    file FILE1: text open write_mode is "PTRS_HBW_Inter_Out_re.txt";
--    file FILE2: text open write_mode is "PTRS_HBW_Inter_Out_im.txt";
--begin
--    if rising_edge(clk) then
--        if rstn = '0' then
----            file_close(FILE1);
----            file_open(FILE1, "PTRS_Inter_Out_re.txt", write_mode);
----            file_close(FILE2);
----            file_open(FILE2, "PTRS_Inter_Out_im.txt", write_mode);
--            file_close(FILE1);
--            file_open(FILE1, "PTRS_HBW_Inter_Out_re.txt", write_mode);
--            file_close(FILE2);
--            file_open(FILE2, "PTRS_HBW_Inter_Out_im.txt", write_mode);
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
----    file FILE1: text open write_mode is "PTRS_Scaling_Out_re.txt";
----    file FILE2: text open write_mode is "PTRS_Scaling_Out_im.txt";
--    file FILE1: text open write_mode is "PTRS_InvScaling_Out_re.txt";
--    file FILE2: text open write_mode is "PTRS_InvScaling_Out_im.txt";
--begin
--    if rising_edge(clk) then
--        if rstn = '0' then
----            file_close(FILE1);
----            file_open(FILE1, "PTRS_Scaling_Out_re.txt", write_mode);
----            file_close(FILE2);
----            file_open(FILE2, "PTRS_Scaling_Out_im.txt", write_mode);
--            file_close(FILE1);
--            file_open(FILE1, "PTRS_InvScaling_Out_re.txt", write_mode);
--            file_close(FILE2);
--            file_open(FILE2, "PTRS_InvScaling_Out_im.txt", write_mode);
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

process(clk)
    variable v_OLINE     : line;
    variable v_SPACE     : character;
--    file FILE1: text open write_mode is "PTRS_PDSCH_PRE_PHASE_Out_re.txt";
--    file FILE2: text open write_mode is "PTRS_PDSCH_PRE_PHASE_Out_im.txt";
--    file FILE1: text open write_mode is "PTRS_PDSCH_Out_re.txt";
--    file FILE2: text open write_mode is "PTRS_PDSCH_Out_im.txt";
    file FILE1: text open write_mode is "PTRS_HBW_PDSCH_Out_re.txt";
    file FILE2: text open write_mode is "PTRS_HBW_PDSCH_Out_im.txt";
begin
    if rising_edge(clk) then
        if rstn = '0' then
--            file_close(FILE1);
--            file_open(FILE1, "PTRS_PDSCH_Out_re.txt", write_mode);
--            file_close(FILE2);
--            file_open(FILE2, "PTRS_PDSCH_Out_im.txt", write_mode);
            file_close(FILE1);
            file_open(FILE1, "PTRS_HBW_PDSCH_Out_re.txt", write_mode);
            file_close(FILE2);
            file_open(FILE2, "PTRS_HBW_PDSCH_Out_im.txt", write_mode);
        else
            if dataOut_Valid(0) = '1' then
                write(v_OLINE, (to_integer(signed((dataOut_re(15 downto 0))))), left, 16);
                writeline(FILE1, v_OLINE);
                write(v_OLINE, (to_integer(signed((dataOut_im(15 downto 0))))), left, 16);
                writeline(FILE2, v_OLINE);
            end if;
            if dataOut_Valid(1) = '1' then                
                write(v_OLINE, (to_integer(signed((dataOut_re(31 downto 16))))), left, 16);
                writeline(FILE1, v_OLINE);
                write(v_OLINE, (to_integer(signed((dataOut_im(31 downto 16))))), left, 16);
                writeline(FILE2, v_OLINE);
            end if;
        end if;
    end if;
end process;

end Behavioral;
