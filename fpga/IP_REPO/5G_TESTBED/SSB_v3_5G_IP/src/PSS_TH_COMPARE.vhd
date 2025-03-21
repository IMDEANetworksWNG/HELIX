----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/24/2022 12:39:09 PM
-- Design Name: 
-- Module Name: PSS_TH_COMPARE - Behavioral
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

entity PSS_TH_COMPARE is
Port (  clk : in std_logic;
        rst_n : in std_logic;
--        PSS_in : in std_logic_vector(30-1 downto 0);
        PSS_in : in std_logic_vector(16-1 downto 0);
        PSS_valid_in : in std_logic;
--        TH_in : in std_logic_vector(24 downto 0);
        TH_in : in std_logic_vector(16-1 downto 0);
        TH_valid_in : in std_logic;
--        PSS_out : out std_logic_vector(30-1 downto 0); 
        PSS_out : out std_logic_vector(16-1 downto 0); 
        TH_out : out std_logic;
        TH_ind_out : out std_logic_vector(1 downto 0);
        PSS_valid : out std_logic 
);
end PSS_TH_COMPARE;

architecture Behavioral of PSS_TH_COMPARE is
    
    constant ONE : std_logic_vector(31 downto 0) := x"00000001";
--    signal b0_PSS0 : std_logic_vector(30-1 downto 0);
--    signal b0_TH : std_logic_vector(24 downto 0);
    signal b0_PSS0 : std_logic_vector(16-1 downto 0);
    signal b0_TH : std_logic_vector(16-1 downto 0);
    signal b0_valid : std_logic;
    
    signal b1_valid, b1_exceed_bit, b1_exceed_bit_last : std_logic;
    signal b1_exceed : std_logic_vector(4 downto 0);
    --signal b1_PSS0 : std_logic_vector(30-1 downto 0);
    signal b1_PSS0 : std_logic_vector(16-1 downto 0);
    
    --signal b2_MAX : std_logic_vector(30-1 downto 0);
    signal b2_MAX : std_logic_vector(16-1 downto 0);
    signal b2_MAX_ind : signed(1 downto 0);
    signal b2_exceed_bit_last : std_logic;
    --signal b2_PSS0 : std_logic_vector(30-1 downto 0);
    signal b2_PSS0 : std_logic_vector(16-1 downto 0);
    signal b2_valid : std_logic;
    
begin

--b0: sync all streams 
process(clk)
begin
    if rising_edge(clk) then
        if TH_valid_in = '1' then
            --b0_TH <= TH_in(29 downto 6);
            b0_TH <= TH_in;
        end if;
        b0_PSS0 <= PSS_in;
        b0_valid <= PSS_valid_in;
    end if;
end process;

--b1: find candidates excedding the threshold
    -- b1_exceed will be 5 clk cycles delayed --> to match the max buffer 
process(clk)
begin
    if rising_edge(clk) then
        if b0_valid = '1' then
            if signed(b0_PSS0) > resize(signed(b0_TH),b0_PSS0'length) and (b1_exceed_bit = '0') then
                b1_exceed <= b1_exceed(3 downto 0) & '1';
            else
                b1_exceed <= b1_exceed(3 downto 0) & '0';
            end if;
        end if;
        b1_valid <= b0_valid;
        b1_PSS0 <= b0_PSS0;
    end if;
end process;

b1_exceed_bit <= '1' when (b1_exceed /= "00000") else '0';
b1_exceed_bit_last <= '1' when (b1_exceed = "10000") else '0';

--b2: MAX finder
process(clk)
    variable b2_count_var : signed(1 downto 0);
begin
    if rising_edge(clk) then
        if b1_valid = '1' then
            if b1_exceed_bit = '1' then
                if signed(b2_MAX) < signed(b1_PSS0) then
                    b2_MAX <= b1_PSS0;
                    b2_MAX_ind <= b2_count_var;
                end if;
                b2_count_var := b2_count_var + signed(ONE(1 downto 0));
            else
                b2_MAX(b2_MAX'high) <= '1';
                b2_MAX(b2_MAX'high-1 downto 0) <= (others => '0');
                b2_count_var := (others => '0');
            end if;
        end if;
        b2_PSS0 <= b1_PSS0;
        b2_valid <= b1_valid;
        b2_exceed_bit_last <= b1_exceed_bit_last;
    end if;
end process;


PSS_out <= b2_PSS0;
TH_out <= b2_exceed_bit_last;
TH_ind_out <= std_logic_vector(b2_MAX_ind);
PSS_valid <= b2_valid;

end Behavioral;
