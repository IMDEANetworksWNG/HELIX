----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2023 11:41:41 AM
-- Design Name: 
-- Module Name: LDPCdecoder_top_tb - Behavioral
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

entity LDPCdecoder_top_tb is
end LDPCdecoder_top_tb;

architecture Behavioral of LDPCdecoder_top_tb is

function or_reduce( V: std_logic_vector ) return std_ulogic is
    variable result: std_ulogic;
begin
    for i in V'range loop
        if i = V'left then
            result := V(i);
        else
            result := result OR V(i);
        end if;
        exit when result = '1';
    end loop;
    return result;
end or_reduce; 

constant clk_P_100 : time := 10 ns;

signal clk : std_logic := '0';
signal rstn, reset : std_logic := '0';
signal coreclk : std_logic := '0';
signal corerstn : std_logic := '0';

signal dataIn_Re : std_logic_vector(31 downto 0) := (others => '0');
signal dataIn_Im :  std_logic_vector(31 downto 0) := (others => '0');
signal dataIn_Valid :  std_logic_vector(1 downto 0) := "00";
signal triggerIn, demapperDone :  std_logic := '0';
signal dataOut :  std_logic_vector(127 downto 0);
--signal validOut :  std_logic_vector(15 downto 0);
signal validOut :  std_logic_vector(7 downto 0);
signal triggerOut : std_logic;
signal dataOutHD : std_logic_vector(63 downto 0);
signal validOutHD : std_logic;

component LDPCdecoder_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        core_clk : in std_logic;
        --
        dataInRe1 : in std_logic_vector(16-1 downto 0);
        dataInRe2 : in std_logic_vector(16-1 downto 0);
        dataInIm1 : in std_logic_vector(16-1 downto 0);
        dataInIm2 : in std_logic_vector(16-1 downto 0);
        validIn : in std_logic_vector(1 downto 0);
        triggerIn : in std_logic; 
        demapperDone : in std_logic;
        --
        Zc : in std_logic_vector(6 downto 0);
        Em1 : in std_logic_vector(10 downto 0);
        Kdm1 : in std_logic_vector(10 downto 0);
        Fm1 : in std_logic_vector(10 downto 0);
        FZ : in std_logic_vector(10 downto 0);
        Cm1 : in std_logic_vector(2 downto 0);
        RuleFirst1 : in std_logic_vector(4*3-1 downto 0);
        JumpFirst1 : in std_logic_vector(2 downto 0);
        RuleLast1 : in std_logic_vector(4*3-1 downto 0);
        RuleFirst2 : in std_logic_vector(4*3-1 downto 0);
        JumpFirst2 : in std_logic_vector(2 downto 0);
        RuleLast2 : in std_logic_vector(4*3-1 downto 0);
        RuleLastZeros : in std_logic_vector(4*3-1 downto 0);
        RuleLastPunctured : in std_logic_vector(4*3-1 downto 0);
        LDPC_Ctrl_1 : in std_logic_vector(39 downto 0);
        LDPC_Ctrl_2 : in std_logic_vector(39 downto 0);
        LDPC_Ctrl_3 : in std_logic_vector(39 downto 0);
        --
        dataOutRateAdap : out std_logic_vector(127 downto 0);
        validOutRateAdap : out std_logic_vector(7 downto 0);
        dataOutHD : out std_logic_vector(63 downto 0);
        validOutHD : out std_logic;
        lastOutHD : out std_logic;
        readyOutHD : out std_logic;
        dataOutStatus : out std_logic_vector(39 downto 0);
        validOutStatus : out std_logic
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

coreclk_process :process
begin
    coreclk <= '0';
    wait for 749 ps;
    coreclk <= '1';
    wait for 749 ps;
end process;

-- hold reset for 8 clock periods 
corerstn <= '1' after 749 ps *2*8;

-- INPUT DATA: 
process(clk)
    file FILE1: text open read_mode is "LDPC_in_re.txt";
    file FILE2: text open read_mode is "LDPC_in_im.txt";
    file FILE3: text open read_mode is "LDPC_valid.txt";
    file FILE4: text open read_mode is "LDPC_trigger.txt";

    variable line1 : line;
    variable dataIn : std_logic_vector(32-1 downto 0);
    variable validInVar : std_logic_vector(1 downto 0);
    variable triggerInVar : std_logic;
    
begin
    if rising_edge(clk) then
        if rstn = '0' then
            file_close(FILE1); file_open(FILE1,"LDPC_in_re.txt",read_mode);
            file_close(FILE2); file_open(FILE2,"LDPC_in_im.txt",read_mode);
            file_close(FILE3); file_open(FILE3,"LDPC_valid.txt",read_mode);
            file_close(FILE4); file_open(FILE4,"LDPC_trigger.txt",read_mode);
            dataIn_Re <= (others => '0');
            dataIn_Im <= (others => '0');
            dataIn_Valid <= "00";
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
            read(line1,triggerInVar);
            triggerIn <= triggerInVar;

        end if;
    end if;
end process;

---- INPUT DATA: 
--process(clk)
--    file FILE1: text open write_mode is "LDPC_Compare.txt";
--    file FILE3: text open read_mode is "LDPC_valid.txt";
--    file FILE4: text open read_mode is "LDPC_trigger.txt";

--    variable line1 : line;
--    variable dataIn : std_logic_vector(32-1 downto 0);
--    variable validInVar : std_logic_vector(1 downto 0);
--    variable triggerInVar : std_logic;
--    variable v_OLINE     : line;
--    variable counterRe, counterIm : integer range -32 to 31;
    
--    variable writeTBInputFile : std_logic := '0';
--begin
--    if rising_edge(clk) then
--        if rstn = '0' then
--            if writeTBInputFile = '1' then    
--                file_close(FILE1); file_open(FILE1,"LDPC_Compare.txt",write_mode);
--            end if;
--            file_close(FILE3); file_open(FILE3,"LDPC_valid.txt",read_mode);
--            file_close(FILE4); file_open(FILE4,"LDPC_trigger.txt",read_mode);
--            dataIn_Re <= (others => '0');
--            dataIn_Im <= (others => '0');
--            dataIn_Valid <= "00";
--            triggerIn <= '0';
--            counterRe := -31;
--            counterIm := 31;
--        else
--            readline(FILE4,line1);
--            read(line1,triggerInVar);
--            triggerIn <= triggerInVar;

--            readline(FILE3,line1);
--            read(line1,validInVar);
--            dataIn_Valid <= validInVar;

--            case validInVar is
--                when "00" => 
--                    dataIn_Re(32-1 downto 0) <= (others => 'X');
--                    dataIn_Im(32-1 downto 0) <= (others => 'X');
--                when "01" => 
--                    dataIn_Re(32-1 downto 16) <= (others => 'X');
--                    dataIn_Re(16-1 downto 0) <= std_logic_vector(to_signed(counterRe*2**10,16));
                    
--                    if writeTBInputFile = '1' then
--                        write(v_OLINE, counterRe, left, 16);
--                        writeline(FILE1, v_OLINE);
--                    end if;
--                    if counterRe = 31 then
--                        counterRe := -31;
--                    else
--                        counterRe := counterRe + 1;
--                    end if;
                    
--                    dataIn_Im(32-1 downto 16) <= (others => 'X');
--                    dataIn_Im(16-1 downto 0) <= std_logic_vector(to_signed(counterIm*2**10,16));
--                    if writeTBInputFile = '1' then
--                        write(v_OLINE, counterIm, left, 16);
--                        writeline(FILE1, v_OLINE);
--                    end if;
--                    if counterIm = -31 then
--                        counterIm := 31;
--                    else
--                        counterIm := counterIm - 1;
--                    end if;
--                when "10" => 
--                    dataIn_Re(32-1 downto 16) <= std_logic_vector(to_signed(counterRe*2**10,16));
--                    dataIn_Re(16-1 downto 0) <= (others => 'X');
--                    if writeTBInputFile = '1' then
--                        write(v_OLINE, counterRe, left, 16);
--                        writeline(FILE1, v_OLINE);
--                    end if;
--                    if counterRe = 31 then
--                        counterRe := -31;
--                    else
--                        counterRe := counterRe + 1;
--                    end if;
                    
--                    dataIn_Im(32-1 downto 16) <= std_logic_vector(to_signed(counterIm*2**10,16));
--                    dataIn_Im(16-1 downto 0) <= (others => 'X');
--                    if writeTBInputFile = '1' then
--                        write(v_OLINE, counterIm, left, 16);
--                        writeline(FILE1, v_OLINE);
--                    end if;
--                    if counterIm = -31 then
--                        counterIm := 31;
--                    else
--                        counterIm := counterIm - 1;
--                    end if;
--                when "11" => 
--                    dataIn_Re(16-1 downto 0) <= std_logic_vector(to_signed(counterRe*2**10,16));
--                    if writeTBInputFile = '1' then
--                        write(v_OLINE, counterRe, left, 16);
--                        writeline(FILE1, v_OLINE);
--                    end if;
--                    if counterRe = 31 then
--                        counterRe := -31;
--                    else
--                        counterRe := counterRe + 1;
--                    end if;
                    
--                    dataIn_Im(16-1 downto 0) <= std_logic_vector(to_signed(counterIm*2**10,16));
--                    if writeTBInputFile = '1' then
--                        write(v_OLINE, counterIm, left, 16);
--                        writeline(FILE1, v_OLINE);
--                    end if;
--                    if counterIm = -31 then
--                        counterIm := 31;
--                    else
--                        counterIm := counterIm - 1;
--                    end if;
                    
--                    dataIn_Re(32-1 downto 16) <= std_logic_vector(to_signed(counterRe*2**10,16));
--                    if writeTBInputFile = '1' then
--                        write(v_OLINE, counterRe, left, 16);
--                        writeline(FILE1, v_OLINE);
--                    end if;
--                    if counterRe = 31 then
--                        counterRe := -31;
--                    else
--                        counterRe := counterRe + 1;
--                    end if;

--                    dataIn_Im(32-1 downto 16) <= std_logic_vector(to_signed(counterIm*2**10,16));
--                    if writeTBInputFile = '1' then
--                        write(v_OLINE, counterIm, left, 16);
--                        writeline(FILE1, v_OLINE);
--                    end if;
--                    if counterIm = -31 then
--                        counterIm := 31;
--                    else
--                        counterIm := counterIm - 1;
--                    end if;
--                when others => 
--                    dataIn_Re(32-1 downto 0) <= (others => 'X');
--                    dataIn_Im(32-1 downto 0) <= (others => 'X');
--            end case;

--        end if;
--    end if;
--end process;

UUT: LDPCdecoder_top
Port map (  clk => clk,
            rstn => rstn,
            core_clk => coreclk,
            triggerIn => triggerIn,
            demapperDone => demapperDone,
            dataInRe1 => dataIn_Re(15 downto 0),
            dataInIm1 => dataIn_Im(15 downto 0),
            dataInRe2 => dataIn_Re(31 downto 16),
            dataInIm2 => dataIn_Im(31 downto 16),
            validIn => dataIn_Valid,
            --
            Zc =>   "0101010",        -- 2*352/16-1-1
            Em1 =>  "00111000111", -- ceil(14578/16/2)-1
            Kdm1 => "00110010100", -- 6496/16-1-1
            Fm1 =>  "00000100001", -- 544/16-1
            FZ =>   "00111111010", -- ceil((23232-14578-544)/16)-1
            Cm1 =>  "010",              -- 3
            RuleFirst1 =>        "110101101111", -- {14 7 16}-1
            JumpFirst1 =>                 "000",
            RuleLast1 =>         "000110001111", -- {2 9 16}-1
            RuleFirst2 =>        "110101101111", -- {14 7 16}-1
            JumpFirst2 =>                 "100",
            RuleLast2 =>         "101000011000", -- {11 2 9}-1
            RuleLastZeros =>     "110111011101", -- {14 14 14}-1 (23232-14578-544)-floor((23232-14578-544)/16)*16-1
            RuleLastPunctured => "111111111111", -- {16 16 16}-1
            LDPC_Ctrl_1 => x"2E003D582D",
            LDPC_Ctrl_2 => x"2E003D582D",
            LDPC_Ctrl_3 => x"2E003D582D",
            --
            dataOutRateAdap => dataOut,
            validOutRateAdap => validOut,
            dataOutHD => dataOutHD,
            validOutHD => validOutHD
);

--        lastOutHD : out std_logic;
--        readyOutHD : out std_logic;
--        dataOutStatus : out std_logic_vector(39 downto 0);
--        validOutStatus : out std_logic

process
begin
    demapperDone <= '0';
    wait for 136185 ns;
    demapperDone <= '1';
    wait for clk_P_100;
    demapperDone <= '0';
    wait;
end process;
    
process(clk)
    variable v_OLINE     : line;
    variable v_SPACE     : character;
    file FILE1: text open write_mode is "rateAdapt_Out.txt";
    file FILE2: text open write_mode is "ldpc_Out.txt";
begin
    if rising_edge(clk) then
        if rstn = '0' then
            file_close(FILE1);
            file_open(FILE1, "rateAdapt_Out.txt", write_mode);
            file_close(FILE2);
            file_open(FILE2, "ldpc_Out.txt", write_mode);
        else
            if to_integer(unsigned(validOut)) > 0 then
                for ii in 0 to to_integer(unsigned(validOut))-1 loop
                    write(v_OLINE, (to_integer(signed((dataOut((ii+1)*8-1 downto ii*8))))), left, 8);
                    writeline(FILE1, v_OLINE);
                end loop;
            end if;
            if validOutHD = '1' then
                for ii in 0 to dataOutHD'high loop
                    write(v_OLINE, dataOutHD(ii), left, 1);
                    writeline(FILE2, v_OLINE);
                end loop;
            end if;
        end if;
    end if;
end process;

end Behavioral;
