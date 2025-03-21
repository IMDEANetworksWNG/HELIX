----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/27/2022 03:03:10 PM
-- Design Name: 
-- Module Name: CORDIC_rot - Behavioral
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

--use work.atan_table_pkg.all;

entity CORDIC_rot is
Generic( ITER_NUM : integer range 1 to 10 := 10
);
Port (  clk                             : IN    std_logic;
        reset                           : IN    std_logic;
        --dataIn_re                       : in    std_logic_vector(21 downto 0);
        --dataIn_im                       : in    std_logic_vector(21 downto 0);
        dataIn_re                       : in    std_logic_vector(39 downto 0);
        dataIn_im                       : in    std_logic_vector(39 downto 0);
        validIn                         : IN    std_logic;
        dataOut                         : out   std_logic_vector(18 downto 0);
        validOut                        : out   std_logic--;
        --sss_in_temp : in std_logic
        --trigger_in_temp : in std_logic
);
end CORDIC_rot;

architecture Behavioral of CORDIC_rot is

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

--TYPES 
type state_type is (st1_IDLE, st2_ITER, st3_ITER);

--SIGNALS
--signal b0_Ip, b0_Qp : signed(21 downto 0);
signal b0_Ip, b0_Qp : signed(39 downto 0);
signal b0_Ip_temp, b0_Qp_temp : std_logic_vector(39 downto 0);
signal b0_Ip_temp2, b0_Qp_temp2 : std_logic_vector(39 downto 0);
signal b0_Z0 : signed(18 downto 0);
signal b0_count : integer range 0 to ITER_NUM-1 := 0; 
signal b0_state : state_type;
signal b0_count2 : std_logic_vector(3 downto 0);
signal b0_validOut : std_logic;

component BARREL_SHIFTER_RIGHT is
Generic ( W : integer := 40
);
Port ( dataIn : in std_logic_vector(W-1 downto 0);
       dataOut : out std_logic_vector(W-1 downto 0);
       ShiftRight : in std_logic_vector(3 downto 0)
);
end component;

--component ila_0 IS
--port(
--    clk : IN STD_LOGIC;
--    probe0 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
--    probe1 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
--    probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe3 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
--    probe4 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
--    probe5 : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
--    probe6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe7 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
--    probe8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe9 : in std_logic_vector(0 downto 0);
--    probe10 : in std_logic_vector(39 downto 0);
--    probe11 : in std_logic_vector(39 downto 0)
--);
--END component;

begin

-- b0: State Machine
process(clk)
begin
    if rising_edge(clk) then
        if (reset = '1') then
            b0_state <= st1_IDLE;
            b0_validOut <= '0';
            dataOut <= (others => '0');
        else
            b0_validOut <= '0';
            case (b0_state) is
                when st1_IDLE =>
                    -- Init phase
                    if validIn = '1' then
                        b0_state <= st2_ITER;
                        if dataIn_im(dataIn_im'high) = '0' then -- if Q>0
                           b0_Ip <= resize(signed(dataIn_im(dataIn_im'high downto 1)),b0_Ip'length);
                           b0_Qp <= resize(- signed(dataIn_re(dataIn_re'high downto 1)),b0_Ip'length);
                           b0_Z0 <= resize(p_pi_18_15,b0_Z0'length);
                        else
                           b0_Ip <= resize(- signed(dataIn_im(dataIn_im'high downto 1)),b0_Ip'length);
                           b0_Qp <=   resize(signed(dataIn_re(dataIn_re'high downto 1)),b0_Ip'length);
                           b0_Z0 <= resize(m_pi_18_15,b0_Z0'length);
                        end if;
                        b0_count <= 0;
                    end if;
                when st2_ITER =>
                    -- iterative phase
                    if b0_Qp_temp(b0_Qp_temp'high) = '0' then -- if Q>0
                        b0_Ip <= signed(b0_Ip_temp) + signed(b0_Qp_temp2);
                        b0_Qp <= signed(b0_Qp_temp) - signed(b0_Ip_temp2);
                        b0_Z0 <= b0_Z0 + resize(signed(atan_table(b0_count)),b0_Z0'length);
                     else
                        b0_Ip <= signed(b0_Ip_temp) - signed(b0_Qp_temp2);
                        b0_Qp <= signed(b0_Qp_temp) + signed(b0_Ip_temp2);
                        b0_Z0 <= b0_Z0 - resize(signed(atan_table(b0_count)),b0_Z0'length);
                     end if;
                    if b0_count < ITER_NUM-1 then
                        b0_count <= b0_count + 1;
                    else
                        b0_validOut <= '1';
                        dataOut <= std_logic_vector(b0_Z0);
                        b0_state <= st1_IDLE;
                    end if;
                when others => 
                    b0_state <= st1_IDLE;
            end case;
        end if;
    end if;
end process;

b0_Ip_temp <= std_logic_vector(b0_Ip);
b0_Qp_temp <= std_logic_vector(b0_Qp);
b0_count2 <= std_logic_vector(to_unsigned(b0_count,4));
validOut <= b0_validOut;

b1_re: BARREL_SHIFTER_RIGHT 
Generic map ( W =>  40 )
Port map (  dataIn => b0_Ip_temp,
            dataOut => b0_Ip_temp2,
            ShiftRight => b0_count2
);

b1_im: BARREL_SHIFTER_RIGHT 
Generic map ( W =>  40 )
Port map (  dataIn => b0_Qp_temp,
            dataOut => b0_Qp_temp2,
            ShiftRight => b0_count2
);



--ILA_BLK: ila_0
--PORT MAP(
--    clk => clk,
--    probe0 => dataIn_re,
--    probe1 => dataIn_im,
--    probe2(0) => validIn,
--    probe3 => b0_Ip_temp,
--    probe4 => b0_Qp_temp,
--    probe5 => std_logic_vector(b0_Z0),
--    probe6(0) => b0_validOut,
--    probe7 => b0_count2,
--    probe8(0) => sss_in_temp,
--    probe9(0) => sss_in_temp,
--    probe10 => b0_Ip_temp2,
--    probe11 => b0_Qp_temp2
--);

end Behavioral;
