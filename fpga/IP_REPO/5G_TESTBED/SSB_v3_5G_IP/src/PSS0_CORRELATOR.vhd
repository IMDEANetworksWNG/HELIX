----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2022 01:39:30 PM
-- Design Name: 
-- Module Name: PSS0_CORRELATOR - Behavioral
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

entity PSS0_CORRELATOR is
Generic ( OFF_MSB : integer := 7
);
Port (  clk : in std_logic;
        rst_n : in std_logic;
        data_in_i : in std_logic_vector(16-1 downto 0);
        data_in_q : in std_logic_vector(16-1 downto 0);
        data_valid_i : in std_logic;
        data_valid_q : in std_logic;
        data_out : out std_logic_vector(16-1 downto 0);
        data_out_valid : out std_logic
);
end PSS0_CORRELATOR;

architecture Behavioral of PSS0_CORRELATOR is

component PSS0_A is
Port (  clk : in std_logic;
        rst_n : in std_logic;
        data_in_i : in std_logic_vector(16-1 downto 0);
        data_in_q : in std_logic_vector(16-1 downto 0);
        data_valid_i : in std_logic;
        data_valid_q : in std_logic;
        data_out_i : out std_logic_vector(40-1 downto 0);
        data_out_valid_i : out std_logic;
        data_out_q : out std_logic_vector(40-1 downto 0);
        data_out_valid_q : out std_logic
);
end component;

component PSS0_B is
Port (  clk : in std_logic;
        rst_n : in std_logic;
        data_in_i : in std_logic_vector(16-1 downto 0);
        data_in_q : in std_logic_vector(16-1 downto 0);
        data_valid_i : in std_logic;
        data_valid_q : in std_logic;
        data_out_i : out std_logic_vector(40-1 downto 0);
        data_out_valid_i : out std_logic;
        data_out_q : out std_logic_vector(40-1 downto 0);
        data_out_valid_q : out std_logic
);
end component;

--types
type type_a128xWin_std is array (0 to 126) of std_logic_vector(16-1 downto 0);

--signals
signal data_in_I_SR, data_in_Q_SR : type_a128xWin_std := (others => (others => '0'));

signal data_in_I_del, data_in_Q_del : std_logic_vector(16-1 downto 0);
signal data_valid_i_del : std_logic;
signal partA_I, partA_Q : std_logic_vector(40-1 downto 0);
signal partB_I, partB_Q : std_logic_vector(40-1 downto 0);
signal partA_I2, partA_Q2 : std_logic_vector(16-1 downto 0);
signal partB_I2, partB_Q2 : std_logic_vector(16-1 downto 0);
signal partA_valid_I, partA_valid_Q, partB_valid_I, partB_valid_Q : std_logic;

signal corr_i, corr_q : std_logic_vector(16-1 downto 0);
signal sq_i, sq_q : signed((16*2-1) downto 0);
signal sq_valid : std_logic;
signal corr_abs2 : std_logic_vector(16*2-1 downto 0);
signal corr_abs2_valid : std_logic;

begin

process(clk)
begin
    if rising_edge(clk) then
        if data_valid_i = '1' then
            data_in_I_SR(1 to 126) <= data_in_I_SR(0 to 125);
            data_in_I_SR(0) <= data_in_I;
            data_in_Q_SR(1 to 126) <= data_in_Q_SR(0 to 125);
            data_in_Q_SR(0) <= data_in_Q;
            
            data_in_I_del <= data_in_I_SR(126);
            data_in_Q_del <= data_in_Q_SR(126);
        end if;
    end if;
end process;

data_valid_i_del <= data_valid_i;

--First filter part 
F0: PSS0_A
Port map (  clk => clk,
            rst_n => rst_n,
            data_in_i => data_in_i,
            data_in_q => data_in_q,
            data_valid_i => data_valid_i,
            data_valid_q => data_valid_q,
            data_out_i => partA_I,
            data_out_valid_i => partA_valid_I,
            data_out_q => partA_Q,
            data_out_valid_q => partA_valid_Q
);

partA_I2 <= partA_I(partA_I'high-OFF_MSB downto partA_I'high-OFF_MSB-(16-1));
partA_Q2 <= partA_Q(partA_Q'high-OFF_MSB downto partA_Q'high-OFF_MSB-(16-1));

--Second filter part 
F2: PSS0_B
Port map (  clk => clk,
            rst_n => rst_n,
            data_in_i => data_in_I_del,
            data_in_q => data_in_Q_del,
            data_valid_i => data_valid_i_del,
            data_valid_q => data_valid_i_del,
            data_out_i => partB_I,
            data_out_valid_i => partB_valid_I,
            data_out_q => partB_Q,
            data_out_valid_q => partB_valid_Q
);

partB_I2 <= partB_I(partB_I'high-OFF_MSB downto partB_I'high-OFF_MSB-(16-1));
partB_Q2 <= partB_Q(partB_Q'high-OFF_MSB downto partB_Q'high-OFF_MSB-(16-1));

process(clk)
begin
    if rising_edge(clk) then
        corr_i <= std_logic_vector(signed(partA_I2) + signed(partB_I2));
        corr_q <= std_logic_vector(signed(partA_Q2) + signed(partB_Q2));
    end if;
end process;

--Magnitude squared 
process(clk)
begin
    if rising_edge(clk) then
        sq_I <= signed(corr_i) * signed(corr_i);
        sq_Q <= signed(corr_q) * signed(corr_q);
        corr_abs2 <= std_logic_vector(sq_I + sq_Q);
        sq_valid <= partB_valid_I;
        corr_abs2_valid <= sq_valid;
    end if;
end process;

--tempOut_re <= corr_abs2(corr_abs2'high downto corr_abs2'high-15);
--tempOut_valid <= corr_abs2_valid;

data_out <= corr_abs2(corr_abs2'high downto corr_abs2'high-15);
data_out_valid <= corr_abs2_valid;

end Behavioral;
