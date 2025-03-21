----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2023 06:52:57 PM
-- Design Name: 
-- Module Name: FIR_decimator_div4_top_wrp - Behavioral
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

entity FIR_decimator_div4_top_wrp is
Port (  -- AXI Lite 
        s00_axi_aclk	: in std_logic;
        s00_axi_aresetn	: in std_logic;
        s00_axi_awaddr	: in std_logic_vector(4-1 downto 0);
        s00_axi_awprot	: in std_logic_vector(2 downto 0);
        s00_axi_awvalid	: in std_logic;
        s00_axi_awready	: out std_logic;
        s00_axi_wdata	: in std_logic_vector(32-1 downto 0);
        s00_axi_wstrb	: in std_logic_vector((32/8)-1 downto 0);
        s00_axi_wvalid	: in std_logic;
        s00_axi_wready	: out std_logic;
        s00_axi_bresp	: out std_logic_vector(1 downto 0);
        s00_axi_bvalid	: out std_logic;
        s00_axi_bready	: in std_logic;
        s00_axi_araddr	: in std_logic_vector(4-1 downto 0);
        s00_axi_arprot	: in std_logic_vector(2 downto 0);
        s00_axi_arvalid	: in std_logic;
        s00_axi_arready	: out std_logic;
        s00_axi_rdata	: out std_logic_vector(32-1 downto 0);
        s00_axi_rresp	: out std_logic_vector(1 downto 0);
        s00_axi_rvalid	: out std_logic;
        s00_axi_rready	: in std_logic;
        -- AXI Stream input (Real part)
        s00_axis_aclk	: in std_logic;
        s00_axis_aresetn	: in std_logic;
        S00_AXIS_tdata : in STD_LOGIC_VECTOR ( 128-1 downto 0 ); 
        S00_AXIS_tlast : in STD_LOGIC;
        S00_AXIS_tready : out STD_LOGIC;
        S00_AXIS_tkeep : in STD_LOGIC_VECTOR ( 15 downto 0 );
        S00_AXIS_tvalid : in STD_LOGIC;
        -- AXI Stream input (Imag part)
        s01_axis_aclk	: in std_logic;
        s01_axis_aresetn	: in std_logic;
        S01_AXIS_tdata : in STD_LOGIC_VECTOR ( 128-1 downto 0 ); 
        S01_AXIS_tlast : in STD_LOGIC;
        S01_AXIS_tready : out STD_LOGIC;
        S01_AXIS_tkeep : in STD_LOGIC_VECTOR ( 15 downto 0 );
        S01_AXIS_tvalid : in STD_LOGIC;
        -- AXI Stream output (Output - real)
        m00_axis_aclk	: in std_logic;
        m00_axis_aresetn	: in std_logic;
        M00_AXIS_tdata : out STD_LOGIC_VECTOR ( 128-1 downto 0 );
        M00_AXIS_tlast : out STD_LOGIC;
        M00_AXIS_tready : in STD_LOGIC;
        M00_AXIS_tkeep : out STD_LOGIC_VECTOR ( 15 downto 0 );
        M00_AXIS_tvalid : out STD_LOGIC;
        -- AXI Stream output (Output - imag)
        m01_axis_aclk	: in std_logic;
        m01_axis_aresetn	: in std_logic;
        M01_AXIS_tdata : out STD_LOGIC_VECTOR ( 128-1 downto 0 );
        M01_AXIS_tlast : out STD_LOGIC;
        M01_AXIS_tready : in STD_LOGIC;
        M01_AXIS_tkeep : out STD_LOGIC_VECTOR ( 15 downto 0 );
        M01_AXIS_tvalid : out STD_LOGIC
);
end FIR_decimator_div4_top_wrp;

architecture Behavioral of FIR_decimator_div4_top_wrp is

component FIR_DECIM_AXI_LITE is
generic (
    C_S_AXI_DATA_WIDTH	: integer	:= 32;
    C_S_AXI_ADDR_WIDTH	: integer	:= 4
);
port (
    R0	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
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

component FIR_decimator_div4_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        dataIn_re : in std_logic_vector(16*8-1 downto 0);
        dataIn_im : in std_logic_vector(16*8-1 downto 0);
        validIn : in std_logic;
        BW_sel : in std_logic;
        dataOut_re : out std_logic_vector(16*8-1 downto 0);
        dataOut_im : out std_logic_vector(16*8-1 downto 0);
        validOut : out std_logic
);
end component;

signal R0, R0_s : std_logic_vector(32-1 downto 0);
signal validOut : std_logic;

begin

-- Instantiation of Axi Bus Interface S00_AXI
B0: FIR_DECIM_AXI_LITE
generic map (
    C_S_AXI_DATA_WIDTH	=> 32,
    C_S_AXI_ADDR_WIDTH	=> 4
)
port map (
    R0	=> R0,
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
    vt_single_sync_inst_1 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => s00_axis_aclk,
        port_i => R0(I),
        port_o => R0_s(I)
    );
end generate;

B1: FIR_decimator_div4_top
Port map    (   clk => s00_axis_aclk,
                rstn => s00_axis_aresetn,
                dataIn_re => S00_AXIS_tdata,
                dataIn_im => S01_AXIS_tdata,
                validIn => S00_AXIS_tvalid,
                BW_sel => R0_s(0),
                dataOut_re => M00_AXIS_tdata,
                dataOut_im => M01_AXIS_tdata,
                validOut => validOut
);

M00_AXIS_tvalid <= validOut;
M01_AXIS_tvalid <= validOut;

M00_AXIS_tlast <= '0';
M01_AXIS_tlast <= '0';

M00_AXIS_tkeep <= (others => '1');
M01_AXIS_tkeep <= (others => '1');

S00_AXIS_tready <= '1';
S01_AXIS_tready <= '1';

end Behavioral;
