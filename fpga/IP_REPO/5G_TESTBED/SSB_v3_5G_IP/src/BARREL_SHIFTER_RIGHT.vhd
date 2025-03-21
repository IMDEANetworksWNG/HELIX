----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2022 09:09:35 PM
-- Design Name: 
-- Module Name: BARREL_SHIFTER_RIGHT - Behavioral
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

entity BARREL_SHIFTER_RIGHT is
Generic ( W : integer := 40
);
Port ( dataIn : in std_logic_vector(W-1 downto 0);
       dataOut : out std_logic_vector(W-1 downto 0);
       ShiftRight : in std_logic_vector(3 downto 0)
);
end BARREL_SHIFTER_RIGHT;

architecture Behavioral of BARREL_SHIFTER_RIGHT is

begin

process(dataIn,ShiftRight)
begin
    case(ShiftRight) is
        when "0000" => dataOut <= dataIn(W-1 downto 0);
        when "0001" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 1)),W));
        when "0010" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 2)),W));
        when "0011" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 3)),W));
        when "0100" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 4)),W));
        when "0101" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 5)),W));
        when "0110" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 6)),W));
        when "0111" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 7)),W));
        when "1000" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 8)),W));
        when "1001" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 9)),W));
        when "1010" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 10)),W));
        when "1011" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 11)),W));
        when "1100" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 12)),W));
        when "1101" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 13)),W));
        when "1110" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 14)),W));
        when "1111" => dataOut <= std_logic_vector(resize(signed(dataIn(W-1 downto 15)),W));
        when others => dataOut <= dataIn(W-1 downto 0);
    end case;        
end process;

end Behavioral;
