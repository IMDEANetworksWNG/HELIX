----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2022 04:45:44 PM
-- Design Name: 
-- Module Name: LDPCdecoder_top - Behavioral
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

entity LDPCdecoder_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        core_clk : in std_logic;
        --
        dataInRe1 : in std_logic_vector(16-1 downto 0);
        dataInRe2 : in std_logic_vector(16-1 downto 0);
        dataInIm1 : in std_logic_vector(16-1 downto 0);
        dataInIm2 : in std_logic_vector(16-1 downto 0);
        validIn : in std_logic_vector(1 downto 0);
        triggerIn : in std_logic; 
        demapperDone : in std_logic;
        triggerOut : out std_logic;
        --
        Zc : in std_logic_vector(6 downto 0);
        Em1 : in std_logic_vector(10 downto 0);
        Kdm1 : in std_logic_vector(10 downto 0);
        Fm1 : in std_logic_vector(10 downto 0);
        FZ : in std_logic_vector(10 downto 0);
        Cm1 : in std_logic_vector(2 downto 0);
        RuleFirst1 : in std_logic_vector(4*3-1 downto 0);
        JumpFirst1 : in std_logic_vector(2 downto 0);
        RuleLast1 : in std_logic_vector(4*3-1 downto 0);
        RuleFirst2 : in std_logic_vector(4*3-1 downto 0);
        JumpFirst2 : in std_logic_vector(2 downto 0);
        RuleLast2 : in std_logic_vector(4*3-1 downto 0);
        RuleLastZeros : in std_logic_vector(4*3-1 downto 0);
        RuleLastPunctured : in std_logic_vector(4*3-1 downto 0);
        LDPC_Ctrl_1 : in std_logic_vector(39 downto 0);
        LDPC_Ctrl_2 : in std_logic_vector(39 downto 0);
        LDPC_Ctrl_3 : in std_logic_vector(39 downto 0);
        --
        dataOutRateAdap : out std_logic_vector(127 downto 0);
        validOutRateAdap : out std_logic_vector(7 downto 0);
        dataOutHD : out std_logic_vector(63 downto 0);
        validOutHD : out std_logic;
        lastOutHD : out std_logic;
        readyOutHD : out std_logic;
        dataOutStatus : out std_logic_vector(39 downto 0);
        validOutStatus : out std_logic
);
end LDPCdecoder_top;

architecture Behavioral of LDPCdecoder_top is

function or_reduce( V: std_logic_vector ) return std_ulogic is
    variable result: std_ulogic;
begin
    for i in V'range loop
        if i = V'left then
            result := V(i);
        else
            result := result OR V(i);
        end if;
        exit when result = '1';
    end loop;
    return result;
end or_reduce; 

function and_reduce( V: std_logic_vector ) return std_ulogic is
    variable result: std_ulogic;
begin
    for i in V'range loop
        if i = V'left then
            result := V(i);
        else
            result := result and V(i);
        end if;
        exit when result = '0';
    end loop;
    return result;
end and_reduce; 

function ruleValid( V: in integer; dir : in std_logic )return std_logic_vector is
    variable result: std_logic_vector(15 downto 0);
begin
    if dir = '0' then --left to right
        result(result'high downto result'high - V) := (others => '1');
        result(result'high - V - 1 downto 0) := (others => '0');
    else
        result(result'high downto V + 1) := (others => '0');
        result(V downto 0) := (others => '1');
    end if;
    return result;
end ruleValid; 

signal rst : std_logic;

signal b0_re1, b0_re2, b0_im1, b0_im2 : std_logic_vector(7 downto 0);
signal b0_valid : std_logic_vector(1 downto 0);

type b1_stateType is (S0, S1);
signal b1_state : b1_stateType;
signal b1_re, b1_im : std_logic_vector(15 downto 0);
signal b1_reserveRe, b1_reserveIm : std_logic_vector(7 downto 0);
signal b1_valid : std_logic;
signal b1_fifoRst : std_logic;

signal b2_dataRe, b2_dataIm : std_logic_vector(127 downto 0);
signal b2_dataRe_order, b2_dataIm_order : std_logic_vector(127 downto 0);
signal b2_emptyRe, b2_emptyIm : std_logic;
signal b2_fullRe, b2_fullIm : std_logic;
signal b2_validRe, b2_validIm : std_logic;
signal b2_wr_rst_busy : std_logic;

type b3_stateType is (idle, send_punctured, send_bit1, send_bit2, send_fillers, send_zeros, waiting, configureLDPCblock, configureLDPCblock2);
signal b3_state : b3_stateType;
signal b3_readRe, b3_readIm : std_logic;
signal b3_realDone, b3_imagDone, b3_fillDone : std_logic; 
signal jumpFirst1_s, jumpFirst2_s, b3_jump : std_logic;
signal validFirst1, validLast1, validLastZeros : std_logic_vector(15 downto 0);
signal validFirst2, validLast2, validLastPunctured : std_logic_vector(15 downto 0);
signal b3_extraRe : std_logic;
signal b3_count, b3_countF : integer range 0 to 32767;
signal b3_countC : integer range 0 to 7;
signal b3_dataOut : std_logic_vector(127 downto 0);
signal b3_dataOut_r, b3_dataOut_r2 : std_logic_vector(127+16 downto 0);
signal b3_validOut_r, b3_validOut_r2 : std_logic;
signal b3_lastOut_r, b3_lastOut_r2 : std_logic;
signal b3_readyOut_r, b3_readyOut_r2 : std_logic;
signal b3_ready, b3_last, b3_rstn_LDPC : std_logic := '0';
signal b3_valid, b3_valid_r : std_logic_vector(15 downto 0);

signal b4_dataIn, b4_dataOut_s : std_logic_vector(127 downto 0);
signal b4_validIn : std_logic_vector(15 downto 0);
signal b4_validOut_s : std_logic_vector(7 downto 0);
signal b4_lastIn : std_logic;
signal b4_data : std_logic_vector(127+8 downto 0);
signal b4_valid, b4_last : std_logic;
--signal b4_Wdata : std_logic_vector(7 downto 0);
--signal b4_Wvalid, b4_Wlast : std_logic;
signal b4_data_r : std_logic_vector(127+8 downto 0);
signal b4_valid_r, b4_last_r : std_logic;

signal b5_rstn_LDPC_s : std_logic := '0';
signal b5_dataOut : std_logic_vector(127 downto 0) := (others => '0');
signal b5_validOut, b5_lastOut : std_logic := '0';
signal b5_s_axi_wready, b5_s_axi_awready, b5_s_axi_wvalid, b5_s_axi_awvalid : std_logic := '0';
signal b5_s_axi_bready, b5_s_axi_bvalid, b5_interrupt : std_logic := '0';
signal b5_s_axi_Ctlready, b5_s_axi_Ctlvalid : std_logic := '0';
signal b5_m_axis_status_tdata : std_logic_vector(39 downto 0) := (others => '0');
signal b5_m_axis_status_tvalid : std_logic := '0';
signal b5_s_axi_ctrldata : std_logic_vector(39 downto 0);
signal b5_ready : std_logic;

signal b6_triggerOut : std_logic;

component FIFO_deinterleaving IS
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    valid : OUT STD_LOGIC;
    wr_rst_busy : OUT STD_LOGIC;
    rd_rst_busy : OUT STD_LOGIC
  );
END component;
  
component sd_fec_0 is
port (
    reset_n : in std_logic;
    core_clk : in std_logic;
    s_axi_aclk : in std_logic;
    s_axi_awaddr : in std_logic_vector(17 downto 0);
    s_axi_awvalid : in std_logic;
    s_axi_awready : out std_logic;
    s_axi_wdata : in std_logic_vector(31 downto 0);
    s_axi_wvalid : in std_logic;
    s_axi_wready : out std_logic;
    s_axi_bready : in std_logic;
    s_axi_bvalid : out std_logic;
    s_axi_araddr : in std_logic_vector(17 downto 0);
    s_axi_arvalid : in std_logic;
    s_axi_arready : out std_logic;
    s_axi_rready : in std_logic;
    s_axi_rdata : out std_logic_vector(31 downto 0);
    s_axi_rvalid  : out std_logic;
    interrupt : out std_logic;
    s_axis_din_words_aclk : in std_logic;
    s_axis_din_words_tready : out std_logic;
    s_axis_din_words_tvalid : in std_logic;
    s_axis_din_words_tlast : in std_logic;
    s_axis_din_words_tdata : in std_logic_vector(7 downto 0);
    s_axis_ctrl_aclk : in std_logic;
    s_axis_ctrl_tready : out std_logic;
    s_axis_ctrl_tvalid : in std_logic;
    s_axis_ctrl_tdata : in std_logic_vector(39 downto 0);
    s_axis_din_aclk : in std_logic;
    s_axis_din_tready : out std_logic;
    s_axis_din_tvalid : in std_logic;
    s_axis_din_tlast : in std_logic;
    s_axis_din_tdata : in std_logic_vector(127 downto 0);
    m_axis_status_aclk : in std_logic;
    m_axis_status_tready : in std_logic;
    m_axis_status_tvalid : out std_logic;
    m_axis_status_tdata : out std_logic_vector(39 downto 0);
    m_axis_dout_aclk : in std_logic;
    m_axis_dout_tready : in std_logic;
    m_axis_dout_tvalid : out std_logic;
    m_axis_dout_tlast : out std_logic;
    m_axis_dout_tdata : out std_logic_vector(127 downto 0)
);
end component;

COMPONENT axis_register_slice_0 is
port(   aclk : in std_logic;
        aresetn : in std_logic;
        s_axis_tvalid : in std_logic;
        s_axis_tready : out std_logic;
        s_axis_tdata : in std_logic_vector(127+8 downto 0);
        s_axis_tlast : in std_logic;
        m_axis_tvalid : out std_logic;
        m_axis_tready : in std_logic;
        m_axis_tdata : out std_logic_vector(127+8 downto 0);
        m_axis_tlast : out std_logic
);
end component;

COMPONENT axis_register_slice_1 is
port(   aclk : in std_logic;
        aresetn : in std_logic;
        s_axis_tvalid : in std_logic;
        s_axis_tready : out std_logic;
        s_axis_tdata : in std_logic_vector(127+16 downto 0);
        s_axis_tlast : in std_logic;
        m_axis_tvalid : out std_logic;
        m_axis_tready : in std_logic;
        m_axis_tdata : out std_logic_vector(127+16 downto 0);
        m_axis_tlast : out std_logic
);
end component;

component vt_single_sync is
generic (
	STAGES		: integer	:= 2;
	STARTUP_VALUE	: std_logic 	:= '1'
);
port (
	clk		:  in std_logic;  -- Clock of the domain into which the outputs are going
	port_i		:  in std_logic;  -- Asynchronous inputs
	port_o		: out std_logic   -- Synchronous outputs
);
end component;

component ila_0 is
port(
    clk : IN STD_LOGIC;
    probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe4 : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe6 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
    probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe8 : IN STD_LOGIC_VECTOR(39 DOWNTO 0);
    probe9 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe10 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    probe11 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
);
end component;

begin

rst <= not rstn;

--b0: Quantize inputs
process(clk)
begin
    if rising_edge(clk) then
            if b3_extraRe = '0' then
                b0_valid <= validIn;
                b0_re1 <= std_logic_vector(resize(- signed(dataInRe1(dataInRe1'high downto dataInRe1'high-5)),b0_re1'length)); -- s[16 13] to s[8 3]
                b0_re2 <= std_logic_vector(resize(- signed(dataInRe2(dataInRe2'high downto dataInRe2'high-5)),b0_re2'length)); -- s[16 13] to s[8 3]
                b0_im1 <= std_logic_vector(resize(- signed(dataInIm1(dataInIm1'high downto dataInIm1'high-5)),b0_im1'length)); -- s[16 13] to s[8 3]
                b0_im2 <= std_logic_vector(resize(- signed(dataInIm2(dataInIm2'high downto dataInIm2'high-5)),b0_im2'length)); -- s[16 13] to s[8 3]
            else
                b0_valid <= "11";
                b0_re1 <= (others => '0');
                b0_re2 <= (others => '0');
                b0_im1 <= (others => '0');
                b0_im2 <= (others => '0');
            end if;
    end if;
end process;

--b1: force SSR = 2 before storing data in FIFO
process(clk)
begin
    if rising_edge(clk) then
        if rstn = '0' or triggerIn = '1' then
            b1_state <= S0;
            b1_valid <= '0';
            b1_re <= (others => '0');
            b1_im <= (others => '0');
            b1_reserveRe <= (others => '0');
            b1_reserveIm <= (others => '0');
            --b1_fifoRst <= '1';
        else
            --b1_fifoRst <= '0';
            case b1_state is
                when S0 =>
                    case b0_valid is
                        when "00" =>
                            b1_valid <= '0';
                        when "01" =>
                            b1_state <= S1;
                            b1_valid <= '0';
                            b1_reserveRe <= b0_re1;
                            b1_reserveIm <= b0_im1;
                        when "10" =>
                            b1_state <= S1;
                            b1_valid <= '0';
                            b1_reserveRe <= b0_re2;
                            b1_reserveIm <= b0_im2;
                        when "11" =>
                            b1_valid <= '1';
                            b1_re <= b0_re2 & b0_re1;
                            b1_im <= b0_im2 & b0_im1;
                        when others => 
                            b1_valid <= '0';
                    end case;
                when S1 =>
                    case b0_valid is
                        when "00" =>
                            b1_valid <= '0';
                        when "01" =>
                            b1_state <= S0;
                            b1_valid <= '1';
                            b1_re <= b0_re1 & b1_reserveRe;
                            b1_im <= b0_im1 & b1_reserveIm;
                        when "10" =>
                            b1_state <= S0;
                            b1_valid <= '1';
                            b1_re <= b0_re2 & b1_reserveRe;
                            b1_im <= b0_im2 & b1_reserveIm;
                        when "11" =>
                            b1_valid <= '1';
                            b1_re <= b0_re1 & b1_reserveRe;
                            b1_im <= b0_im1 & b1_reserveIm;
                            b1_reserveRe <= b0_re2;
                            b1_reserveIm <= b0_im2;
                        when others => 
                            b1_valid <= '0';
                    end case;
                when others => 
                    b1_state <= S0;
            end case;
        end if;
    end if;
end process;

b2_FIFO_Re: FIFO_deinterleaving
PORT MAP(
    clk => clk,
    srst => b1_fifoRst,  
    din => b1_re,
    wr_en => b1_valid,
    rd_en => b3_readRe,
    dout => b2_dataRe_order,
    full => b2_fullRe,
    empty => b2_emptyRe,
    valid => b2_validRe,
    wr_rst_busy => b2_wr_rst_busy,
    rd_rst_busy => open
);

b2_FIFO_Im: FIFO_deinterleaving
PORT MAP(
    clk => clk,
    srst => b1_fifoRst,
    din => b1_im,
    wr_en => b1_valid,
    rd_en => b3_readIm,
    dout => b2_dataIm_order,
    full => b2_fullIm,
    empty => b2_emptyIm,
    valid => b2_validIm,
    wr_rst_busy => open,
    rd_rst_busy => open
);

fg_order: for ii in 0 to 7 generate
    b2_dataRe(16*(8-ii)-1 downto 16*(7-ii)) <= b2_dataRe_order(16*(ii+1)-1 downto 16*ii);
    b2_dataIm(16*(8-ii)-1 downto 16*(7-ii)) <= b2_dataIm_order(16*(ii+1)-1 downto 16*ii);
end generate;

-- b3: state machine to control flow to the LDPC decoder core
process(clk)
    variable countRst : integer range 0 to 31 := 0;
    variable LDPC_aconf, LDPC_conf, LDPC_conf2 : std_logic := '0';
    variable sendFillersFLAG : std_logic := '0';
begin
    if rising_edge(clk) then
        if rstn = '0' then
            b1_fifoRst <= '1';
            LDPC_aconf := '0';
            LDPC_conf := '0';
            LDPC_conf2 := '0';
            b3_jump <= '0';
            b3_extraRe <= '0';
            countRst := 0;
            b3_state <= idle;
            b3_count <= 0;
            b3_realDone <= '0';
            b3_imagDone <= '0';
            b3_fillDone <= '0';
            b3_last <= '0';
            b3_countC <= 0;
            b3_rstn_LDPC <= '0';
            b3_valid <= (others => '0');
            sendFillersFLAG := '0';
            b5_s_axi_awvalid <= '0';
            b5_s_axi_wvalid <= '0';
        else
            b1_fifoRst <= '0';
            case b3_state is
                when idle => -- waits for an input trigger to starts operation
                    b1_fifoRst <= '1';
                    LDPC_aconf := '0';
                    LDPC_conf := '0';
                    LDPC_conf2 := '0';
                    b5_s_axi_awvalid <= '0';
                    b5_s_axi_wvalid <= '0';
                    b3_jump <= '0';
                    b3_extraRe <= '0';
                    sendFillersFLAG := '0';
                    b3_realDone <= '0';
                    b3_imagDone <= '0';
                    b3_fillDone <= '0';
                    b3_countC <= 0;
                    countRst := 0;
                    b3_rstn_LDPC <= '1';
                    b3_last <= '0';
                    b3_count <= 0;
                    b3_valid <= (others => '0');
                    if triggerIn = '1' then
                        b3_state <= waiting;
                    end if;
                when waiting => -- reset LDPC block during 32 clk cycles each time (to avoid unexpected errors)
                    LDPC_aconf := '0';
                    LDPC_conf := '0';
                    LDPC_conf2 := '0';
                    b5_s_axi_awvalid <= '0';
                    b5_s_axi_wvalid <= '0';
                    b3_jump <= '0';
                    b3_extraRe <= '0';
                    b3_realDone <= '0';
                    b3_imagDone <= '0';
                    b3_fillDone <= '0';
                    b3_countC <= 0;
                    b3_valid <= (others => '0');
                    b3_last <= '0';
                    b3_rstn_LDPC <= '0';
                    if countRst = 31 then
                        b3_state <= configureLDPCblock;
                        countRst := 0;
                        b5_s_axi_awvalid <= '1';
                        b5_s_axi_wvalid <= '1';
                    else
                        countRst := countRst + 1;
                    end if;
                when configureLDPCblock => -- sebnd the general configuration (fixed) to the LDPC block
                    b3_jump <= '0';
                    b3_extraRe <= '0';
                    b3_realDone <= '0';
                    b3_imagDone <= '0';
                    b3_fillDone <= '0';
                    b3_countC <= 0;
                    b3_valid <= (others => '0');
                    b3_last <= '0';
                    b3_rstn_LDPC <= '1';
                    
                    if b5_s_axi_awready = '1' and b5_s_axi_awvalid = '1' then
                        LDPC_aconf := '1';
                        b5_s_axi_awvalid <= '0';
                    end if;
                    if b5_s_axi_wready = '1' and b5_s_axi_wvalid = '1' then
                        b5_s_axi_wvalid <= '0';
                        LDPC_conf := '1';
                        b5_s_axi_bready <= '1';
                    end if;
                    if b5_s_axi_bready = '1' and b5_s_axi_bvalid = '1' then
                        b5_s_axi_bready <= '0';
                        LDPC_conf2 := '1';
                    end if;
                    
                    if LDPC_aconf = '1' and LDPC_conf = '1' and LDPC_conf2 = '1' then                   
                        LDPC_conf := '0';
                        LDPC_aconf := '0';
                        LDPC_conf2 := '0';
                        b3_state <= configureLDPCblock2;
                        b5_s_axi_ctlvalid <= '1';
                        b5_s_axi_ctrldata <= LDPC_Ctrl_1;
                    end if;
                when configureLDPCblock2 => --- send decoder configuration for *each* of the codewords in the slot
                    LDPC_aconf := '0';
                    LDPC_conf := '0';
                    LDPC_conf2 := '0';
                    b3_jump <= '0';
                    b3_extraRe <= '0';
                    b3_realDone <= '0';
                    b3_imagDone <= '0';
                    b3_fillDone <= '0';
                    b3_valid <= (others => '0');
                    b3_last <= '0';
                    b3_rstn_LDPC <= '1';
                    
                    if b5_s_axi_ctlvalid = '1' and b5_s_axi_ctlready = '1' then
                        if b3_countC = to_integer(unsigned(Cm1)) then
                            b3_state <= send_punctured; -- could be generalized to DO NOT include punctured bits and jumps directly to bit 1
                            b3_valid <= (others => '1');
                            b3_countC <= 0;
                            b5_s_axi_ctlvalid <= '0';
                        else
                            b3_countC <= b3_countC + 1;
                            case b3_countC is
                                when 0 => b5_s_axi_ctrldata <= LDPC_Ctrl_2;
                                when 1 => b5_s_axi_ctrldata <= LDPC_Ctrl_3;
                                when others => b5_s_axi_ctrldata <= LDPC_Ctrl_1;
                            end case;
                        end if;
                    end if;
                when send_punctured => -- send punctured bits to the LDPC block and select the first/last rule for the transfer depending on the codeword
                    LDPC_aconf := '0';
                    LDPC_conf := '0';
                    LDPC_conf2 := '0';
                    b3_jump <= '0';
                    if demapperDone = '1' then
                        b3_extraRe <= '1';
                    end if;
                    b3_rstn_LDPC <= '1';
                    b3_last <= '0';
                    b3_valid <= (others => '1');
                    if b3_ready = '1' then
                        if b3_count > to_integer(unsigned(Zc)) then
                            b3_count <= 0;
                            b3_state <= send_bit1;
                            b3_valid <= validFirst1; 
                            b3_jump <= jumpFirst1_s;
                        elsif b3_count = to_integer(unsigned(Zc)) then
                            b3_valid <= validLastPunctured; 
                            b3_count <= b3_count + 1;
                        else
                            b3_count <= b3_count + 1;
                        end if;
                    end if;
                    
                    case b3_countC is
                        when 0 => 
                            validFirst1 <= ruleValid(to_integer(unsigned(RuleFirst1(3 downto 0))),'0');
                            validLast1 <= ruleValid(to_integer(unsigned(RuleLast1(3 downto 0))),'1');
                            validFirst2 <= ruleValid(to_integer(unsigned(RuleFirst2(3 downto 0))),'0');
                            validLast2 <= ruleValid(to_integer(unsigned(RuleLast2(3 downto 0))),'1');
                            validLastZeros <= ruleValid(to_integer(unsigned(RuleLastZeros(3 downto 0))),'1');
                            validLastPunctured <= ruleValid(to_integer(unsigned(RuleLastPunctured(3 downto 0))),'1');
                            jumpFirst1_s <= jumpFirst1(0);
                            jumpFirst2_s <= jumpFirst2(0);
                        when 1 => 
                            validFirst1 <= ruleValid(to_integer(unsigned(RuleFirst1(7 downto 4))),'0');
                            validLast1 <= ruleValid(to_integer(unsigned(RuleLast1(7 downto 4))),'1');
                            validFirst2 <= ruleValid(to_integer(unsigned(RuleFirst2(7 downto 4))),'0');
                            validLast2 <= ruleValid(to_integer(unsigned(RuleLast2(7 downto 4))),'1');
                            validLastZeros <= ruleValid(to_integer(unsigned(RuleLastZeros(7 downto 4))),'1');
                            validLastPunctured <= ruleValid(to_integer(unsigned(RuleLastPunctured(7 downto 4))),'1');
                            jumpFirst1_s <= jumpFirst1(1);
                            jumpFirst2_s <= jumpFirst2(1);
                        when 2 => 
                            validFirst1 <= ruleValid(to_integer(unsigned(RuleFirst1(11 downto 8))),'0');
                            validLast1 <= ruleValid(to_integer(unsigned(RuleLast1(11 downto 8))),'1');
                            validFirst2 <= ruleValid(to_integer(unsigned(RuleFirst2(11 downto 8))),'0');
                            validLast2 <= ruleValid(to_integer(unsigned(RuleLast2(11 downto 8))),'1');
                            validLastZeros <= ruleValid(to_integer(unsigned(RuleLastZeros(11 downto 8))),'1');
                            validLastPunctured <= ruleValid(to_integer(unsigned(RuleLastPunctured(11 downto 8))),'1');
                            jumpFirst1_s <= jumpFirst1(2);
                            jumpFirst2_s <= jumpFirst2(2);
                        when others => 
                            validFirst1 <= ruleValid(to_integer(unsigned(RuleFirst1(3 downto 0))),'0');
                            validLast1 <= ruleValid(to_integer(unsigned(RuleLast1(3 downto 0))),'1');
                            validFirst2 <= ruleValid(to_integer(unsigned(RuleFirst2(3 downto 0))),'0');
                            validLast2 <= ruleValid(to_integer(unsigned(RuleLast2(3 downto 0))),'1');
                            validLastZeros <= ruleValid(to_integer(unsigned(RuleLastZeros(3 downto 0))),'1');
                            validLastPunctured <= ruleValid(to_integer(unsigned(RuleLastPunctured(3 downto 0))),'1');
                            jumpFirst1_s <= jumpFirst1(0);
                            jumpFirst2_s <= jumpFirst2(0);
                    end case; 
                when send_bit1 => -- First bit of the demapper out (real part for the QPSK case). 
                    LDPC_aconf := '0';
                    LDPC_conf := '0';
                    LDPC_conf2 := '0';
                    if demapperDone = '1' then
                        b3_extraRe <= '1';
                    end if;
                    b3_rstn_LDPC <= '1';
                    b3_last <= '0';
                    if b3_ready = '1' and b2_validRe = '1' then
                        if b3_valid(b3_valid'low) = '1' or b3_jump = '1' then
                            b3_count <= b3_count + 1;
                        end if;
                        if sendFillersFLAG = '1' then
                            sendFillersFLAG := '0';
                            b3_state <= send_fillers;
                            b3_valid <= (others => '1');
                            b3_jump <= '0';
                        elsif b3_count = to_integer(unsigned(Em1))  then -- Rule last  
                            b3_state <= send_bit2;
                            b3_realDone <= '1';
                            b3_count <= 0;
                            b3_valid <= validFirst1; --(others => '1');
                            b3_jump <= jumpFirst2_s;
                        elsif b3_count = to_integer(unsigned(Kdm1)) and b3_fillDone = '0' then 
                            b3_valid <= validLast1; --(others => '1');
                            sendFillersFLAG := '1';
                            b3_jump <= '0';
                        elsif b3_count < to_integer(unsigned(Em1))-1 then  
                            b3_valid <= (others => '1');
                            b3_jump <= '0';
                        else
                            b3_valid <= validLast2;
                            b3_jump <= '0';
                        end if;
                    end if;
                when send_bit2 => -- Second bit of the demapper out (imag part for the QPSK case). (Could be generalized for higher order QAM).
                    LDPC_aconf := '0';
                    LDPC_conf := '0';
                    LDPC_conf2 := '0';
                    if demapperDone = '1' then
                        b3_extraRe <= '1';
                    end if;
                    b3_rstn_LDPC <= '1';
                    b3_last <= '0';
                    if b3_ready = '1' and b2_validIm = '1' then
                        if b3_valid(b3_valid'low) = '1' or b3_jump = '1' then
                            b3_count <= b3_count + 1;
                        end if;
                        if sendFillersFLAG = '1' then
                            sendFillersFLAG := '0';
                            b3_state <= send_fillers;
                            b3_valid <= (others => '1');
                            b3_jump <= '0'; 
                        elsif b3_count = to_integer(unsigned(Em1))  then -- Rule last  
                            b3_state <= send_zeros;
                            b3_imagDone <= '1';
                            b3_count <= 0;
                            b3_valid <= (others => '1');--validFirst1; --
                            b3_jump <= '0';
                        elsif b3_count = to_integer(unsigned(Kdm1)) and b3_fillDone = '0' then 
                            b3_valid <= validLast1; --(others => '1');
                            sendFillersFLAG := '1';
                            b3_jump <= '0';
                        elsif b3_count < to_integer(unsigned(Em1))-1 then  
                            b3_valid <= (others => '1');
                            b3_jump <= '0';
                        else
                            b3_valid <= validLast2;  
                            b3_jump <= '0';
                        end if;
                    end if;
                when send_fillers => -- send filler bits with high LLR value according to the rules defined with the configuration registers. 
                    LDPC_aconf := '0';
                    LDPC_conf := '0';
                    LDPC_conf2 := '0';
                    b3_jump <= '0';
                    if demapperDone = '1' then
                        b3_extraRe <= '1';
                    end if;
                    b3_rstn_LDPC <= '1';
                    b3_last <= '0';
                    b3_valid <= (others => '1');
                    if b3_ready = '1' then
                        if b3_countF = to_integer(unsigned(Fm1)) then
                            b3_countF <= 0;
                            b3_fillDone <= '1';
                            b3_valid <= validFirst2; --(others => '1');
                            b3_jump <= jumpFirst2_s;
                            if b3_realDone = '0' then
                                b3_state <= send_bit1;
                            else
                                b3_state <= send_bit2;
                            end if;
                        else
                            b3_countF <= b3_countF + 1;
                        end if;
                    end if;
                when send_zeros => -- apend zeros at the tail of the codeword to match the codeword length. At the end sends the tlast flag the starts again (if not finished), else return to idle.
                    LDPC_aconf := '0';
                    LDPC_conf := '0';
                    LDPC_conf2 := '0';
                    b3_jump <= '0';
                    b3_extraRe <= '0';
                    b3_rstn_LDPC <= '1';
                    if b3_ready = '1' then
                        if b3_count < to_integer(unsigned(FZ))-1 then
                            b3_valid <= (others => '1');
                            b3_count <= b3_count + 1;
                            b3_last <= '0';
                        elsif b3_count = to_integer(unsigned(FZ))-1 then
                            b3_valid <= validLastZeros; 
                            b3_count <= b3_count + 1;
                            b3_last <= '1';
                        else
                            b3_last <= '0';
                            b3_realDone <= '0';
                            b3_imagDone <= '0';
                            b3_fillDone <= '0';
                            b3_count <= 0;
                            if b3_countC = to_integer(unsigned(Cm1)) then
                                b3_valid <= (others => '0'); 
                                b3_countC <= 0;
                                b3_state <= idle;
                            else
                                b3_countC <= b3_countC + 1; 
                                b3_state <= send_punctured;
                                b3_valid <= (others => '1'); 
                            end if;
                        end if;
                    end if;
            end case;
        end if;
    end if;
end process;

with b3_state select b3_dataOut <=
    b2_dataRe when send_bit1,
    b2_dataIm when send_bit2,
    x"E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1" when send_fillers,
    (others => '0') when others;

process(b2_validRe,b2_validIm,b3_state,b3_valid,b3_ready)
begin
    for ii in 0 to 15 loop
        if b3_state = send_bit1 then
            b3_valid_r(ii) <= b3_valid(ii) and b2_validRe;
        elsif b3_state = send_bit2 then
            b3_valid_r(ii) <= b3_valid(ii) and b2_validIm;
        else
            b3_valid_r(ii) <= b3_valid(ii);
        end if;
    end loop;
    
    if b3_ready = '1' and b2_validRe = '1' and b3_valid(b3_valid'high) ='1' and b3_state = send_bit1 then
        b3_readRe <= '1';
    else
        b3_readRe <= '0';
    end if;

    if b3_ready = '1' and b2_validIm = '1' and b3_valid(b3_valid'high) ='1' and b3_state = send_bit2 then
        b3_readIm <= '1';
    else
        b3_readIm <= '0';
    end if;
end process;

b3_validOut_r <= or_reduce(b3_valid_r);
b3_dataOut_r <= b3_dataOut & b3_valid_r;
b3_ready <= b3_readyOut_r;
b3_lastOut_r <= b3_last;

B4_REG2: axis_register_slice_1
port map (  aclk => clk,
            aresetn => rstn,
            s_axis_tvalid => b3_validOut_r,
            s_axis_tready => b3_readyOut_r,
            s_axis_tdata => b3_dataOut_r,
            s_axis_tlast => b3_lastOut_r,
            m_axis_tvalid => b3_validOut_r2,
            m_axis_tready => b3_readyOut_r2,
            m_axis_tdata => b3_dataOut_r2,
            m_axis_tlast => b3_lastOut_r2
);

b4_validIn <= b3_dataOut_r2(15 downto 0);
b4_dataIn <= b3_dataOut_r2(127+16 downto 0+16);

process(b4_dataIn,b4_validIn)
begin
    if b4_validIn(0) = '1' then
        b4_dataOut_s <= b4_dataIn; 
    elsif b4_validIn(1) = '1' then
        b4_dataOut_s(127-8 downto 0) <= b4_dataIn(127 downto 8); 
        b4_dataOut_s(127 downto 127-8+1) <= b4_dataIn(127 downto 127-8+1); 
    elsif b4_validIn(2) = '1' then
        b4_dataOut_s(127-8*2 downto 0) <= b4_dataIn(127 downto 8*2); 
        b4_dataOut_s(127 downto 127-8*2+1) <= b4_dataIn(127 downto 127-8*2+1); 
    elsif b4_validIn(3) = '1' then
        b4_dataOut_s(127-8*3 downto 0) <= b4_dataIn(127 downto 8*3); 
        b4_dataOut_s(127 downto 127-8*3+1) <= b4_dataIn(127 downto 127-8*3+1); 
    elsif b4_validIn(4) = '1' then
        b4_dataOut_s(127-8*4 downto 0) <= b4_dataIn(127 downto 8*4); 
        b4_dataOut_s(127 downto 127-8*4+1) <= b4_dataIn(127 downto 127-8*4+1); 
    elsif b4_validIn(5) = '1' then
        b4_dataOut_s(127-8*5 downto 0) <= b4_dataIn(127 downto 8*5); 
        b4_dataOut_s(127 downto 127-8*5+1) <= b4_dataIn(127 downto 127-8*5+1); 
    elsif b4_validIn(6) = '1' then
        b4_dataOut_s(127-8*6 downto 0) <= b4_dataIn(127 downto 8*6); 
        b4_dataOut_s(127 downto 127-8*6+1) <= b4_dataIn(127 downto 127-8*6+1); 
    elsif b4_validIn(7) = '1' then
        b4_dataOut_s(127-8*7 downto 0) <= b4_dataIn(127 downto 8*7); 
        b4_dataOut_s(127 downto 127-8*7+1) <= b4_dataIn(127 downto 127-8*7+1); 
    elsif b4_validIn(8) = '1' then
        b4_dataOut_s(127-8*8 downto 0) <= b4_dataIn(127 downto 8*8); 
        b4_dataOut_s(127 downto 127-8*8+1) <= b4_dataIn(127 downto 127-8*8+1); 
    elsif b4_validIn(9) = '1' then
        b4_dataOut_s(127-8*9 downto 0) <= b4_dataIn(127 downto 8*9); 
        b4_dataOut_s(127 downto 127-8*9+1) <= b4_dataIn(127 downto 127-8*9+1); 
    elsif b4_validIn(10) = '1' then
        b4_dataOut_s(127-8*10 downto 0) <= b4_dataIn(127 downto 8*10); 
        b4_dataOut_s(127 downto 127-8*10+1) <= b4_dataIn(127 downto 127-8*10+1); 
    elsif b4_validIn(11) = '1' then
        b4_dataOut_s(127-8*11 downto 0) <= b4_dataIn(127 downto 8*11); 
        b4_dataOut_s(127 downto 127-8*11+1) <= b4_dataIn(127 downto 127-8*11+1); 
    elsif b4_validIn(12) = '1' then
        b4_dataOut_s(127-8*12 downto 0) <= b4_dataIn(127 downto 8*12); 
        b4_dataOut_s(127 downto 127-8*12+1) <= b4_dataIn(127 downto 127-8*12+1); 
    elsif b4_validIn(13) = '1' then
        b4_dataOut_s(127-8*13 downto 0) <= b4_dataIn(127 downto 8*13); 
        b4_dataOut_s(127 downto 127-8*13+1) <= b4_dataIn(127 downto 127-8*13+1); 
    elsif b4_validIn(14) = '1' then
        b4_dataOut_s(127-8*14 downto 0) <= b4_dataIn(127 downto 8*14); 
        b4_dataOut_s(127 downto 127-8*14+1) <= b4_dataIn(127 downto 127-8*14+1); 
    --elsif b4_validIn(15) = '1' then
    else
        b4_dataOut_s(127-8*15 downto 0) <= b4_dataIn(127 downto 8*15); 
        b4_dataOut_s(127 downto 127-8*15+1) <= b4_dataIn(127 downto 127-8*15+1); 
    end if;
end process;
process(b4_validIn)
begin
    case b4_validIn is
        when "1111111111111111"                      => b4_validOut_s <= x"10";
        when "0111111111111111" | "1111111111111110" => b4_validOut_s <= x"0F";
        when "0011111111111111" | "1111111111111100" => b4_validOut_s <= x"0E";
        when "0001111111111111" | "1111111111111000" => b4_validOut_s <= x"0D";
        when "0000111111111111" | "1111111111110000" => b4_validOut_s <= x"0C";
        when "0000011111111111" | "1111111111100000" => b4_validOut_s <= x"0B";
        when "0000001111111111" | "1111111111000000" => b4_validOut_s <= x"0A";
        when "0000000111111111" | "1111111110000000" => b4_validOut_s <= x"09";
        when "0000000011111111" | "1111111100000000" => b4_validOut_s <= x"08";
        when "0000000001111111" | "1111111000000000" => b4_validOut_s <= x"07";
        when "0000000000111111" | "1111110000000000" => b4_validOut_s <= x"06";
        when "0000000000011111" | "1111100000000000" => b4_validOut_s <= x"05";
        when "0000000000001111" | "1111000000000000" => b4_validOut_s <= x"04";
        when "0000000000000111" | "1110000000000000" => b4_validOut_s <= x"03";
        when "0000000000000011" | "1100000000000000" => b4_validOut_s <= x"02";
        when "0000000000000001" | "1000000000000000" => b4_validOut_s <= x"01";
        when others => b4_validOut_s <= x"00";
    end case;
end process;

-- TEMP OUTPUTS
process(clk)
begin
    if rising_edge(clk) then
        validOutRateAdap <= (others => '0');
        dataOutRateAdap <= (others => '0');
        if b3_readyOut_r2 = '1' and or_reduce(b3_valid) = '1' then
            validOutRateAdap <= b4_validOut_s;
            dataOutRateAdap <= b4_dataOut_s;
        end if;
    end if;
end process;
--

b4_data <= b4_dataOut_s & b4_validOut_s;
b4_valid <= or_reduce(b4_validOut_s);
b4_last <= b3_lastOut_r2;

B4_REG1: axis_register_slice_0
port map (  aclk => clk,
            aresetn => rstn,
            s_axis_tvalid => b4_valid,
            s_axis_tready => b3_readyOut_r2,
            s_axis_tdata => b4_data,
            s_axis_tlast => b4_last,
            m_axis_tvalid => b4_valid_r,
            m_axis_tready => b5_ready,
            m_axis_tdata => b4_data_r,
            m_axis_tlast => b4_last_r
);

--b4_Wdata <= b3_valid_rs;
--b4_Wvalid <= or_reduce(b3_valid_rs);
--b4_Wlast <= b3_last;

vt_single_sync_rst: vt_single_sync
port map(
	clk	=> core_clk,
	port_i => b3_rstn_LDPC,
	port_o => b5_rstn_LDPC_s
);

b5_LDPCblock: sd_fec_0 
port map(
    reset_n => b5_rstn_LDPC_s,  
    core_clk => core_clk,
    s_axi_aclk => clk,
    s_axi_awaddr => "000000000000010000", -- from the example
    s_axi_awvalid => b5_s_axi_awvalid,
    s_axi_awready => b5_s_axi_awready,
    s_axi_wdata => x"0000003F", -- from the example
    s_axi_wvalid => b5_s_axi_wvalid,
    s_axi_wready => b5_s_axi_wready,
    s_axi_bready => b5_s_axi_bready,
    s_axi_bvalid => b5_s_axi_bvalid,
    s_axi_araddr => (others => '0'),
    s_axi_arvalid => '0',
    s_axi_arready => open,
    s_axi_rready => '0',
    s_axi_rdata => open,
    s_axi_rvalid => open,
    interrupt => b5_interrupt,
    --
    s_axis_din_words_aclk => clk,
    s_axis_din_words_tready => open,
    s_axis_din_words_tvalid => b4_valid_r,
    s_axis_din_words_tlast => b4_last_r,
    s_axis_din_words_tdata => b4_data_r(7 downto 0),
    --
    s_axis_ctrl_aclk => clk,
    s_axis_ctrl_tready => b5_s_axi_Ctlready,
    s_axis_ctrl_tvalid => b5_s_axi_Ctlvalid,
    s_axis_ctrl_tdata => b5_s_axi_ctrldata,  
    --
    s_axis_din_aclk => clk,
    s_axis_din_tready => b5_ready, 
    s_axis_din_tvalid => b4_valid_r,
    s_axis_din_tlast => b4_last_r,
    s_axis_din_tdata => b4_data_r(127+8 downto 0+8),
    --
    m_axis_status_aclk => clk,
    m_axis_status_tready => '1',
    m_axis_status_tvalid => b5_m_axis_status_tvalid,
    m_axis_status_tdata => b5_m_axis_status_tdata,
    m_axis_dout_aclk => clk,
    m_axis_dout_tready => '1',
    m_axis_dout_tvalid => b5_validOut,
    m_axis_dout_tlast => b5_lastOut,
    m_axis_dout_tdata => b5_dataOut
);

dataOutHD <= b5_dataOut(63 downto 0);
validOutHD <= b5_validOut;

--        lastOutHD : out std_logic;
--        readyOutHD : out std_logic;
--        dataOutStatus : out std_logic_vector(39 downto 0);
--        validOutStatus : out std_logic

--b6: triggerOut generation
process(clk)
begin
    if rising_edge(clk) then 
        if rstn = '0' then
            b6_triggerOut <= '0';
        else
            if triggerIn = '1' then
                b6_triggerOut <= '1';
            elsif b5_validOut = '1' then
                b6_triggerOut <= '0';
            end if;
        end if;
    end if;
end process;

triggerOut <= b6_triggerOut;

--ila_blk: ila_0
--port map(
--    clk => clk,
--    probe0(0) => triggerIn,
--    probe1(0) => b5_s_axi_wvalid,
--    probe2 => b4_data_r(7 downto 0),
--    probe3(0) => b4_valid_r,
--    probe4 => b4_data_r(127+8 downto 0+8),
--    probe5(0) => b3_rstn_LDPC,
--    probe6 => b5_s_axi_ctrldata,
--    probe7(0) => b5_s_axi_Ctlvalid,
--    probe8 => b5_m_axis_status_tdata,
--    probe9(0) => b5_m_axis_status_tvalid,
--    probe10 => b5_dataOut(63 downto 0),
--    probe11(0) => b5_validOut
--);

end Behavioral;
