
-- 
-- Create Date: 01/21/2022 12:43:17 PM
-- Design Name: 
-- Module Name: PSS_THRESHOLD - Behavioral
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

entity PSS_THRESHOLD is
Port (  clk : in std_logic;
        rst_n : in std_logic;
        data_in_i : in std_logic_vector(16-1 downto 0);
        data_in_q : in std_logic_vector(16-1 downto 0);
        data_in_valid : in std_logic;
        --data_out : out std_logic_vector(36 downto 0);
        data_out : out std_logic_vector(24 downto 0);
        data_out_valid : out std_logic
);
end PSS_THRESHOLD;

architecture Behavioral of PSS_THRESHOLD is

type a256x31s is array (0 to 255) of signed(30 downto 0);

--b0:
signal b0_sq_i, b0_sq_q : signed(29 downto 0); -- s[30 28]
signal b0_abs2 : signed(30 downto 0); -- s[31 28]
signal b0_data_valid, b0_data_valid_r : std_logic;

--b1:
signal b1_sr : a256x31s := (others => (others => '0')); -- s[31 28]
signal b1_data_valid : std_logic;

--b2: 
signal b2_comb_out : signed(30 downto 0); -- s[31 28]
signal b2_data_valid : std_logic;

--b3: 
signal b3_acc : signed(30+6 downto 0); -- s[37 28]
signal b3_data_valid : std_logic;

--b4:
--constant b4_hardTh : signed(36 downto 0) := "0000000000000000000000001000000000000";
--signal b4_acc_th : signed(36 downto 0);
constant b4_hardTh : signed(24 downto 0) := "0000000000000000000010000";
signal b4_acc_th : signed(24 downto 0);
signal b4_data_valid : std_logic;

begin

-- Threshold is approximated by 0.5, then no multiplication is required (just an arithmetical shift).

-- B0: absolute value
process(clk)
begin
    if rising_edge(clk) then
        b0_sq_i <= signed(data_in_i(15 downto 1)) * signed(data_in_i(15 downto 1)); -- scaling by 0.5 (threshold aproximation)
        b0_sq_q <= signed(data_in_q(15 downto 1)) * signed(data_in_q(15 downto 1)); -- scaling by 0.5 (threshold aproximation)
        b0_abs2 <= resize(b0_sq_i,b0_abs2'length) + resize(b0_sq_q,b0_abs2'length); -- abs value is always positive (we can avoid the sign).        
        b0_data_valid <= data_in_valid;
        b0_data_valid_r <= b0_data_valid;
    end if;
end process;

-- B1: shift register
process(clk)
begin
    if rising_edge(clk) then
        if b0_data_valid_r = '1' then
            for ii in 1 to 255 loop
                b1_sr(ii) <= b1_sr(ii-1);
            end loop;
            b1_sr(0) <= b0_abs2;
        end if;
        b1_data_valid <= b0_data_valid_r;
    end if;
end process;

-- B2: comb filter
process(clk)
begin
    if rising_edge(clk) then
        b2_comb_out <= b0_abs2 - b1_sr(255);
        b2_data_valid <= b1_data_valid;
    end if;
end process;

-- B3: acc
process(clk)
begin
    if rising_edge(clk) then
        if rst_n <= '0' then 
            b3_acc <= (others => '0');
        else
            if b2_data_valid = '1' then
                b3_acc <= b3_acc + resize(b2_comb_out,b3_acc'length);
            end if;
            b3_data_valid <= b2_data_valid;
        end if;
    end if;
end process;

-- Hard threshold
process(clk)
begin
    if rising_edge(clk) then
        --if b3_acc < b4_hardTh then
        if b3_acc(36 downto 12) < b4_hardTh then
            b4_acc_th <= b4_hardTh;
        else
            --b4_acc_th <= b3_acc;
            b4_acc_th <= b3_acc(36 downto 12);
        end if;
        b4_data_valid <= b3_data_valid;
    end if;
end process;

--outputs
data_out <= std_logic_vector(b4_acc_th);
data_out_valid <= b4_data_valid;

end Behavioral;
