
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.PTRS_5G_pkg.all;

entity PT_RS_5G_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        --
        dataIn_re : in std_logic_vector(2*16-1 downto 0); -- s[16 10] : {X_re[n+1],X_re[n]}
        dataIn_im : in std_logic_vector(2*16-1 downto 0); -- s[16 10] : {X_im[n+1],X_im[n]}
        validIn : in std_logic;
        triggerIn : in std_logic;
        --
        BW_MODE : in std_logic_vector(0 downto 0);
        offsetDMRSIn : in std_logic_vector(4 downto 0);
        DMRSSCspacingIn : in std_logic_vector(4 downto 0);
        DMRSSymbolIn : in std_logic_vector(4 downto 0); -- 1'based
        offsetPTRSIn : in std_logic_vector(4 downto 0);
        PTRSSCspacingIn : in std_logic_vector(4 downto 0);
        Even_PTRS : in std_logic;
        numOFDM : in std_logic_vector(4 downto 0);
        numSC : in std_logic_vector(11 downto 0);
        SSBSymbolIn1 : in std_logic_vector(4 downto 0); -- 1'based
        SSBSymbolIn2 : in std_logic_vector(4 downto 0); -- 1'based
        SSBSymbolIn3 : in std_logic_vector(4 downto 0); -- 1'based
        SSBSymbolIn4 : in std_logic_vector(4 downto 0); -- 1'based
        SSB_SCinit : in std_logic_vector(11 downto 0);
        SSB_SCend : in std_logic_vector(11 downto 0);
        --
        triggerOut : out std_logic;
        dataOut_re : out std_logic_vector(2*16-1 downto 0);  -- s[16 14] : {X_re[n+1],X_re[n]}
        dataOut_im : out std_logic_vector(2*16-1 downto 0);  -- s[16 14] : {X_im[n+1],X_im[n]}
        --validOut : out std_logic
        lastOut : out std_logic;
        validOut : out std_logic_vector(1 downto 0)
);
end PT_RS_5G_top;

architecture Behavioral of PT_RS_5G_top is

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

component CORDIC_rot2 is
Generic( ITER_NUM : integer range 1 to 10 := 10
);
Port (  clk                             : IN    std_logic;
        rstn                           : IN    std_logic;
        dataIn_re                       : in    std_logic_vector(39 downto 0);
        dataIn_im                       : in    std_logic_vector(39 downto 0);
        validIn                         : IN    std_logic;
        dataOut                         : out   std_logic_vector(18 downto 0); -- s[19 15]
        validOut                        : out   std_logic
);
end component;

component cordicSinCos IS
PORT (
    aclk : IN STD_LOGIC;
    s_axis_phase_tvalid : IN STD_LOGIC;
    s_axis_phase_tready : OUT STD_LOGIC;
    s_axis_phase_tdata : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END component;

component PTRS_dataFIFO IS
PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    wr_rst_busy : OUT STD_LOGIC;
    rd_rst_busy : OUT STD_LOGIC
);
END component;

constant ONE : unsigned(31 downto 0) := x"00000001";

type b9_st_type is (st_Idle, st_waitPhaseRot, st_SymReg, st_SymDMRS, st_SymSSB);

signal b0_state : b9_st_type;
signal b0_countOFDM : integer range 0 to 31;
signal b0_SCcountTotal : integer range 0 to 2047;
signal b0_countSCS_PTRS : integer range 0 to 31;
signal b0_valid_PTRS : std_logic;
signal b0_valid_SSB : std_logic;

--type b0_st_type is (st_idle,st_offset,st_count);
--signal b0_state : b0_st_type;
--signal b0_SCcount : integer range 0 to 63;
--signal b0_OFDMcountTotal : integer range 0 to 31;
--signal b0_SCcountTotal : integer range 0 to 2047;
--signal b0_offset_count : integer range 0 to 31;

signal b0_valid, b0_validOut, b0_validOutAll, b0_validOutAll_r, b0_validOutAll_r2 : std_logic := '0';
signal b0_dataRe, b0_dataIm : std_logic_vector(16-1 downto 0); 
signal b0_dataRe_r, b0_dataIm_r : std_logic_vector(16-1 downto 0); 
signal b0_dataRe_r2, b0_dataIm_r2 : std_logic_vector(16-1 downto 0); 
signal b0_OFDMSymEnd : std_logic;

signal b1_dataFIFOin, b1_dataFIFOin_r : std_logic_vector(64-1 downto 0); 
signal b1_validFIFOin, b1_validFIFOin_r : std_logic; 
signal b1_validOut, b1_validOut_r, b1_validOutAll : std_logic := '0';
signal b1_dataRe, b1_dataIm : std_logic_vector(16-1 downto 0); 
signal b1_dataRe_r, b1_dataIm_r : std_logic_vector(16-1 downto 0); 
signal b1_OFDMcountTotal : integer range 0 to 31;
signal b1_SCcountTotal : integer range 0 to 2047;

signal b2_dictInd_DMRS : integer range 0 to 3 := 0;
signal b2_dict_DMRS_re, b2_dict_DMRS_im : std_logic_vector(15 downto 0) := (others => '0');
signal b2_count : integer range 0 to 1023 := 0;

signal b3_LSest_re, b3_LSest_im : std_logic_vector(32 downto 0)  := (others => '0');
signal b3_validOut : std_logic := '0';
signal b3_LSest_re2, b3_LSest_im2 : std_logic_vector(31 downto 0)  := (others => '0');
signal b3_validOut2, b3_validOutAll : std_logic := '0';
signal b3_validAll_SR : std_logic_vector(7+11+51 downto 0) := (others => '0');
signal b3_OFDMSymEnd_SR : std_logic_vector(7+11+51+3 downto 0) := (others => '0');

signal b4_FiltInterpOut_re, b4_FiltInterpOut_im, b4_FiltInterpOut_Scaling : std_logic_vector(63 downto 0) := (others => '0');
signal b4_validOut, b4_validOut2 : std_logic := '0';
signal b4_FiltInterpIn_Scaling : std_logic_vector(31 downto 0) := (others => '0');
signal b4_OFDMSymEnd : std_logic;

signal b5_acc_re1, b5_acc_re2, b5_acc_im1, b5_acc_im2 : signed(16+10-1 downto 0);
signal b5_acc_reOut, b5_acc_imOut : signed(16+10-1 downto 0);
signal b5_validOut : std_logic := '0';
signal b5_OFDMcount : integer range 0 to 31 := 0;

signal b6_dataInRe, b6_dataInIm : std_logic_vector(39 downto 0) := (others => '0');
signal b6_dataOut : std_logic_vector(18 downto 0) := (others => '0');
signal b6_validOut : std_logic := '0';

signal b7_ready : std_logic;
signal b7_dataIn : std_logic_vector(23 downto 0);
signal b7_dataOut : std_logic_vector(31 downto 0);
signal b7_dataOutRe, b7_dataOutIm : std_logic_vector(15 downto 0);
signal b7_validOut : std_logic;

signal b8_full, b8_empty, b8_rd_busy, b8_wr_busy : std_logic;
signal b8_dataFIFOout : std_logic_vector(63 downto 0);

signal b9_state : b9_st_type;
signal b9_rdFIFO : std_logic;
signal b9_PhaseRotVals : std_logic_vector(31 downto 0);
signal b9_countOFDM : integer range 0 to 31;
signal b9_SCcountTotal : integer range 0 to 2047;
signal b9_countSCS_DMRS : integer range 0 to 31;
signal b9_countSCS_PTRS : integer range 0 to 31;
signal b9_valid_DMRS : std_logic_vector(1 downto 0);
signal b9_valid_PTRS : std_logic_vector(1 downto 0);
signal b9_valid_SSB : std_logic_vector(1 downto 0);
signal b9_valid : std_logic_vector(1 downto 0);
signal b9_last : std_logic;

signal b10_dataIn_re1, b10_dataIn_re2, b10_dataIn_im1, b10_dataIn_im2 : std_logic_vector(15 downto 0);
signal b10_dataOut_re1, b10_dataOut_re2, b10_dataOut_im1, b10_dataOut_im2 : std_logic_vector(32 downto 0);
signal b10_rotVal_re, b10_rotVal_im : std_logic_vector(15 downto 0);
signal b10_validOut : std_logic_vector(1 downto 0);
signal b10_last, b10_last_r1, b10_last_r2, b10_last_r3, b10_last_r4, b10_last_r5 : std_logic;

signal b11_triggerOut : std_logic;

begin

--Retain PT_RS subcarriers from the OFDM symbols in the slot 
process(clk)
begin
    if rising_edge(clk) then
        if Even_PTRS = '0' then
            b0_dataRe <= dataIn_re(15 downto 0);
            b0_dataIm <= dataIn_im(15 downto 0);
        else
            b0_dataRe <= dataIn_re(31 downto 16);
            b0_dataIm <= dataIn_im(31 downto 16);
        end if;
        b0_valid <= validIn;
        b0_dataRe_r <= b0_dataRe;
        b0_dataIm_r <= b0_dataIm;
        b0_dataRe_r2 <= b0_dataRe_r;
        b0_dataIm_r2 <= b0_dataIm_r;
        b0_validOut <= '0';
        b0_validOutAll <= validIn;
        b0_validOutAll_r <= b0_validOutAll;
        b0_validOutAll_r2 <= b0_validOutAll_r;
        b0_OFDMSymEnd <= '0';

        if rstn = '0' then
            b0_state <= st_idle;
            b0_countOFDM <= 0;
            b0_countSCS_PTRS <= 0;
            b0_validOut <= '0';
            b0_valid_PTRS <= '0';
            b0_valid_SSB <= '0';
        else
            if b0_countOFDM = to_integer(unsigned(DMRSSymbolIn)) then
                b0_validOut <= '0';
            elsif b0_countOFDM = to_integer(unsigned(SSBSymbolIn1)) or
                  b0_countOFDM = to_integer(unsigned(SSBSymbolIn2)) or
                  b0_countOFDM = to_integer(unsigned(SSBSymbolIn3)) or
                  b0_countOFDM = to_integer(unsigned(SSBSymbolIn4)) then
                b0_validOut <= b0_valid_PTRS and b0_valid_SSB;
            else
                b0_validOut <= b0_valid_PTRS;
            end if;
            
            case b0_state is
                when st_Idle => 
                    b0_valid_PTRS <= '0';
                    b0_valid_SSB <= '0';
                    b0_countOFDM <= 0;
                    b0_countSCS_PTRS <= to_integer(unsigned(offsetPTRSIn));
                    if triggerIn = '1' then
                        b0_state <= st_SymReg;
                        b0_countOFDM <= b0_countOFDM + 1; 
                    end if;
                when st_waitPhaseRot => 
                    b0_valid_PTRS <= '0';
                    b0_valid_SSB <= '0';
                    if b0_countOFDM = to_integer(unsigned(numOFDM)) then
                        b0_state <= st_Idle;
                    else
                        b0_countOFDM <= b0_countOFDM + 1; 
                        b0_countSCS_PTRS <= to_integer(unsigned(offsetPTRSIn));
                        b0_state <= st_SymReg;
                    end if;
                when st_SymReg => 
                    if b0_SCcountTotal = to_integer(unsigned(numSC)) then  
                        b0_valid_PTRS <= '0';
                        b0_valid_SSB <= '0';
                        b0_SCcountTotal <= 0;
                        b0_OFDMSymEnd <= '1';
                        b0_state <= st_waitPhaseRot;
                    elsif b0_valid = '1' then
                        b0_SCcountTotal <= b0_SCcountTotal + 1;
                        --PT-RS Valid
                        if b0_countSCS_PTRS = to_integer(unsigned(PTRSSCspacingIn)) then
                            b0_valid_PTRS <= '1';
                            b0_countSCS_PTRS <= 0;
                        else
                            b0_valid_PTRS <= '0';
                            b0_countSCS_PTRS <= b0_countSCS_PTRS + 1;
                        end if;
                        --SSB Valid
                        if b0_SCcountTotal < to_integer(unsigned(SSB_SCinit)) or b0_SCcountTotal > to_integer(unsigned(SSB_SCend)) then
                            b0_valid_SSB <= '1';
                        else
                            b0_valid_SSB <= '0';
                        end if;
                    end if;
                when others => 
                    b0_valid_PTRS <= '0';
                    b0_valid_SSB <= '0';
                    b0_state <= st_idle;
            end case;
        end if;
    end if;
end process; 

process(clk)
begin
    if rising_edge(clk) then 
        b1_dataFIFOin <= dataIn_im & dataIn_re;
        b1_validFIFOin <= validIn;
        b1_dataFIFOin_r <= b1_dataFIFOin;
        b1_validFIFOin_r <= b1_validFIFOin;
        b1_validOutAll <= b0_validOutAll_r2;
        b1_validOut_r <= b1_validOut;
        b1_dataRe_r <= b1_dataRe;
        b1_dataIm_r <= b1_dataIm;

        if b0_validOut = '1' then
            b1_dataRe <= b0_dataRe_r2;
            b1_dataIm <= b0_dataIm_r2;
            b1_validOut <= '1';
        else
            b1_validOut <= '0';
            b1_dataRe <= (others => '0');
            b1_dataIm <= (others => '0');
        end if;

    end if;
end process;

--dataOut_re <= x"0000" & b1_dataRe;
--dataOut_im <= x"0000" & b1_dataIm;
--validOut <= b1_validOutAll;

--b2: extract PT-RS symbols from memory
process(clk)
begin
    if rising_edge(clk) then
        b2_dictInd_DMRS <= dictInd_DMRS(b2_count,to_integer(unsigned(BW_MODE)));
        b2_dict_DMRS_re <= dict_DMRS(b2_dictInd_DMRS,0);
        b2_dict_DMRS_im <= dict_DMRS(b2_dictInd_DMRS,1);
        if rstn = '0' or triggerIn = '1' then
            b2_count <= 0;
        --elsif b1_validOut_r = '1' then
        elsif b1_validOut = '1' then
            b2_count <= b2_count + 1;
        end if;        
    end if;
end process;

--dataOut_re <= std_logic_vector(resize(signed(b2_dict_DMRS_re),dataOut_re'length));
--dataOut_im <= std_logic_vector(resize(signed(b2_dict_DMRS_im),dataOut_im'length));
--validOut <= b1_validOut_r;

b3_compMult: ComplexMult2
port map(   clk => clk,
            ar => b1_dataRe_r,
            ai => b1_dataIm_r,
            br => b2_dict_DMRS_re,
            bi => b2_dict_DMRS_im,
            validIn => b1_validOut_r,
            pr => b3_LSest_re,
            pi => b3_LSest_im,
            validOut => b3_validOut
);

--validOut <= b3_validOut; 
--dataOut_re <= std_logic_vector(resize(signed(b3_LSest_re(30 downto 30-15)),dataOut_re'length));
--dataOut_im <= std_logic_vector(resize(signed(b3_LSest_im(30 downto 30-15)),dataOut_re'length));

process(clk)
begin
    if rising_edge(clk) then
        b3_validOut2 <= b3_validOut;
        b3_validAll_SR <= b3_validAll_SR(b3_validAll_SR'high-1 downto 0) & b1_validOutAll;
        b3_OFDMSymEnd_SR <= b3_OFDMSymEnd_SR(b3_OFDMSymEnd_SR'high-1 downto 0) & b0_OFDMSymEnd;
        if Even_PTRS = '0' then
            b3_LSest_re2 <= x"0000" & b3_LSest_re(30 downto 30-15);
            b3_LSest_im2 <=  x"0000" & b3_LSest_im(30 downto 30-15);
        else
            b3_LSest_re2 <= b3_LSest_re(30 downto 30-15) & x"0000";
            b3_LSest_im2 <= b3_LSest_im(30 downto 30-15) & x"0000";
        end if;
    end if;
end process;

b3_validOutAll <= b3_validAll_SR(7) or b3_validAll_SR(7+11);

InterpFilt_re: CE_INTERP_FILT 
PORT MAP(
    aclk => clk,
    s_axis_data_tvalid => b3_validOutAll,
    s_axis_data_tready => open,
    s_axis_data_tdata => b3_LSest_re2,
    m_axis_data_tvalid => b4_validOut,
    m_axis_data_tdata => b4_FiltInterpOut_re
);

InterpFilt_im: CE_INTERP_FILT 
PORT MAP(
    aclk => clk,
    s_axis_data_tvalid => b3_validOutAll,
    s_axis_data_tready => open,
    s_axis_data_tdata => b3_LSest_im2,
    m_axis_data_tvalid => open,
    m_axis_data_tdata => b4_FiltInterpOut_im
);

b4_validOut2 <= b3_validAll_SR(b3_validAll_SR'high);
b4_OFDMSymEnd <= b3_OFDMSymEnd_SR(b3_OFDMSymEnd_SR'high);

--validOut <= b3_validAll_SR(b3_validAll_SR'high); --b4_validOut;
--dataOut_re <= b4_FiltInterpOut_re(63-5 downto 63-15-5) & b4_FiltInterpOut_re(31-5 downto 31-15-5); --s[16 12]
--dataOut_im <= b4_FiltInterpOut_im(63-5 downto 63-15-5) & b4_FiltInterpOut_im(31-5 downto 31-15-5); --s[16 12]

--b5: acc over each OFDM symbol
process(clk)
begin
    if rising_edge(clk) then
        b5_validOut <= '0';
        if rstn = '0' or triggerIn = '1' then
            b5_OFDMcount <= 1;
            b5_acc_re1 <= (others => '0');
            b5_acc_re2 <= (others => '0');
            b5_acc_im1 <= (others => '0');
            b5_acc_im2 <= (others => '0');
            b5_acc_reOut <= (others => '0');
            b5_acc_imOut <= (others => '0');
        elsif b4_OFDMSymEnd = '1' then
            b5_OFDMcount <= b5_OFDMcount + 1;
            b5_acc_reOut <= b5_acc_re1 + b5_acc_re2;
            b5_acc_imOut <= b5_acc_im1 + b5_acc_im2;
            b5_validOut <= '1';
            if b5_OFDMcount /= to_integer(unsigned(DMRSSymbolIn))-1 then
                b5_acc_re1 <= (others => '0');
                b5_acc_re2 <= (others => '0');
                b5_acc_im1 <= (others => '0');
                b5_acc_im2 <= (others => '0');
            end if;
        elsif b4_validOut2 = '1' then
            b5_acc_re1 <= b5_acc_re1 + signed(b4_FiltInterpOut_re(31-5 downto 31-15-5));
            b5_acc_re2 <= b5_acc_re2 + signed(b4_FiltInterpOut_re(63-5 downto 63-15-5));
            b5_acc_im1 <= b5_acc_im1 + signed(b4_FiltInterpOut_im(31-5 downto 31-15-5));
            b5_acc_im2 <= b5_acc_im2 + signed(b4_FiltInterpOut_im(63-5 downto 63-15-5));
        end if;
    end if;
end process;

b6_dataInRe <= std_logic_vector(resize(b5_acc_reOut,40));
b6_dataInIm <= std_logic_vector(resize(b5_acc_imOut,40));

b6: CORDIC_rot2
Port Map(   clk => clk,
            rstn => rstn,
            dataIn_re => b6_dataInRe,
            dataIn_im => b6_dataInIm,
            validIn => b5_validOut,
            dataOut => b6_dataOut, -- s[19 15]
            validOut => b6_validOut
);

b7_dataIn <= std_logic_vector(resize(signed(b6_dataOut & '0'),b7_dataIn'length));

--b7: cosine / sine estimation for phase de-rotation
b7: cordicSinCos
PORT MAP(
    aclk => clk,
    s_axis_phase_tvalid => b6_validOut,
    s_axis_phase_tready => b7_ready,
    s_axis_phase_tdata => b7_dataIn,
    m_axis_dout_tvalid => b7_validOut,
    m_axis_dout_tdata => b7_dataOut
);

b7_dataOutRe <= b7_dataOut(15 downto 0); --s[16 14]
b7_dataOutIm <= b7_dataOut(31 downto 16); --s[16 14]

b8: PTRS_dataFIFO
PORT MAP(
    clk => clk,
    srst => triggerIn,
    din => b1_dataFIFOin_r,
    wr_en => b1_validFIFOin_r,
    rd_en => b9_rdFIFO,
    dout => b8_dataFIFOout,
    full => b8_full,
    empty => b8_empty,
    wr_rst_busy => b8_rd_busy,
    rd_rst_busy => b8_wr_busy
);

--b9: state machine to perform data de-rotation and pdsch selection
process(clk)
begin
    if rising_edge(clk) then
        if rstn = '0' then
            b9_state <= st_idle;
            b9_countOFDM <= 0;
            b9_countSCS_DMRS <= 0;
            b9_countSCS_PTRS <= 0;
            b9_rdFIFO <= '0';
            b9_valid <= "00";
            b9_valid_DMRS <= "00";
            b9_valid_PTRS <= "00";
            b9_valid_SSB <= "00";
            b9_PhaseRotVals <= (others => '0');
            b9_last <= '0';
        else
            if b9_countOFDM = to_integer(unsigned(DMRSSymbolIn)) then
                b9_valid <= b9_valid_DMRS;
            elsif b9_countOFDM = to_integer(unsigned(SSBSymbolIn1)) or
                              b9_countOFDM = to_integer(unsigned(SSBSymbolIn2)) or
                              b9_countOFDM = to_integer(unsigned(SSBSymbolIn3)) or
                              b9_countOFDM = to_integer(unsigned(SSBSymbolIn4)) then
                b9_valid <= b9_valid_PTRS and b9_valid_SSB;
            else
                b9_valid <= b9_valid_PTRS;
            end if;
            b9_last <= '0';
            case b9_state is
                when st_Idle => 
                    b9_valid_DMRS <= "00";
                    b9_valid_PTRS <= "00";
                    b9_valid_SSB <= "00";
                    b9_PhaseRotVals <= (others => '0');
                    b9_rdFIFO <= '0';
                    b9_countOFDM <= 0;
                    b9_countSCS_DMRS <= 0;
                    b9_countSCS_PTRS <= 0;
                    if triggerIn = '1' then
                        b9_state <= st_waitPhaseRot;
                    end if;
                when st_waitPhaseRot => 
                    b9_valid_DMRS <= "00";
                    b9_valid_PTRS <= "00";
                    b9_valid_SSB <= "00";
                    b9_rdFIFO <= '0';
                    if b9_countOFDM = to_integer(unsigned(numOFDM)) then
                        b9_state <= st_Idle;
                        b9_last <= '1';
                    elsif b7_validOut = '1' then
                        b9_PhaseRotVals <= b7_dataOut;
                        b9_countOFDM <= b9_countOFDM + 1; 
                        b9_countSCS_DMRS <= to_integer(unsigned(offsetDMRSIn));
                        b9_countSCS_PTRS <= to_integer(unsigned(offsetPTRSIn));
                        b9_state <= st_SymReg;
                    end if;
                when st_SymReg => 
                    if b9_SCcountTotal = to_integer(unsigned(numSC)) then  
                        b9_valid_DMRS <= "00";
                        b9_valid_PTRS <= "00";
                        b9_valid_SSB <= "00";
                        b9_rdFIFO <= '0';
                        b9_SCcountTotal <= 0;
                        b9_state <= st_waitPhaseRot;
                    else
                        b9_rdFIFO <= '1';
                        b9_SCcountTotal <= b9_SCcountTotal + 1;
                        --PT-RS Valid
                        if b9_countSCS_PTRS = to_integer(unsigned(PTRSSCspacingIn)) then
                            if Even_PTRS = '0' then
                                b9_valid_PTRS <= "10";
                            else
                                b9_valid_PTRS <= "01";
                            end if;
                            b9_countSCS_PTRS <= 0;
                        else
                            b9_valid_PTRS <= "11";
                            b9_countSCS_PTRS <= b9_countSCS_PTRS + 1;
                        end if;
                        --DM-RS Valid
                        if b9_countSCS_DMRS = to_integer(unsigned(DMRSSCspacingIn)) then
                            b9_valid_DMRS <= "00";
                            b9_countSCS_DMRS <= 0;
                        else
                            b9_valid_DMRS <= "11";
                            b9_countSCS_DMRS <= b9_countSCS_DMRS + 1;
                        end if;
                        --SSB Valid
                        if b9_SCcountTotal < to_integer(unsigned(SSB_SCinit)) or b9_SCcountTotal > to_integer(unsigned(SSB_SCend)) then
                            b9_valid_SSB <= "11";
                        else
                            b9_valid_SSB <= "00";
                        end if;
                    end if;
                when others => 
                    b9_valid_DMRS <= "00";
                    b9_valid_PTRS <= "00";
                    b9_valid_SSB <= "00";
                    b9_state <= st_idle;
            end case;
        end if;
    end if;
end process; 

--validOut <= b9_valid; 
--process(clk)
--begin
--    if rising_edge(clk) then
--        dataOut_re <= b8_dataFIFOout(31 downto 0); --s[16 12]
--        dataOut_im <= b8_dataFIFOout(63 downto 32); --s[16 12]
--    end if;
--end process;

process(clk)
begin
    if rising_edge(clk) then
        b10_dataIn_re1 <= b8_dataFIFOout(15 downto 0);
        b10_dataIn_re2 <= b8_dataFIFOout(31 downto 16);
        b10_dataIn_im1 <= b8_dataFIFOout(32+15 downto 32+0);
        b10_dataIn_im2 <= b8_dataFIFOout(32+31 downto 32+16);
    end if;
end process;
b10_rotVal_re <= b9_PhaseRotVals(15 downto 0);
b10_rotVal_im <= std_logic_vector(- signed(b9_PhaseRotVals(31 downto 16)));

b10_compMult1: ComplexMult2
port map(   clk => clk,
            ar => b10_dataIn_re1,
            ai => b10_dataIn_im1,
            br => b10_rotVal_re,
            bi => b10_rotVal_im,
            validIn => b9_valid(0),
            pr => b10_dataOut_re1,
            pi => b10_dataOut_im1,
            validOut => b10_validOut(0)
);

b10_compMult2: ComplexMult2
port map(   clk => clk,
            ar => b10_dataIn_re2,
            ai => b10_dataIn_im2,
            br => b10_rotVal_re,
            bi => b10_rotVal_im,
            validIn => b9_valid(1),
            pr => b10_dataOut_re2,
            pi => b10_dataOut_im2,
            validOut => b10_validOut(1)
);

--tlast latency compensation
process(clk) 
begin
    if rising_edge(clk) then
        b10_last <= b9_last;
        b10_last_r1 <= b10_last;
        b10_last_r2 <= b10_last_r1; 
        b10_last_r3 <= b10_last_r2;
        b10_last_r4 <= b10_last_r3;
    end if;
end process;

--b11: triggerOut generation
process(clk)
begin
    if rising_edge(clk) then 
        if rstn = '0' then
            b11_triggerOut <= '0';
        else
            if triggerIn = '1' then
                b11_triggerOut <= '1';
            elsif b10_validOut /= "00" then
                b11_triggerOut <= '0';
            end if;
        end if;
    end if;
end process;

triggerOut <= b11_triggerOut and (b10_validOut(1) or b10_validOut(0)) ;

validOut <= b10_validOut; 
dataOut_re <= b10_dataOut_re2(32-5 downto 17-5) & b10_dataOut_re1(32-5 downto 17-5); --s[16 12]
dataOut_im <= b10_dataOut_im2(32-5 downto 17-5) & b10_dataOut_im1(32-5 downto 17-5); --s[16 12]
lastOut <= b10_last_r4;

end Behavioral;
