----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2022 10:31:58 AM
-- Design Name: 
-- Module Name: SSB_TOP_v2_wrp_tb - Behavioral
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

entity SSB_v3_tb is
end SSB_v3_tb;

architecture Behavioral of SSB_v3_tb is

component SSB_TOP_v3 is
PORT(   clk                             : IN  std_logic; -- 245.76MHz 
        reset                           : IN  std_logic;
        clk_enable                      : IN  std_logic;
        dataIn_re                       : IN  std_logic_vector(16-1 DOWNTO 0);  -- s[16 15]
        dataIn_im                       : IN  std_logic_vector(16-1 DOWNTO 0);  -- s[16 15]
        validIn                         : IN  std_logic;
        BW_sel                          : in  std_logic;
        pssenergyOut                    : out std_logic_vector(24 downto 0);      -- s[24 16]
        pssenergyValidOut               : out std_logic;                          
        psscellidOut                    : out std_logic_vector(1 downto 0); -- u[2 0] 
        psscellidValidOut               : out std_logic;
        cfoOut                          : out std_logic_vector(18 downto 0); -- s[19 15]
        cfoValidOut                     : out std_logic;
        endssbOut                       : out std_logic;
--        pbchOut_re                      : out std_logic_vector((256-16)*16-1 downto 0); -- {X[255] X[254] .. X[0]}  --s[16 11]
--        pbchOut_im                      : out std_logic_vector((256-16)*16-1 downto 0); -- {X[255] X[254] .. X[0]}  --s[16 11]
--        pbchValidOut                    : out std_logic;
--        ssscellidOut                    : out std_logic_vector(8 downto 0); --u[9 0]
--        ssscellidValidOut               : out std_logic;
        tempOut_re                      : out std_logic_vector(15 DOWNTO 0);      --TEMP OUTPUT
        tempOut_im                      : out std_logic_vector(15 DOWNTO 0);      --TEMP OUTPUT
        tempValidOut                    : out std_logic
);
end component;

constant clk_P_100 : time := 10 ns;
constant DS_FACTOR : integer := 4; 

signal clk : std_logic := '0';
signal rstn, reset, rstn_FILE : std_logic := '0';

signal b0_valid : std_logic := '0';
signal b0_data_I, b0_data_Q : std_logic_vector(16-1 downto 0);

signal pssenergyOut : std_logic_vector(24 downto 0);     
signal pssenergyValidOut : std_logic;                         
signal psscellidOut : std_logic_vector(1 downto 0); 
signal psscellidValidOut : std_logic;

signal CFO_dataOut : std_logic_vector(18 downto 0);
signal CFO_validOut : std_logic;
signal Time_offset : std_logic;

signal pbchOut_re : std_logic_vector((256-16)*16-1 downto 0); -- {X[255] X[254] .. X[0]}
signal pbchOut_im : std_logic_vector((256-16)*16-1 downto 0); -- {X[255] X[254] .. X[0]}
signal pbchValidOut : std_logic;

signal ssscellidOut : std_logic_vector(8 downto 0);
signal ssscellidValidOut : std_logic;

signal delayIn : std_logic_vector(14-1 downto 0);

signal tempOut_re, tempOut_im : std_logic_vector(16-1 downto 0);
signal tempValidOut : std_logic;
 
file F0, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11 : text;

begin

clk100_process :process
begin
    clk <= '0';
    wait for clk_P_100/2;
    clk <= '1';
    wait for clk_P_100/2;
end process;

rst_process :process
begin
    rstn <= '0';
    wait for clk_P_100*8;
    rstn <= '1';
    wait;
end process;

reset <= not rstn;

rst_FILE_process :process
begin
    rstn_FILE <= '0';
    wait for clk_P_100*8;
    rstn_FILE <= '1';
    wait;
end process;



-- INPUT DATA: 
process(clk)
    file if_signals: text open read_mode is "dataIn_SSBv3_FR1_I_tb.txt";
    file if_signals2: text open read_mode is "dataIn_SSBv3_FR1_Q_tb.txt";
    variable line_var : line;
    variable data_in_VAR : std_logic_vector(15 downto 0);
    variable count : integer := 0;
    variable INIT : std_logic := '0';
    
begin
    if rising_edge(clk) then
        if rstn = '0' then
            b0_valid <= '0';
            file_close(if_signals);
            file_open(if_signals,"dataIn_SSBv3_FR1_I_tb.txt",read_mode);
            file_close(if_signals2);
            file_open(if_signals2,"dataIn_SSBv3_FR1_Q_tb.txt",read_mode);
            count := 0;
        else
            b0_valid <= '0';
            if count = DS_FACTOR-1 then
                readline(if_signals,line_var);
                read(line_var,data_in_VAR);
                b0_data_I <= data_in_VAR;
                
                readline(if_signals2,line_var);
                read(line_var,data_in_VAR);
                b0_data_Q <= data_in_VAR;

                b0_valid <= '1';
                
                count := 0;
            else
                count := count + 1;
            end if;
        end if;
    end if;
end process;

delayIn <= std_logic_vector(to_unsigned(12662,delayIn'length));

UUT: SSB_TOP_v3
PORT MAP (  clk => clk, 
            reset => reset,
            clk_enable => '1',
            dataIn_re => b0_data_I,
            dataIn_im => b0_data_Q,
            validIn => b0_valid,
            BW_sel => '1', -- '0' high BW, '1' low BW
            pssenergyOut => pssenergyOut,
            pssenergyValidOut => pssenergyValidOut,        
            psscellidOut => psscellidOut,
            psscellidValidOut => psscellidValidOut,
            cfoOut => CFO_dataOut,
            cfoValidOut => CFO_validOut,
            endssbOut => Time_offset,
            tempOut_re => tempOut_re,
            tempOut_im => tempOut_im,
            tempValidOut => tempValidOut
);

--write tb results to file
process(clk)
    variable v_OLINE     : line;
    variable v_SPACE     : character;
begin
    if rising_edge(clk) then
        if rstn_FILE = '0' then
            file_close(F0);
            file_open(F0, "SSB_pssenergyOut.txt", write_mode);
            file_close(F1);
            file_open(F1, "SSB_psscellidOut.txt", write_mode);
            file_close(F2);
            file_open(F2, "SSB_CFO_dataOut.txt", write_mode);
            file_close(F9);
            file_open(F9, "SSB_TempOut_re.txt", write_mode);
            file_close(F10);
            file_open(F10, "SSB_TempOut_im.txt", write_mode);
        else
            if pssenergyValidOut = '1' then
                write(v_OLINE, to_integer(unsigned(pssenergyOut)), left, 16);
                writeline(F0, v_OLINE);
            end if;
            if psscellidValidOut = '1' then
                write(v_OLINE, to_integer(unsigned(psscellidOut)), left, 16);
                writeline(F1, v_OLINE);
            end if;
            if CFO_validOut = '1' then
                write(v_OLINE, to_integer(signed(CFO_dataOut)), left, 16);
                writeline(F2, v_OLINE);
            end if;
            if tempValidOut = '1' then
                write(v_OLINE, to_integer(signed(tempOut_re)), left, 16);
                writeline(F9, v_OLINE);
                write(v_OLINE, to_integer(signed(tempOut_im)), left, 16);
                writeline(F10, v_OLINE);
            end if;
        end if;
    end if;
end process;

end Behavioral;