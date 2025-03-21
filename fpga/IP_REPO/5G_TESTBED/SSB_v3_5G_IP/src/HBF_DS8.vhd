----------------------------------------------------------------------------------
-- 
-- Create Date: 11/30/2021 04:59:19 PM
-- Design Name: 
-- Module Name: HBF_DS8 - Behavioral
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

entity HBF_DS8 is
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validIn                           :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validOut                          :   OUT   std_logic
        );
end HBF_DS8;

architecture rtl of HBF_DS8 is

--components
component Stage_2 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validIn                           :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validOut                          :   OUT   std_logic
        );
END component;

component Stage_3 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validIn                           :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validOut                          :   OUT   std_logic
        );
END component;

component Stage_4 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validIn                           :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        validOut                          :   OUT   std_logic
        );
END component;

signal ST2_ce_out, ST2_validOut : std_logic;
signal ST2_dataOut_re, ST2_dataOut_im : std_logic_vector(15 downto 0);
signal ST3_ce_out, ST3_validOut : std_logic;
signal ST3_dataOut_re, ST3_dataOut_im : std_logic_vector(15 downto 0);
signal ST4_ce_out, ST4_validOut : std_logic;
signal ST4_dataOut_re, ST4_dataOut_im : std_logic_vector(15 downto 0);

begin

ST2: Stage_2
PORT MAP (  clk => clk,
            reset => reset,
            clk_enable => clk_enable,
            dataIn_re => dataIn_re,
            dataIn_im => dataIn_im,
            validIn => validIn,
            ce_out => ST2_ce_out,
            dataOut_re => ST2_dataOut_re,
            dataOut_im => ST2_dataOut_im,
            validOut => ST2_validOut
);

ST3: Stage_3
PORT MAP (  clk => clk,
            reset => reset,
            clk_enable => ST2_ce_out,
            dataIn_re => ST2_dataOut_re,
            dataIn_im => ST2_dataOut_im,
            validIn => ST2_validOut,
            ce_out => ST3_ce_out,
            dataOut_re => ST3_dataOut_re,
            dataOut_im => ST3_dataOut_im,
            validOut => ST3_validOut
);

ST4: Stage_4
PORT MAP (  clk => clk,
            reset => reset,
            clk_enable => ST3_ce_out,
            dataIn_re => ST3_dataOut_re,
            dataIn_im => ST3_dataOut_im,
            validIn => ST3_validOut,
            ce_out => ST4_ce_out,
            dataOut_re => ST4_dataOut_re,
            dataOut_im => ST4_dataOut_im,
            validOut => ST4_validOut
);

ce_out <= ST4_ce_out;
dataOut_re <= ST4_dataOut_re;
dataOut_im <= ST4_dataOut_im;
validOut <= ST4_validOut;

--ce_out <= ST3_ce_out;
--dataOut_re <= ST3_dataOut_re;
--dataOut_im <= ST3_dataOut_im;
--validOut <= ST3_validOut;

--ce_out <= ST2_ce_out;
--dataOut_re <= ST2_dataOut_re;
--dataOut_im <= ST2_dataOut_im;
--validOut <= ST2_validOut;

end rtl;
