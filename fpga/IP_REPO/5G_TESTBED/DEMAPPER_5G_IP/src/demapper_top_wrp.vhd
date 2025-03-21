----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2022 03:47:36 PM
-- Design Name: 
-- Module Name: demapper_top_wrp - Behavioral
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

entity demapper_top_wrp is
generic (   -- Parameters of Axi Slave Bus Interface S00_AXI
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
Port (  triggerIn : in std_logic;
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
end demapper_top_wrp;

architecture Behavioral of demapper_top_wrp is

component demapper_5G_AXI_LITE is
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

component demapper_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        triggerIn : in std_logic;
        dataIn_re : in std_logic_vector(2*16-1 downto 0); -- s[16 14]
        dataIn_im : in std_logic_vector(2*16-1 downto 0); -- s[16 14]
        validIn : in std_logic;
        NumBLK : in std_logic_vector(13 downto 0);  -- number of blocks of 4 bits in the slot. 
        triggerOut : out std_logic;
        lastOut : out std_logic;
        dataOut_re : out std_logic_vector(2*16-1 downto 0);  -- s[16 13] : {X_MSB[n+1],X_MSB[n]}
        dataOut_im : out std_logic_vector(2*16-1 downto 0);  -- s[16 13] : {X_LSB[n+1],X_LSB[n]}
        --validOut : out std_logic
        validOut : out std_logic_vector(1 downto 0)
);
end component;

--Signals
signal b0_R1, b0_R2, b0_R3 : std_logic_vector(31 downto 0);
signal b0_R1_s, b0_R2_s, b0_R3_s : std_logic_vector(31 downto 0);

signal demapper_DataOut_re, demapper_DataOut_im : std_logic_vector(31 downto 0);
signal demapper_triggerOut, demapper_lastOut : std_logic;
signal demapper_validOut  : std_logic_vector(1 downto 0);

begin

s00_axis_tready <= '1';
s01_axis_tready <= '1';

-- Instantiation of Axi Bus Interface S00_AXI
b0: demapper_5G_AXI_LITE
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

demapper_block: demapper_top
Port Map(   clk => s00_axis_aclk,
            rstn => s00_axis_aresetn,
            --
            dataIn_re => s00_axis_tdata,
            dataIn_im => s01_axis_tdata,
            validIn => s00_axis_tvalid,
            triggerIn => s00_axis_tdata(0),
            --
            NumBLK => b0_R1_s(13+0 downto 0+0),
            --
            triggerOut => demapper_triggerOut,
            lastOut => demapper_lastOut,
            dataOut_re => demapper_DataOut_re,
            dataOut_im => demapper_DataOut_im,
            validOut => demapper_validOut
);

triggerOut <= demapper_triggerOut;

m00_axis_tvalid	<= demapper_validOut(0) or demapper_validOut(1);
m00_axis_tdata	<= demapper_DataOut_re(31 downto 17) & demapper_triggerOut & demapper_DataOut_re(15 downto 1) & demapper_triggerOut;
m00_axis_tkeep	<= (others => '1');
m00_axis_tlast	<= demapper_lastOut;

m01_axis_tvalid	<= demapper_validOut(0) or demapper_validOut(1);
m01_axis_tdata	<= demapper_DataOut_im(31 downto 17) & demapper_validOut(1) & demapper_DataOut_im(15 downto 1) & demapper_validOut(0);
m01_axis_tkeep	<= (others => '1');
m01_axis_tlast	<= demapper_lastOut;
m01_axis_tlast	<= demapper_lastOut;

end Behavioral;
