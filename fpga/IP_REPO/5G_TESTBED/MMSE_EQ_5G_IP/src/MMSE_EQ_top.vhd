----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2022 07:13:28 PM
-- Design Name: 
-- Module Name: MMSE_EQ_top - Behavioral
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

entity MMSE_EQ_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        dataIn_Re : in std_logic_vector(31 downto 0); -- s[16 10]
        dataIn_Im : in std_logic_vector(31 downto 0); -- s[16 10]
        dataIn_Valid : in std_logic;
        triggerIn : in std_logic;
        CE_In_re : in std_logic_vector(31 downto 0); -- s[16 10]
        CE_In_im : in std_logic_vector(31 downto 0); -- s[16 10]
        CE_In_Valid : in std_logic;
        CE_triggerIn : in std_logic;
        nVar_In : in std_logic_vector(31 downto 0); -- s[32 31]
        nVar_In_Valid : in std_logic;
        triggerOut : out std_logic;
        --
        numSC : in std_logic_vector(11 downto 0);
        numOFDMm1 : in std_logic_vector(4 downto 0);
        --
        dataOut_Re : out std_logic_vector(31 downto 0); -- s[16 12]
        dataOut_Im : out std_logic_vector(31 downto 0); -- s[16 12]
        dataOut_Last : out std_logic;
        dataOut_Valid : out std_logic
);
end MMSE_EQ_top;

architecture Behavioral of MMSE_EQ_top is

component CE_FIFO_IN IS
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    wr_rst_busy : OUT STD_LOGIC;
    rd_rst_busy : OUT STD_LOGIC
  );
END component;

component dataRAM is
port(   clka : in std_logic;
        ena : in std_logic;
        wea : in std_logic;
        addra : in std_logic_vector(12 downto 0);
        dina : in std_logic_vector(63 downto 0);
        clkb : in std_logic;
        enb : in std_logic;
        addrb : in std_logic_vector(12 downto 0);
        doutb : out std_logic_vector(63 downto 0)
);
end component;

component FIFO_rxStatus is
port(   clk : in std_logic;
        srst : in std_logic;
        din : in std_logic_vector(0 downto 0);
        wr_en : in std_logic;
        rd_en : in std_logic;
        dout : out std_logic_vector(0 downto 0);
        full : out std_logic;
        empty : out std_logic;
        wr_rst_busy : out std_logic;
        rd_rst_busy : out std_logic
);
end component;

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

component MMSEdivider IS
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_divisor_tvalid : IN STD_LOGIC;
    s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    s_axis_dividend_tvalid : IN STD_LOGIC;
    s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END component;

signal rst : std_logic;

signal b0_rd_en : std_logic;
signal b0_wr_en : std_logic;
signal b0_MUX_in_FIFO : std_logic;
signal b0_CE_In_Re, b0_CE_In_Im : std_logic_vector(31 downto 0);
signal b0_CE_Out_Re, b0_CE_Out_Im : std_logic_vector(31 downto 0);
signal b0_full_re, b0_empty_re : std_logic;
signal b0_rd_FIFO : std_logic;
signal b0_lat_counter : integer  range 0 to 63;

signal b1_Hconj_re1, b1_Hconj_re2, b1_Hconj_im1, b1_Hconj_im2 : signed(15 downto 0);
signal b1_Hconj_re1_r, b1_Hconj_re2_r, b1_Hconj_im1_r, b1_Hconj_im2_r : std_logic_vector(15 downto 0);
signal b1_Hsq_re1, b1_Hsq_re2, b1_Hsq_im1, b1_Hsq_im2 : signed(31 downto 0);
signal b1_Habs_1, b1_Habs_2 : signed(31 downto 0);
signal b1_valid, b1_valid_r, b1_valid_r2, b1_valid_r3 : std_logic := '0';
signal b1_nVar : signed(31 downto 0) := (others => '0');
signal b1_csi_1, b1_csi_2 : signed(31 downto 0);
signal b1_csi_1_r, b1_csi_2_r : std_logic_vector(15 downto 0);

type b2_st_type is (ST_idle, ST_CE_write, ST_read, ST_waitSymbols);
signal b2_state : b2_st_type;
signal b2_SC_count, b2_SC_count_r : integer range 0 to 2047;
signal b2_countOFDMSym : integer range 0 to 31;
signal b2_addRd : std_logic_vector(12 downto 0);
signal b2_countOFDMSymRed : std_logic_vector(2 downto 0); 
signal b2_last, b2_last_r : std_logic := '0';

type b3_st_type is (ST_idle, ST_dataWr, ST_symbolEnd);
signal b3_state : b3_st_type;
signal b3_countSC, b3_countSC_r : integer range 0 to 2047;
signal b3_countOFDMSym : integer range 0 to 31;
signal b3_wrEn, b3_fifoWr, b3_fifoRst : std_logic;
signal b3_dataIn : std_logic_vector(63 downto 0);
signal b3_addrWr : std_logic_vector(12 downto 0);
signal b3_dataOut : std_logic_vector(63 downto 0);
signal b3_countOFDMSymRed : std_logic_vector(2 downto 0);
signal b3_dataReady_n : std_logic;
signal b3_dataOut_re1, b3_dataOut_re2, b3_dataOut_im1, b3_dataOut_im2 : std_logic_vector(15 downto 0);

signal b4_dataOut_re1, b4_dataOut_re2, b4_dataOut_im1, b4_dataOut_im2 : std_logic_vector(32 downto 0);
signal b4_dataOutRed_re1, b4_dataOutRed_re2, b4_dataOutRed_im1, b4_dataOutRed_im2 : std_logic_vector(15 downto 0);
signal b4_validOut : std_logic;
type type_a31x16std is array (0 to 30) of std_logic_vector(15 downto 0);
signal b4_dataSR_re1, b4_dataSR_re2, b4_dataSR_im1, b4_dataSR_im2 : type_a31x16std;
signal b4_last_SR : std_logic_vector(37 downto 0) := (others => '0');
signal b4_last : std_logic;

signal b5_invCSI_1, b5_invCSI_2 : std_logic_vector(31 downto 0);
signal b5_validOut : std_logic;

signal b6_dataIn_re1, b6_dataIn_re2, b6_dataIn_im1, b6_dataIn_im2 : std_logic_vector(15 downto 0); 
signal b6_invCSIIn_1, b6_invCSIIn_2 : std_logic_vector(15 downto 0);
signal b6_dataOut_re1, b6_dataOut_re2, b6_dataOut_im1, b6_dataOut_im2 : std_logic_vector(31 downto 0); 
signal b6_validOut : std_logic;
signal b6_dataOut_re_s : std_logic_vector(31 downto 0);

type b7_st_type is (ST_idle, ST_waitValid);
signal b7_state : b7_st_type;

component MMSE_ila_0 IS
PORT (
    clk : IN STD_LOGIC;
    probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe5 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe8 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END component;

begin

ila_blk: MMSE_ila_0
PORT MAP(
    clk => clk,
    probe0 => dataIn_Re,
    probe1 => dataIn_Im,
    probe2(0) => dataIn_Valid,
    probe3(0) => triggerIn,
    probe4 => CE_In_re,
    probe5 => CE_In_im,
    probe6(0) => CE_In_Valid,
    probe7(0) => CE_triggerIn,
    probe8 => nVar_In,
    probe9(0) => nVar_In_Valid
);

rst <= not rstn;

--b0: Buffer CE data until nVar is computed
b0_re: CE_FIFO_IN 
PORT MAP (  clk => clk,
            srst => triggerIn,
            din => b0_CE_In_Re,
            wr_en => b0_wr_en,
            rd_en => b0_rd_en,
            dout => b0_CE_Out_Re,
            full => b0_full_re,
            empty => b0_empty_re,
            wr_rst_busy => open,
            rd_rst_busy => open
);

b0_im: CE_FIFO_IN 
PORT MAP (  clk => clk,
            srst => triggerIn,
            din => b0_CE_In_Im,
            wr_en => b0_wr_en,
            rd_en => b0_rd_en,
            dout => b0_CE_Out_Im,
            full => open,
            empty => open,
            wr_rst_busy => open,
            rd_rst_busy => open
);

b1_valid <= b0_rd_en;

--b1: conj(H_est)
process(clk)
begin
    if rising_edge(clk) then
        b1_Hsq_re1 <= signed(b0_CE_Out_Re(15 downto 0))*signed(b0_CE_Out_Re(15 downto 0));
        b1_Hsq_re2 <= signed(b0_CE_Out_Re(31 downto 16))*signed(b0_CE_Out_Re(31 downto 16));
        b1_Hsq_im1 <= signed(b0_CE_Out_Im(15 downto 0))*signed(b0_CE_Out_Im(15 downto 0));
        b1_Hsq_im2 <= signed(b0_CE_Out_Im(31 downto 16))*signed(b0_CE_Out_Im(31 downto 16));
        b1_valid_r <= b1_valid;
        
        b1_Habs_1 <= b1_Hsq_re1 + b1_Hsq_im1;
        b1_Habs_2 <= b1_Hsq_re2 + b1_Hsq_im2;
        b1_valid_r2 <= b1_valid_r;
        
        b1_csi_1 <= b1_Habs_1 + resize(b1_nVar(b1_nVar'high downto b1_nVar'high-15),b1_csi_1'length);
        b1_csi_2 <= b1_Habs_2 + resize(b1_nVar(b1_nVar'high downto b1_nVar'high-15),b1_csi_2'length);
        b1_valid_r3 <= b1_valid_r2;

        b1_Hconj_re1 <= signed(b0_CE_Out_Re(15 downto 0));
        b1_Hconj_re2 <= signed(b0_CE_Out_Re(31 downto 16));
        b1_Hconj_im1 <= - signed(b0_CE_Out_Im(15 downto 0));
        b1_Hconj_im2 <= - signed(b0_CE_Out_Im(31 downto 16));
        
        b1_Hconj_re1_r <= std_logic_vector(b1_Hconj_re1);
        b1_Hconj_re2_r <= std_logic_vector(b1_Hconj_re2);
        b1_Hconj_im1_r <= std_logic_vector(b1_Hconj_im1);
        b1_Hconj_im2_r <= std_logic_vector(b1_Hconj_im2);

        if nVar_In_Valid = '1' then
            b1_nVar <= signed(nVar_In);
        end if;
    end if;
end process;

--dataOut_Re <= std_logic_vector(resize(b1_csi_1(31-8 downto 16-8),32));
--dataOut_Im <= std_logic_vector(resize(b1_csi_2(31-8 downto 16-8),32));
--dataOut_Valid <= b1_valid_r3;

b1_csi_1_r <= std_logic_vector(b1_csi_1(31-8 downto 16-8)); -- s[16 12]
b1_csi_2_r <= std_logic_vector(b1_csi_2(31-8 downto 16-8)); -- s[16 12]

--b2: state machine --> holds CE input until nVar arrives to the input (assumes nVar arrives after the last CE subcarrier of the OFDM symbol).
process(clk)
begin
    if rising_edge(clk) then
        
        if b0_MUX_in_FIFO = '0' then
            b0_CE_In_Re <= CE_In_re;
            b0_CE_In_Im <= CE_In_im;
        else
            b0_CE_In_Re <= b0_CE_Out_Re; 
            b0_CE_In_Im <= b0_CE_Out_Im; 
        end if;
        
        b2_SC_count_r <= b2_SC_count;
        b0_rd_FIFO <= '0';
        b2_last_r <= b2_last;
        if rstn = '0' then
            b2_state <= st_idle;
            b0_rd_en <= '0';
            b0_wr_en <= '0';
            b0_MUX_in_FIFO <= '0';
            b2_SC_count <= 0;
            b2_countOFDMSym <= 0;
            b0_lat_counter <= 0;
            b2_last <= '0';
        else
            b2_last <= '0';
            case b2_state is
                when st_idle => 
                    b0_lat_counter <= 0;
                    b0_rd_en <= '0';
                    b2_SC_count <= 0;
                    b2_countOFDMSym <= 0;
                    b0_wr_en <= '0';
                    b0_MUX_in_FIFO <= '0';
                    if CE_triggerIn = '1' then
                        if CE_In_Valid = '1' then
                            b0_wr_en <= '1';
                        end if;
                        b2_state <= ST_CE_write;
                    end if;
                when ST_CE_write => 
                    b0_lat_counter <= 0;
                    b0_rd_en <= '0';
                    b0_wr_en <= '0';
                    if CE_In_Valid = '1' then
                        b0_wr_en <= '1';
                    end if;
                    b0_MUX_in_FIFO <= '0';
                    if nVar_In_Valid = '1' then
                        b2_state <= ST_waitSymbols;
                        b0_wr_en <= '0';
                    end if;
                when ST_waitSymbols => 
                    b0_wr_en <= '0';
                    b0_MUX_in_FIFO <= '1';
                    
                    if b0_lat_counter < 32 then
                        b0_lat_counter <= b0_lat_counter + 1;
                    elsif b3_dataReady_n = '0' then
                        b0_lat_counter <= 0;
                        b0_rd_FIFO <= '1';
                        b0_rd_en <= '1';
                        b0_wr_en <= '0';
                        b2_SC_count <= b2_SC_count + 1;
                        b2_state <= st_read;
                    end if;
                when st_read => 
                    b0_lat_counter <= 0;
                    b0_wr_en <= '1';
                    b0_MUX_in_FIFO <= '1';
                    b2_SC_count <= b2_SC_count + 1;
                    b0_rd_en <= '1';
                    if b2_SC_count = to_integer(unsigned(numSC)) then
                        b2_SC_count <= 0;
                        b0_rd_en <= '0';
                        if b2_countOFDMSym = to_integer(unsigned(numOFDMm1)) then
                            b2_state <= st_idle;
                            b2_last <= '1';
                        else
                            b2_countOFDMSym <= b2_countOFDMSym + 1;
                            b2_state <= ST_waitSymbols;
                        end if;
                    end if;
                when others => 
                    b0_lat_counter <= 0;
                    b2_state <= st_idle;
                    b0_rd_en <= '0';
                    b2_SC_count <= 0;
            end case;
        end if;
    end if;
end process;

b2_countOFDMSymRed <= std_logic_vector(to_unsigned(b2_countOFDMSym,3)); 
b2_addRd <=  b2_countOFDMSymRed & std_logic_vector(to_unsigned(b2_SC_count_r,10));

--b3: state machine to "hold" data while CE arrives 
process(clk)
begin
    if rising_edge(clk) then
        b3_dataIn <= dataIn_Im & dataIn_Re;
        b3_countSC_r <= b3_countSC;
        b3_fifoWr <= '0';
        b3_wrEn <= '0';
        if rstn = '0' then
            b3_state <= ST_idle;
            b3_countSC <= 0;
            b3_countOFDMSym <= 0;
            --b2_last <= '0';
        else
            --b2_last <= '0';
            case b3_state is 
                when ST_idle => 
                    b3_fifoRst <= '0';
                    b3_countSC <= 0;
                    b3_countOFDMSym <= 0;
                    if triggerIn = '1' then
                        b3_fifoRst <= '1';
                        if dataIn_Valid = '1' then 
                            b3_countSC <= b3_countSC + 1;
                            b3_wrEn <= '1';
                        end if;
                        b3_state <= ST_dataWr;
                    end if;
                when ST_dataWr => 
                    b3_fifoRst <= '0';
                    if b3_countSC = to_integer(unsigned(numSC)) then
                        b3_state <= ST_symbolEnd;
                        b3_countSC <= 0;
                    elsif dataIn_Valid = '1' then 
                        b3_wrEn <= '1';
                        b3_countSC <= b3_countSC + 1;
                    end if;
                when ST_symbolEnd => 
                    b3_fifoRst <= '0';
                    b3_fifoWr <= '1';
                    if b3_countOFDMSym = to_integer(unsigned(numOFDMm1)) then
                        b3_state <= ST_idle;
                        --b2_last <= '1';
                    else
                        b3_countOFDMSym <= b3_countOFDMSym+1;
                        b3_state <= ST_dataWr;
                    end if;
                when others =>
                    b3_state <= ST_idle;
                    b3_countSC <= 0;
                    b3_countOFDMSym <= 0;
            end case;
        end if;
    end if;
end process;

b3_countOFDMSymRed <= std_logic_vector(to_unsigned(b3_countOFDMSym,3)); 
b3_addrWr <=  b3_countOFDMSymRed & std_logic_vector(to_unsigned(b3_countSC_r,10));

b3_dataRAM: dataRAM
port map(   clka => clk,
            ena => '1',
            wea => b3_wrEn,
            addra => b3_addrWr,
            dina => b3_dataIn,
            clkb => clk,
            enb => '1',
            addrb => b2_addRd,
            doutb => b3_dataOut
);

b3_dataOut_re1 <= b3_dataOut(16*1-1 downto 16*0);
b3_dataOut_re2 <= b3_dataOut(16*2-1 downto 16*1);
b3_dataOut_im1 <= b3_dataOut(16*3-1 downto 16*2);
b3_dataOut_im2 <= b3_dataOut(16*4-1 downto 16*3);

b3_FIFO: FIFO_rxStatus
port map (  clk => clk,
            srst => b3_fifoRst,
            din => "1",
            wr_en => b3_fifoWr,
            rd_en => b0_rd_FIFO,
            dout => open,
            full => open,
            empty => b3_dataReady_n,
            wr_rst_busy => open,
            rd_rst_busy => open
);

--b4: H_dash * rxSym
b4_compMult_1: ComplexMult2
port map(   clk => clk,
            ar => b3_dataOut_re1,
            ai => b3_dataOut_im1,
            br => b1_Hconj_re1_r,
            bi => b1_Hconj_im1_r,
            validIn => b1_valid_r2,
            pr => b4_dataOut_re1,
            pi => b4_dataOut_im1,
            validOut => b4_validOut
);

b4_compMult_2: ComplexMult2
port map(   clk => clk,
            ar => b3_dataOut_re2,
            ai => b3_dataOut_im2,
            br => b1_Hconj_re2_r,
            bi => b1_Hconj_im2_r,
            validIn => b1_valid_r2,
            pr => b4_dataOut_re2,
            pi => b4_dataOut_im2,
            validOut => open
);

--dataOut_Re <= b4_dataOut_re2(31-8 downto 16-8) & b4_dataOut_re1(31-8 downto 16-8);
--dataOut_Im <= b4_dataOut_im2(31-8 downto 16-8) & b4_dataOut_im1(31-8 downto 16-8);
--dataOut_Valid <= b4_validOut;

b4_dataOutRed_re2 <= b4_dataOut_re2(31-8 downto 16-8);
b4_dataOutRed_re1 <= b4_dataOut_re1(31-8 downto 16-8);
b4_dataOutRed_im2 <= b4_dataOut_im2(31-8 downto 16-8);
b4_dataOutRed_im1 <= b4_dataOut_im1(31-8 downto 16-8);

--shift register to align data with CSI^-1
process(clk)
begin
    if rising_edge(clk) then
        for ii in 0 to 36 loop
            b4_last_SR(ii+1) <= b4_last_SR(ii);
        end loop;
        for ii in 0 to 29 loop
            b4_dataSR_re1(ii+1) <= b4_dataSR_re1(ii);
            b4_dataSR_re2(ii+1) <= b4_dataSR_re2(ii);
            b4_dataSR_im1(ii+1) <= b4_dataSR_im1(ii);
            b4_dataSR_im2(ii+1) <= b4_dataSR_im2(ii);
        end loop;
        b4_dataSR_re1(0) <= b4_dataOutRed_re1;
        b4_dataSR_re2(0) <= b4_dataOutRed_re2;
        b4_dataSR_im1(0) <= b4_dataOutRed_im1;
        b4_dataSR_im2(0) <= b4_dataOutRed_im2;
        b4_last_SR(0) <= b2_last_r;
    end if;
end process;

b6_dataIn_re1 <= b4_dataSR_re1(30);
b6_dataIn_re2 <= b4_dataSR_re2(30);
b6_dataIn_im1 <= b4_dataSR_im1(30);
b6_dataIn_im2 <= b4_dataSR_im2(30);
b4_last <= b4_last_SR(30+7);

b5_CSI_inv1: MMSEdivider
PORT MAP(
    aclk => clk,
    s_axis_divisor_tvalid => b1_valid_r3,
    s_axis_divisor_tdata => b1_csi_1_r,
    s_axis_dividend_tvalid => b1_valid_r3,
    s_axis_dividend_tdata => x"0200",
    m_axis_dout_tvalid => b5_validOut,
    m_axis_dout_tdata => b5_invCSI_1
);

b5_CSI_inv2: MMSEdivider
PORT MAP(
    aclk => clk,
    s_axis_divisor_tvalid => b1_valid_r3,
    s_axis_divisor_tdata => b1_csi_2_r,
    s_axis_dividend_tvalid => b1_valid_r3,
    s_axis_dividend_tdata => x"0200",
    m_axis_dout_tvalid => open,
    m_axis_dout_tdata => b5_invCSI_2
);

b6_invCSIIn_1 <= b5_invCSI_1(31-14 downto 16-14); -- s[16 10]
b6_invCSIIn_2 <= b5_invCSI_2(31-14 downto 16-14); -- s[16 10]

--dataOut_Re <= std_logic_vector(resize(unsigned(b6_invCSIIn_1),32)); 
--dataOut_Im <= std_logic_vector(resize(unsigned(b6_invCSIIn_2),32)); 
--dataOut_Valid <= b5_validOut;

--b6: final multiplications: 
process(clk)
begin
    if rising_edge(clk) then
        b6_validOut <= b5_validOut;
        b6_dataOut_re1 <= std_logic_vector(signed(b6_dataIn_re1) * signed(b6_invCSIIn_1));
        b6_dataOut_im1 <= std_logic_vector(signed(b6_dataIn_im1) * signed(b6_invCSIIn_1));
        b6_dataOut_re2 <= std_logic_vector(signed(b6_dataIn_re2) * signed(b6_invCSIIn_2));
        b6_dataOut_im2 <= std_logic_vector(signed(b6_dataIn_im2) * signed(b6_invCSIIn_2));
    end if;
end process;

b6_dataOut_re_s <= b6_dataOut_re2(31-6 downto 16-6) & b6_dataOut_re1(31-6 downto 16-6); -- s[16 12]
dataOut_Re <= b6_dataOut_re_s;
dataOut_Im <= b6_dataOut_im2(31-6 downto 16-6) & b6_dataOut_im1(31-6 downto 16-6); -- s[16 12] 
dataOut_Valid <= b6_validOut;
dataOut_Last <= b4_last;

--b7: triggerOut generation
process(clk)
begin
    if rising_edge(clk)then
        triggerOut <= '0';
        case b7_state is 
            when st_idle => 
                if triggerIn = '1' then
                    b7_state <= ST_waitValid;
                end if;
            when ST_waitValid =>
                if b5_validOut = '1' then
                    b7_state <= st_idle;
                    triggerOut <= '1';
                end if;
            when others => 
                b7_state <= st_idle;
        end case;
    end if;
end process;

end Behavioral;
