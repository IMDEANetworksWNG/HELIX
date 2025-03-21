library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

USE work.HBF_x8_pkg.ALL;

entity FILTER_DS_x8_v3_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 4;

		-- Parameters of Axi Slave Bus Interface S00_AXIS
		C_S00_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Slave Bus Interface S01_AXIS
		C_S01_AXIS_TDATA_WIDTH	: integer	:= 32;

		-- Parameters of Axi Master Bus Interface M00_AXIS
		C_M00_AXIS_TDATA_WIDTH	: integer	:= 16;
		
		-- Parameters of Axi Master Bus Interface M01_AXIS
		C_M01_AXIS_TDATA_WIDTH	: integer	:= 16;
		
		-- Parameters of Axi Master Bus Interface M02_AXIS
		C_M02_AXIS_TDATA_WIDTH	: integer	:= 32;
		
		-- Parameters of Axi Master Bus Interface M03_AXIS
		C_M03_AXIS_TDATA_WIDTH	: integer	:= 32
	);
	port (
		-- Users to add ports here
        --aclk	: in std_logic;
        --aresetn : in std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXI
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

		-- Ports of Axi Slave Bus Interface S00_AXIS
		s00_axis_aclk	: in std_logic;
		s00_axis_aresetn	: in std_logic;
		s00_axis_tready	: out std_logic;
		s00_axis_tdata	: in std_logic_vector(C_S00_AXIS_TDATA_WIDTH-1 downto 0);
		s00_axis_tkeep	: in std_logic_vector((C_S00_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s00_axis_tlast	: in std_logic;
		s00_axis_tvalid	: in std_logic;

		-- Ports of Axi Slave Bus Interface S01_AXIS
		s01_axis_aclk	: in std_logic;
		s01_axis_aresetn	: in std_logic;
		s01_axis_tready	: out std_logic;
		s01_axis_tdata	: in std_logic_vector(C_S01_AXIS_TDATA_WIDTH-1 downto 0);
		s01_axis_tkeep	: in std_logic_vector((C_S01_AXIS_TDATA_WIDTH/8)-1 downto 0);
		s01_axis_tlast	: in std_logic;
		s01_axis_tvalid	: in std_logic;

		-- Ports of Axi Master Bus Interface M00_AXIS
		m00_axis_aclk	: in std_logic;
		m00_axis_aresetn	: in std_logic;
		m00_axis_tvalid	: out std_logic;
		m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
		m00_axis_tkeep	: out std_logic_vector((C_M00_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m00_axis_tlast	: out std_logic;
		m00_axis_tready	: in std_logic;

		-- Ports of Axi Master Bus Interface M01_AXIS
		m01_axis_aclk	: in std_logic;
		m01_axis_aresetn	: in std_logic;
		m01_axis_tvalid	: out std_logic;
		m01_axis_tdata	: out std_logic_vector(C_M01_AXIS_TDATA_WIDTH-1 downto 0);
		m01_axis_tkeep	: out std_logic_vector((C_M01_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m01_axis_tlast	: out std_logic;
		m01_axis_tready	: in std_logic;

		-- Ports of Axi Master Bus Interface M02_AXIS
		m02_axis_aclk	: in std_logic;
		m02_axis_aresetn	: in std_logic;
		m02_axis_tvalid	: out std_logic;
		m02_axis_tdata	: out std_logic_vector(C_M02_AXIS_TDATA_WIDTH-1 downto 0);
		m02_axis_tkeep	: out std_logic_vector((C_M02_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m02_axis_tlast	: out std_logic;
		m02_axis_tready	: in std_logic;

		-- Ports of Axi Master Bus Interface M03_AXIS
		m03_axis_aclk	: in std_logic;
		m03_axis_aresetn	: in std_logic;
		m03_axis_tvalid	: out std_logic;
		m03_axis_tdata	: out std_logic_vector(C_M03_AXIS_TDATA_WIDTH-1 downto 0);
		m03_axis_tkeep	: out std_logic_vector((C_M03_AXIS_TDATA_WIDTH/8)-1 downto 0);
		m03_axis_tlast	: out std_logic;
		m03_axis_tready	: in std_logic
	);
end FILTER_DS_x8_v3_v1_0;

architecture behavioral of FILTER_DS_x8_v3_v1_0 is

component HBF_x8 IS
PORT(   clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        hdl_in_re                         :   IN    vector_of_std_logic_vector16(0 TO 1);  -- sfix16_En15 [2]
        hdl_in_im                         :   IN    vector_of_std_logic_vector16(0 TO 1);  -- sfix16_En15 [2]
        valid_in                          :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        Out1_re                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        Out1_im                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        Out2                              :   OUT   std_logic
);
END component;

component FILTER_DS_x8_AXI_LITE is
    generic (
    C_S_AXI_DATA_WIDTH	: integer	:= 32;
    C_S_AXI_ADDR_WIDTH	: integer	:= 4
    );
    port (
    R1  	        : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
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

signal reset : std_logic;
signal b0_validIn : std_logic;
signal b0_dataIn_re, b0_dataIn_im : vector_of_std_logic_vector16(0 TO 1);  -- sfix16_En15 [2]
signal b0_validOut, b0_ce_out : std_logic;
signal b0_dataOut_re, b0_dataOut_im : std_logic_vector(15 downto 0);

signal b1_dataOut_re, b1_dataOut_im : std_logic_vector(2*16-1 downto 0);
signal b1_validOut : std_logic;
signal b1_BWsel : std_logic;

signal b2_R1 : std_logic_vector(32-1 downto 0);

signal aclk : std_logic;
signal aresetn : std_logic;

begin

aclk <= s00_axis_aclk;
aresetn <= s00_axis_aresetn;

-- Instantiation of Axi Bus Interface S00_AXI
b2: FILTER_DS_x8_AXI_LITE
generic map (
    C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
    C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
)
port map (
    R1	=> b2_R1,
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

vt_single_sync_1: vt_single_sync
generic map(
    STAGES => 2,
    STARTUP_VALUE => '0'
)
port map(
    clk => aclk,
    port_i => b2_R1(0),
    port_o => b1_BWsel
);

b0_validIn <= s00_axis_tvalid and s01_axis_tvalid;
reset <= not aresetn;

b0_dataIn_re(0) <= s00_axis_tdata(15 downto 0);
b0_dataIn_re(1) <= s00_axis_tdata(31 downto 16);

b0_dataIn_im(0) <= s01_axis_tdata(15 downto 0);
b0_dataIn_im(1) <= s01_axis_tdata(31 downto 16);

s00_axis_tready <= '1';
s01_axis_tready <= '1';

b0: HBF_x8
PORT map (  clk => aclk,
            reset => reset,
            clk_enable => '1',
            hdl_in_re => b0_dataIn_re,
            hdl_in_im => b0_dataIn_im,
            valid_in => b0_validIn,
            ce_out => b0_ce_out,
            Out1_re => b0_dataOut_re,
            Out1_im  => b0_dataOut_im,
            Out2 => b0_validOut
);

-- Downsampled outputs (SSB decoding input)
m00_axis_tdata <= b0_dataOut_re;
m00_axis_tvalid <= b0_validOut;
m00_axis_tkeep <= (others => '1');
m00_axis_tlast <= '0';

m01_axis_tdata <= b0_dataOut_im;
m01_axis_tvalid <= b0_validOut;
m01_axis_tkeep <= (others => '1');
m01_axis_tlast <= '0';

--b1: ping pong block to pass from SSR=1 to SSR=2
process(aclk)
    variable ping_pong : std_logic := '0';
begin
    if rising_edge(aclk) then
        if aresetn = '0' then
            ping_pong := '0';
            b1_validOut <= '0';
            b1_dataOut_re <= (others => '0');
            b1_dataOut_im <= (others => '0');
        else
            b1_validOut <= '0';
            if b0_validOut = '1' then
                if ping_pong = '0' then
                    b1_validOut <= '0';
                    b1_dataOut_re(16-1 downto 0) <= b0_dataOut_re;
                    b1_dataOut_im(16-1 downto 0) <= b0_dataOut_im;
                    ping_pong := '1';
                else
                    b1_validOut <= '1';
                    b1_dataOut_re(2*16-1 downto 16) <= b0_dataOut_re;
                    b1_dataOut_im(2*16-1 downto 16) <= b0_dataOut_im;
                    ping_pong := '0';
                end if;
            end if;
        end if;
    end if;
end process;

m02_axis_tdata <= s00_axis_tdata when b1_BWsel = '0' else b1_dataOut_re;
m02_axis_tvalid <= s00_axis_tvalid when b1_BWsel = '0' else b1_validOut;
m02_axis_tkeep <= (others => '1');
m02_axis_tlast <= '0';

m03_axis_tdata <= s01_axis_tdata when b1_BWsel = '0' else b1_dataOut_im;
m03_axis_tvalid <= s01_axis_tvalid when b1_BWsel = '0' else b1_validOut;
m03_axis_tkeep <= (others => '1');
m03_axis_tlast <= '0';

end behavioral;

