----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2023 05:40:03 PM
-- Design Name: 
-- Module Name: FIR_decimator_div4_top - Behavioral
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

entity FIR_decimator_div4_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        dataIn_re : in std_logic_vector(16*8-1 downto 0);
        dataIn_im : in std_logic_vector(16*8-1 downto 0);
        validIn : in std_logic;
        BW_sel : in std_logic;
        dataOut_re : out std_logic_vector(16*8-1 downto 0);
        dataOut_im : out std_logic_vector(16*8-1 downto 0);
        validOut : out std_logic
);
end FIR_decimator_div4_top;

architecture Behavioral of FIR_decimator_div4_top is

component fir_decimator_div4 IS
PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(79 DOWNTO 0)
  );
END component;

component axis_dwidth_converter_0 IS
Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 )
);
END component;

signal b0_validOut : std_logic;
signal b0_dataOut_re, b0_dataOut_im : std_logic_vector(79 downto 0);
signal b0_dataOut2_re, b0_dataOut2_im : std_logic_vector(31 downto 0);
constant b0_offset : integer := 1;

signal b1_dataOut_re, b1_dataOut_im : std_logic_vector(16*8-1 downto 0);
signal b1_validOut : std_logic;

begin

B0_1:  fir_decimator_div4
PORT MAP (
    aclk => clk,
    s_axis_data_tvalid => validIn,
    s_axis_data_tready => open,
    s_axis_data_tdata => dataIn_re,
    m_axis_data_tvalid => b0_validOut,
    m_axis_data_tdata => b0_dataOut_re
);

B0_2:  fir_decimator_div4
PORT MAP (
    aclk => clk,
    s_axis_data_tvalid => validIn,
    s_axis_data_tready => open,
    s_axis_data_tdata => dataIn_im,
    m_axis_data_tvalid => open,
    m_axis_data_tdata => b0_dataOut_im
);

--b0_dataOut2_re <= b0_dataOut_re(b0_dataOut_re'high-b0_offset downto b0_dataOut_re'high-b0_offset-15) & b0_dataOut_re(b0_dataOut_re'high-20-b0_offset downto b0_dataOut_re'high-20-b0_offset-15); 
--b0_dataOut2_im <= b0_dataOut_im(b0_dataOut_im'high-b0_offset downto b0_dataOut_im'high-b0_offset-15) & b0_dataOut_im(b0_dataOut_im'high-20-b0_offset downto b0_dataOut_im'high-20-b0_offset-15); 
b0_dataOut2_re <= b0_dataOut_re(73-b0_offset downto 73-b0_offset-15) & b0_dataOut_re(33-b0_offset downto 33-b0_offset-15); 
b0_dataOut2_im <= b0_dataOut_im(73-b0_offset downto 73-b0_offset-15) & b0_dataOut_im(33-b0_offset downto 33-b0_offset-15); 

--dataOut_re <= b0_dataOut2_re;
--dataOut_im <= b0_dataOut2_im;
--validOut <= b0_validOut;

B1_1: axis_dwidth_converter_0 
Port map( 
    aclk => clk,
    aresetn => rstn,
    s_axis_tvalid => b0_validOut,
    s_axis_tready => open,
    s_axis_tdata => b0_dataOut2_re,
    m_axis_tvalid => b1_validOut,
    m_axis_tready => '1',
    m_axis_tdata => b1_dataOut_re
);

B1_2: axis_dwidth_converter_0 
Port map( 
    aclk => clk,
    aresetn => rstn,
    s_axis_tvalid => b0_validOut,
    s_axis_tready => open,
    s_axis_tdata => b0_dataOut2_im,
    m_axis_tvalid => open,
    m_axis_tready => '1',
    m_axis_tdata => b1_dataOut_im
);

--B2:
process(clk)
begin
    if rising_edge(clk) then
        if BW_sel = '0' then
            dataOut_re <= dataIn_re;
            dataOut_im <= dataIn_im;
            validOut <= validIn;
        else
            dataOut_re <= b1_dataOut_re;
            dataOut_im <= b1_dataOut_im;
            validOut <= b1_validOut;
        end if;
    end if;
end process;

end Behavioral;
