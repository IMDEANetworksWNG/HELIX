-- GENERATED WITH MATLAB...

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package atan_table_pkg is 


type type_a15x16_std is array (0 to 14) of std_logic_vector(15 downto 0); 
 
constant atan_table : type_a15x16_std := ( 
	 "0110010010001000", 
	 "0011101101011001", 
	 "0001111101011011", 
	 "0000111111101011", 
	 "0000011111111101", 
	 "0000010000000000", 
	 "0000001000000000", 
	 "0000000100000000", 
	 "0000000010000000", 
	 "0000000001000000", 
	 "0000000000100000", 
	 "0000000000010000", 
	 "0000000000001000", 
	 "0000000000000100", 
	 "0000000000000010"); 
 
constant p_pi_18_15 : signed(17 downto 0) := "001100100100010000"; 
constant m_pi_18_15 : signed(17 downto 0) := "110011011011110000"; 

end atan_table_pkg; 
