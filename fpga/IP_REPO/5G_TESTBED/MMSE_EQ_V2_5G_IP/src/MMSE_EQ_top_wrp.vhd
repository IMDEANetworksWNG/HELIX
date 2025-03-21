----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2022 06:06:09 PM
-- Design Name: 
-- Module Name: MMSE_EQ_top_wrp - Behavioral
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

entity MMSE_EQ_top_wrp is
generic (   -- Parameters of Axi Slave Bus Interface S00_AXI
            C_S00_AXI_DATA_WIDTH	: integer	:= 32;
            C_S00_AXI_ADDR_WIDTH	: integer	:= 4;
            -- Parameters of Axi Slave Bus Interface S00_AXIS
            C_S00_AXIS_TDATA_WIDTH	: integer	:= 32;
            -- Parameters of Axi Slave Bus Interface S01_AXIS
            C_S01_AXIS_TDATA_WIDTH	: integer	:= 32;
            -- Parameters of Axi Slave Bus Interface S02_AXIS
            C_S02_AXIS_TDATA_WIDTH	: integer	:= 32;
            -- Parameters of Axi Slave Bus Interface S03_AXIS
            C_S03_AXIS_TDATA_WIDTH	: integer	:= 32;
            -- Parameters of Axi Master Bus Interface M00_AXIS
            C_M00_AXIS_TDATA_WIDTH	: integer	:= 32;
            -- Parameters of Axi Master Bus Interface M01_AXIS
            C_M01_AXIS_TDATA_WIDTH	: integer	:= 32
);
Port (  triggerIn : in std_logic;
        CE_triggerIn : in std_logic;
        nVar_In : in std_logic_vector(31 downto 0); -- s[32 31]
        nVar_In_Valid : in std_logic;
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
        s02_axis_aclk	: in std_logic;
        s02_axis_aresetn	: in std_logic;
        s02_axis_tready	: out std_logic;
        s02_axis_tdata	: in std_logic_vector(C_S02_AXIS_TDATA_WIDTH-1 downto 0);
        s02_axis_tkeep	: in std_logic_vector(C_S02_AXIS_TDATA_WIDTH/8-1 downto 0);
        s02_axis_tlast	: in std_logic;
        s02_axis_tvalid	: in std_logic;
        --
        s03_axis_aclk	: in std_logic;
        s03_axis_aresetn	: in std_logic;
        s03_axis_tready	: out std_logic;
        s03_axis_tdata	: in std_logic_vector(C_S03_AXIS_TDATA_WIDTH-1 downto 0);
        s03_axis_tkeep	: in std_logic_vector(C_S03_AXIS_TDATA_WIDTH/8-1 downto 0);
        s03_axis_tlast	: in std_logic;
        s03_axis_tvalid	: in std_logic;
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
        m01_axis_tready	: in std_logic;
        
        m02_axis_aclk	: in std_logic;
        m02_axis_aresetn	: in std_logic;
        m02_axis_tvalid	: out std_logic;
        m02_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
        m02_axis_tkeep	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH/8-1 downto 0);
        m02_axis_tlast	: out std_logic;
        m02_axis_tready	: in std_logic;
        --
        m03_axis_aclk	: in std_logic;
        m03_axis_aresetn	: in std_logic;
        m03_axis_tvalid	: out std_logic;
        m03_axis_tdata	: out std_logic_vector(C_M01_AXIS_TDATA_WIDTH-1 downto 0);
        m03_axis_tkeep	: out std_logic_vector(C_M01_AXIS_TDATA_WIDTH/8-1 downto 0);
        m03_axis_tlast	: out std_logic;
        m03_axis_tready	: in std_logic

);
end MMSE_EQ_top_wrp;

architecture Behavioral of MMSE_EQ_top_wrp is

component MMSE_EQ_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        dataIn_Re : in std_logic_vector(31 downto 0);
        dataIn_Im : in std_logic_vector(31 downto 0);
        dataIn_Valid : in std_logic;
        triggerIn : in std_logic;
        CE_In_re : in std_logic_vector(31 downto 0);
        CE_In_im : in std_logic_vector(31 downto 0);
        CE_In_Valid : in std_logic;
        CE_triggerIn : in std_logic;
        nVar_In : in std_logic_vector(31 downto 0);
        nVar_In_Valid : in std_logic;
        triggerOut : out std_logic;
        --
        numSC : in std_logic_vector(11 downto 0);
        numOFDMm1 : in std_logic_vector(4 downto 0);
        --
        dataOut_Re : out std_logic_vector(31 downto 0);
        dataOut_Im : out std_logic_vector(31 downto 0);
        dataOut_Last : out  std_logic;
        dataOut_Valid : out std_logic
);
end component;

component MMSE_EQ_AXI_LITE is
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

--Signals
signal b0_R1, b0_R2, b0_R3 : std_logic_vector(31 downto 0);
signal b0_R1_s, b0_R2_s, b0_R3_s : std_logic_vector(31 downto 0);
signal dataOut_Valid, dataOut_Last : std_logic;
signal dataOut_Re, dataOut_Im : std_logic_vector(31 downto 0);
signal triggerOut_s : std_logic;

begin

-- Instantiation of Axi Bus Interface S00_AXI
b0: MMSE_EQ_AXI_LITE
generic map (
    C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
    C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
)
port map (
    R1	=> b0_R1,
    R2	=> b0_R2,
    R3	=> b0_R3,
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

b0_sync1: for I in 0 to 31 generate
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
end generate;

b0_sync2: for I in 0 to 31 generate
    vt_single_sync_inst_1 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => s00_axis_aclk,
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
        clk => s00_axis_aclk,
        port_i => b0_R3(I),
        port_o => b0_R3_s(I)
    );
end generate;

MMSE_EQ_BLK: MMSE_EQ_top 
Port map (  clk => s00_axis_aclk,
            rstn => s00_axis_aresetn,
            --
            dataIn_re => s00_axis_tdata,
            dataIn_im => s01_axis_tdata,
            dataIn_Valid => s00_axis_tvalid,
            triggerIn => triggerIn,
            CE_In_re => s02_axis_tdata,
            CE_In_im => s03_axis_tdata,
            CE_In_Valid => s02_axis_tvalid,
            CE_triggerIn => CE_triggerIn,
            nVar_In => nVar_In,
            nVar_In_Valid => nVar_In_Valid,
            triggerOut => triggerOut_s,
            --
            numSC => b0_R1_s(11 downto 0),
            numOFDMm1 => b0_R1_s(12+4 downto 12), 
            --
            dataOut_Re => dataOut_Re,
            dataOut_Im => dataOut_Im,
            dataOut_Last => dataOut_Last,
            dataOut_Valid => dataOut_Valid
);

triggerOut <= triggerOut_s;

s00_axis_tready <= '1';
s01_axis_tready <= '1';
s02_axis_tready <= '1';
s03_axis_tready <= '1';

m00_axis_tdata <= dataOut_re(2*16-1 downto 17) & triggerOut_s & dataOut_re(16-1 downto 1) & triggerOut_s;
m00_axis_tvalid <= dataOut_Valid;
m00_axis_tkeep	<= (others => '1');
m00_axis_tlast	<= dataOut_Last;

m01_axis_tdata <= dataOut_Im;
m01_axis_tvalid <= dataOut_Valid;
m01_axis_tkeep	<= (others => '1');
m01_axis_tlast	<= dataOut_Last; 

m02_axis_tvalid	<= s02_axis_tvalid;
m02_axis_tdata	<= s02_axis_tdata;
m02_axis_tkeep	<= (others => '1');
m02_axis_tlast	<= s02_axis_tlast;

m03_axis_tvalid	<= s03_axis_tvalid;
m03_axis_tdata	<= s03_axis_tdata;
m03_axis_tkeep	<= (others => '1');
m03_axis_tlast	<= s03_axis_tlast;

end Behavioral;
