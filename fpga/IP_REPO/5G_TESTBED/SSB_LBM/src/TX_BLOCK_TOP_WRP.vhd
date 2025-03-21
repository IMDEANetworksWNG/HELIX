----------------------------------------------------------------------------------
-- 
-- Create Date: 07/09/2021 01:03:18 PM
-- Design Name: 
-- Module Name: TX_BLOCK_TOP_WRP - Behavioral
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

entity TX_BLOCK_TOP_WRP is
generic (
    -- Users to add parameters here
    RST_I_BIT : integer	range 0 to 94 := 0;
    MUX_LBM_I_BIT : integer	range 0 to 94 := 0;
    LOAD_DATA_LBM_I_BIT : integer	range 0 to 94 := 0;
    -- User parameters ends
    -- Do not modify the parameters beyond this line
    
    -- Parameters of Axi Slave Bus Interface S00_AXI
    C_S00_AXI_DATA_WIDTH	: integer	:= 32;
    C_S00_AXI_ADDR_WIDTH	: integer	:= 4;
    
    -- Parameters of Axi Slave Bus Interface S00_AXIS
    C_S00_AXIS_TDATA_WIDTH	: integer	:= 256;
    
    -- Parameters of Axi Master Bus Interface M00_AXIS
    C_M00_AXIS_TDATA_WIDTH	: integer	:= 64
);
Port ( 

    send_pkt_i : in std_logic;
    GPIO_i : in std_logic_vector(94 downto 0);
    triggerOut : out std_logic;
    rstnOut : out std_logic;
        
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

    s00_axis_aclk	: in std_logic;
    s00_axis_aresetn : in std_logic;
    s00_axis_tready	: out std_logic;
    s00_axis_tdata	: in std_logic_vector(C_S00_AXIS_TDATA_WIDTH-1 downto 0);
    s00_axis_tkeep	: in std_logic_vector(32-1 downto 0);
    s00_axis_tlast	: in std_logic;
    s00_axis_tvalid	: in std_logic;

    --
    m00_axis_aclk	: in std_logic;
    m00_axis_aresetn : in std_logic;
    m00_axis_tvalid	: out std_logic;
    m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
    m00_axis_tkeep	: out std_logic_vector(8-1 downto 0);
    m00_axis_tlast	: out std_logic;
    m00_axis_tready	: in std_logic
);
end TX_BLOCK_TOP_WRP;

architecture Behavioral of TX_BLOCK_TOP_WRP is

-- component declaration
component TX_BLOCK_AXI_LITE is
generic (
    C_S_AXI_DATA_WIDTH	: integer	:= 32;
    C_S_AXI_ADDR_WIDTH	: integer	:= 4
);
port (
    --TX_SIFS	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    TX_control	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    --R2 : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
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
end component TX_BLOCK_AXI_LITE;

component TX_BLOCK_TOP_v2 is
Port (  
    CLK_OUT : in std_logic; -- 61.44MHz (PL/DAC domain)
    RST_OUT_N : in std_logic;
    
    -- AXI Stream Interface (from TX-DMA)
    S00_AXIS_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 ); -- {Q[0] .. Q[8-1] I[0] .. I[8-1]}
    S00_AXIS_tlast : in STD_LOGIC;
    S00_AXIS_tready : out STD_LOGIC;
    S00_AXIS_tkeep : in STD_LOGIC_VECTOR ( 31 downto 0 );
    S00_AXIS_tvalid : in STD_LOGIC;
    S00_AXIS_aclk : in STD_LOGIC; -- 100MHz (PS domain)
    S00_axis_aresetn : in STD_LOGIC;
    
    -- Control Inputs
    ic_LOAD_DATA : in std_logic; -- 0: load data to FIFO; 1: loopback mode
    ic_SEND_PKT : in std_logic; -- Transmit ONE packet

    --Register Inputs
    ir_PAYLOAD_L : in std_logic_vector(15 downto 0); -- Payload length divided by 8
    ir_remPAYLOAD_L : in std_logic_vector(2 downto 0); -- Remain of Payload length divided by 8 (when division is not exact)
    ir_TIMER : in std_logic_vector(31 downto 0); -- Clock cycles of idle time between packets (TIME = irTIMER/61.44MHz)
    --ir_BW_SEL : in std_logic;
    triggerOut : out std_logic;
    
    -- AXI Stream output (Imag / Real Part)
    M00_AXIS_tdata : out STD_LOGIC_VECTOR ( 4*16-1 downto 0 );
    M00_AXIS_tlast : out STD_LOGIC;
    M00_AXIS_tready : in STD_LOGIC;
    M00_AXIS_tkeep : out STD_LOGIC_VECTOR ( 8-1 downto 0 );
    M00_AXIS_tvalid : out STD_LOGIC
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

--signal R2, R2_s : std_logic_vector(31 downto 0);
signal b0_TX_control, b1_TX_control : STD_LOGIC_VECTOR ( 32-1 downto 0 );
--signal b0_TX_SIFS, b1_TX_SIFS : STD_LOGIC_VECTOR ( 32-1 downto 0 );
--signal GPIO_RST, GPIO_RST_DDR, GPIO_RST_DDR_s : std_logic_vector(1 downto 0);
signal GPIO_RST, GPIO_RST_DDR, GPIO_RST_DDR_s : std_logic_vector(0 downto 0);
--signal GPIO_RST_DAC, GPIO_RST_DAC_s : std_logic_vector(1 downto 0);
signal GPIO_RST_DAC, GPIO_RST_DAC_s : std_logic_vector(0 downto 0);
--signal GPIO_MUX, GPIO_MUX_DAC : std_logic_vector(1 downto 0);
signal GPIO_MUX, GPIO_MUX_DAC : std_logic_vector(0 downto 0);
--signal GPIO_LOAD_DATA, GPIO_LOAD_DATA_DDR, GPIO_LOAD_DATA_DDR_s : std_logic_vector(1 downto 0);
signal GPIO_LOAD_DATA, GPIO_LOAD_DATA_DDR, GPIO_LOAD_DATA_DDR_s : std_logic_vector(0 downto 0);

signal b2_send_pkt_i : std_logic;

signal b2_data : std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
signal b2_valid : std_logic;
signal b2_last : std_logic;
signal b2_ready : std_logic;
signal b2_keep : std_logic_vector(8-1 downto 0);

begin

-- Instantiation of Axi Bus Interface S00_AXI
b0: TX_BLOCK_AXI_LITE
generic map (
    C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
    C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
)
port map (
    --TX_SIFS	=> b0_TX_SIFS,
    TX_control => b0_TX_control,
    --R2 => R2,
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
        clk => m00_axis_aclk,
        port_i => b0_TX_control(I),
        port_o => b1_TX_control(I)
    );
    
--    vt_single_sync_inst_2   : vt_single_sync
--    generic map(
--        STAGES => 2,
--        STARTUP_VALUE => '0'
--    )
--    port map(
--        clk => m00_axis_aclk,
--        port_i => b0_TX_SIFS(I),
--        port_o => b1_TX_SIFS(I)
--    );    
    
--    vt_single_sync_inst_3 : vt_single_sync
--    generic map(
--        STAGES => 2,
--        STARTUP_VALUE => '0'
--    )
--    port map(
--        clk => m00_axis_aclk,
--        port_i => R2(I),
--        port_o => R2_s(I)
--    );
end generate b1_fg1;

-- Reset Generation
GPIO_RST(0) <= not GPIO_i(RST_I_BIT);

b1_fg2: for I in 0 to 0 generate
    vt_single_sync_inst_1 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => s00_axis_aclk,
        port_i => GPIO_RST(I),
        port_o => GPIO_RST_DDR(I)
    );
    
    vt_single_sync_inst_2   : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => m00_axis_aclk,
        port_i => GPIO_RST(I),
        port_o => GPIO_RST_DAC(I)
    );    
end generate;

GPIO_RST_DDR_s(0) <= GPIO_RST_DDR(0) and s00_axis_aresetn;
GPIO_RST_DAC_s(0) <= GPIO_RST_DAC(0) and m00_axis_aresetn;
rstnOut <= GPIO_RST_DAC_s(0);

-- LBM MUX-SEL Generation
GPIO_MUX(0) <= GPIO_i(MUX_LBM_I_BIT);

b1_fg3: for I in 0 to 0 generate
    vt_single_sync_inst : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => m00_axis_aclk,
        port_i => GPIO_MUX(I),
        port_o => GPIO_MUX_DAC(I)
    );    
end generate;

-- LBM LOAD_DATA Generation
GPIO_LOAD_DATA(0) <= GPIO_i(LOAD_DATA_LBM_I_BIT);

b1_fg4: for I in 0 to 0 generate
    vt_single_sync_inst : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => s00_axis_aclk,
        port_i => GPIO_LOAD_DATA(I),
        port_o => GPIO_LOAD_DATA_DDR(I)
    );    
end generate;

vt_single_sync_inst : vt_single_sync
generic map(
    STAGES => 2,
    STARTUP_VALUE => '0'
)
port map(
    clk => s00_axis_aclk,
    port_i => send_pkt_i,
    port_o => b2_send_pkt_i
);

GPIO_LOAD_DATA_DDR_s(0) <= GPIO_LOAD_DATA_DDR(0) and s00_axis_tvalid;

b2: TX_BLOCK_TOP_v2
port map (
    CLK_OUT => m00_axis_aclk,
    RST_OUT_N => GPIO_RST_DAC_s(0),
    
    S00_AXIS_tdata => s00_axis_tdata,
    S00_AXIS_tlast => s00_axis_tlast,
    S00_AXIS_tkeep => s00_axis_tkeep,
    S00_AXIS_tready	=> s00_axis_tready,
    S00_AXIS_tvalid	=> GPIO_LOAD_DATA_DDR_s(0),
    S00_AXIS_aclk => s00_axis_aclk,
    S00_axis_aresetn => GPIO_RST_DDR_s(0),
    
    ic_LOAD_DATA => GPIO_MUX_DAC(0),
    ic_SEND_PKT	=> send_pkt_i,
    
    ir_PAYLOAD_L	=> b1_TX_control(15 downto 0),
    ir_remPAYLOAD_L => b1_TX_control(2+16 downto 0+16),
    ir_TIMER	=> x"00000010",
    triggerOut => triggerOut,
    --ir_TIMER	=> b1_TX_SIFS,
    --ir_BW_SEL => b1_TX_control(16),
    
    M00_AXIS_tdata	=> b2_data,
    M00_AXIS_tlast	=> b2_last,
    M00_AXIS_tkeep	=> b2_keep,
    M00_AXIS_tready	=> b2_ready,
    M00_AXIS_tvalid	=> b2_valid
);

--process(m00_axis_aclk)
--begin
--    if rising_edge(m00_axis_aclk) then
--        if R2_s(0) = '1' then
            m00_axis_tdata <= b2_data;
            m00_axis_tvalid <= b2_valid;
            m00_axis_tlast <= b2_last;
            m00_axis_tkeep <= b2_keep;
            b2_ready <= m00_axis_tready;
--            m01_axis_tdata <= (others => '0');
--            m01_axis_tvalid <= '0';
--            m01_axis_tlast <= '0';
--            m01_axis_tkeep <= (others => '0');
--        else
--            m01_axis_tdata <= b2_data;
--            m01_axis_tvalid <= b2_valid;
--            m01_axis_tlast <= b2_last;
--            m01_axis_tkeep <= b2_keep;
--            b2_ready <= m01_axis_tready;
--            m00_axis_tdata <= (others => '0');
--            m00_axis_tvalid <= '0';
--            m00_axis_tlast <= '0';
--            m00_axis_tkeep <= (others => '0');
--        end if;
--    end if;
--end process;

end behavioral;
