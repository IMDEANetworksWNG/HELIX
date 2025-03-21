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

use work.atan_table_pkg.all;

entity CORDIC_rot2 is
Generic( ITER_NUM : integer range 1 to 10 := 10
);
Port (  clk                             : IN    std_logic;
        rstn                           : IN    std_logic;
        --dataIn_re                       : in    std_logic_vector(21 downto 0);
        --dataIn_im                       : in    std_logic_vector(21 downto 0);
        dataIn_re                       : in    std_logic_vector(39 downto 0);
        dataIn_im                       : in    std_logic_vector(39 downto 0);
        validIn                         : IN    std_logic;
        dataOut                         : out   std_logic_vector(18 downto 0);
        validOut                        : out   std_logic
);
end CORDIC_rot2;

architecture Behavioral of CORDIC_rot2 is

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
signal validOut_s : std_logic := '0';
signal dataOut_s : std_logic_vector(18 downto 0) := (others => '0');

component BARREL_SHIFTER_RIGHT is
Generic ( W : integer := 40
);
Port ( dataIn : in std_logic_vector(W-1 downto 0);
       dataOut : out std_logic_vector(W-1 downto 0);
       ShiftRight : in std_logic_vector(3 downto 0)
);
end component;

begin

-- b0: State Machine
process(clk)
begin
    if rising_edge(clk) then
        validOut_s <= '0';
        if (rstn = '0') then
            b0_state <= st1_IDLE;
            dataOut_s <= (others => '0');
        else
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
                    if b0_Qp_temp2(b0_Qp_temp2'high) = '0' then -- if Q>0
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
                        validOut_s <= '1';
                        dataOut_s <= std_logic_vector(b0_Z0);
                        b0_state <= st1_IDLE;
                    end if;
                when others => 
                    b0_state <= st1_IDLE;
            end case;
        end if;
    end if;
end process;

validOut <= validOut_s;
dataOut <= dataOut_s;

b0_Ip_temp <= std_logic_vector(b0_Ip);
b0_Qp_temp <= std_logic_vector(b0_Qp);
b0_count2 <= std_logic_vector(to_unsigned(b0_count,4));

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

end Behavioral;



--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

--use work.atan_table_pkg.all;

--entity CORDIC_rot is
--Generic( ITER_NUM : integer range 1 to 10 := 10
--);
--Port (  clk                             : IN    std_logic;
--        reset                           : IN    std_logic;
--        --dataIn_re                       : in    std_logic_vector(21 downto 0);
--        --dataIn_im                       : in    std_logic_vector(21 downto 0);
--        dataIn_re                       : in    std_logic_vector(39 downto 0);
--        dataIn_im                       : in    std_logic_vector(39 downto 0);
--        validIn                         : IN    std_logic;
--        dataOut                         : out   std_logic_vector(18 downto 0);
--        validOut                        : out   std_logic
--);
--end CORDIC_rot;

--architecture Behavioral of CORDIC_rot is

----TYPES 
--type state_type is (st1_IDLE, st2_ITER, st3_ITER);

----SIGNALS
----signal b0_Ip, b0_Qp : signed(21 downto 0);
--signal b0_Ip, b0_Qp : signed(39 downto 0);
--signal b0_Z0 : signed(18 downto 0);
--signal b0_count : integer range 0 to ITER_NUM-1 := 0; 
--signal b0_state : state_type;

--begin

---- b0: State Machine
--process(clk)
--begin
--    if rising_edge(clk) then
--        if (reset = '1') then
--            b0_state <= st1_IDLE;
--            validOut <= '0';
--            dataOut <= (others => '0');
--        else
--            validOut <= '0';
--            case (b0_state) is
--                when st1_IDLE =>
--                    -- Init phase
--                    if validIn = '1' then
--                        b0_state <= st2_ITER;
--                        if dataIn_im(dataIn_im'high) = '0' then -- if Q>0
--                           b0_Ip <= resize(signed(dataIn_im(dataIn_im'high downto 1)),b0_Ip'length);
--                           b0_Qp <= resize(- signed(dataIn_re(dataIn_re'high downto 1)),b0_Ip'length);
--                           b0_Z0 <= resize(p_pi_18_15,b0_Z0'length);
--                        else
--                           b0_Ip <= resize(- signed(dataIn_im(dataIn_im'high downto 1)),b0_Ip'length);
--                           b0_Qp <=   resize(signed(dataIn_re(dataIn_re'high downto 1)),b0_Ip'length);
--                           b0_Z0 <= resize(m_pi_18_15,b0_Z0'length);
--                        end if;
--                        b0_count <= 0;
--                    end if;
--                when st2_ITER =>
--                    -- iterative phase
--                    if b0_Qp(b0_Qp'high) = '0' then -- if Q>0
--                        b0_Ip <= b0_Ip + resize(b0_Qp(b0_Qp'high downto b0_count),b0_Ip'length);
--                        b0_Qp <= b0_Qp - resize(b0_Ip(b0_Ip'high downto b0_count),b0_Qp'length);
--                        b0_Z0 <= b0_Z0 + resize(signed(atan_table(b0_count)),b0_Z0'length);
--                     else
--                        b0_Ip <= b0_Ip - resize(b0_Qp(b0_Qp'high downto b0_count),b0_Ip'length);
--                        b0_Qp <= b0_Qp + resize(b0_Ip(b0_Ip'high downto b0_count),b0_Qp'length);
--                        b0_Z0 <= b0_Z0 - resize(signed(atan_table(b0_count)),b0_Z0'length);
--                     end if;
--                    if b0_count < ITER_NUM-1 then
--                        b0_count <= b0_count + 1;
--                    else
--                        validOut <= '1';
--                        dataOut <= std_logic_vector(b0_Z0);
--                        b0_state <= st1_IDLE;
--                    end if;
--                when others => 
--                    b0_state <= st1_IDLE;
--            end case;
--        end if;
--    end if;
--end process;

--end Behavioral;
