----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2021 02:49:25 PM
-- Design Name: 
-- Module Name: PSS_DETECTION_TOP - Behavioral
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

entity PSS_DETECTION_TOP is
PORT(   clk                             : IN    std_logic;
        reset                           : IN    std_logic;
        clk_enable                      : IN    std_logic;
        dataIn_re                       : IN    std_logic_vector(16-1 DOWNTO 0);    -- sfix16_En15
        dataIn_im                       : IN    std_logic_vector(16-1 DOWNTO 0);    -- sfix16_En15
        validIn                         : IN    std_logic;
        tempOut_re                      : out std_logic_vector(15 DOWNTO 0);      --TEMP OUTPUT
        tempOut_im                      : out std_logic_vector(15 DOWNTO 0);      --TEMP OUTPUT
        tempValidOut                    : out std_logic;
--        dataOut_PSS0_temp               : out   std_logic_vector(29 downto 0);      --TEMP OUTPUT
--        validOut_PSS0_temp              : out   std_logic;                          --TEMP OUTPUT
--        dataOut_PSS1_temp               : out   std_logic_vector(29 downto 0);      --TEMP OUTPUT
--        validOut_PSS1_temp              : out   std_logic;                          --TEMP OUTPUT
--        dataOut_PSS2_temp               : out   std_logic_vector(29 downto 0);      --TEMP OUTPUT
--        validOut_PSS2_temp              : out   std_logic;                          --TEMP OUTPUT
        dataOut_TH                       : out   std_logic_vector(24 downto 0);      -- u[24 18]
        validOut_TH                      : out   std_logic;                          -- u[24 18]
        psscellidOut                     : out std_logic_vector(1 downto 0); 
        psscellidValidOut                : out std_logic
    );
end PSS_DETECTION_TOP;

architecture Behavioral of PSS_DETECTION_TOP is

--component PSS_Prefilter IS
--  PORT( clk                               :   IN    std_logic;
--        reset                             :   IN    std_logic;
--        clk_enable                        :   IN    std_logic;
--        dataIn_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
--        dataIn_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
--        validIn                           :   IN    std_logic;
--        ce_out                            :   OUT   std_logic;
--        dataOut_re                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
--        dataOut_im                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
--        validOut                          :   OUT   std_logic
--        );
--END component;

component PSSPrefilter IS
PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(16-1 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(40-1 DOWNTO 0)
  );
END component;

component PSS_CORRELATOR is
Generic ( Win : integer := 16;
          Wh : integer := 8;
          PSS_SEQ : integer := 0 -- PSS SEQ
);
Port (  clk : in std_logic;
        rst_n : in std_logic;
        data_in_i : in std_logic_vector(Win-1 downto 0);
        data_in_q : in std_logic_vector(Win-1 downto 0);
        data_valid_i : in std_logic;
        data_valid_q : in std_logic;
        tempOut_re : out std_logic_vector(16-1 downto 0);
        tempOut_im : out std_logic_vector(16-1 downto 0);
        tempOut_valid : out std_logic;
        data_out : out std_logic_vector(Wh+Win-1+6 downto 0);
        data_out_valid : out std_logic
);
end component;

component PSS0_CORRELATOR is
Port (  clk : in std_logic;
        rst_n : in std_logic;
        data_in_i : in std_logic_vector(16-1 downto 0);
        data_in_q : in std_logic_vector(16-1 downto 0);
        data_valid_i : in std_logic;
        data_valid_q : in std_logic;
        data_out : out std_logic_vector(16-1 downto 0);
        data_out_valid : out std_logic
);
end component;

component PSS_THRESHOLD is
Port (  clk : in std_logic;
        rst_n : in std_logic;
        data_in_i : in std_logic_vector(16-1 downto 0);
        data_in_q : in std_logic_vector(16-1 downto 0);
        data_in_valid : in std_logic;
        data_out : out std_logic_vector(24 downto 0);
        data_out_valid : out std_logic
);
end component;

component PSS_TH_COMPARE is
Port (  clk : in std_logic;
        rst_n : in std_logic;
--        PSS_in : in std_logic_vector(30-1 downto 0);
        PSS_in : in std_logic_vector(16-1 downto 0);
        PSS_valid_in : in std_logic;
--        TH_in : in std_logic_vector(24 downto 0);
        TH_in : in std_logic_vector(16-1 downto 0);
        TH_valid_in : in std_logic;
--        PSS_out : out std_logic_vector(30-1 downto 0); 
        PSS_out : out std_logic_vector(16-1 downto 0); 
        TH_out : out std_logic;
        TH_ind_out : out std_logic_vector(1 downto 0);
        PSS_valid : out std_logic 
);
end component;

signal b0_ce_out : std_logic;
signal b0_dataOut_re : std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
signal b0_dataOut_im : std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
signal b0_validOut : std_logic;
signal b0_dataIn : std_logic_vector(32-1 downto 0);
signal b0_dataOut_re1, b0_dataOut_im1 : std_logic_vector(40-1 downto 0);


signal b1_dataOut_0 : std_logic_vector(16-1 DOWNTO 0);  -- sfix16_En15
signal b1_dataOut_1_temp : std_logic_vector(29 downto 0);
signal b1_validOut_0 : std_logic;
signal b1_dataOut_1 : std_logic_vector(29 DOWNTO 0);  -- sfix16_En15
signal b1_validOut_1 : std_logic;
signal b1_dataOut_2 : std_logic_vector(29 DOWNTO 0);  -- sfix16_En15
signal b1_validOut_2 : std_logic;

--signal b2_data_out : std_logic_vector(36 DOWNTO 0);  -- sfix16_En15
signal b2_data_out1 : std_logic_vector(24 DOWNTO 0);  -- sfix16_En15
signal b2_data_out2 :  std_logic_vector(16-1 DOWNTO 0);  -- sfix16_En15
signal b2_valid_out : std_logic;

--signal b3_PSS0_out, b3_PSS1_out, b3_PSS2_out : std_logic_vector(30-1 downto 0); 
signal b3_PSS0_out, b3_PSS1_out, b3_PSS2_out : std_logic_vector(16-1 downto 0); 
signal b3_TH0_out, b3_TH1_out, b3_TH2_out : std_logic;
signal b3_TH_out : std_logic_vector(2 downto 0);
signal b3_TH0_ind_out, b3_TH1_ind_out, b3_TH2_ind_out : std_logic_vector(1 downto 0);
signal b3_PSS0_valid, b3_PSS1_valid, b3_PSS2_valid : std_logic; 

signal b4_CELL_ID, b4_CELL_ID_r, b4_CELL_ID_r2, b4_CELL_ID_r3, b4_CELL_ID_r4 : std_logic_vector(1 downto 0) := "00"; 
signal b4_CELL_ID_valid, b4_CELL_ID_valid_r, b4_CELL_ID_valid_r2, b4_CELL_ID_valid_r3, b4_CELL_ID_valid_r4 : std_logic := '0';
signal b4_Time_offset, b4_Time_offset_r : std_logic_vector(1 downto 0) := "00";



signal rst_n : std_logic;

begin

--b0: PSS_Prefilter
--PORT MAP (  clk => clk,
--            reset => reset,
--            clk_enable => clk_enable,
--            dataIn_re => dataIn_re,
--            dataIn_im => dataIn_im,
--            validIn => validIn,
--            ce_out => b0_ce_out,
--            dataOut_re => b0_dataOut_re,
--            dataOut_im => b0_dataOut_im,
--            validOut => b0_validOut
--);

--b0_dataIn <= dataIn_im & dataIn_re;

b0re: PSSPrefilter
PORT MAP (  aclk => clk,
            s_axis_data_tdata => dataIn_re,
            s_axis_data_tvalid => validIn,
            s_axis_data_tready => open,
            m_axis_data_tvalid => b0_validOut,
            m_axis_data_tdata => b0_dataOut_re1
);

b0im: PSSPrefilter
PORT MAP (  aclk => clk,
            s_axis_data_tdata => dataIn_im,
            s_axis_data_tvalid => validIn,
            s_axis_data_tready => open,
            m_axis_data_tvalid => open,
            m_axis_data_tdata => b0_dataOut_im1
);

b0_dataOut_re <= b0_dataOut_re1(b0_dataOut_re1'high-9 downto b0_dataOut_re1'high-15-9);
b0_dataOut_im <= b0_dataOut_im1(b0_dataOut_im1'high-9 downto b0_dataOut_im1'high-15-9);

--tempOut_re <= b0_dataOut_re;
--tempOut_im <= b0_dataOut_im;
--tempValidOut <= b0_validOut;

rst_n <= not reset;

--b1_<x> : Time-domain correlators against each one of the x=1:3 PSS sequences 
b1_0: PSS0_CORRELATOR 
Port map(   clk => clk,
            rst_n => rst_n,
            data_in_I => b0_dataOut_re,
            data_valid_I => b0_validOut,
            data_in_Q => b0_dataOut_im,
            data_valid_Q => b0_validOut,
            data_out => b1_dataOut_0,
            data_out_valid => b1_validOut_0
);
--tempOut_re <= b1_dataOut_0;
--tempValidOut <= b1_validOut_0;

--b1_1: PSS_CORRELATOR 
--Generic map (PSS_SEQ => 1
--)
--Port map(   clk => clk,
--            rst_n => rst_n,
--            data_in_I => b0_dataOut_re,
--            data_valid_I => b0_validOut,
--            data_in_Q => b0_dataOut_im,
--            data_valid_Q => b0_validOut,
--            tempOut_re => open,
--            tempOut_im => open,
--            tempOut_valid => open,
--            data_out => b1_dataOut_1,
--            data_out_valid => b1_validOut_1
--);

--b1_2: PSS_CORRELATOR 
--Generic map (PSS_SEQ => 2
--)
--Port map(   clk => clk,
--            rst_n => rst_n,
--            data_in_I => b0_dataOut_re,
--            data_valid_I => b0_validOut,
--            data_in_Q => b0_dataOut_im,
--            data_valid_Q => b0_validOut,
--            tempOut_re => open,
--            tempOut_im => open,
--            tempOut_valid => open,
--            data_out => b1_dataOut_2,
--            data_out_valid => b1_validOut_2
--);

--dataOut_PSS2_temp <= b1_dataOut_2;
--validOut_PSS2_temp <= b1_validOut_2;

b2: PSS_THRESHOLD 
Port map(   clk => clk,
            rst_n => rst_n,
            data_in_i => b0_dataOut_re,
            data_in_q => b0_dataOut_im,
            data_in_valid => b0_validOut,
            data_out => b2_data_out1,
            data_out_valid => b2_valid_out
);

dataOut_TH <= b2_data_out1;
validOut_TH <= b2_valid_out;

b2_data_out2 <= b2_data_out1(b2_data_out1'high-4 downto b2_data_out1'high-4 - 15);
--tempOut_re <= b2_data_out2;
--tempValidOut <= b2_valid_out;

--b3: Compare PSS against the Threshold  
-- TH<x>_out is 4 valid clock cycles ahead of the PSS signal
b3_0: PSS_TH_COMPARE
Port Map(   clk => clk,
            rst_n => rst_n,
            PSS_in => b1_dataOut_0,
            PSS_valid_in => b1_validOut_0,
            --TH_in => b2_data_out(36 downto 7),
            TH_in => b2_data_out2,
            TH_valid_in => b2_valid_out,
            PSS_out => b3_PSS0_out, 
            TH_out => b3_TH0_out,
            TH_ind_out => b3_TH0_ind_out,
            PSS_valid => b3_PSS0_valid 
);

--b3_1: PSS_TH_COMPARE
--Port Map(   clk => clk,
--            rst_n => rst_n,
--            PSS_in => b1_dataOut_1,
--            PSS_valid_in => b1_validOut_1,
--            --TH_in => b2_data_out(36 downto 7),
--            TH_in => b2_data_out,
--            TH_valid_in => b2_valid_out,
--            PSS_out => b3_PSS1_out, 
--            TH_out => b3_TH1_out,
--            TH_ind_out => b3_TH1_ind_out,
--            PSS_valid => b3_PSS1_valid 
--);

--b3_2: PSS_TH_COMPARE
--Port Map(   clk => clk,
--            rst_n => rst_n,
--            PSS_in => b1_dataOut_2,
--            PSS_valid_in => b1_validOut_2,
--            --TH_in => b2_data_out(36 downto 7),
--            TH_in => b2_data_out,
--            TH_valid_in => b2_valid_out,
--            PSS_out => b3_PSS2_out, 
--            TH_out => b3_TH2_out,
--            TH_ind_out => b3_TH2_ind_out,
--            PSS_valid => b3_PSS2_valid 
--);

--b3_TH_out <= b3_TH2_out & b3_TH1_out & b3_TH0_out;
b3_TH_out <= "00" & b3_TH0_out;

--process(b3_TH_out,b3_TH0_ind_out,b3_TH1_ind_out,b3_TH2_ind_out)
process(b3_TH_out,b3_TH0_ind_out)
begin
    case(b3_TH_out) is
        when "001" =>   b4_CELL_ID <= "00";
                        b4_CELL_ID_valid <= '1';
                        b4_Time_offset <= b3_TH0_ind_out;
--        when "010" =>   b4_CELL_ID <= "01";
--                        b4_CELL_ID_valid <= '1';
--                        b4_Time_offset <= b3_TH1_ind_out;
--        when "100" =>   b4_CELL_ID <= "10";
--                        b4_CELL_ID_valid <= '1';
--                        b4_Time_offset <= b3_TH2_ind_out;
        when others =>  b4_CELL_ID <= "11";
                        b4_CELL_ID_valid <= '0';
                        b4_Time_offset <= "00";
    end case;
end process;

process(clk)
begin
    if rising_edge(clk) then
        --if b3_PSS2_valid = '1' then
        if b3_PSS0_valid = '1' then
            b4_CELL_ID_r <= b4_CELL_ID;
            b4_CELL_ID_r2 <= b4_CELL_ID_r;
            b4_CELL_ID_r3 <= b4_CELL_ID_r2;
            b4_CELL_ID_r4 <= b4_CELL_ID_r3;
            b4_CELL_ID_valid_r <= b4_CELL_ID_valid;
            b4_CELL_ID_valid_r2 <= b4_CELL_ID_valid_r;
            b4_CELL_ID_valid_r3 <= b4_CELL_ID_valid_r2;
            b4_CELL_ID_valid_r4 <= b4_CELL_ID_valid_r3;
        end if;
--        b4_PSS0_valid <= b3_PSS0_valid;
--        b4_PSS1_valid <= b3_PSS1_valid;
--        b4_PSS2_valid <= b3_PSS2_valid;
    end if;
end process;

-- adjust timing according to the Time_offset_out signal 
process(clk)
begin
    if rising_edge(clk) then
        if b4_CELL_ID_valid = '1' then
            b4_Time_offset_r <= b4_Time_offset;
        end if;
    end if;
end process;

with b4_Time_offset_r select psscellidValidOut <= 
    b4_CELL_ID_valid_r when "00",
    b4_CELL_ID_valid_r2 when "01",
    b4_CELL_ID_valid_r3 when "10",
    b4_CELL_ID_valid_r4 when others;
    
with b4_Time_offset_r select psscellidOut <= 
    b4_CELL_ID_r when "00",
    b4_CELL_ID_r2 when "01",
    b4_CELL_ID_r3 when "10",
    b4_CELL_ID_r4 when others;

    
end Behavioral;
