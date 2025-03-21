----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/26/2022 07:56:24 PM
-- Design Name: 
-- Module Name: CE_5G_NR_top_tb - Behavioral
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


entity CE_5G_NR_top_tb is
end CE_5G_NR_top_tb;

architecture Behavioral of CE_5G_NR_top_tb is

constant clk_P_100 : time := 10 ns;

signal clk : std_logic := '0';
signal rstn, reset : std_logic := '0';
signal b0_valid : std_logic := '0';
signal b0_data_I, b0_data_Q : std_logic_vector(2*16-1 downto 0) := (others => '0');
signal b0_countSCIn : std_logic_vector(11 downto 0) := (others => '0');
signal b0_countOFDMIn : std_logic_vector(4 downto 0) := (others => '0');
signal b0_triggerIn : std_logic := '0';

signal dataOut_re, dataOut_im : std_logic_vector(2*16-1 downto 0);
signal validOut : std_logic;
signal triggerOut : std_logic;
signal dataOut_re_LStemp :  std_logic_vector(2*16-1 downto 0); 
signal dataOut_im_LStemp :  std_logic_vector(2*16-1 downto 0); 
signal validOut_LStemp :  std_logic;
signal nVarOut : std_logic_vector(31 downto 0);
signal nVarValidOut : std_logic;

component CE_5G_NR_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        --
        dataIn_re : in std_logic_vector(2*16-1 downto 0); -- s[16 10] : {X_re[n+1],X_re[n]}
        dataIn_im : in std_logic_vector(2*16-1 downto 0); -- s[16 10] : {X_im[n+1],X_im[n]}
        validIn : in std_logic;
        triggerIn : in std_logic;
        --
        countSCIn : in std_logic_vector(11 downto 0);
        countOFDMIn : in std_logic_vector(4 downto 0);
        offsetIn : in std_logic_vector(3 downto 0);
        SCspacingIn : in std_logic_vector(4 downto 0);
        DMRSSymbolIn : in std_logic_vector(4 downto 0);
        NumSCp22div2 : in std_logic_vector(10 downto 0); -- Number of DM_RS symbols div2 + 11
        Num_DMRS_inv : in std_logic_vector(15 downto 0); -- Inv of Number of DM_RS symbols s[16 15]
        scaling_nVar : in std_logic_vector(15 downto 0); -- s * (1/(numDMRS-1)) s[16 15]
        --
        triggerOut : out std_logic;
--        dataOut_re_LStemp : out std_logic_vector(2*16-1 downto 0); 
--        dataOut_im_LStemp : out std_logic_vector(2*16-1 downto 0); 
--        validOut_LStemp : out std_logic;
        dataOut_re : out std_logic_vector(2*16-1 downto 0); 
        dataOut_im : out std_logic_vector(2*16-1 downto 0); 
        validOut : out std_logic;
        nVarOut : out std_logic_vector(31 downto 0);
        nVarValidOut : out std_logic
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
    file FILE1: text open read_mode is "dataInILA_I.txt";
    file FILE2: text open read_mode is "dataInILA_Q.txt";
    file FILE3: text open read_mode is "dataValidILA.txt";
    file FILE4: text open read_mode is "scInILA.txt";
    file FILE5: text open read_mode is "ofdmInILA.txt";
    file FILE6: text open read_mode is "triggerILA.txt";
    variable line1 : line;
    variable dataIn : std_logic_vector(32-1 downto 0);
    variable OFDMInVar : std_logic_vector(4 downto 0);
    variable SCInVar : std_logic_vector(11 downto 0);
    variable validInVar : std_logic;
    
begin
    if rising_edge(clk) then
        if rstn = '0' then
            b0_valid <= '0';
--            file_close(FILE1); file_open(FILE1,"OFDM_DEMOD_dataOut_re.txt",read_mode);
--            file_close(FILE2); file_open(FILE2,"OFDM_DEMOD_dataOut_im.txt",read_mode);
--            file_close(FILE3); file_open(FILE3,"OFDM_DEMOD_validOut.txt",read_mode);
--            file_close(FILE4); file_open(FILE4,"OFDM_DEMOD_countOFDMOut.txt",read_mode);
--            file_close(FILE5); file_open(FILE5,"OFDM_DEMOD_countSCOut.txt",read_mode);
--            file_close(FILE6); file_open(FILE6,"OFDM_DEMOD_triggerOut.txt",read_mode);
            file_close(FILE1); file_open(FILE1,"dataInILA_I.txt",read_mode);
            file_close(FILE2); file_open(FILE2,"dataInILA_Q.txt",read_mode);
            file_close(FILE3); file_open(FILE3,"dataValidILA.txt",read_mode);
            file_close(FILE4); file_open(FILE4,"ofdmInILA.txt",read_mode);
            file_close(FILE5); file_open(FILE5,"scInILA.txt",read_mode);
            file_close(FILE6); file_open(FILE6,"triggerILA.txt",read_mode);
            b0_data_I <= ((others => '0'));
            b0_data_Q <= ((others => '0'));
            b0_valid <= '0';
            b0_countOFDMIn <= (others => '0');
            b0_countSCIn <= (others => '0');
            b0_triggerIn <= '0';
        else
            readline(FILE1,line1);
            read(line1,dataIn);
            b0_data_I(32-1 downto 0) <= dataIn;
            
            readline(FILE2,line1);
            read(line1,dataIn);
            b0_data_Q(32-1 downto 0) <= dataIn;

            readline(FILE3,line1);
            read(line1,validInVar);
            b0_valid <= validInVar;

            readline(FILE4,line1);
            read(line1,OFDMInVar);
            b0_countOFDMIn <= OFDMInVar;

            readline(FILE5,line1);
            read(line1,SCInVar);
            b0_countSCIn <= SCInVar;

            readline(FILE6,line1);
            read(line1,validInVar);
            b0_triggerIn <= validInVar;

        end if;
    end if;
end process;

UUT: CE_5G_NR_top
Port map(   clk => clk,
            rstn => rstn,
            --
            dataIn_re => b0_data_I,
            dataIn_im => b0_data_Q,
            validIn => b0_valid,
            triggerIn => b0_triggerIn,
            --
            countSCIn => b0_countSCIn,
            countOFDMIn => b0_countOFDMIn,
            offsetIn => "0000", -- 
            SCspacingIn => "00010", 
            DMRSSymbolIn => "00011",
            NumSCp22div2 => "01101110001", -- (1740+22)/2
            Num_DMRS_inv => "0000000000111000", -- 1/580
            scaling_nVar => "0000000000111111", -- 1.1161/(580-1) s[16 15] -- s * (1/dmRS-1)
            --
            --dataOut_re_LStemp => dataOut_re_LStemp,
            --dataOut_im_LStemp => dataOut_im_LStemp,
            --validOut_LStemp => validOut_LStemp,
            dataOut_re => dataOut_re,
            dataOut_im => dataOut_im,
            triggerOut => triggerOut,
            validOut => validOut,
            nVarOut => nVarOut,
            nVarValidOut => nVarValidOut
);


--OUTPUT DATA
--process(clk)
--    variable v_OLINE     : line;
--    variable v_SPACE     : character;
--    file FILE1: text open write_mode is "dataOut3_I.txt";
--    file FILE2: text open write_mode is "dataOut3_Q.txt";
--begin
--    if rising_edge(clk) then
--        if rstn = '0' then
--            file_close(FILE1);
--            file_open(FILE1, "dataOut3_I.txt", write_mode);
--            file_close(FILE2);
--            file_open(FILE2, "dataOut3_Q.txt", write_mode);
--        else
--            if validOut = '1' then
--                write(v_OLINE, to_integer(signed(dataOut_re(16-1 downto 0))), left, 16);
--                writeline(FILE1, v_OLINE);
--                write(v_OLINE, to_integer(signed(dataOut_re(2*16-1 downto 16))), left, 16);
--                writeline(FILE1, v_OLINE);

--                write(v_OLINE, to_integer(signed(dataOut_im(16-1 downto 0))), left, 16);
--                writeline(FILE2, v_OLINE);
--                write(v_OLINE, to_integer(signed(dataOut_im(2*16-1 downto 16))), left, 16);
--                writeline(FILE2, v_OLINE);
--            end if;
--        end if;
--    end if;
--end process;

--process(clk)
--    variable v_OLINE     : line;
--    variable v_SPACE     : character;
--    file FILE1: text open write_mode is "dataOut_CE_I.txt";
--    file FILE2: text open write_mode is "dataOut_CE_Q.txt";
--    file FILE3: text open write_mode is "dataOut_CE_Valid.txt";
--    file FILE4: text open write_mode is "dataOut_LS_I.txt";
--    file FILE5: text open write_mode is "dataOut_LS_Q.txt";
--    file FILE6: text open write_mode is "dataOut_LS_Valid.txt";
--begin
--    if rising_edge(clk) then
--        if rstn = '0' then
--            file_close(FILE1);
--            file_open(FILE1, "dataOut_CE_I.txt", write_mode);
--            file_close(FILE2);
--            file_open(FILE2, "dataOut_CE_Q.txt", write_mode);
--            file_close(FILE3);
--            file_open(FILE3, "dataOut_CE_Valid.txt", write_mode);
--            file_close(FILE4);
--            file_open(FILE4, "dataOut_LS_I.txt", write_mode);
--            file_close(FILE5);
--            file_open(FILE5, "dataOut_LS_Q.txt", write_mode);
--            file_close(FILE6);
--            file_open(FILE6, "dataOut_LS_Valid.txt", write_mode);
--        else
--            write(v_OLINE, ((dataOut_re)), left, 32);
--            writeline(FILE1, v_OLINE);
--            write(v_OLINE, ((dataOut_im)), left, 32);
--            writeline(FILE2, v_OLINE);
--            write(v_OLINE, ((validOut)), left, 1);
--            writeline(FILE3, v_OLINE);
--            write(v_OLINE, ((dataOut_re_LStemp)), left, 32);
--            writeline(FILE4, v_OLINE);
--            write(v_OLINE, ((dataOut_im_LStemp)), left, 32);
--            writeline(FILE5, v_OLINE);
--            write(v_OLINE, ((validOut_LStemp)), left, 1);
--            writeline(FILE6, v_OLINE);
--        end if;
--    end if;
--end process;

end Behavioral;
