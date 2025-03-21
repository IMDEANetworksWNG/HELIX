----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/02/2023 04:39:04 PM
-- Design Name: 
-- Module Name: OFDM_mod_top_wrp - Behavioral
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

entity OFDM_mod_top_wrp is
generic (
    -- Parameters of Axi Slave Bus Interface S00_AXI
    C_S00_AXI_DATA_WIDTH	: integer	:= 32;
    C_S00_AXI_ADDR_WIDTH	: integer	:= 4;
    -- Parameters of Axi Slave Bus Interface S00_AXIS
    C_S00_AXIS_TDATA_WIDTH	: integer	:= 64;
    -- Parameters of Axi Master Bus Interface M00_AXIS
    C_M00_AXIS_TDATA_WIDTH	: integer	:= 64
);
Port ( 
    aclk : in std_logic;
    aresetn	: in std_logic;
    
    s00_axi_aclk	: in std_logic;
    s00_axi_aresetn	: in std_logic;
    s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
    s00_axi_awprot	: in std_logic_vector(2 downto 0);
    s00_axi_awvalid	: in std_logic;
    s00_axi_awready	: out std_logic;
    s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
    s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
    s00_axi_wvalid	: in std_logic;
    s00_axi_wready	: out std_logic;
    s00_axi_bresp	: out std_logic_vector(1 downto 0);
    s00_axi_bvalid	: out std_logic;
    s00_axi_bready	: in std_logic;
    s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
    s00_axi_arprot	: in std_logic_vector(2 downto 0);
    s00_axi_arvalid	: in std_logic;
    s00_axi_arready	: out std_logic;
    s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
    s00_axi_rresp	: out std_logic_vector(1 downto 0);
    s00_axi_rvalid	: out std_logic;
    s00_axi_rready	: in std_logic;
    --
    triggerIn       : in std_logic;
    --s00_axis_aclk	: in std_logic;
    --s00_axis_aresetn : in std_logic;
    s00_axis_tready	: out std_logic;
    s00_axis_tdata	: in std_logic_vector(C_S00_AXIS_TDATA_WIDTH-1 downto 0);
    s00_axis_tkeep	: in std_logic_vector(8-1 downto 0);
    s00_axis_tlast	: in std_logic;
    s00_axis_tvalid	: in std_logic;
    --
    triggerOut      : out std_logic;
    busyOut         : out std_logic;
    m00_axis_tvalid	: out std_logic;
    m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
    m00_axis_tkeep	: out std_logic_vector(8-1 downto 0);
    m00_axis_tlast	: out std_logic;
    m00_axis_tready	: in std_logic--;
--    -- TEMP
--    sendData : in std_logic;
--    m01_axis_tvalid	: out std_logic;
--    m01_axis_tdata	: out std_logic_vector(256-1 downto 0);
--    m01_axis_tkeep	: out std_logic_vector(256/8-1 downto 0);
--    m01_axis_tlast	: out std_logic;
--    m01_axis_tready	: in std_logic
);
end OFDM_mod_top_wrp;

architecture Behavioral of OFDM_mod_top_wrp is

-- component declaration
component OFDM_mod_AXI_LITE is
    generic (
    C_S_AXI_DATA_WIDTH	: integer	:= 32;
    C_S_AXI_ADDR_WIDTH	: integer	:= 4
    );
    port (
    R1	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    R2	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    R3  : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_ACLK	: in std_logic;
    S_AXI_ARESETN	: in std_logic;
    S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
    S_AXI_AWVALID	: in std_logic;
    S_AXI_AWREADY	: out std_logic;
    S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    S_AXI_WVALID	: in std_logic;
    S_AXI_WREADY	: out std_logic;
    S_AXI_BRESP	: out std_logic_vector(1 downto 0);
    S_AXI_BVALID	: out std_logic;
    S_AXI_BREADY	: in std_logic;
    S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
    S_AXI_ARVALID	: in std_logic;
    S_AXI_ARREADY	: out std_logic;
    S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_RRESP	: out std_logic_vector(1 downto 0);
    S_AXI_RVALID	: out std_logic;
    S_AXI_RREADY	: in std_logic
    );
end component OFDM_mod_AXI_LITE;

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

component FFT_mod_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        triggerIn : in std_logic;
        dataIn_re : in std_logic_vector(31 downto 0);
        dataIn_im : in std_logic_vector(31 downto 0);
        validIn : in std_logic;
        readyIn : out std_logic;
        cpLengths : in std_logic_vector(9*2-1 downto 0);
        numOFDMSyms : in std_logic_vector(6 downto 0);
        numDataSC_div2 : in std_logic_vector(9 downto 0);
        numNullSC_div2 : in std_logic_vector(9 downto 0);
        triggerOut : out std_logic;
        dataOut_re : out std_logic_vector(31 downto 0);
        dataOut_im : out std_logic_vector(31 downto 0);
        validOut : out std_logic;
        readyOut : in std_logic;
        lastOut : out std_logic
);
end component;

component OFDMmod_OutFIFO is
Port (  s_axis_aresetn : in std_logic;
        s_axis_aclk : in std_logic;
        s_axis_tvalid : in std_logic;
        s_axis_tready : out std_logic;
        s_axis_tdata : in std_logic_vector(63+8 downto 0);
        s_axis_tlast : in std_logic;
        m_axis_tvalid : out std_logic;
        m_axis_tready : in std_logic;
        m_axis_tdata : out std_logic_vector(63+8 downto 0);
        m_axis_tlast : out std_logic;
        prog_full : out std_logic
);
end component;

signal CP_lengths : std_logic_vector(9*2-1 downto 0);
signal numOFDMSyms : std_logic_vector(6 downto 0);
signal numDataSC_div2 : std_logic_vector(9 downto 0);
signal numNullSC_div2 : std_logic_vector(9 downto 0);
signal symPerSlot : integer;

signal R1, R2, R3 : std_logic_vector(31 downto 0);
signal R1_s, R2_s, R3_s : std_logic_vector(31 downto 0);

signal b2_dataIn_re, b2_dataIn_im : std_logic_vector(31 downto 0);
signal b2_validIn, b2_readyIn, b2_triggerIn : std_logic;
signal b2_dataOut_re, b2_dataOut_im : std_logic_vector(31 downto 0);
signal b2_validOut, b2_readyOut, b2_readyOut_s, b2_triggerOut, b2_lastOut : std_logic;
signal b2_dataOut : std_logic_vector(63+8 downto 0);

signal b3_dataOut : std_logic_vector(63+8 downto 0);
signal b3_validOut, b3_readyOut, b3_lastOut, b3_triggerOut, b3_prog_full : std_logic;

signal tempdataOut : std_logic_vector(256-1 downto 0);

signal triggerCount : integer range 0 to 3;

begin

-- Instantiation of Axi Bus Interface S00_AXI
b0: OFDM_mod_AXI_LITE
generic map (
    C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
    C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
)
port map (
    R1	=> R1,
    R2 => R2,
    R3 => R3,
    S_AXI_ACLK => s00_axi_aclk,
    S_AXI_ARESETN => s00_axi_aresetn,
    S_AXI_AWADDR => s00_axi_awaddr,
    S_AXI_AWPROT => s00_axi_awprot,
    S_AXI_AWVALID => s00_axi_awvalid,
    S_AXI_AWREADY => s00_axi_awready,
    S_AXI_WDATA	=> s00_axi_wdata,
    S_AXI_WSTRB	=> s00_axi_wstrb,
    S_AXI_WVALID => s00_axi_wvalid,
    S_AXI_WREADY => s00_axi_wready,
    S_AXI_BRESP	=> s00_axi_bresp,
    S_AXI_BVALID => s00_axi_bvalid,
    S_AXI_BREADY => s00_axi_bready,
    S_AXI_ARADDR => s00_axi_araddr,
    S_AXI_ARPROT => s00_axi_arprot,
    S_AXI_ARVALID	=> s00_axi_arvalid,
    S_AXI_ARREADY	=> s00_axi_arready,
    S_AXI_RDATA	=> s00_axi_rdata,
    S_AXI_RRESP	=> s00_axi_rresp,
    S_AXI_RVALID	=> s00_axi_rvalid,
    S_AXI_RREADY	=> s00_axi_rready
);

b1_fg1: for I in 0 to 31 generate
    vt_single_sync_inst_1 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => aclk,
        port_i => R1(I),
        port_o => R1_s(I)
    );
    
    vt_single_sync_inst_2   : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => aclk,
        port_i => R2(I),
        port_o => R2_s(I)
    );    
    
    vt_single_sync_inst_3 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => aclk,
        port_i => R3(I),
        port_o => R3_s(I)
    );
end generate b1_fg1;

b2_dataIn_re <= s00_axis_tdata(31 downto 0);
b2_dataIn_im <= s00_axis_tdata(63 downto 32);
b2_validIn <= s00_axis_tvalid;
s00_axis_tready <= b2_readyIn;
b2_triggerIn <= triggerIn;

CP_lengths <= R1_s(17 downto 0);
numOFDMSyms <= R1_s(18+6 downto 18);
numDataSC_div2 <= R2_s(9 downto 0);
numNullSC_div2 <= R2_s(10+9 downto 10);

b2: FFT_mod_top
Port map(   clk => aclk,
            rstn => aresetn,
            --
            dataIn_re => b2_dataIn_re,
            dataIn_im => b2_dataIn_im,
            validIn => b2_validIn,
            readyIn => b2_readyIn,
            triggerIn => b2_triggerIn,
            --
            cpLengths => CP_lengths,
            numOFDMSyms => numOFDMSyms,
            numDataSC_div2 => numDataSC_div2,
            numNullSC_div2 => numNullSC_div2,
            --
            triggerOut => b2_triggerOut,
            dataOut_re => b2_dataOut_re,
            dataOut_im => b2_dataOut_im,
            validOut => b2_validOut,
            readyOut => b2_readyOut,
            lastOut => b2_lastOut
);

------------------ NEW ------------------------------

b2_readyOut <= not b3_prog_full;
b2_dataOut <= "0000000" & b2_triggerOut & b2_dataOut_im & b2_dataOut_re;
OutFIFO: OFDMmod_OutFIFO
Port Map (  s_axis_aresetn => aresetn,
            s_axis_aclk => aclk,
            s_axis_tvalid => b2_validOut,
            s_axis_tready => b2_readyOut_s,
            s_axis_tdata => b2_dataOut,
            s_axis_tlast => b2_lastOut,
            m_axis_tvalid => b3_validOut,
            m_axis_tready => b3_readyOut,
            m_axis_tdata => b3_dataOut,
            m_axis_tlast => b3_lastOut,
            prog_full => b3_prog_full
);

m00_axis_tvalid <= b3_validOut;
m00_axis_tdata  <= b3_dataOut(63 downto 0);
m00_axis_tkeep  <= (others => '1');
m00_axis_tlast  <= b3_lastOut;
b3_readyOut <= m00_axis_tready;
triggerOut <= b3_dataOut(64);

process(aclk)
begin
    if rising_edge(aclk) then
        if aresetn = '0' then
            busyOut <= '0';
        else
            if triggerIn = '1' and b2_validIn = '1' then
                triggerCount <= triggerCount + 1;
            elsif b3_lastOut = '1' and b3_validOut = '1' then
                triggerCount <= triggerCount - 1;
            end if;         
            if triggerCount > 0 then
                 busyOut <= '1';
            else
                busyOut <= '0';
            end if;
        end if;
    end if;
end process;

------------------ END NEW ------------------------------

--m00_axis_tvalid <= b2_validOut;
--m00_axis_tdata  <= b2_dataOut_im & b2_dataOut_re;
--m00_axis_tkeep  <= (others => '1');
--m00_axis_tlast  <= b2_lastOut;
--b2_readyOut <= m00_axis_tready;
--triggerOut <= b2_triggerOut;

--process(aclk)
--begin
--    if rising_edge(aclk) then
--        if aresetn = '0' then
--            busyOut <= '0';
--        else
--            if triggerIn = '1' and b2_validIn = '1' then
--                triggerCount <= triggerCount + 1;
--            elsif b2_lastOut = '1' and b2_validOut = '1' then
--                triggerCount <= triggerCount - 1;
--            end if;         
--            if triggerCount > 0 then
--                 busyOut <= '1';
--            else
--                busyOut <= '0';
--            end if;
--        end if;
--    end if;
--end process;

end Behavioral;
