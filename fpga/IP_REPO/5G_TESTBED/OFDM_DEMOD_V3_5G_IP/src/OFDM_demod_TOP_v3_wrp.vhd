----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2022 11:33:45 AM
-- Design Name: 
-- Module Name: OFDM_demod_TOP_v2_wrp - Behavioral
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

entity OFDM_demod_TOP_v3_wrp is
generic (
    -- Parameters of Axi Slave Bus Interface S00_AXI
    C_S00_AXI_DATA_WIDTH	: integer	:= 32;
    C_S00_AXI_ADDR_WIDTH	: integer	:= 4;
    -- Parameters of Axi Slave Bus Interface S00_AXIS
    C_S00_AXIS_TDATA_WIDTH	: integer	:= 32;
    -- Parameters of Axi Slave Bus Interface S01_AXIS
    C_S01_AXIS_TDATA_WIDTH	: integer	:= 32;
    -- Parameters of Axi Master Bus Interface M00_AXIS
    C_M00_AXIS_TDATA_WIDTH	: integer	:= 32;
    -- Parameters of Axi Master Bus Interface M01_AXIS
    C_M01_AXIS_TDATA_WIDTH	: integer	:= 32
);
Port ( 
--    aclk : in std_logic;
--    aresetn : in std_logic;
--    axi_lite_aclk	: in std_logic;
--    axi_lite_aresetn	: in std_logic;
    --
    GlobalStart : in std_logic;
    countSCOut : out std_logic_vector(11 downto 0);
    countOFDMOut : out std_logic_vector(4 downto 0);
    fifoErrorOut : out std_logic;
    triggerOut : out std_logic;
--
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
    s00_axis_aclk	: in std_logic;
    s00_axis_aresetn	: in std_logic;
    s00_axis_tready	: out std_logic;
    s00_axis_tdata	: in std_logic_vector(C_S00_AXIS_TDATA_WIDTH-1 downto 0);
    s00_axis_tkeep	: in std_logic_vector(C_S00_AXIS_TDATA_WIDTH/8-1 downto 0);
    s00_axis_tlast	: in std_logic;
    s00_axis_tvalid	: in std_logic;
    --
    s01_axis_aclk	: in std_logic;
    s01_axis_aresetn	: in std_logic;
    s01_axis_tready	: out std_logic;
    s01_axis_tdata	: in std_logic_vector(C_S01_AXIS_TDATA_WIDTH-1 downto 0);
    s01_axis_tkeep	: in std_logic_vector(C_S01_AXIS_TDATA_WIDTH/8-1 downto 0);
    s01_axis_tlast	: in std_logic;
    s01_axis_tvalid	: in std_logic;
    --
    m00_axis_aclk	: in std_logic;
    m00_axis_aresetn	: in std_logic;
    m00_axis_tvalid	: out std_logic;
    m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
    m00_axis_tkeep	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH/8-1 downto 0);
    m00_axis_tlast	: out std_logic;
    m00_axis_tready	: in std_logic;
    --
    m01_axis_aclk	: in std_logic;
    m01_axis_aresetn	: in std_logic;
    m01_axis_tvalid	: out std_logic;
    m01_axis_tdata	: out std_logic_vector(C_M01_AXIS_TDATA_WIDTH-1 downto 0);
    m01_axis_tkeep	: out std_logic_vector(C_M01_AXIS_TDATA_WIDTH/8-1 downto 0);
    m01_axis_tlast	: out std_logic;
    m01_axis_tready	: in std_logic
);
end OFDM_demod_TOP_v3_wrp;

architecture Behavioral of OFDM_demod_TOP_v3_wrp is

component OFDM_DEMOD_AXI_LITE is
    generic (
    C_S_AXI_DATA_WIDTH	: integer	:= 32;
    C_S_AXI_ADDR_WIDTH	: integer	:= 4
    );
    port (
    R1  	        : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    R2  	        : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    R3  	        : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_ACLK	    : in std_logic;
    S_AXI_ARESETN	: in std_logic;
    S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
    S_AXI_AWVALID	: in std_logic;
    S_AXI_AWREADY	: out std_logic;
    S_AXI_WDATA	    : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_WSTRB	    : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    S_AXI_WVALID	: in std_logic;
    S_AXI_WREADY	: out std_logic;
    S_AXI_BRESP	    : out std_logic_vector(1 downto 0);
    S_AXI_BVALID	: out std_logic;
    S_AXI_BREADY	: in std_logic;
    S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
    S_AXI_ARVALID	: in std_logic;
    S_AXI_ARREADY	: out std_logic;
    S_AXI_RDATA	    : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    S_AXI_RRESP	    : out std_logic_vector(1 downto 0);
    S_AXI_RVALID	: out std_logic;
    S_AXI_RREADY	: in std_logic
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

component OFDM_demod_TOP_v3 is
--Generic ( SSR : integer := 2
--);
Port (  clk : in std_logic;
        rstn : in std_logic;
        GlobalStart : in std_logic;
        --
        dataIn_re : in std_logic_vector(2*16-1 downto 0); -- s[16 15]
        dataIn_im : in std_logic_vector(2*16-1 downto 0); -- s[16 15]
        validIn : in std_logic;
        triggerIn : in std_logic;
        triggerIn_TEMP : in std_logic;
        --
        cpLengths : in std_logic_vector(17 downto 0);
        numOFDMSyms : in std_logic_vector(6 downto 0);
        nullFirst : in std_logic_vector(11 downto 0); -- Index of the first null subcarrier = Num Data subcarriers (no fftshift)
        nullLast : in std_logic_vector(11 downto 0); -- NumDataSC/2 + NumNullSC - 1 (no fftshift)  
        --
        countSCOut : out std_logic_vector(11 downto 0);
        countOFDMOut : out std_logic_vector(4 downto 0);
        fifoErrorOut : out std_logic;
        triggerOut : out std_logic;
        dataOut_re : out std_logic_vector(2*16-1 downto 0); -- s[16 10] (when configFFT = "0000001010101011")
        dataOut_im : out std_logic_vector(2*16-1 downto 0); -- s[16 10] (when configFFT = "0000001010101011")
        lastOut : out std_logic;
        validOut : out std_logic
);
end component;

--b0:
signal b0_R1, b0_R2, b0_R3 : std_logic_vector(31 downto 0);
signal b0_R1_s, b0_R2_s, b0_R3_s : std_logic_vector(31 downto 0);

--b1:
signal b1_dataOut_re, b1_dataOut_im : std_logic_vector(2*16-1 downto 0);
signal b1_validOut, b1_lastOut : std_logic;
signal b1_triggerOut : std_logic;

signal axi_lite_aclk, aclk : std_logic;
signal axi_lite_aresetn, aresetn : std_logic;

signal triggerIn_TEMP2 : std_logic;

begin

axi_lite_aclk <= s00_axi_aclk;
axi_lite_aresetn <= s00_axi_aresetn;
aclk <= s00_axis_aclk;
aresetn <= s00_axis_aresetn;

-- Instantiation of Axi Bus Interface S00_AXI
b0: OFDM_DEMOD_AXI_LITE
generic map (
    C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
    C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
)
port map (
    R1	=> b0_R1,
    R2	=> b0_R2,
    R3	=> b0_R3,
    S_AXI_ACLK => axi_lite_aclk,
    S_AXI_ARESETN => axi_lite_aresetn,
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

b0_sync1: for I in 0 to 31 generate
    vt_single_sync_inst_1 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => aclk,
        port_i => b0_R1(I),
        port_o => b0_R1_s(I)
    );
end generate;

b0_sync2: for I in 0 to 31 generate
    vt_single_sync_inst_1 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => aclk,
        port_i => b0_R2(I),
        port_o => b0_R2_s(I)
    );
end generate;

b0_sync3: for I in 0 to 31 generate
    vt_single_sync_inst_1 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => aclk,
        port_i => b0_R3(I),
        port_o => b0_R3_s(I)
    );
end generate;

triggerIn_TEMP2 <= GlobalStart and s00_axis_tdata(0);

b1: OFDM_demod_TOP_v3
Port map(   clk => aclk,
            rstn => aresetn,
            GlobalStart => GlobalStart,
            --
            dataIn_re => s00_axis_tdata,
            dataIn_im => s01_axis_tdata,
            validIn => s00_axis_tvalid,
            triggerIn => s00_axis_tdata(0),
            triggerIn_TEMP => triggerIn_TEMP2,
            --
            cpLengths => b0_R1_s(18-1 downto 0),
            numOFDMSyms => b0_R1_s(6+18 downto 0+18),
            nullFirst => b0_R2_s(12-1 downto 0),
            nullLast => b0_R2_s(12-1+12 downto 0+12),
            --
            countSCOut => countSCOut,
            countOFDMOut => countOFDMOut,
            fifoErrorOut => fifoErrorOut,
            --
            dataOut_re => b1_dataOut_re,
            dataOut_im => b1_dataOut_im,
            triggerOut => b1_triggerOut,
            lastOut => b1_lastOut,
            validOut => b1_validOut
);

--m00_axis_tdata <= b1_dataOut_re(16-1 downto 1) & b1_triggerOut;
m00_axis_tdata <= b1_dataOut_re(2*16-1 downto 17) & b1_triggerOut & b1_dataOut_re(16-1 downto 1) & b1_triggerOut;
m01_axis_tdata <= b1_dataOut_im;
m00_axis_tvalid <= b1_validOut;
m01_axis_tvalid <= b1_validOut;
m00_axis_tkeep <= (others => '1');
m01_axis_tkeep <= (others => '1');
m00_axis_tlast <= b1_lastOut;
m01_axis_tlast <= b1_lastOut;
s00_axis_tready <= '1';
s01_axis_tready <= '1';
triggerOut <= b1_triggerOut;

end Behavioral;
