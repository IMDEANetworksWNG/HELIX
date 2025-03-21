----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2022 02:37:09 PM
-- Design Name: 
-- Module Name: demapper_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: - for QPSK only
--                      - does not consider noise variance (Min-Sum LDPC algorithm is employed for channel decoding).
--                      - Scrambling sequence is *fixed* and extracted from memory
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.demapping_5G_pkg.all;

entity demapper_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        triggerIn : in std_logic;
        dataIn_re : in std_logic_vector(2*16-1 downto 0); -- s[16 14]
        dataIn_im : in std_logic_vector(2*16-1 downto 0); -- s[16 14]
        validIn : in std_logic;
        NumBLK : in std_logic_vector(13 downto 0);  -- number of blocks of 4 bits in the slot. 
        triggerOut : out std_logic;
        lastOut : out std_logic;
        dataOut_re : out std_logic_vector(2*16-1 downto 0);  -- s[16 13] : {X_MSB[n+1],X_MSB[n]}
        dataOut_im : out std_logic_vector(2*16-1 downto 0);  -- s[16 13] : {X_LSB[n+1],X_LSB[n]}
        --validOut : out std_logic
        validOut : out std_logic_vector(1 downto 0)
);
end demapper_top;

architecture Behavioral of demapper_top is

constant four_div_sqrt2 : signed(11 downto 0) := x"5A8"; -- s[12 9]

signal b0_MSB1, b0_MSB2, b0_LSB1, b0_LSB2 : signed(16+12-1 downto 0);
signal b0_validOut : std_logic_vector(1 downto 0);

type b1_st_type is (st_idle, st_no_offset, st_offset);
signal b1_state : b1_st_type;
signal b1_scramR1 : std_logic_vector(0 to 3); 
signal b1_counter : integer range 0 to 16384-1 := 0;
signal b1_MSB1, b1_MSB2, b1_LSB1, b1_LSB2 : signed(16-1 downto 0);
signal b1_validOut : std_logic_vector(1 downto 0);
signal b1_demapperDone : std_logic;

signal b2_triggerOut : std_logic;

component ila_0 is
PORT (
    clk : IN STD_LOGIC;
    probe0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe2 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe4 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
);
end component;

begin

--b0: Apply scaling factors to form LLR values
process(clk)
begin
    if rising_edge(clk) then
        b0_MSB1 <= signed(dataIn_re(15 downto 0)) * four_div_sqrt2;
        b0_MSB2 <= signed(dataIn_re(31 downto 16)) * four_div_sqrt2;
        b0_LSB1 <= signed(dataIn_im(15 downto 0)) * four_div_sqrt2;
        b0_LSB2 <= signed(dataIn_im(31 downto 16)) * four_div_sqrt2;
        b0_validOut <= dataIn_im(16) & dataIn_im(0);
    end if;
end process;

--b1: Descrambling
process(clk)
begin
    if rising_edge(clk) then
        
        b1_validOut <= b0_validOut;
        b1_demapperDone <= '0';
        
        if rstn = '0' then
            b1_state <= st_idle;
            b1_counter <= 0;
            b1_scramR1 <= descramblingSeq(b1_counter);
            
        else
            case b1_state is 
                when st_idle => 
                    b1_counter <= 0;
                    b1_scramR1 <= descramblingSeq(b1_counter);
                    if triggerIn = '1' then
                        b1_counter <= b1_counter + 1;
                        b1_state <= st_no_offset;
                    end if;
                when st_no_offset =>
                    if b1_counter = to_integer(unsigned(NumBLK)) then
                        b1_state <= st_idle;
                        b1_demapperDone <= '1';
                    else
                        if b0_validOut = "11" then
                            if b1_scramR1(0) = '1' then
                                b1_MSB1 <= - b0_MSB1(27-2 downto 27-15-2);
                            else
                                b1_MSB1 <= b0_MSB1(27-2 downto 27-15-2);
                            end if;
                            
                            if b1_scramR1(1) = '1' then
                                b1_LSB1 <= - b0_LSB1(27-2 downto 27-15-2);
                            else
                                b1_LSB1 <= b0_LSB1(27-2 downto 27-15-2);
                            end if;
                            
                            if b1_scramR1(2) = '1' then
                                b1_MSB2 <= - b0_MSB2(27-2 downto 27-15-2);
                            else
                                b1_MSB2 <= b0_MSB2(27-2 downto 27-15-2);
                            end if;
                            
                            if b1_scramR1(3) = '1' then
                                b1_LSB2 <= - b0_LSB2(27-2 downto 27-15-2);
                            else
                                b1_LSB2 <= b0_LSB2(27-2 downto 27-15-2);
                            end if;
                        
                            b1_state <= st_no_offset;
                            b1_scramR1 <= descramblingSeq(b1_counter);
                            b1_counter <= b1_counter + 1;
                        elsif b0_validOut = "01" or b0_validOut = "10" then
                            if b1_scramR1(0) = '1' then
                                b1_MSB1 <= - b0_MSB1(27-2 downto 27-15-2);
                            else
                                b1_MSB1 <= b0_MSB1(27-2 downto 27-15-2);
                            end if;
                            
                            if b1_scramR1(1) = '1' then
                                b1_LSB1 <= - b0_LSB1(27-2 downto 27-15-2);
                            else
                                b1_LSB1 <= b0_LSB1(27-2 downto 27-15-2);
                            end if;
                            
                            if b1_scramR1(0) = '1' then
                                b1_MSB2 <= - b0_MSB2(27-2 downto 27-15-2);
                            else
                                b1_MSB2 <= b0_MSB2(27-2 downto 27-15-2);
                            end if;
                            
                            if b1_scramR1(1) = '1' then
                                b1_LSB2 <= - b0_LSB2(27-2 downto 27-15-2);
                            else
                                b1_LSB2 <= b0_LSB2(27-2 downto 27-15-2);
                            end if;
                            
                            b1_state <= st_offset;
                        end if;
                    end if;
                when st_offset =>
                    if b1_counter = to_integer(unsigned(NumBLK)) then
                        b1_state <= st_idle;
                        b1_demapperDone <= '1';
                    else
                        if b0_validOut = "11" then
                            if b1_scramR1(2) = '1' then
                                b1_MSB1 <= - b0_MSB1(27-2 downto 27-15-2);
                            else
                                b1_MSB1 <= b0_MSB1(27-2 downto 27-15-2);
                            end if;
                            
                            if b1_scramR1(3) = '1' then
                                b1_LSB1 <= - b0_LSB1(27-2 downto 27-15-2);
                            else
                                b1_LSB1 <= b0_LSB1(27-2 downto 27-15-2);
                            end if;
                            
                            if descramblingSeq(b1_counter)(0) = '1' then
                                b1_MSB2 <= - b0_MSB2(27-2 downto 27-15-2);
                            else
                                b1_MSB2 <= b0_MSB2(27-2 downto 27-15-2);
                            end if;
                            
                            if descramblingSeq(b1_counter)(1) = '1' then
                                b1_LSB2 <= - b0_LSB2(27-2 downto 27-15-2);
                            else
                                b1_LSB2 <= b0_LSB2(27-2 downto 27-15-2);
                            end if;

                            b1_state <= st_offset;
                            b1_scramR1 <= descramblingSeq(b1_counter);
                            b1_counter <= b1_counter + 1;
                        elsif b0_validOut = "01" or b0_validOut = "10" then
                            if b1_scramR1(2) = '1' then
                                b1_MSB1 <= - b0_MSB1(27-2 downto 27-15-2);
                            else
                                b1_MSB1 <= b0_MSB1(27-2 downto 27-15-2);
                            end if;
                            
                            if b1_scramR1(3) = '1' then
                                b1_LSB1 <= - b0_LSB1(27-2 downto 27-15-2);
                            else
                                b1_LSB1 <= b0_LSB1(27-2 downto 27-15-2);
                            end if;
                            
                            if b1_scramR1(2) = '1' then
                                b1_MSB2 <= - b0_MSB2(27-2 downto 27-15-2);
                            else
                                b1_MSB2 <= b0_MSB2(27-2 downto 27-15-2);
                            end if;
                            
                            if b1_scramR1(3) = '1' then
                                b1_LSB2 <= - b0_LSB2(27-2 downto 27-15-2);
                            else
                                b1_LSB2 <= b0_LSB2(27-2 downto 27-15-2);
                            end if;
                            b1_state <= st_no_offset;
                            b1_scramR1 <= descramblingSeq(b1_counter);
                            b1_counter <= b1_counter + 1;
                        end if;
                    end if;
                when others => 
                    b1_state <= st_idle;
            end case;
        end if;
    end if;
end process;

--b2: triggerOut generation
process(clk)
begin
    if rising_edge(clk) then 
        if rstn = '0' then
            b2_triggerOut <= '0';
        else
            if triggerIn = '1' then
                b2_triggerOut <= '1';
            elsif b1_validOut /= "00" then
                b2_triggerOut <= '0';
            end if;
        end if;
    end if;
end process;


triggerOut <= b2_triggerOut and (b1_validOut(1) or b1_validOut(0)) ;
process(clk)
begin
    if rising_edge(clk) then
        dataOut_re <= std_logic_vector(b1_MSB2) & std_logic_vector(b1_MSB1);
        dataOut_im <= std_logic_vector(b1_LSB2) & std_logic_vector(b1_LSB1);
        validOut <= b1_validOut;
    end if;
end process;
lastOut <= b1_demapperDone;

--ila_blk: ila_0
--PORT MAP(
--    clk => clk,
--    probe0 => std_logic_vector(b1_MSB2),
--    probe1 => std_logic_vector(b1_MSB1),
--    probe2 => std_logic_vector(b1_LSB2),
--    probe3 => std_logic_vector(b1_LSB1),
--    probe4 => b1_validOut,
--    probe5(0) => b2_triggerOut
--);

end Behavioral;
