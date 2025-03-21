----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2023 10:45:10 AM
-- Design Name: 
-- Module Name: LDPCdecoder_top_wrp - Behavioral
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

entity LDPCdecoder_top_wrp is
generic (   -- Parameters of Axi Slave Bus Interface S00_AXI
            C_S00_AXI_DATA_WIDTH	: integer	:= 32;
            C_S00_AXI_ADDR_WIDTH	: integer	:= 5;
            -- Parameters of Axi Slave Bus Interface S00_AXIS
            C_S00_AXIS_TDATA_WIDTH	: integer	:= 32;
            -- Parameters of Axi Slave Bus Interface S01_AXIS
            C_S01_AXIS_TDATA_WIDTH	: integer	:= 32;
            -- Parameters of Axi Master Bus Interface M00_AXIS
            C_M00_AXIS_TDATA_WIDTH	: integer	:= 32;
            -- Parameters of Axi Master Bus Interface M01_AXIS
            C_M01_AXIS_TDATA_WIDTH	: integer	:= 32
);
Port (  coreClk : in std_logic;
        triggerIn : in std_logic;
        demapperDone : in std_logic;
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
end LDPCdecoder_top_wrp;

architecture Behavioral of LDPCdecoder_top_wrp is

component LDPCdecoder_top is
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
end component;

component LDPCdecoder_AXI_LITE is
generic (
    C_S_AXI_DATA_WIDTH	: integer	:= 32;
    C_S_AXI_ADDR_WIDTH	: integer	:= 5
);
port (
    R0  	        : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    R1  	        : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    R2  	        : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    R3  	        : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    R4  	        : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    R5  	        : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    R6  	        : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    R7  	        : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
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

--Signals
signal b0_R0, b0_R1, b0_R2, b0_R3, b0_R4, b0_R5, b0_R6, b0_R7 : std_logic_vector(31 downto 0);
signal b0_R0_s, b0_R1_s, b0_R2_s, b0_R3_s, b0_R4_s, b0_R5_s, b0_R6_s, b0_R7_s : std_logic_vector(31 downto 0);
signal validIn : std_logic_vector(1 downto 0);
signal RuleFirst1, RuleLastPunctured : std_logic_vector(11 downto 0);
signal LDPC_Ctrl_1, LDPC_Ctrl_2, LDPC_Ctrl_3 : std_logic_vector(39 downto 0);
signal dataOutHD : std_logic_vector(63 downto 0);
signal validOutHD : std_logic;
signal lastOutHD : std_logic;
signal readyOutHD : std_logic;
signal dataOutStatus : std_logic_vector(39 downto 0);
signal validOutStatus : std_logic;

begin

s00_axis_tready <= '1';
s01_axis_tready <= '1';

-- Instantiation of Axi Bus Interface S00_AXI
b0: LDPCdecoder_AXI_LITE
generic map (
    C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
    C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
)
port map (
    R0	=> b0_R0,
    R1	=> b0_R1,
    R2	=> b0_R2,
    R3	=> b0_R3,
    R4	=> b0_R4,
    R5	=> b0_R5,
    R6	=> b0_R6,
    R7	=> b0_R7,
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

vt_single_sync_gen: for I in 0 to 31 generate

    vt_single_sync_inst_0 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => s00_axis_aclk,
        port_i => b0_R0(I),
        port_o => b0_R0_s(I)
    );

    vt_single_sync_inst_1 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => s00_axis_aclk,
        port_i => b0_R1(I),
        port_o => b0_R1_s(I)
    );

    vt_single_sync_inst_2 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => s00_axis_aclk,
        port_i => b0_R2(I),
        port_o => b0_R2_s(I)
    );

    vt_single_sync_inst_3 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => s00_axis_aclk,
        port_i => b0_R3(I),
        port_o => b0_R3_s(I)
    );

    vt_single_sync_inst_4 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => s00_axis_aclk,
        port_i => b0_R4(I),
        port_o => b0_R4_s(I)
    );

    vt_single_sync_inst_5 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => s00_axis_aclk,
        port_i => b0_R5(I),
        port_o => b0_R5_s(I)
    );

    vt_single_sync_inst_6 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => s00_axis_aclk,
        port_i => b0_R6(I),
        port_o => b0_R6_s(I)
    );

    vt_single_sync_inst_7 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => s00_axis_aclk,
        port_i => b0_R7(I),
        port_o => b0_R7_s(I)
    );

end generate;

validIn <= s01_axis_tdata(16) & s01_axis_tdata(0);
RuleFirst1 <= b0_R2_s(6 downto 0) & b0_R1_s(31 downto 27);
RuleLastPunctured <= b0_R4_s(3 downto 0) & b0_R3_s(31 downto 0+24);
LDPC_Ctrl_1 <= b0_R5_s(11 downto 0) & b0_R4_s(31 downto 0+4);
LDPC_Ctrl_2 <= b0_R6_s(19 downto 0) & b0_R5_s(31 downto 12);
LDPC_Ctrl_3 <= b0_R7_s(27 downto 0) & b0_R6_s(31 downto 20);

LDPCtop: LDPCdecoder_top
Port map (  clk => s00_axis_aclk,
            rstn => s00_axis_aresetn,
            core_clk => coreClk,
            triggerIn => triggerIn,
            triggerOut => triggerOut,
            demapperDone => demapperDone,
            dataInRe1 => s00_axis_tdata(15 downto 0),
            dataInIm1 => s01_axis_tdata(15 downto 0),
            dataInRe2 => s00_axis_tdata(31 downto 16),
            dataInIm2 => s01_axis_tdata(31 downto 16),
            validIn => validIn,
            --
            Zc =>   b0_R0_s(6 downto 0),                    -- ("0101010",    -- 2*352/16-1-1
            Em1 =>  b0_R0_s(10+7 downto 0+7),               -- "00111000111", -- ceil(14578/16/2)-1
            Kdm1 => b0_R0_s(10+18 downto 0+18),             -- "00110010100", -- 6496/16-1-1
            Cm1 =>  b0_R0_s(2+29 downto 0+29),              -- "010",              -- 3
            Fm1 =>  b0_R1_s(10 downto 0),                   -- "00000100001", -- 544/16-1
            FZ =>   b0_R1_s(10+11 downto 0+11),             -- "00111111010", -- ceil((23232-14578-544)/16)
            JumpFirst1 => b0_R1_s(2+22 downto 0+22),        -- "000",
            JumpFirst2 => b0_R1_s(2+24 downto 0+24),        -- "100",
            RuleFirst1 => RuleFirst1,                       -- "110101101111", -- {14 7 16}-1
            RuleLast1 => b0_R2_s(11+7 downto 0+7),          -- "000110001111", -- {2 9 16}-1
            RuleFirst2 => b0_R2_s(11+19 downto 0+19),       -- "110101101111", -- {14 7 16}-1
            RuleLast2 => b0_R3_s(11+0 downto 0+0),          -- "101000011000", -- {11 2 9}-1
            RuleLastZeros => b0_R3_s(11+12 downto 0+12),    -- "110111011101", -- {13 13 13} (23232-14578-544)-floor((23232-14578-544)/16)*16-1
            RuleLastPunctured => RuleLastPunctured,         -- "111111111111", -- {16 16 16}-1
            LDPC_Ctrl_1 => LDPC_Ctrl_1,                     -- x"2E003D582D",
            LDPC_Ctrl_2 => LDPC_Ctrl_2,                     -- x"2E003D582D",
            LDPC_Ctrl_3 => LDPC_Ctrl_3,                     -- x"2E003D582D",
            --
            dataOutRateAdap => open,
            validOutRateAdap => open,
            dataOutHD => dataOutHD,
            validOutHD => validOutHD,
            lastOutHD => lastOutHD,
            readyOutHD => readyOutHD,
            dataOutStatus => dataOutStatus,
            validOutStatus => validOutStatus
);

readyOutHD <= m00_axis_tready;
m00_axis_tkeep	<= (others => '1');
m00_axis_tdata	<= dataOutHD(31 downto 0);
m00_axis_tvalid <= validOutHD;
m00_axis_tlast	<= '0';

m01_axis_tkeep	<= (others => '1');
m01_axis_tdata	<= dataOutHD(63 downto 32);
m01_axis_tvalid <= validOutHD;
m01_axis_tlast	<= '0';

--signal dataOutHD : std_logic_vector(63 downto 0);
--signal validOutHD : std_logic;
--signal lastOutHD : std_logic;
--signal readyOutHD : std_logic;
--signal dataOutStatus : std_logic_vector(39 downto 0);
--signal validOutStatus : std_logic;


end Behavioral;
