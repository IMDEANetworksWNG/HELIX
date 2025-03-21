----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/26/2022 10:05:03 AM
-- Design Name: 
-- Module Name: CE_5G_NR_top_wrp - Behavioral
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

entity CE_5G_NR_top_wrp is
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
Port (  countSCIn : in std_logic_vector(11 downto 0);
        countOFDMIn : in std_logic_vector(4 downto 0);
        triggerIn : in std_logic;
        countSCOut : out std_logic_vector(11 downto 0);
        countOFDMOut : out std_logic_vector(4 downto 0);
        triggerOut : out std_logic;
        CE_triggerOut : out std_logic;
        nVarOut : out std_logic_vector(31 downto 0); -- s[32 31]
        nVarValidOut : out std_logic;
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
        m01_axis_tready	: in std_logic;
        --
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
end CE_5G_NR_top_wrp;

architecture Behavioral of CE_5G_NR_top_wrp is

component CE_5G_NR_top is
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
end component;

component CE_5G_AXI_LITE is
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

signal CE_DataOut_re, CE_DataOut_im : std_logic_vector(31 downto 0);
signal CE_validOut, CE_lastOut : std_logic;

begin

s00_axis_tready <= '1';
s01_axis_tready <= '1';

-- Instantiation of Axi Bus Interface S00_AXI
b0: CE_5G_AXI_LITE
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

CE_block: CE_5G_NR_top
Port Map(   clk => s00_axis_aclk,
            rstn => s00_axis_aresetn,
            --
            dataIn_re => s00_axis_tdata,
            dataIn_im => s01_axis_tdata,
            validIn => s00_axis_tvalid,
            triggerIn => triggerIn,
            --
            countSCIn => countSCIn,
            countOFDMIn => countOFDMIn,
            offsetIn => b0_R1_s(3 downto 0), -- Offset of the first DMRS subcarrier from the start of the ofdm symbol
            SCspacingIn => b0_R1_s(4+4 downto 0+4), -- subcarrier spacing for the DMRS subcarriers 
            DMRSSymbolIn => b0_R1_s(4+9 downto 0+9), -- OFDM symbol in the slot where the DMRS subcarriers are located
            NumSCp22div2 => b0_R1_s(10+14 downto 14), -- (NumSC+22)/2
            Num_DMRS_inv => b0_R2_s(15 downto 0),
            scaling_nVar => b0_R2_s(15+16 downto 0+16),
            --
            triggerOut => CE_triggerOut,
            dataOut_re => CE_DataOut_re,
            dataOut_im => CE_DataOut_im,
            validOut => CE_validOut,
            lastOut => CE_lastOut,
            nVarOut => nVarOut,
            nVarValidOut => nVarValidOut
);

process(s00_axis_aclk)
begin
    if rising_edge(s00_axis_aclk) then
        m00_axis_tvalid	<= s00_axis_tvalid;
        m00_axis_tdata	<= s00_axis_tdata;
        m00_axis_tlast	<= s00_axis_tlast;
        
        m01_axis_tvalid	<= s01_axis_tvalid;
        m01_axis_tdata	<= s01_axis_tdata;
        m01_axis_tlast	<= s01_axis_tlast;
        
        countSCOut <= countSCIn; 
        countOFDMOut <= countOFDMIn;
        triggerOut <= triggerIn;
    end if;
end process;

m00_axis_tkeep	<= (others => '1');
m01_axis_tkeep	<= (others => '1');

m02_axis_tvalid	<= CE_validOut;
m02_axis_tdata	<= CE_DataOut_re;
m02_axis_tkeep	<= (others => '1');
m02_axis_tlast	<= CE_lastOut;

m03_axis_tvalid	<= CE_validOut;
m03_axis_tdata	<= CE_DataOut_im;
m03_axis_tkeep	<= (others => '1');
m03_axis_tlast	<= CE_lastOut;

end Behavioral;
