----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2022 05:01:19 PM
-- Design Name: 
-- Module Name: SSB_TOP_v3 - Behavioral
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

entity SSB_TOP_v3 is
PORT(   clk                             : IN  std_logic; -- 245.76MHz 
        reset                           : IN  std_logic;
        clk_enable                      : IN  std_logic;
        dataIn_re                       : IN  std_logic_vector(16-1 DOWNTO 0);  -- s[16 15]
        dataIn_im                       : IN  std_logic_vector(16-1 DOWNTO 0);  -- s[16 15]
        validIn                         : IN  std_logic;
        BW_sel                          : in  std_logic;
        pssenergyOut                    : out std_logic_vector(24 downto 0);      -- s[24 16]
        pssenergyValidOut               : out std_logic;                          
        psscellidOut                    : out std_logic_vector(1 downto 0); -- u[2 0] 
        psscellidValidOut               : out std_logic;
        cfoOut                          : out std_logic_vector(18 downto 0); -- s[19 15]
        cfoValidOut                     : out std_logic;
        endssbOut                       : out std_logic;
--        pbchOut_re                      : out std_logic_vector((256-16)*16-1 downto 0); -- {X[255] X[254] .. X[0]}  --s[16 11]
--        pbchOut_im                      : out std_logic_vector((256-16)*16-1 downto 0); -- {X[255] X[254] .. X[0]}  --s[16 11]
--        pbchValidOut                    : out std_logic;
--        ssscellidOut                    : out std_logic_vector(8 downto 0); --u[9 0]
--        ssscellidValidOut               : out std_logic;
        tempOut_re                      : out std_logic_vector(15 DOWNTO 0);      --TEMP OUTPUT
        tempOut_im                      : out std_logic_vector(15 DOWNTO 0);      --TEMP OUTPUT
        tempValidOut                    : out std_logic
);
end SSB_TOP_v3;

architecture Behavioral of SSB_TOP_v3 is

--COMPONENTS
component HBF_DS8 is
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
end component;

component PSS_DETECTION_TOP is
PORT(   clk                             : IN    std_logic;
        reset                           : IN    std_logic;
        clk_enable                      : IN    std_logic;
        dataIn_re                       : IN    std_logic_vector(16-1 DOWNTO 0);    -- sfix16_En15
        dataIn_im                       : IN    std_logic_vector(16-1 DOWNTO 0);    -- sfix16_En15
        validIn                         : IN    std_logic;
        tempOut_re                      : out std_logic_vector(15 DOWNTO 0);      --TEMP OUTPUT
        tempOut_im                      : out std_logic_vector(15 DOWNTO 0);      --TEMP OUTPUT
        tempValidOut                    : out std_logic;
        dataOut_TH                      : out   std_logic_vector(24 downto 0);      --TEMP OUTPUT
        validOut_TH                     : out   std_logic;                          --TEMP OUTPUT
        psscellidOut                    : out std_logic_vector(1 downto 0); 
        psscellidValidOut               : out std_logic
);
end component;

component CP_correlation_CFO is
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
end component;

--component SSS_dec is
--Generic ( N_FFT                     : integer := 256;           -- FFT size (fixed to 256 for now)
--          W                         : integer := 16             -- Input word-length
--);
--Port (  clk                             : IN    std_logic; -- 245.76MHz 
--        reset                           : IN    std_logic;
--        dataIn_re                       : IN    std_logic_vector(16-1 DOWNTO 0);    -- sfix16_En15
--        dataIn_im                       : IN    std_logic_vector(16-1 DOWNTO 0);    -- sfix16_En15
--        validIn                         : IN    std_logic;
--        syncIn                          : IN    std_logic;
--        PSSseqIn                        : in    std_logic_vector(1 downto 0);
--        TH_in                           : in    std_logic_vector(24 downto 0);
--        pbchOut_re                      : out   std_logic_vector((N_FFT-16)*W-1 downto 0); -- {X[255] X[254] .. X[0]}
--        pbchOut_im                      : out   std_logic_vector((N_FFT-16)*W-1 downto 0); -- {X[255] X[254] .. X[0]}
--        pbchValidOut                    : out   std_logic;
--        ssscellidOut                    : out   std_logic_vector(8 downto 0);
--        ssscellidValid                  : out   std_logic
--);
--end component;

--SIGNALS
signal b0_ce_out : std_logic;
signal b0_dataOut_re1, b0_dataOut_re2 : std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
signal b0_dataOut_im1, b0_dataOut_im2 : std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
signal b0_validOut1, b0_validOut2 : std_logic;

signal b1_psscellidOut : std_logic_vector(1 downto 0); 
signal b1_psscellidValidOut : std_logic;
signal b1_Time_offset_out : std_logic_vector(1 downto 0);
signal b1_TH_out : std_logic_vector(24 downto 0);
signal b1_TH_ValidOut : std_logic;

--signal b1_FFTin_re, b1_FFTin_im : std_logic_vector(256*16-1 downto 0);
--signal b1_FFTin_valid : std_logic;
signal b1_SSSin_re, b1_SSSin_im : std_logic_vector(127*16-1 downto 0);
signal b1_SSSin_valid : std_logic;

signal b2_CFO_dataOut : std_logic_vector(18 downto 0);
signal b2_CFO_validOut : std_logic;
signal b2_CFO_dataOut_s : std_logic_vector(18 downto 0);
signal b2_CFO_validOut_s : std_logic;
--signal b2_dataOut_re : std_logic_vector(21 downto 0);
--signal b2_dataOut_im : std_logic_vector(21 downto 0);
signal b2_dataOut_re : std_logic_vector(39 downto 0);
signal b2_dataOut_im : std_logic_vector(39 downto 0);
signal b2_validOut : std_logic;
        
signal b3_END_SSB_SR : std_logic_vector(0 to 822-1) := (others => '0');
signal b3_END_SSB : std_logic;

signal b4_dataOut_re, b4_dataOut_im : std_logic_vector(16*2-1 downto 0);
signal b4_validOut : std_logic;
signal b4_angleIn : std_logic_vector(19-1 DOWNTO 0); -- s[19 15]   
signal b4_angleValidIn : std_logic;

signal b5_pbchOut_re : std_logic_vector((256-16)*16-1 downto 0); -- {X[255] X[254] .. X[0]}
signal b5_pbchOut_im : std_logic_vector((256-16)*16-1 downto 0); -- {X[255] X[254] .. X[0]}
signal b5_pbchValidOut : std_logic;
signal b5_ssscellidOut : std_logic_vector(8 downto 0);
signal b5_ssscellidValid : std_logic;


begin

-- Downsampling filters (x8) --> from 61.44MHz (F_clk = 61.44MHz -- SSR = 1) to 7.68MHz (SSR = 1)
-- Generated using HDL coder (Matlab)

b0: HBF_DS8
PORT MAP (  clk => clk,
            reset => reset,
            clk_enable => clk_enable,
            dataIn_re => dataIn_re,
            dataIn_im => dataIn_im,
            validIn => validIn,
            ce_out => b0_ce_out,
            dataOut_re => b0_dataOut_re1, --s[16 15]
            dataOut_im => b0_dataOut_im1, --s[16 15]
            validOut => b0_validOut1
);

--tempOut_re <= b0_dataOut_re;
--tempOut_im <= b0_dataOut_im;
--tempValidOut <= b0_validOut;

-- BW selection
process(clk)
begin
    if rising_edge(clk) then
        if BW_sel = '0' then
            b0_dataOut_re2 <= dataIn_re;
            b0_dataOut_im2 <= dataIn_im;
            b0_validOut2 <= validIn;
        else
            b0_dataOut_re2 <= b0_dataOut_re1;
            b0_dataOut_im2 <= b0_dataOut_im1;
            b0_validOut2 <= b0_validOut1;
        end if;
    end if;
end process;

-- PSS Detection block: PSS prefilter - Correlators - Dynamic Threshold - PSS sequence selection 
b1: PSS_DETECTION_TOP 
PORT MAP(   clk => clk,
            reset => reset,
            clk_enable => clk_enable,
            dataIn_re => b0_dataOut_re2, --s[16 15]
            dataIn_im => b0_dataOut_im2, --s[16 15]
            validIn => b0_validOut2,
            --tempOut_re => tempOut_re,
            --tempOut_im => tempOut_im,
            --tempValidOut => tempValidOut,
            dataOut_TH => b1_TH_out, --u[24 18]
            validOut_TH => b1_TH_ValidOut,
            psscellidOut => b1_psscellidOut, --u[2 0]
            psscellidValidOut => b1_psscellidValidOut
);

process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            psscellidOut <= (others => '1');
            psscellidValidOut <= '0';
            pssenergyOut <= (others => '0');
            pssenergyValidOut <= '0';
        else
            if b1_psscellidValidOut = '1' and b1_TH_ValidOut = '1' then
                psscellidOut <= b1_psscellidOut;
                psscellidValidOut <= '1';
                pssenergyOut <= b1_TH_out;
                pssenergyValidOut <= '1';
            else
                psscellidOut <= (others => '1');
                psscellidValidOut <= '0';
                pssenergyOut <= (others => '0');
                pssenergyValidOut <= '0';
            end if;
        end if;
    end if;
end process;

-- CFO estimation block
b2: CP_correlation_CFO 
port map(   clk => clk,
            reset => reset,
            dataIn_re => b0_dataOut_re2,
            dataIn_im => b0_dataOut_im2,
            validIn => b0_validOut2, --b0_validOut2,
--            dataIn_re => dataIn_re,
--            dataIn_im => dataIn_im,
--            validIn => validIn,
            --trigger_in_temp => triggerin_TEMP,
            --pss_in_temp => b1_psscellidValidOut,
            --sss_in_temp => b3_END_SSB,
            cordicValid => b3_END_SSB,
            dataOut_re => b2_dataOut_re,
            dataOut_im => b2_dataOut_im,
            validOut => b2_validOut,
            dataOut_CFO => b2_CFO_dataOut,
            validOut_CFO => b2_CFO_validOut
);

tempOut_re <= b2_dataOut_re(36-1 downto 36-16);
tempOut_im <= b2_dataOut_im(36-1 downto 36-16);
tempValidOut <= b2_validOut;

process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            b2_CFO_dataOut_s <= (others => '0');
            b2_CFO_validOut_s <= '0';   
        else
            if b3_END_SSB = '1' and b2_CFO_validOut = '1' then
                b2_CFO_dataOut_s <= b2_CFO_dataOut;
                b2_CFO_validOut_s <= '1';
            else
                b2_CFO_dataOut_s <= (others => '0');
                b2_CFO_validOut_s <= '0';
            end if;
        end if;
    end if;
end process;
--cfoOut <= b2_CFO_dataOut_s;
--cfoValidOut <= b2_CFO_validOut_s;
cfoOut <= b2_CFO_dataOut;
cfoValidOut <= b2_CFO_validOut;

-- Synchronize b1_Time_offset_out signal with the end of the 4 OFDM symbols that compose the SSB 
-- 3*274 - 63 clock cycles --> particular for the 30KHz SCS case. 274 is the OFDM symbol length and 63 is the latency of the PSS prefilter. 
process(clk)
begin
    if rising_edge(clk) then
        if b0_validOut2 = '1' then
        --if validIn = '1' then
            b3_END_SSB_SR <= b1_psscellidValidOut & b3_END_SSB_SR(0 to b3_END_SSB_SR'high-1);
        end if;
    end if;
end process;
-- Included 3 clock cycles of latency  (??? --> need to find the reason)
b3_END_SSB <= b3_END_SSB_SR(758-1-6) when BW_sel = '1' else b3_END_SSB_SR(758-1-18);

endssbOut <= b3_END_SSB;

--b5: SSS_dec
--Port map (  clk => clk, 
--            reset => reset,
--            dataIn_re => b0_dataOut_re,
--            dataIn_im  => b0_dataOut_im,
--            validIn => b0_validOut,
--            syncIn => b1_psscellidValidOut,
--            PSSseqIn => b1_psscellidOut,
--            TH_in => b1_TH_out,
--            pbchOut_re => b5_pbchOut_re,
--            pbchOut_im => b5_pbchOut_im,
--            pbchValidOut=> b5_pbchValidOut,
--            ssscellidOut => b5_ssscellidOut,
--            ssscellidValid => b5_ssscellidValid
--);

--pbchOut_re <= b5_pbchOut_re;
--pbchOut_im <= b5_pbchOut_im;
--pbchValidOut <= b5_pbchValidOut;
--ssscellidOut <= b5_ssscellidOut;
--ssscellidValidOut <= b5_ssscellidValid;

end Behavioral;

