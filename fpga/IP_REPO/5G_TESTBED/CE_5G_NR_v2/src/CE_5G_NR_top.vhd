
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.CE_5G_pkg.all;

entity CE_5G_NR_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        --
        dataIn_re : in std_logic_vector(2*16-1 downto 0); -- s[16 10] : {X_re[n+1],X_re[n]}
        dataIn_im : in std_logic_vector(2*16-1 downto 0); -- s[16 10] : {X_im[n+1],X_im[n]}
        validIn : in std_logic;
        triggerIn : in std_logic;
        --
        countSCIn : in std_logic_vector(11 downto 0);
        countOFDMIn : in std_logic_vector(4 downto 0);
        offsetIn : in std_logic_vector(3 downto 0);
        SCspacingIn : in std_logic_vector(4 downto 0);
        DMRSSymbolIn : in std_logic_vector(4 downto 0); -- 1'based
        NumSCp22div2 : in std_logic_vector(10 downto 0); -- (NumSC+22)/2
        Num_DMRS_inv : in std_logic_vector(15 downto 0); -- Inv of Number of DM_RS symbols s[16 15]
        scaling_nVar : in std_logic_vector(15 downto 0); -- s * (1/(numDMRS-1)) s[16 15]
        --
        triggerOut : out std_logic;
        --dataOut_re_LStemp : out std_logic_vector(2*16-1 downto 0); 
        --dataOut_im_LStemp : out std_logic_vector(2*16-1 downto 0); 
        --validOut_LStemp : out std_logic;
        dataOut_re : out std_logic_vector(2*16-1 downto 0);  -- s[16 10] : {X_re[n+1],X_re[n]}
        dataOut_im : out std_logic_vector(2*16-1 downto 0);  -- s[16 10] : {X_im[n+1],X_im[n]}
        validOut : out std_logic;
        lastOut : out std_logic;        
        nVarOut : out std_logic_vector(31 downto 0); -- s[32 31]
        nVarValidOut : out std_logic
);
end CE_5G_NR_top;

architecture Behavioral of CE_5G_NR_top is

component ComplexMult2 is
generic(AWIDTH : integer := 16;
        BWIDTH : integer := 16
);
port(   clk    : in  std_logic;
        ar, ai : in  std_logic_vector(AWIDTH - 1 downto 0);
        br, bi : in  std_logic_vector(BWIDTH - 1 downto 0);
        validIn : in std_logic;
        pr, pi : out std_logic_vector(AWIDTH + BWIDTH downto 0);
        validOut : out std_logic
);
end component;

component CE_INTERP_FILT IS
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
  );
END component;

component divScaling IS
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_divisor_tvalid : IN STD_LOGIC;
    s_axis_divisor_tready : OUT STD_LOGIC;
    s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    s_axis_dividend_tvalid : IN STD_LOGIC;
    s_axis_dividend_tready : OUT STD_LOGIC;
    s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END component;

component CE_nVar is
Port (  clk : in std_logic;
        rstn : in std_logic;
        --
        b2_FiltInterpIn_re : in std_logic_vector(2*16-1 downto 0); 
        b2_FiltInterpIn_im : in std_logic_vector(2*16-1 downto 0); 
        b1_validOut : in std_logic;
        b6_dataIn_re : in std_logic_vector(2*16-1 downto 0); 
        b6_dataIn_im : in std_logic_vector(2*16-1 downto 0); 
        b5_validOut : in std_logic;
        triggerIn : in std_logic;
        CE_end : in std_logic;
        --
        Num_DMRS_inv : in std_logic_vector(15 downto 0); -- Inv of Number of DM_RS symbols s[16 15]
        scaling_nVar : in std_logic_vector(15 downto 0); -- s * (1/(numDMRS-1)) s[16 15]
        offsetIn : in std_logic_vector(3 downto 0);
        SCspacingIn : in std_logic_vector(4 downto 0);
        --
        nVarOut : out std_logic_vector(31 downto 0);
        nVarValidOut : out std_logic
);
end component;

component ila_0_ce IS
PORT (
    clk : IN STD_LOGIC;
    probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END component;

constant ONE : unsigned(31 downto 0) := x"00000001";

signal b0_SCcount : integer range 0 to 31;
signal b0_enable : std_logic := '0';
signal b0_offset_count : integer range 0 to 31;
signal b0_validOut, b0_validOutAll, b0_validOutAll_2 : std_logic := '0';
signal b0_dataRe, b0_dataIm : std_logic_vector(2*16-1 downto 0); 
signal b0_SCcountTotal : integer range 0 to 2047;
signal b0_triggerOut : std_logic;

signal b1_dictInd_DMRS_1, b1_dictInd_DMRS_2 : integer range 0 to 3 := 0;
signal b1_dict_DMRS_re1, b1_dict_DMRS_im1 : std_logic_vector(15 downto 0) := (others => '0');
signal b1_dict_DMRS_re2, b1_dict_DMRS_im2 : std_logic_vector(15 downto 0) := (others => '0');
signal b1_dataInRe1, b1_dataInIm1 : std_logic_vector(15 downto 0) := (others => '0');
signal b1_dataInRe2, b1_dataInIm2 : std_logic_vector(15 downto 0) := (others => '0');
signal b1_LSest_re1, b1_LSest_re2, b1_LSest_im1, b1_LSest_im2 : std_logic_vector(32 downto 0);
signal b1_validIn, b1_validOut : std_logic;
signal b1_validInAll, b1_validInAll_r1, b1_validInAll_r2, b1_validInAll_r3 : std_logic := '0';
signal b1_validInAll_r4, b1_validInAll_r5, b1_validInAll_r6 : std_logic := '0';

signal b1_validInAll_2, b1_validInAll_r1_2, b1_validInAll_r2_2, b1_validInAll_r3_2 : std_logic := '0';
signal b1_validInAll_r4_2, b1_validInAll_r5_2, b1_validInAll_r6_2 : std_logic := '0';

signal b2_FiltInterpIn_re, b2_FiltInterpIn_im : std_logic_vector(31 downto 0):= (others => '0');
signal b2_FiltInterpIn_Scaling : std_logic_vector(31 downto 0) := (others => '0');
signal b2_FiltInterpOut_re, b2_FiltInterpOut_im, b2_FiltInterpOut_Scaling : std_logic_vector(63 downto 0) := (others => '0');
signal b2_validIn, b2_validOut : std_logic;

signal b3_CEOut_re, b3_CEOut_im, b3_CEOut_Scaling : std_logic_vector(31 downto 0):= (others => '0');
signal b3_countValid : integer range 0 to 2047;
signal b3_validOut : std_logic := '0';
signal b3_CEOut_Scaling1, b3_CEOut_Scaling2 : std_logic_vector(15 downto 0);
signal b3_CEend : std_logic;

signal b4_ready1, b4_ready2 : std_logic;
signal b4_dataOut1, b4_dataOut2 : std_logic_vector(31 downto 0);
signal b4_validOut : std_logic;
signal b4_invOut : std_logic_vector(15 downto 0);
type type_a37x32std is array(0 to 36) of std_logic_vector(31 downto 0);
type type_a37x1std is array(0 to 36) of std_logic;
signal b4_CEOut_SR_re, b4_CEOut_SR_im : type_a37x32std;
signal b4_CEOut_re, b4_CEOut_im : std_logic_vector(31 downto 0):= (others => '0');
signal b4_CEOut_Sca1, b4_CEOut_Sca2 : std_logic_vector(15 downto 0);
signal b4_CEendSR : type_a37x1std;
signal b4_CEend : std_logic;

signal b5_CE_Sca_Out_re1, b5_CE_Sca_Out_im1 : std_logic_vector(31 downto 0):= (others => '0');
signal b5_CE_Sca_Out_re2, b5_CE_Sca_Out_im2 : std_logic_vector(31 downto 0):= (others => '0');
signal b5_validOut : std_logic;
signal b5_CEend : std_logic;
signal b5_dataOut_re, b5_dataOut_im : std_logic_vector(31 downto 0);
  
signal b6_dataIn_re : std_logic_vector(2*16-1 downto 0); 
signal b6_dataIn_im : std_logic_vector(2*16-1 downto 0); 
signal b6_nVar : std_logic_vector(31 downto 0);
signal b6_nVarValid : std_logic;

begin

--Retain equally spaced DM_RS subcarriers from the corresponding OFDM symbol in the slot 
process(clk)
begin
    if rising_edge(clk) then
        b0_dataRe <= dataIn_re;
        b0_dataIm <= dataIn_im;
        if rstn = '0' then
            b0_SCcount <= 0;
            b0_offset_count <= 0;
            b0_validOut <= '0';
            b0_SCcountTotal <= 0;
            b0_validOutAll <= '0';
        else
            b0_validOut <= '0';
            b0_validOutAll <= '0';
            b0_validOutAll_2 <= '0';
            
            if countOFDMIn = DMRSSymbolIn then -- find for the OFDM symbol where the DM-RS symbols are located
                
                if validIn = '1' then
                    b0_validOutAll <= '1';
                end if;
            
                b0_SCcount <= to_integer(unsigned(SCspacingIn));
                if b0_offset_count = to_integer(unsigned(offsetIn)) then -- offset from the start of the ODFM symbol
                    b0_enable <= '1';
                else
                    b0_offset_count <= b0_offset_count + 1;
                end if;
            else
                b0_enable <= '0';
                b0_offset_count <= 0;
            end if;
            
            if countOFDMIn = std_logic_vector(unsigned(DMRSSymbolIn)+ONE(DMRSSymbolIn'high downto 0)) then -- for the transient of the interpolation filter
                if validIn = '1' then
                    b0_validOutAll_2 <= '1';
                end if;
            end if;
                        
            if b0_enable = '1' and validIn = '1' then
                --b0_validOutAll <= '1';
                if b0_SCcount = to_integer(unsigned(SCspacingIn)) then
                    b0_SCcount <= 0;
                    b0_validOut <= '1';
                    b0_SCcountTotal <= b0_SCcountTotal + 1;
                else
                    b0_SCcount <=  b0_SCcount + 1;
                end if;
            elsif b0_enable = '0' then
                b0_SCcountTotal <= 0;
                --b0_validOutAll <= '0';
            end if;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then 
        if rstn = '0' then
            b0_triggerOut <= '0';
        else
            if triggerIn = '1' then
                b0_triggerOut <= '1';
            elsif b5_validOut = '1' then
                b0_triggerOut <= '0';
            end if;
        end if;
    end if;
end process;

triggerOut <= b0_triggerOut and b5_validOut;
             
--validOut <= b0_validOut;
--dataOut_re <= b0_dataRe;
--dataOut_im <= b0_dataIm;

process(clk)
begin
    if rising_edge(clk) then
        if rstn = '0' then
            b1_dataInRe1 <= (others => '0');
            b1_dataInIm1 <= (others => '0');
            b1_dataInRe2 <= (others => '0');
            b1_dataInIm2 <= (others => '0');
        else
            b1_dictInd_DMRS_1 <= dictInd_DMRS(b0_SCcountTotal,0);
            b1_dictInd_DMRS_2 <= dictInd_DMRS(b0_SCcountTotal,1);
            
            if b0_validOut = '1' then
                b1_dict_DMRS_re1 <= dict_DMRS(b1_dictInd_DMRS_1,0);
                b1_dict_DMRS_im1 <= dict_DMRS(b1_dictInd_DMRS_1,1);
            else
                b1_dict_DMRS_re1 <= (others => '0');
                b1_dict_DMRS_im1 <= (others => '0');
            end if;
            
            b1_dataInRe1 <= b0_dataRe(15 downto 0);
            b1_dataInIm1 <= b0_dataIm(15 downto 0);
    
            if b0_validOut = '1' then
                b1_dict_DMRS_re2 <= dict_DMRS(b1_dictInd_DMRS_2,0);
                b1_dict_DMRS_im2 <= dict_DMRS(b1_dictInd_DMRS_2,1);
            else
                b1_dict_DMRS_re2 <= (others => '0');
                b1_dict_DMRS_im2 <= (others => '0');
            end if;
    
            b1_dataInRe2 <= b0_dataRe(31 downto 16);
            b1_dataInIm2 <= b0_dataIm(31 downto 16);
    
            b1_validIn <= b0_validOut;
            b1_validInAll <= b0_validOutAll;
            
            b1_validInAll_r1 <= b1_validInAll;
            b1_validInAll_r2 <= b1_validInAll_r1;
            b1_validInAll_r3 <= b1_validInAll_r2;
            b1_validInAll_r4 <= b1_validInAll_r3;
            b1_validInAll_r5 <= b1_validInAll_r4;
            b1_validInAll_r6 <= b1_validInAll_r5;
            
            b1_validInAll_2 <= b0_validOutAll_2;
            b1_validInAll_r1_2 <= b1_validInAll_2;
            b1_validInAll_r2_2 <= b1_validInAll_r1_2;
            b1_validInAll_r3_2 <= b1_validInAll_r2_2;
            b1_validInAll_r4_2 <= b1_validInAll_r3_2;
            b1_validInAll_r5_2 <= b1_validInAll_r4_2;
            b1_validInAll_r6_2 <= b1_validInAll_r5_2;
        end if;        
    end if;
end process;

compMult_1: ComplexMult2
port map(   clk => clk,
            ar => b1_dataInRe1,
            ai => b1_dataInIm1,
            br => b1_dict_DMRS_re1,
            bi => b1_dict_DMRS_im1,
            validIn => b1_validIn,
            pr => b1_LSest_re1,
            pi => b1_LSest_im1,
            validOut => b1_validOut
);

compMult_2: ComplexMult2
port map(   clk => clk,
            ar => b1_dataInRe2,
            ai => b1_dataInIm2,
            br => b1_dict_DMRS_re2,
            bi => b1_dict_DMRS_im2,
            validIn => b1_validIn,
            pr => b1_LSest_re2,
            pi => b1_LSest_im2,
            validOut => open
);

--validOut <= b1_validOut; --b1_validInAll_r6 or b1_validInAll_r6_2;
--dataOut_re <= b1_LSest_re2(30 downto 30-15) & b1_LSest_re1(30 downto 30-15);
--dataOut_im <= b1_LSest_im2(30 downto 30-15) & b1_LSest_im1(30 downto 30-15);

b2_FiltInterpIn_re <= b1_LSest_re2(30 downto 30-15) & b1_LSest_re1(30 downto 30-15);
b2_FiltInterpIn_im <= b1_LSest_im2(30 downto 30-15) & b1_LSest_im1(30 downto 30-15);

--dataOut_re_LStemp <= b2_FiltInterpIn_re;
--dataOut_im_LStemp <= b2_FiltInterpIn_im;
--validOut_LStemp <= b1_validOut;

b2_validIn <= b1_validInAll_r6 or b1_validInAll_r6_2;

InterpFilt_re: CE_INTERP_FILT 
PORT MAP(
    aclk => clk,
    s_axis_data_tvalid => b2_validIn,
    s_axis_data_tready => open,
    s_axis_data_tdata => b2_FiltInterpIn_re,
    m_axis_data_tvalid => b2_validOut,
    m_axis_data_tdata => b2_FiltInterpOut_re
);

InterpFilt_im: CE_INTERP_FILT 
PORT MAP(
    aclk => clk,
    s_axis_data_tvalid => b2_validIn,
    s_axis_data_tready => open,
    s_axis_data_tdata => b2_FiltInterpIn_im,
    m_axis_data_tvalid => open,
    m_axis_data_tdata => b2_FiltInterpOut_im
);

b2_FiltInterpIn_Scaling <= x"04000400" when b1_validOut = '1' else x"00000000";

InterpFilt_Scaling: CE_INTERP_FILT 
PORT MAP(
    aclk => clk,
    s_axis_data_tvalid => b2_validIn,
    s_axis_data_tready => open,
    s_axis_data_tdata => b2_FiltInterpIn_Scaling,
    m_axis_data_tvalid => open,
    m_axis_data_tdata => b2_FiltInterpOut_Scaling
);

----validOut <= b2_validOut;
----dataOut_re <= b2_FiltInterpOut_re(63-5 downto 63-15-5) & b2_FiltInterpOut_re(31-5 downto 31-15-5);
----dataOut_im <= b2_FiltInterpOut_im(63-5 downto 63-15-5) & b2_FiltInterpOut_im(31-5 downto 31-15-5);

--b3: counter for valid Channel Estimation Data
process(clk)
    variable Scaling1, Scaling2 : std_logic_vector(15 downto 0);
begin
    if rising_edge(clk) then
        if rstn = '0' or triggerIn = '1' then
            b3_countValid <= 0;
            b3_validOut <= '0';
        else
            b3_CEOut_re <= b2_FiltInterpOut_re(63-5 downto 63-15-5) & b2_FiltInterpOut_re(31-5 downto 31-15-5);
            b3_CEOut_im <= b2_FiltInterpOut_im(63-5 downto 63-15-5) & b2_FiltInterpOut_im(31-5 downto 31-15-5);
            if b2_FiltInterpOut_Scaling(63-5 downto 63-15-5) = x"0000" then
                Scaling2 := x"0001";
            else
                Scaling2 := b2_FiltInterpOut_Scaling(63-5 downto 63-15-5);
            end if;
            if b2_FiltInterpOut_Scaling(31-5 downto 31-15-5) = x"0000" then
                Scaling1 := x"0001";
            else
                Scaling1 := b2_FiltInterpOut_Scaling(31-5 downto 31-15-5);
            end if;
            b3_CEOut_Scaling <= Scaling2 & Scaling1;
            b3_validOut <= '0';
            b3_CEend <= '0';
            if b2_validOut = '1' then
                b3_countValid <= b3_countValid + 1;
                if b3_countValid > 10 and b3_countValid < to_integer(unsigned(NumSCp22div2)) then 
                    b3_validOut <= '1';
                end if;
                
                if b3_countValid = to_integer(unsigned(NumSCp22div2)) then
                    b3_CEend <= '1';
                end if;
            end if;
            
        end if;
    end if;
end process;

--validOut <= b3_validOut;
--dataOut_re <= b3_CEOut_Scaling;
--dataOut_im <= b3_CEOut_im;

b3_CEOut_Scaling2 <= b3_CEOut_Scaling(31 downto 16);
b3_CEOut_Scaling1 <= b3_CEOut_Scaling(15 downto 0);

b4_divScaling1: divScaling
PORT MAP(
    aclk => clk,
    s_axis_divisor_tvalid => b3_validOut,
    s_axis_divisor_tready => b4_ready1,
    s_axis_divisor_tdata => b3_CEOut_Scaling1,
    s_axis_dividend_tvalid => b3_validOut,
    s_axis_dividend_tready => b4_ready2,
    s_axis_dividend_tdata => x"0400",
    m_axis_dout_tvalid => b4_validOut,
    m_axis_dout_tdata => b4_dataOut1
);

b4_divScaling2: divScaling -- 37 clk cycles latency
PORT MAP(
    aclk => clk,
    s_axis_divisor_tvalid => b3_validOut,
    s_axis_divisor_tready => open,
    s_axis_divisor_tdata => b3_CEOut_Scaling2,
    s_axis_dividend_tvalid => b3_validOut,
    s_axis_dividend_tready => b4_ready2,
    s_axis_dividend_tdata => x"0400",
    m_axis_dout_tvalid => open,
    m_axis_dout_tdata => b4_dataOut2
);

process(clk)
begin
    if rising_edge(clk) then
        if rstn = '0' then
            for ii in 0 to 36 loop
                b4_CEOut_SR_re(ii) <= (others => '0');
                b4_CEOut_SR_im(ii) <= (others => '0');
                b4_CEendSR(ii) <= '0';
            end loop;
        else
            for ii in 0 to 35 loop
                b4_CEOut_SR_re(ii+1) <= b4_CEOut_SR_re(ii);
                b4_CEOut_SR_im(ii+1) <= b4_CEOut_SR_im(ii);
                b4_CEendSR(ii+1) <=  b4_CEendSR(ii);
            end loop;
            b4_CEOut_SR_re(0) <= b3_CEOut_re;
            b4_CEOut_SR_im(0) <= b3_CEOut_im;
            b4_CEendSR(0) <= b3_CEend;
        end if;
     end if;
 end process;
 
b4_CEOut_Sca1 <= b4_dataOut1(31-11 downto 16-11);
b4_CEOut_Sca2 <= b4_dataOut2(31-11 downto 16-11);
b4_CEOut_re <= b4_CEOut_SR_re(36);
b4_CEOut_im <= b4_CEOut_SR_im(36);
b4_CEend <= b4_CEendSR(36);
--validOut <= b4_validOut;
--dataOut_re <= b4_CEOut_re;
--dataOut_im <= b4_CEOut_Sca2 & b4_CEOut_Sca1;

--b5: scale CE subcarriers
process(clk)
begin
    if rising_edge(clk) then
        b5_CE_Sca_Out_re1 <= std_logic_vector(signed(b4_CEOut_re(15 downto 0)) * signed(b4_CEOut_Sca1));
        b5_CE_Sca_Out_re2 <= std_logic_vector(signed(b4_CEOut_re(31 downto 16)) * signed(b4_CEOut_Sca2));
        b5_CE_Sca_Out_im1 <= std_logic_vector(signed(b4_CEOut_im(15 downto 0)) * signed(b4_CEOut_Sca1));
        b5_CE_Sca_Out_im2 <= std_logic_vector(signed(b4_CEOut_im(31 downto 16)) * signed(b4_CEOut_Sca2));
        b5_validOut <= b4_validOut;
    end if;
end process;

b5_dataOut_re <= b5_CE_Sca_Out_re2(31-6 downto 16-6) & b5_CE_Sca_Out_re1(31-6 downto 16-6);
b5_dataOut_im <= b5_CE_Sca_Out_im2(31-6 downto 16-6) & b5_CE_Sca_Out_im1(31-6 downto 16-6);
b5_CEend <= b4_CEend;

validOut <= b5_validOut;
lastOut <= b5_CEend;
dataOut_re <= b5_dataOut_re;
dataOut_im <= b5_dataOut_im;


b6_dataIn_re <= b5_CE_Sca_Out_re2(31-6 downto 16-6) & b5_CE_Sca_Out_re1(31-6 downto 16-6);
b6_dataIn_im <= b5_CE_Sca_Out_im2(31-6 downto 16-6) & b5_CE_Sca_Out_im1(31-6 downto 16-6);

--ila_blk: ila_0_ce
--PORT MAP(
--    clk => clk,
--    probe0 => b5_dataOut_re,
--    probe1(0) => b5_validOut,
--    probe2(0) => b5_CEend,
--    probe3 => b6_nVar,
--    probe4(0) => b6_nVarValid
--);

b6: CE_nVar
Port Map (  clk => clk,
            rstn => rstn,
            --
            b2_FiltInterpIn_re => b2_FiltInterpIn_re,
            b2_FiltInterpIn_im => b2_FiltInterpIn_im,
            b1_validOut => b1_validOut,
            b6_dataIn_re => b6_dataIn_re,
            b6_dataIn_im => b6_dataIn_im,
            b5_validOut => b5_validOut,
            triggerIn => triggerIn,
            CE_end => b5_CEend,
            --
            Num_DMRS_inv => Num_DMRS_inv,
            scaling_nVar => scaling_nVar,
            offsetIn => offsetIn,
            SCspacingIn => SCspacingIn,
            --
            nVarOut => b6_nVar,
            nVarValidOut => b6_nVarValid
);

nVarOut <= b6_nVar;
nVarValidOut <= b6_nVarValid;

end Behavioral;
