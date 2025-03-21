----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2022 07:34:59 PM
-- Design Name: 
-- Module Name: CFO_correction - Behavioral
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

entity CFO_correction is
PORT(   clk                             : IN    std_logic; -- 245.76MHz 
        reset                           : IN    std_logic;
        dataIn_re                       : IN    std_logic_vector(2*16-1 DOWNTO 0);  -- s[16,15]
        dataIn_im                       : IN    std_logic_vector(2*16-1 DOWNTO 0);  -- s[16,15]
        validIn                         : IN    std_logic;
        angleIn                         : IN    std_logic_vector(19-1 DOWNTO 0); -- s[19 15]   
        angleIn_valid                   : IN    std_logic;
        BW_SEL                          : IN    std_logic;
        scalingOut                      : in    std_logic_vector(4 downto 0);
        dataOut_re                      : out   std_logic_vector(2*16-1 DOWNTO 0);  -- s[16,15]
        dataOut_im                      : out   std_logic_vector(2*16-1 DOWNTO 0);  -- s[16,15]
        validOut                        : out   std_logic
);
end CFO_correction;

architecture Behavioral of CFO_correction is

component DDS_v2 is
Port (  clk                             : IN    std_logic; -- 245.76MHz 
        reset                           : IN    std_logic;
        angleIn                         : IN    std_logic_vector(19-1 DOWNTO 0); -- s[19 15]   
        angleIn_valid                   : IN    std_logic;
        enableIn                        : IN    std_logic;
        BW_SEL                          : IN    std_logic;
        cosOut                          : out   std_logic_vector(2*17-1 downto 0); --s[17 15]
        sinOut                          : out   std_logic_vector(2*17-1 downto 0); --s[17 15]
        outValid                        : out   std_logic 
);
end component;

signal b0_cosOut, b0_sinOut : std_logic_vector(2*17-1 downto 0) := (others => '0');
signal b0_cosOut1, b0_sinOut1 : std_logic_vector(17-1 downto 0) := (others => '0');
signal b0_cosOut2, b0_sinOut2 : std_logic_vector(17-1 downto 0) := (others => '0');
signal b0_valid : std_logic;

signal b1_re1, b1_re2, b1_im1, b1_im2 : signed(33-1 downto 0) := (others => '0');
signal b1_re3, b1_re4, b1_im3, b1_im4 : signed(33-1 downto 0) := (others => '0');
signal b1_add_re1, b1_add_im1 : signed(34-1 downto 0) := (others => '0');
signal b1_add_re2, b1_add_im2 : signed(34-1 downto 0) := (others => '0');
signal b1_valid, b1_valid_r : std_logic;

begin

b0: DDS_v2 
Port map    (   clk => clk, 
                reset => reset,
                angleIn => angleIn,   
                angleIn_valid => angleIn_valid,
                enableIn => validIn,
                BW_SEL => BW_SEL,
                cosOut => b0_cosOut,
                sinOut => b0_sinOut,
                outValid => b0_valid 
);

b0_cosOut1 <= b0_cosOut(16 downto 0);
b0_sinOut1 <= b0_sinOut(16 downto 0);
b0_cosOut2 <= b0_cosOut(33 downto 17);
b0_sinOut2 <= b0_sinOut(33 downto 17);

process(clk)
begin
    if rising_edge(clk) then
        if validIn = '1' then
            b1_re1 <= signed(dataIn_re(15 downto 0)) * signed(b0_cosOut1);
            b1_re2 <= signed(dataIn_im(15 downto 0)) * signed(b0_sinOut1);
            b1_im1 <= signed(dataIn_re(15 downto 0)) * signed(b0_sinOut1);
            b1_im2 <= signed(dataIn_im(15 downto 0)) * signed(b0_cosOut1);

            b1_re3 <= signed(dataIn_re(31 downto 16)) * signed(b0_cosOut2);
            b1_re4 <= signed(dataIn_im(31 downto 16)) * signed(b0_sinOut2);
            b1_im3 <= signed(dataIn_re(31 downto 16)) * signed(b0_sinOut2);
            b1_im4 <= signed(dataIn_im(31 downto 16)) * signed(b0_cosOut2);
        end if;
        if b1_valid = '1' then
            b1_add_re1 <= resize(b1_re1,b1_add_re1'length) - resize(b1_re2,b1_add_re1'length);
            b1_add_im1 <= resize(b1_im1,b1_add_im1'length) + resize(b1_im2,b1_add_im1'length);
            b1_add_re2 <= resize(b1_re3,b1_add_re2'length) - resize(b1_re4,b1_add_re2'length);
            b1_add_im2 <= resize(b1_im3,b1_add_im2'length) + resize(b1_im4,b1_add_im2'length);
        end if;
        
        b1_valid <= validIn;
        b1_valid_r <= b1_valid;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        validOut <= b1_valid_r;
        
        case scalingOut is
            when "00000" => -- div1
                dataOut_re(15 downto 0) <= std_logic_vector(b1_add_re1(30 downto 15));
                dataOut_re(31 downto 16) <= std_logic_vector(b1_add_re2(30 downto 15));
                dataOut_im(15 downto 0) <= std_logic_vector(b1_add_im1(30 downto 15));
                dataOut_im(31 downto 16) <= std_logic_vector(b1_add_im2(30 downto 15));
            when "00001" => -- div2 
                dataOut_re(15 downto 0) <= std_logic_vector(b1_add_re1(30+1 downto 15+1));
                dataOut_re(31 downto 16) <= std_logic_vector(b1_add_re2(30+1 downto 15+1));
                dataOut_im(15 downto 0) <= std_logic_vector(b1_add_im1(30+1 downto 15+1));
                dataOut_im(31 downto 16) <= std_logic_vector(b1_add_im2(30+1 downto 15+1));
            when "00010" =>  -- div4
                dataOut_re(15 downto 0) <= std_logic_vector(b1_add_re1(30+2 downto 15+2));
                dataOut_re(31 downto 16) <= std_logic_vector(b1_add_re2(30+2 downto 15+2));
                dataOut_im(15 downto 0) <= std_logic_vector(b1_add_im1(30+2 downto 15+2));
                dataOut_im(31 downto 16) <= std_logic_vector(b1_add_im2(30+2 downto 15+2));
            when "00011" =>  -- div8
                dataOut_re(15 downto 0) <= std_logic_vector(b1_add_re1(30+3 downto 15+3));
                dataOut_re(31 downto 16) <= std_logic_vector(b1_add_re2(30+3 downto 15+3));
                dataOut_im(15 downto 0) <= std_logic_vector(b1_add_im1(30+3 downto 15+3));
                dataOut_im(31 downto 16) <= std_logic_vector(b1_add_im2(30+3 downto 15+3));
            when "00100" => --mul2
                dataOut_re(15 downto 0)	<= std_logic_vector(b1_add_re1(29 downto 14));                         
                dataOut_re(31 downto 16)	<= std_logic_vector(b1_add_re2(29 downto 14));                            
                dataOut_im(15 downto 0)	<= std_logic_vector(b1_add_im1(29 downto 14));                    
                dataOut_im(31 downto 16)	<= std_logic_vector(b1_add_im2(29 downto 14));                                    
            when "00101" => --mul4
                dataOut_re(15 downto 0)	<= std_logic_vector(b1_add_re1(28 downto 13));                         
                dataOut_re(31 downto 16)	<= std_logic_vector(b1_add_re2(28 downto 13));                            
                dataOut_im(15 downto 0)	<= std_logic_vector(b1_add_im1(28 downto 13));                    
                dataOut_im(31 downto 16)	<= std_logic_vector(b1_add_im2(28 downto 13));                                    
            when "00110" => --mul8
                dataOut_re(15 downto 0)	<= std_logic_vector(b1_add_re1(27 downto 12));                         
                dataOut_re(31 downto 16)	<= std_logic_vector(b1_add_re2(27 downto 12));                            
                dataOut_im(15 downto 0)	<= std_logic_vector(b1_add_im1(27 downto 12));                    
                dataOut_im(31 downto 16)	<= std_logic_vector(b1_add_im2(27 downto 12));                                    
        when others => 
                dataOut_re(15 downto 0) <= std_logic_vector(b1_add_re1(30 downto 15));
                dataOut_re(31 downto 16) <= std_logic_vector(b1_add_re2(30 downto 15));
                dataOut_im(15 downto 0) <= std_logic_vector(b1_add_im1(30 downto 15));
                dataOut_im(31 downto 16) <= std_logic_vector(b1_add_im2(30 downto 15));
        end case;
    end if;
end process;

end Behavioral;
