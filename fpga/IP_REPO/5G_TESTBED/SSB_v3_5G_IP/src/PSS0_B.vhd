----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/11/2022 02:20:16 PM
-- Design Name: 
-- Module Name: PSS0_B - Behavioral
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

entity PSS0_B is
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
end PSS0_B;

architecture Behavioral of PSS0_B is

component PSS0_B_DIFF IS
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(39 DOWNTO 0)
  );
end component;

component PSS0_B_IMAG IS
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(39 DOWNTO 0)
  );
end component;

component PSS0_B_ADD IS
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(39 DOWNTO 0)
  );
end component;

--signals
signal F1_data_out : std_logic_vector(40-1 downto 0);
signal F1_data_out_valid : std_logic;
signal F2_data_in : std_logic_vector(16-1 downto 0);
signal F2_data_out : std_logic_vector(40-1 downto 0);
signal F2_data_out_valid : std_logic;
signal F3_data_out : std_logic_vector(40-1 downto 0);
signal F3_data_out_valid : std_logic;

begin

--First filter
F1: PSS0_B_DIFF 
Port map(   aclk => clk,
            s_axis_data_tdata => data_in_i,
            s_axis_data_tvalid => data_valid_i,
            s_axis_data_tready => open,
            m_axis_data_tdata => F1_data_out,
            m_axis_data_tvalid => F1_data_out_valid
);

F2_data_in <= std_logic_vector(signed(data_in_i) - signed(data_in_q));

--Second filter
F2: PSS0_B_IMAG
Port map(   aclk => clk,
            s_axis_data_tdata => F2_data_in,
            s_axis_data_tvalid => data_valid_i,
            s_axis_data_tready => open,
            m_axis_data_tdata => F2_data_out,
            m_axis_data_tvalid => F2_data_out_valid
);

--Third filter
F3: PSS0_B_ADD
Port map(   aclk => clk,
            s_axis_data_tdata => data_in_q,
            s_axis_data_tvalid => data_valid_q,
            s_axis_data_tready => open,
            m_axis_data_tdata => F3_data_out,
            m_axis_data_tvalid => F3_data_out_valid
);

--data_out_i <= std_logic_vector(signed(F1_data_out) + signed(F2_data_out));
--data_out_q <= std_logic_vector(signed(F2_data_out) + signed(F3_data_out));
data_out_i <= std_logic_vector(resize(signed(F1_data_out),data_out_i'length) + resize(signed(F2_data_out),data_out_i'length));
data_out_q <= std_logic_vector(resize(signed(F2_data_out),data_out_i'length) + resize(signed(F3_data_out),data_out_i'length));

data_out_valid_i <= F3_data_out_valid;
data_out_valid_q <= F3_data_out_valid;

end Behavioral;
