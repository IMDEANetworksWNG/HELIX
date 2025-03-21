----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2022 05:44:44 PM
-- Design Name: 
-- Module Name: DDS_v2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: - designed for SSR = 2 (output), 3 clk cycles of latency
--                      - output: cos(x) - jsin(x) (for CFO correction) 
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.DDS_constants_pkg.all;

entity DDS_v2 is
Port (  clk                             : IN    std_logic; -- 245.76MHz 
        reset                           : IN    std_logic;
        angleIn                         : IN    std_logic_vector(19-1 DOWNTO 0); -- s[19 15]   
        angleIn_valid                   : IN    std_logic;
        enableIn                        : IN    std_logic;
        BW_SEL                          : IN    std_logic;
        cosOut                          : out   std_logic_vector(2*17-1 downto 0); --s[17 15]
        sinOut                          : out   std_logic_vector(2*17-1 downto 0); --s[17 15]
        outValid                        : out   std_logic 
);
end DDS_v2;

architecture Behavioral of DDS_v2 is

constant ZEROES : std_logic_vector(31 downto 0) := (others => '0');
constant K : std_logic_vector(25-1 downto 0) := "0101000101111100110000011";

signal b0_acc_in_temp : signed(25+19-1 downto 0);
signal b0_acc_in : signed(32-1 downto 0);

signal b1_acc1, b1_acc1_r : signed(31 downto 0);
signal b1_acc2_r : signed(31 downto 0);

signal b1_accW1, b1_accW2 : unsigned(N_COS+2-1 downto 0);
signal b1_COS_address1, b1_SIN_address1 : unsigned(N_COS-1 downto 0);
signal b1_COS_address2, b1_SIN_address2 : unsigned(N_COS-1 downto 0);
signal b1_sel_out1, b1_sel_out2 : std_logic_vector(1 downto 0);
signal b1_valid, b1_valid_r : std_logic;

signal b2_COSout1, b2_SINout1 : std_logic_vector(W_COS-1 downto 0) := (others => '0');
signal b2_COSout2, b2_SINout2 : std_logic_vector(W_COS-1 downto 0) := (others => '0');
signal b2_valid : std_logic;
signal b2_sel_out1, b2_sel_out2 : std_logic_vector(1 downto 0);

signal cosOut_s, sinOut_s : std_logic_vector(2*17-1 downto 0) := (others => '0');
signal outValid_s : std_logic;
        
begin

--b0: 
process(clk)

begin
    if rising_edge(clk) then
        if reset = '1' then
            b0_acc_in_temp <= (others => '0');
        else
            if angleIn_valid = '1' then
                b0_acc_in_temp <= signed(angleIn) * signed(K);
            end if;
        end if;
    end if;
end process;
b0_acc_in <=    resize(b0_acc_in_temp(b0_acc_in_temp'high downto 22),b0_acc_in'length) when BW_SEL = '1' --30KHz
           else resize(b0_acc_in_temp(b0_acc_in_temp'high downto 22) & signed(ZEROES(2 downto 0)),b0_acc_in'length); --240KHz

--b1: Phase ACC
process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            b1_acc1 <= (others => '0');
        else
            if enableIn = '1' then
                b1_acc1 <= b1_acc1 + b0_acc_in;
            end if;
            b1_valid <= enableIn;
            b1_valid_r <= b1_valid;
        end if;
        b1_acc1_r <= b1_acc1;
        b1_acc2_r <= b1_acc1 + b0_acc_in(b0_acc_in'high downto 1);
    end if;
end process;

b1_accW1 <= unsigned(b1_acc1_r(b1_acc1_r'high downto b1_acc1_r'high - (N_COS + 2) + 1)); 
b1_sel_out1 <= std_logic_vector(b1_accW1(b1_accW1'high downto b1_accW1'high-1));
b1_COS_address1 <= b1_accW1(b1_accW1'high-2 downto 0) when b1_sel_out1(0) = '0' else unsigned(not(std_logic_vector(b1_accW1(b1_accW1'high-2 downto 0))));
b1_SIN_address1 <= b1_accW1(b1_accW1'high-2 downto 0) when b1_sel_out1(0) = '1' else unsigned(not(std_logic_vector(b1_accW1(b1_accW1'high-2 downto 0))));

b1_accW2 <= unsigned(b1_acc2_r(b1_acc2_r'high downto b1_acc2_r'high - (N_COS + 2) + 1)); 
b1_sel_out2 <= std_logic_vector(b1_accW2(b1_accW2'high downto b1_accW2'high-1));
b1_COS_address2 <= b1_accW2(b1_accW2'high-2 downto 0) when b1_sel_out2(0) = '0' else unsigned(not(std_logic_vector(b1_accW2(b1_accW2'high-2 downto 0))));
b1_SIN_address2 <= b1_accW2(b1_accW2'high-2 downto 0) when b1_sel_out2(0) = '1' else unsigned(not(std_logic_vector(b1_accW2(b1_accW2'high-2 downto 0))));


--b2: cosine/sine LUT
process(clk) 
begin
    if rising_edge(clk) then
        if b1_valid_r = '1' then
            b2_COSout1 <= COS_LUT(to_integer(b1_COS_address1));
            b2_SINout1 <= COS_LUT(to_integer(b1_SIN_address1));
            b2_COSout2 <= COS_LUT(to_integer(b1_COS_address2));
            b2_SINout2 <= COS_LUT(to_integer(b1_SIN_address2));
        end if;
        b2_valid <= b1_valid_r;
        b2_sel_out1 <= b1_sel_out1;
        b2_sel_out2 <= b1_sel_out2;
    end if;
end process;

--b3: output selection
process(clk) 
begin
    if rising_edge(clk) then
        if b2_valid = '1' then
            if b2_sel_out1 = "10" or b2_sel_out1 = "01" then
                cosOut_s(16 downto 0) <= std_logic_vector(- signed('0' & b2_COSout1));
            else
                cosOut_s(16 downto 0) <= '0' & b2_COSout1;
            end if;
            --if b2_sel_out1(1) = '1' then
            if b2_sel_out1(1) = '0' then
                sinOut_s(16 downto 0) <= std_logic_vector(- signed('0' & b2_SINout1));
            else
                sinOut_s(16 downto 0) <= '0' & b2_SINout1;
            end if;

            if b2_sel_out2 = "10" or b2_sel_out2 = "01" then
                cosOut_s(33 downto 17) <= std_logic_vector(- signed('0' & b2_COSout2));
            else
                cosOut_s(33 downto 17) <= '0' & b2_COSout2;
            end if;
            --if b2_sel_out2(1) = '1' then
            if b2_sel_out2(1) = '0' then
                sinOut_s(33 downto 17) <= std_logic_vector(- signed('0' & b2_SINout2));
            else
                sinOut_s(33 downto 17) <= '0' & b2_SINout2;
            end if;

        end if;
        outValid_s <= b2_valid;
    end if;
end process;

cosOut <= cosOut_s;
sinOut <= sinOut_s;
outValid <= outValid_s;

end Behavioral;
