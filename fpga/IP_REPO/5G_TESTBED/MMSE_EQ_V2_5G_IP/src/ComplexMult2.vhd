----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2022 02:42:39 PM
-- Design Name: 
-- Module Name: ComplexMult2 - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Complex Multiplier (pr+i.pi) = (ar+i.ai)*(br+i.bi)
entity ComplexMult2 is
generic(AWIDTH : integer := 16;
        BWIDTH : integer := 16
);
port(   clk    : in  std_logic;
        ar, ai : in  std_logic_vector(AWIDTH - 1 downto 0);
        br, bi : in  std_logic_vector(BWIDTH - 1 downto 0);
        validIn : in std_logic;
        pr, pi : out std_logic_vector(AWIDTH + BWIDTH downto 0);
        validOut : out std_logic
);
end ComplexMult2;

architecture Behavioral of ComplexMult2 is

signal valid_r1, valid_r2, valid_r3, valid_r4, valid_r5, valid_r6 : std_logic := '0';
signal ai_d, ai_dd, ai_ddd, ai_dddd             : signed(AWIDTH - 1 downto 0) := (others => '0');
signal ar_d, ar_dd, ar_ddd, ar_dddd             : signed(AWIDTH - 1 downto 0) := (others => '0');
signal bi_d, bi_dd, bi_ddd, br_d, br_dd, br_ddd : signed(BWIDTH - 1 downto 0) := (others => '0');
signal addcommon                                : signed(AWIDTH downto 0) := (others => '0');
signal addr, addi                               : signed(BWIDTH downto 0) := (others => '0');
signal mult0, multr, multi, pr_int, pi_int      : signed(AWIDTH + BWIDTH downto 0) := (others => '0');
signal common, commonr1, commonr2               : signed(AWIDTH + BWIDTH downto 0) := (others => '0');


begin

process(clk)
begin
    if rising_edge(clk) then
        ar_d   <= signed(ar);
        ar_dd  <= signed(ar_d);
        ai_d   <= signed(ai);
        ai_dd  <= signed(ai_d);
        br_d   <= signed(br);
        br_dd  <= signed(br_d);
        br_ddd <= signed(br_dd);
        bi_d   <= signed(bi);
        bi_dd  <= signed(bi_d);
        bi_ddd <= signed(bi_dd);
        valid_r1 <= validIn;
        valid_r2 <= valid_r1;
        valid_r3 <= valid_r2;
        valid_r4 <= valid_r3;
        valid_r5 <= valid_r4;
        valid_r6 <= valid_r5;
    end if;
end process;

-- Common factor (ar - ai) x bi, shared for the calculations
-- of the real and imaginary final products.
process(clk)
begin
    if rising_edge(clk) then
        addcommon <= resize(ar_d, AWIDTH + 1) - resize(ai_d, AWIDTH + 1);
        mult0     <= addcommon * bi_dd;
        common    <= mult0;
    end if;
end process;

-- Real product
process(clk)
begin
    if rising_edge(clk) then
        ar_ddd   <= ar_dd;
        ar_dddd  <= ar_ddd;
        addr     <= resize(br_ddd, BWIDTH + 1) - resize(bi_ddd, BWIDTH + 1);
        multr    <= addr * ar_dddd;
        commonr1 <= common;
        pr_int   <= multr + commonr1;
    end if;
end process;

-- Imaginary product
process(clk)
begin
    if rising_edge(clk) then
        ai_ddd   <= ai_dd;
        ai_dddd  <= ai_ddd;
        addi     <= resize(br_ddd, BWIDTH + 1) + resize(bi_ddd, BWIDTH + 1);
        multi    <= addi * ai_dddd;
        commonr2 <= common;
        pi_int   <= multi + commonr2;
    end if;
end process;

-- VHDL type conversion for output
pr <= std_logic_vector(pr_int);
pi <= std_logic_vector(pi_int);
validOut <= valid_r6;

end Behavioral;