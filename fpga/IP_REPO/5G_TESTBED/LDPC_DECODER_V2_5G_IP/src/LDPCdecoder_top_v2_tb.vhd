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

entity LDPCdecoder_top_v2_tb is
end LDPCdecoder_top_v2_tb;

architecture Behavioral of LDPCdecoder_top_v2_tb is

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
signal validOutHD, lastOutHD : std_logic;

component LDPCdecoder_top_v2 is
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
        lastIn : in std_logic;
        triggerOut : out std_logic;
        --
        Kdm1 : in std_logic_vector(10 downto 0);
        Em1_C0 : in std_logic_vector(10 downto 0);
        Em1_C1 : in std_logic_vector(10 downto 0);
        Em1_C2 : in std_logic_vector(10 downto 0);
        Em1_C3 : in std_logic_vector(10 downto 0);
        Em1_C4 : in std_logic_vector(10 downto 0);
        Em1_C5 : in std_logic_vector(10 downto 0);
        RuleFirst1 : in std_logic_vector(6*4-1 downto 0);
        RuleLast1 : in std_logic_vector(6*4-1 downto 0);
        RuleFirst2 : in std_logic_vector(6*4-1 downto 0);
        RuleLast2 : in std_logic_vector(6*4-1 downto 0);
        JumpFirst1 : in std_logic_vector(5 downto 0);
        JumpFirst2 : in std_logic_vector(5 downto 0);
        Zc : in std_logic_vector(6 downto 0);
        LastPunctured : in std_logic_vector(4-1 downto 0);
        Fm1 : in std_logic_vector(10 downto 0);
        LastFillers : in std_logic_vector(4-1 downto 0);
        FZ_C0 : in std_logic_vector(10 downto 0);
        FZ_C1 : in std_logic_vector(10 downto 0);
        FZ_C2 : in std_logic_vector(10 downto 0);
        FZ_C3 : in std_logic_vector(10 downto 0);
        FZ_C4 : in std_logic_vector(10 downto 0);
        FZ_C5 : in std_logic_vector(10 downto 0);
        LastZeros : in std_logic_vector(6*4-1 downto 0);
        Cm1 : in std_logic_vector(2 downto 0);
        LDPC_Ctrl : in std_logic_vector(39 downto 0);
        F_R : in std_logic;
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

signal        Kdm1 :  std_logic_vector(10 downto 0);
signal        Em1_C0 :  std_logic_vector(10 downto 0);
signal        Em1_C1 :  std_logic_vector(10 downto 0);
signal        Em1_C2 :  std_logic_vector(10 downto 0);
signal        Em1_C3 :  std_logic_vector(10 downto 0);
signal        Em1_C4 :  std_logic_vector(10 downto 0);
signal        Em1_C5 :  std_logic_vector(10 downto 0);
signal        RuleFirst1 :  std_logic_vector(6*4-1 downto 0);
signal        RuleLast1 :  std_logic_vector(6*4-1 downto 0);
signal        RuleFirst2 :  std_logic_vector(6*4-1 downto 0);
signal        RuleLast2 :  std_logic_vector(6*4-1 downto 0);
signal        JumpFirst1 :  std_logic_vector(5 downto 0);
signal        JumpFirst2 :  std_logic_vector(5 downto 0);
signal        Zc :  std_logic_vector(6 downto 0);
signal        LastPunctured :  std_logic_vector(4-1 downto 0);
signal        Fm1 :  std_logic_vector(10 downto 0);
signal        LastFillers :  std_logic_vector(4-1 downto 0);
signal        FZ_C0 :  std_logic_vector(10 downto 0);
signal        FZ_C1 :  std_logic_vector(10 downto 0);
signal        FZ_C2 :  std_logic_vector(10 downto 0);
signal        FZ_C3 :  std_logic_vector(10 downto 0);
signal        FZ_C4 :  std_logic_vector(10 downto 0);
signal        FZ_C5 :  std_logic_vector(10 downto 0);
signal        LastZeros :  std_logic_vector(6*4-1 downto 0);
signal        Cm1 :  std_logic_vector(2 downto 0);
signal        LDPC_Ctrl :  std_logic_vector(39 downto 0);
signal        dataOutStatus :  std_logic_vector(39 downto 0);
signal        validOutStatus :  std_logic;
signal        F_R : std_logic;

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
--process(clk)
--    file FILE1: text open read_mode is "LDPC_in_re.txt";
--    file FILE2: text open read_mode is "LDPC_in_im.txt";
--    file FILE3: text open read_mode is "LDPC_valid.txt";
--    file FILE4: text open read_mode is "LDPC_trigger.txt";

--    variable line1 : line;
--    variable dataIn : std_logic_vector(32-1 downto 0);
--    variable validInVar : std_logic_vector(1 downto 0);
--    variable triggerInVar : std_logic;
    
--begin
--    if rising_edge(clk) then
--        if rstn = '0' then
--            file_close(FILE1); file_open(FILE1,"LDPC_in_re.txt",read_mode);
--            file_close(FILE2); file_open(FILE2,"LDPC_in_im.txt",read_mode);
--            file_close(FILE3); file_open(FILE3,"LDPC_valid.txt",read_mode);
--            file_close(FILE4); file_open(FILE4,"LDPC_trigger.txt",read_mode);
--            dataIn_Re <= (others => '0');
--            dataIn_Im <= (others => '0');
--            dataIn_Valid <= "00";
--            triggerIn <= '0';
--        else
--            readline(FILE1,line1);
--            read(line1,dataIn);
--            dataIn_Re(32-1 downto 0) <= dataIn;
            
--            readline(FILE2,line1);
--            read(line1,dataIn);
--            dataIn_Im(32-1 downto 0) <= dataIn;

--            readline(FILE3,line1);
--            read(line1,validInVar);
--            dataIn_Valid <= validInVar;

--            readline(FILE4,line1);
--            read(line1,triggerInVar);
--            triggerIn <= triggerInVar;

--        end if;
--    end if;
--end process;

-- INPUT DATA: 
process(clk)
    file FILE2: text open read_mode is "dataIn_v2.txt";
    file FILE3: text open read_mode is "LDPC_valid.txt";
    file FILE4: text open read_mode is "LDPC_trigger.txt";

    variable line1 : line;
    variable dataIn : std_logic_vector(16-1 downto 0);
    variable validInVar : std_logic_vector(1 downto 0);
    variable triggerInVar : std_logic;
    variable v_OLINE     : line;
    variable counterRe, counterIm : integer range -32 to 31;
    
begin
    if rising_edge(clk) then
        if rstn = '0' then
            file_close(FILE2); file_open(FILE2,"dataIn_v2.txt",read_mode);
            file_close(FILE3); file_open(FILE3,"LDPC_valid.txt",read_mode);
            file_close(FILE4); file_open(FILE4,"LDPC_trigger.txt",read_mode);
            dataIn_Re <= (others => '0');
            dataIn_Im <= (others => '0');
            dataIn_Valid <= "00";
            triggerIn <= '0';
        else
            readline(FILE4,line1);
            read(line1,triggerInVar);
            triggerIn <= triggerInVar;

            readline(FILE3,line1);
            read(line1,validInVar);
            dataIn_Valid <= validInVar;

            case validInVar is
                when "00" => 
                    dataIn_Re(32-1 downto 0) <= (others => 'X');
                    dataIn_Im(32-1 downto 0) <= (others => 'X');
                when "01" => 
                    
                    readline(FILE2,line1);
                    read(line1,dataIn);
                    dataIn_Re(32-1 downto 16) <= (others => 'X');
                    dataIn_Re(16-1 downto 0) <= dataIn;
                    
                    readline(FILE2,line1);
                    read(line1,dataIn);
                    dataIn_Im(32-1 downto 16) <= (others => 'X');
                    dataIn_Im(16-1 downto 0) <= dataIn;
                    
                when "10" => 
                    readline(FILE2,line1);
                    read(line1,dataIn);
                    dataIn_Re(32-1 downto 16) <= dataIn;
                    dataIn_Re(16-1 downto 0) <= (others => 'X');
                    
                    readline(FILE2,line1);
                    read(line1,dataIn);
                    dataIn_Im(32-1 downto 16) <= dataIn;
                    dataIn_Im(16-1 downto 0) <= (others => 'X');

                when "11" => 

                    readline(FILE2,line1);
                    read(line1,dataIn);
                    dataIn_Re(16-1 downto 0) <= dataIn;
                    
                    readline(FILE2,line1);
                    read(line1,dataIn);
                    dataIn_Im(16-1 downto 0) <= dataIn;

                    readline(FILE2,line1);
                    read(line1,dataIn);
                    dataIn_Re(32-1 downto 16) <= dataIn;
                    
                    readline(FILE2,line1);
                    read(line1,dataIn);
                    dataIn_Im(32-1 downto 16) <= dataIn;

                when others => 
                    dataIn_Re(32-1 downto 0) <= (others => 'X');
                    dataIn_Im(32-1 downto 0) <= (others => 'X');
            end case;

        end if;
    end if;
end process;

process
    file FILE1: text open read_mode is "LDPCregs.txt";
    variable line1 : line;
    variable dataIn : std_logic_vector(40-1 downto 0);
begin
    file_close(FILE1); file_open(FILE1,"LDPCregs.txt",read_mode);

    readline(FILE1,line1);
    read(line1,dataIn(10 downto 0));
    Kdm1 <= dataIn(10 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(10 downto 0));
    Em1_C0 <= dataIn(10 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(10 downto 0));
    Em1_C1 <= dataIn(10 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(10 downto 0));
    Em1_C2 <= dataIn(10 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(10 downto 0));
    Em1_C3 <= dataIn(10 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(10 downto 0));
    Em1_C4 <= dataIn(10 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(10 downto 0));
    Em1_C5 <= dataIn(10 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(6*4-1 downto 0));
    RuleFirst1 <= dataIn(6*4-1 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(6*4-1 downto 0));
    RuleFirst2 <= dataIn(6*4-1 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(6*4-1 downto 0));
    RuleLast1 <= dataIn(6*4-1 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(6*4-1 downto 0));
    RuleLast2 <= dataIn(6*4-1 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(5 downto 0));
    JumpFirst1 <= dataIn(5 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(5 downto 0));
    JumpFirst2 <= dataIn(5 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(6 downto 0));
    Zc <= dataIn(6 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(3 downto 0));
    LastPunctured <= dataIn(3 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(10 downto 0));
    Fm1 <= dataIn(10 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(3 downto 0));
    LastFillers <= dataIn(3 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(10 downto 0));
    FZ_C0 <= dataIn(10 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(10 downto 0));
    FZ_C1 <= dataIn(10 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(10 downto 0));
    FZ_C2 <= dataIn(10 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(10 downto 0));
    FZ_C3 <= dataIn(10 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(10 downto 0));
    FZ_C4 <= dataIn(10 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(10 downto 0));
    FZ_C5 <= dataIn(10 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(6*4-1 downto 0));
    LastZeros <= dataIn(6*4-1 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(40-1 downto 0));
    LDPC_Ctrl <= dataIn(40-1 downto 0);

    readline(FILE1,line1);
    read(line1,dataIn(3-1 downto 0));
    Cm1 <= dataIn(3-1 downto 0);
    
    readline(FILE1,line1);
    read(line1,dataIn(0 downto 0));
    F_R <= dataIn(0);
                                            
    wait;
end process;

UUT: LDPCdecoder_top_v2
Port map (  clk => clk,
            rstn => rstn,
            core_clk => coreclk,
            triggerIn => triggerIn,
            lastIn => demapperDone,
            dataInRe1 => dataIn_Re(15 downto 0),
            dataInIm1 => dataIn_Im(15 downto 0),
            dataInRe2 => dataIn_Re(31 downto 16),
            dataInIm2 => dataIn_Im(31 downto 16),
            validIn => dataIn_Valid,
            --
            Kdm1 => Kdm1, -- 6496/16-1-1
            Em1_C0 => Em1_C0, -- ceil(14578/16/2)-1
            Em1_C1 => Em1_C1, -- ceil(14578/16/2)-1
            Em1_C2 => Em1_C2, -- ceil(14578/16/2)-1
            Em1_C3 => Em1_C3, -- ceil(14578/16/2)-1
            Em1_C4 => Em1_C4, -- ceil(14578/16/2)-1
            Em1_C5 => Em1_C5, -- ceil(14578/16/2)-1
            RuleFirst1 => RuleFirst1, -- {14 7 16}-1
            RuleLast1 => RuleLast1, -- {2 9 16}-1
            RuleFirst2 => RuleFirst2, -- {14 7 16}-1
            RuleLast2 => RuleLast2, -- {11 2 9}-1
            JumpFirst1 => JumpFirst1, --"000010", -- "011110", --"010110", -- 
            JumpFirst2 => JumpFirst2, --"000000",--"000000", -- "000000", --
            Zc => Zc,        -- 2*352/16-1-1
            LastPunctured => LastPunctured, -- {16 16 16}-1
            Fm1 => Fm1, -- 544/16-1
            LastFillers => LastFillers, -- 
            FZ_C0 => FZ_C0, -- ceil((23232-14578-544)/16)-1
            FZ_C1 => FZ_C1, -- ceil((23232-14578-544)/16)-1
            FZ_C2 =>FZ_C2, -- ceil((23232-14578-544)/16)-1
            FZ_C3 => FZ_C3, -- ceil((23232-14578-544)/16)-1
            FZ_C4 => FZ_C4, -- ceil((23232-14578-544)/16)-1
            FZ_C5 => FZ_C5, -- ceil((23232-14578-544)/16)-1
            LastZeros => LastZeros, -- {14 14 14}-1 (23232-14578-544)-floor((23232-14578-544)/16)*16-1
            Cm1 => Cm1,              -- 3
            LDPC_Ctrl => LDPC_Ctrl,
            F_R => F_R,
            --
            dataOutRateAdap => dataOut,
            validOutRateAdap => validOut,
            dataOutHD => dataOutHD,
            validOutHD => validOutHD,
            lastOutHD => lastOutHD,
            dataOutStatus => dataOutStatus,
            validOutStatus => validOutStatus

);

process
begin
    demapperDone <= '0';
    wait for 136165 ns;
    demapperDone <= '1';
    wait for clk_P_100;
    demapperDone <= '0';
    wait;
end process;
    
process(clk)
    variable v_OLINE     : line;
    variable v_SPACE     : character;
    file FILE1: text open write_mode is "rateAdapt_v2_Out.txt";
    file FILE2: text open write_mode is "ldpc_v2_Out.txt";
begin
    if rising_edge(clk) then
        if rstn = '0' then
            file_close(FILE1);
            file_open(FILE1, "rateAdapt_v2_Out.txt", write_mode);
            file_close(FILE2);
            file_open(FILE2, "ldpc_v2_Out.txt", write_mode);
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
