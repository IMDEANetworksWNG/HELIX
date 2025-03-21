----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/26/2022 04:15:25 PM
-- Design Name: 
-- Module Name: CP_correlation_CFO - Behavioral
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

entity CP_correlation_CFO is
port(   clk                             : IN    std_logic;
        reset                           : IN    std_logic;
        dataIn_re                       : IN    std_logic_vector(16-1 DOWNTO 0);    -- sfix16_En15
        dataIn_im                       : IN    std_logic_vector(16-1 DOWNTO 0);    -- sfix16_En15
        validIn                         : IN    std_logic;
        cordicValid                     : IN    std_logic;
        --trigger_in_temp : in std_logic;
        --pss_in_temp : in std_logic;
        --sss_in_temp : in std_logic;
        --dataOut_re                      : out   std_logic_vector(21 downto 0);
        --dataOut_im                      : out   std_logic_vector(21 downto 0);
        dataOut_re                      : out   std_logic_vector(39 downto 0);
        dataOut_im                      : out   std_logic_vector(39 downto 0);
        validOut                        : out   std_logic;
        dataOut_CFO                     : out   std_logic_vector(18 downto 0);
        validOut_CFO                    : out   std_logic
);
end CP_correlation_CFO;

architecture Behavioral of CP_correlation_CFO is

--COMPONENTS
component CORDIC_rot is
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
end component;

--component ila_0 IS
--port(
--    clk : IN STD_LOGIC;
--    probe0 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
--    probe1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
--    probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe3 : IN STD_LOGIC_VECTOR(38 DOWNTO 0);
--    probe4 : IN STD_LOGIC_VECTOR(38 DOWNTO 0);
--    probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe6 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
--    probe7 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
--    probe8 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe9 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
--    probe10 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
--    probe11 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe12 : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
--    probe13 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe14 : IN STD_LOGIC_VECTOR(37 DOWNTO 0);
--    probe15 : IN STD_LOGIC_VECTOR(37 DOWNTO 0);
--    probe16 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe17 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe18 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe19: IN STD_LOGIC_VECTOR(0 DOWNTO 0)
--);
--END component;

--TYPES
type a256x16std is array (0 to 255) of std_logic_vector(15 downto 0);
--type a18x20std is array (0 to 17) of std_logic_vector(19 downto 0);
type a18x20std is array (0 to 17) of std_logic_vector(32 downto 0);
--type a274x20s is array (0 to 273) of signed(19 downto 0);
type a274x38s is array (0 to 273) of signed(37 downto 0);

--SIGNALS
signal b0_SR_re, b0_SR_im : a256x16std := (others => (others => '0'));
signal b0_mult_re1, b0_mult_re2, b0_mult_im1, b0_mult_im2 : signed(31 downto 0) := (others => '0');
--signal b0_cpMult_re, b0_cpMult_im : std_logic_vector(19 downto 0);
signal b0_cpMult_re, b0_cpMult_im : std_logic_vector(32 downto 0) := (others => '0');
signal b0_valid, b0_valid_r : std_logic;

signal b1_SR_re, b1_SR_im : a18x20std := (others => (others => '0'));
--signal b1_comb_re, b1_comb_im : signed(19 downto 0) := (others => '0');
--signal b1_acc_re, b1_acc_im : signed(19+5 downto 0) := (others => '0');
signal b1_comb_re, b1_comb_im : signed(32 downto 0) := (others => '0');
signal b1_acc_re, b1_acc_im : signed(32+5 downto 0) := (others => '0');
signal b1_valid, b1_valid_r : std_logic;

--signal b2_SR_re1, b2_SR_re2, b2_SR_re3 : a274x20s := (others => (others => '0'));
--signal b2_SR_im1, b2_SR_im2, b2_SR_im3 : a274x20s := (others => (others => '0'));
signal b2_SR_re1, b2_SR_re2, b2_SR_re3 : a274x38s := (others => (others => '0'));
signal b2_SR_im1, b2_SR_im2, b2_SR_im3 : a274x38s := (others => (others => '0'));
--signal b2_add_re1, b2_add_im1 : signed(20 downto 0) := (others => '0');
signal b2_add_re1, b2_add_im1 : signed(38 downto 0) := (others => '0');
--signal b2_add_re2, b2_add_im2 : signed(21 downto 0) := (others => '0');
signal b2_add_re2, b2_add_im2 : signed(39 downto 0) := (others => '0');
--signal b2_add_re3, b2_add_im3 : signed(21 downto 0) := (others => '0');
signal b2_add_re3, b2_add_im3 : signed(39 downto 0) := (others => '0');
signal b2_valid, b2_valid_r, b2_valid_r2, b2_valid_r3 : std_logic := '0';
--signal b2_SR_re1_r, b2_SR_im1_r : signed(19 downto 0) := (others => '0');
--signal b2_SR_re2_r, b2_SR_im2_r : signed(19 downto 0) := (others => '0');
signal b2_SR_re1_r, b2_SR_im1_r : signed(37 downto 0) := (others => '0');
signal b2_SR_re2_r, b2_SR_im2_r : signed(37 downto 0) := (others => '0');

signal b3_dataOut : std_logic_vector(18 downto 0);
signal b3_validOut : std_logic;

begin

--b0:   256-length shift register (length of the OFDM symbol of SSB) -- CP product: x * conj(x-256)
--      (2 valid clk cycles latency)
process(clk)
begin
    if rising_edge(clk) then
        if validIn = '1' then
            for ii in 0 to 254 loop
                b0_SR_re(ii+1) <= b0_SR_re(ii);
                b0_SR_im(ii+1) <= b0_SR_im(ii);
            end loop;
            b0_SR_re(0) <= dataIn_re;
            b0_SR_im(0) <= dataIn_im;
        end if;
        
        b0_mult_re1 <= signed(dataIn_re) * signed(b0_SR_re(255));
        b0_mult_re2 <= signed(dataIn_im) * signed(b0_SR_im(255));
        b0_mult_im1 <= signed(dataIn_im) * signed(b0_SR_re(255));
        b0_mult_im2 <= signed(dataIn_re) * signed(b0_SR_im(255));
        
        --b0_cpMult_re <= std_logic_vector(b0_mult_re1(31 downto 12) + b0_mult_re2(31 downto 12));
        --b0_cpMult_im <= std_logic_vector(b0_mult_im1(31 downto 12) - b0_mult_im2(31 downto 12));
        b0_cpMult_re <= std_logic_vector(resize(b0_mult_re1,33) + resize(b0_mult_re2,33));
        b0_cpMult_im <= std_logic_vector(resize(b0_mult_im1,33) - resize(b0_mult_im2,33));
        
        b0_valid <= validIn;   
        b0_valid_r <= b0_valid;   
    end if;
end process;

--b1:   Cyclic prefix length (18) moving average filter. 
process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            b1_acc_re <= (others => '0');
            b1_acc_im <= (others => '0');
        else
            if b0_valid_r = '1' then
                
                --18 cycles shift register
                for ii in 1 to 17 loop
                    b1_SR_re(ii) <= b1_SR_re(ii-1);
                    b1_SR_im(ii) <= b1_SR_im(ii-1);
                end loop;
                b1_SR_re(0) <= b0_cpMult_re;
                b1_SR_im(0) <= b0_cpMult_im;

                -- comb filter
                b1_comb_re <= signed(b0_cpMult_re) - signed(b1_SR_re(17));
                b1_comb_im <= signed(b0_cpMult_im) - signed(b1_SR_im(17));
                
                -- accumulator
                b1_acc_re <= b1_acc_re + resize(b1_comb_re,b1_acc_re'length);
                b1_acc_im <= b1_acc_im + resize(b1_comb_im,b1_acc_im'length);
            end if;
            
            b1_valid <= b0_valid_r;
            b1_valid_r <= b1_valid;
        end if;
    end if;
end process;

--dataOut_re <= std_logic_vector(b1_acc_re(21 downto 0));
--dataOut_im <= std_logic_vector(b1_acc_im(21 downto 0));
--validOut <= b1_valid_r;

--b2: sum across 4 OFDM symbols (length 274)
process(clk)
begin
    if rising_edge(clk) then
        if b1_valid_r = '1' then
            for ii in 0 to 272 loop
                b2_SR_re1(ii+1) <= b2_SR_re1(ii);
                b2_SR_im1(ii+1) <= b2_SR_im1(ii);
            end loop;
--            b2_SR_re1(0) <= b1_acc_re(24 downto 5);
--            b2_SR_im1(0) <= b1_acc_im(24 downto 5);
            b2_SR_re1(0) <= b1_acc_re;
            b2_SR_im1(0) <= b1_acc_im;
        end if;
        
--        b2_add_re1 <= resize(b1_acc_re(24 downto 5),b2_add_re1'length) + resize(b2_SR_re1(273),b2_add_re1'length);
--        b2_add_im1 <= resize(b1_acc_im(24 downto 5),b2_add_im1'length) + resize(b2_SR_im1(273),b2_add_im1'length);
        b2_add_re1 <= resize(b1_acc_re,b2_add_re1'length) + resize(b2_SR_re1(273),b2_add_re1'length);
        b2_add_im1 <= resize(b1_acc_im,b2_add_im1'length) + resize(b2_SR_im1(273),b2_add_im1'length);
        b2_SR_re1_r <= b2_SR_re1(273);
        b2_SR_im1_r <= b2_SR_im1(273);
        b2_valid <= b1_valid_r;
        
        if b2_valid = '1' then
            for ii in 0 to 272 loop
                b2_SR_re2(ii+1) <= b2_SR_re2(ii);
                b2_SR_im2(ii+1) <= b2_SR_im2(ii);
            end loop;
            b2_SR_re2(0) <= b2_SR_re1_r;
            b2_SR_im2(0) <= b2_SR_im1_r;
        end if;
        
        b2_add_re2 <= resize(b2_add_re1,b2_add_re2'length) + resize(b2_SR_re2(273),b2_add_re2'length);
        b2_add_im2 <= resize(b2_add_im1,b2_add_im2'length) + resize(b2_SR_im2(273),b2_add_im2'length);
        b2_SR_re2_r <= b2_SR_re2(273);
        b2_SR_im2_r <= b2_SR_im2(273);
        b2_valid_r <= b2_valid;

        if b2_valid_r = '1' then
            for ii in 0 to 272 loop
                b2_SR_re3(ii+1) <= b2_SR_re3(ii);
                b2_SR_im3(ii+1) <= b2_SR_im3(ii);
            end loop;
            b2_SR_re3(0) <= b2_SR_re2_r;
            b2_SR_im3(0) <= b2_SR_im2_r;
        end if;
        
        b2_add_re3 <= resize(b2_add_re2,b2_add_re3'length) + resize(b2_SR_re3(273),b2_add_re3'length);
        b2_add_im3 <= resize(b2_add_im2,b2_add_im3'length) + resize(b2_SR_im3(273),b2_add_im3'length);
        b2_valid_r2 <= b2_valid_r;
        
    end if;
end process;

--ILA_BLK: ila_0
--PORT MAP(
--    clk => clk,
--    probe0 => dataIn_re,
--    probe1 => dataIn_im,
--    probe2(0) => validIn,
--    probe3 => std_logic_vector(b2_add_re1),
--    probe4 => std_logic_vector(b2_add_im1),
--    probe5(0) => b2_valid,
--    probe6 => std_logic_vector(b2_add_re2),
--    probe7 => std_logic_vector(b2_add_im2),
--    probe8(0) => b2_valid_r,
--    probe9 => std_logic_vector(b2_add_re3),
--    probe10 => std_logic_vector(b2_add_im3),
--    probe11(0) => b2_valid_r2,
--    probe12 => b3_dataOut,
--    probe13(0) => b3_validOut,
--    probe14 => std_logic_vector(b1_acc_re),
--    probe15 => std_logic_vector(b1_acc_im),
--    probe16(0) => b1_valid_r,
--    probe17(0) => trigger_in_temp,
--    probe18(0)=> pss_in_temp,
--    probe19(0) => sss_in_temp
--);

dataOut_re <= std_logic_vector(b2_add_re3(39 downto 0));
dataOut_im <= std_logic_vector(b2_add_im3(39 downto 0));
validOut <= b2_valid_r2;

b2_valid_r3 <= b2_valid_r2 and cordicValid;
b3: CORDIC_rot
Port Map(   clk => clk,
            reset => reset,
            dataIn_re => std_logic_vector(b2_add_re3),
            dataIn_im => std_logic_vector(b2_add_im3),
            validIn => b2_valid_r3,
            dataOut => b3_dataOut,
            validOut => b3_validOut--,
            --sss_in_temp => sss_in_temp
            --trigger_in_temp => trigger_in_temp
);

dataOut_CFO <= b3_dataOut;
validOut_CFO <= b3_validOut;

end Behavioral;
