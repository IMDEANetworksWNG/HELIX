----------------------------------------------------------------------------------

-- 
-- Create Date: 03/14/2022 05:40:27 PM
-- Design Name: 
-- Module Name: SSB_TOP_v2_wrp - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:     - PSS processing: PSS cell id identification
--                          - data buffering to sync with start of slot (assumes known SSB position in the slot).
--                          - SSB processing assumes 61.44Msps data rate (245.76MHz clk and SSR = 1).
--                          - Support two SCS: 30KHz and 240KHz. 
--                          - Data buffering and sync assumes max data rate of 491.52Msps with 245.76MHz clk and SSR=2.
--                          - S00 and S01 AXIS are the real/imag part of the SSB input
--                          - S02 and S03 AXIS are the real/imag part of the stream to be sync 
--                          - M00 and M01 AXIS are the real/imag part of the already sync outputs. 
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SSB_TOP_v2_wrp is
generic (
    -- Parameters of Axi Slave Bus Interface S00_AXI
    C_S00_AXI_DATA_WIDTH	: integer	:= 32;
    C_S00_AXI_ADDR_WIDTH	: integer	:= 4;
    -- Parameters of Axi Slave Bus Interface S00_AXIS
    C_S00_AXIS_TDATA_WIDTH	: integer	:= 16;
    -- Parameters of Axi Slave Bus Interface S01_AXIS
    C_S01_AXIS_TDATA_WIDTH	: integer	:= 16;
    -- Parameters of Axi Slave Bus Interface S02_AXIS
    C_S02_AXIS_TDATA_WIDTH	: integer	:= 32;
    -- Parameters of Axi Slave Bus Interface S03_AXIS
    C_S03_AXIS_TDATA_WIDTH	: integer	:= 32;
    -- Parameters of Axi Master Bus Interface M00_AXIS
    C_M00_AXIS_TDATA_WIDTH	: integer	:= 32;
    -- Parameters of Axi Master Bus Interface M01_AXIS
    C_M01_AXIS_TDATA_WIDTH	: integer	:= 32
);
Port ( 
--    aclk : in std_logic;
--    aresetn : in std_logic;
--    axi_lite_aclk	: in std_logic;
--    axi_lite_aresetn : in std_logic;
    --
    triggerin_TEMP : in std_logic;
    pssenergyOut                    : out std_logic_vector(24 downto 0);            -- s[24 16]
    pssenergyValidOut               : out std_logic;                          
    psscellidOut                    : out std_logic_vector(1 downto 0);             -- u[2 0] 
    psscellidValidOut               : out std_logic;
    cfoOut                          : out std_logic_vector(18 downto 0);            -- s[19 15]
    cfoValidOut                     : out std_logic;
    endssbOut                       : out std_logic;
    triggerOut                      : out std_logic;
--    pbchOut_re                      : out std_logic_vector((256-16)*16-1 downto 0); -- {X[255] X[254] .. X[0]}  --s[16 11]
--    pbchOut_im                      : out std_logic_vector((256-16)*16-1 downto 0); -- {X[255] X[254] .. X[0]}  --s[16 11]
--    pbchValidOut                    : out std_logic;
--    ssscellidOut                    : out std_logic_vector(8 downto 0);             --u[9 0]
--    ssscellidValidOut               : out std_logic;
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
    s00_axis_tkeep	: in std_logic_vector((C_S00_AXIS_TDATA_WIDTH/8)-1 downto 0);
    s00_axis_tlast	: in std_logic;
    s00_axis_tvalid	: in std_logic;
    --
    s01_axis_aclk	: in std_logic;
    s01_axis_aresetn	: in std_logic;
    s01_axis_tready	: out std_logic;
    s01_axis_tdata	: in std_logic_vector(C_S01_AXIS_TDATA_WIDTH-1 downto 0);
    s01_axis_tkeep	: in std_logic_vector((C_S01_AXIS_TDATA_WIDTH/8)-1 downto 0);
    s01_axis_tlast	: in std_logic;
    s01_axis_tvalid	: in std_logic;
    --
    s02_axis_aclk	: in std_logic;
    s02_axis_aresetn	: in std_logic;
    s02_axis_tready	: out std_logic;
    s02_axis_tdata	: in std_logic_vector(C_S02_AXIS_TDATA_WIDTH-1 downto 0);
    s02_axis_tkeep	: in std_logic_vector((C_S02_AXIS_TDATA_WIDTH/8)-1 downto 0);
    s02_axis_tlast	: in std_logic;
    s02_axis_tvalid	: in std_logic;
    --
    s03_axis_aclk	: in std_logic;
    s03_axis_aresetn	: in std_logic;
    s03_axis_tready	: out std_logic;
    s03_axis_tdata	: in std_logic_vector(C_S03_AXIS_TDATA_WIDTH-1 downto 0);
    s03_axis_tkeep	: in std_logic_vector((C_S03_AXIS_TDATA_WIDTH/8)-1 downto 0);
    s03_axis_tlast	: in std_logic;
    s03_axis_tvalid	: in std_logic;
    --
    m00_axis_aclk	: in std_logic;
    m00_axis_aresetn	: in std_logic;
    m00_axis_tvalid	: out std_logic;
    m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
    m00_axis_tkeep	: out std_logic_vector((C_M00_AXIS_TDATA_WIDTH/8)-1 downto 0);
    m00_axis_tlast	: out std_logic;
    m00_axis_tready	: in std_logic;
    --
    m01_axis_aclk	: in std_logic;
    m01_axis_aresetn	: in std_logic;
    m01_axis_tvalid	: out std_logic;
    m01_axis_tdata	: out std_logic_vector(C_M01_AXIS_TDATA_WIDTH-1 downto 0);
    m01_axis_tkeep	: out std_logic_vector((C_M01_AXIS_TDATA_WIDTH/8)-1 downto 0);
    m01_axis_tlast	: out std_logic;
    m01_axis_tready	: in std_logic
);
end SSB_TOP_v2_wrp;

architecture Behavioral of SSB_TOP_v2_wrp is

-- component declaration
component SSB_AXI_LITE is
    generic (
    C_S_AXI_DATA_WIDTH	: integer	:= 32;
    C_S_AXI_ADDR_WIDTH	: integer	:= 4
    );
    port (
    R0	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    R1 : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
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
	
component SSB_TOP_v3 is
PORT(   clk                             : IN  std_logic; -- 245.76MHz 
        reset                           : IN  std_logic;
        clk_enable                      : IN  std_logic;
        --triggerin_TEMP : in std_logic;
        dataIn_re                       : IN  std_logic_vector(16-1 DOWNTO 0);  -- s[16 15]
        dataIn_im                       : IN  std_logic_vector(16-1 DOWNTO 0);  -- s[16 15]
        validIn                         : IN  std_logic;
        BW_sel                          : in  std_logic;
        pssenergyOut                    : out std_logic_vector(24 downto 0);      -- s[24 16]
        pssenergyValidOut               : out std_logic;                          
        psscellidOut                    : out std_logic_vector(1 downto 0); -- u[2 0] 
        psscellidValidOut               : out std_logic;
        cfoOut                          : out std_logic_vector(18 downto 0); -- s[19 15]
        cfoValidOut                     : out std_logic;
        endssbOut                       : out std_logic;
--        pbchOut_re                      : out std_logic_vector((256-16)*16-1 downto 0); -- {X[255] X[254] .. X[0]}  --s[16 11]
--        pbchOut_im                      : out std_logic_vector((256-16)*16-1 downto 0); -- {X[255] X[254] .. X[0]}  --s[16 11]
--        pbchValidOut                    : out std_logic;
--        ssscellidOut                    : out std_logic_vector(8 downto 0); --u[9 0]
--        ssscellidValidOut               : out std_logic;
        tempOut_re                      : out std_logic_vector(15 DOWNTO 0);      --TEMP OUTPUT
        tempOut_im                      : out std_logic_vector(15 DOWNTO 0);      --TEMP OUTPUT
        tempValidOut                    : out std_logic
);
end component;

component packet_sync is
generic (
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
    aclk	: in std_logic;
    aresetn : in std_logic;
    --
    syncIn  : in  std_logic;
    delayIn : in  std_logic_vector(13 downto 0);
    syncOut : out std_logic;
    slotLength : in std_logic_vector(15 downto 0);
    --
    s00_axis_tready	: out std_logic;
    s00_axis_tdata	: in std_logic_vector(C_S00_AXIS_TDATA_WIDTH-1 downto 0);
    s00_axis_tkeep	: in std_logic_vector((C_S00_AXIS_TDATA_WIDTH/8)-1 downto 0);
    s00_axis_tlast	: in std_logic;
    s00_axis_tvalid	: in std_logic;
    --
    s01_axis_tready	: out std_logic;
    s01_axis_tdata	: in std_logic_vector(C_S01_AXIS_TDATA_WIDTH-1 downto 0);
    s01_axis_tkeep	: in std_logic_vector((C_S01_AXIS_TDATA_WIDTH/8)-1 downto 0);
    s01_axis_tlast	: in std_logic;
    s01_axis_tvalid	: in std_logic;
    --
    m00_axis_tvalid	: out std_logic;
    m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
    m00_axis_tkeep	: out std_logic_vector((C_M00_AXIS_TDATA_WIDTH/8)-1 downto 0);
    m00_axis_tlast	: out std_logic;
    m00_axis_tready	: in std_logic;

    m01_axis_tvalid	: out std_logic;
    m01_axis_tdata	: out std_logic_vector(C_M01_AXIS_TDATA_WIDTH-1 downto 0);
    m01_axis_tkeep	: out std_logic_vector((C_M01_AXIS_TDATA_WIDTH/8)-1 downto 0);
    m01_axis_tlast	: out std_logic;
    m01_axis_tready	: in std_logic
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

--component ila_SSB IS
--PORT (
--    clk : IN STD_LOGIC;
--    probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--    probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
--);
--END component;

signal aclk	: std_logic;
signal aresetn : std_logic;
signal reset : std_logic;
signal b0_validIn : std_logic;
signal b0_pssenergyValidOut : std_logic;
signal SSB_delayIn, b1_SSB_delayIn : std_logic_vector(31 downto 0);
signal SSB_syncOut : std_logic;
signal R1, R1_s : std_logic_vector(31 downto 0);

signal tempOut_re                      : std_logic_vector(15 DOWNTO 0);      --TEMP OUTPUT
signal tempOut_im                      : std_logic_vector(15 DOWNTO 0);      --TEMP OUTPUT
signal tempValidOut                    : std_logic;

signal b2_BW_sel_s : std_logic;

signal psscellidValidOut_s: std_logic;
signal m00_axis_tdata_s : std_logic_vector(31 downto 0);
signal m00_axis_tvalid_s : std_logic;

begin

-- Instantiation of Axi Bus Interface S00_AXI
b2: SSB_AXI_LITE
generic map (
    C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
    C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
)
port map (
    R0	=> SSB_delayIn,
    R1 => R1,
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

aclk <= s00_axis_aclk;
aresetn <= s00_axis_aresetn;
reset <= not aresetn;
b0_validIn <= s00_axis_tvalid and s01_axis_tvalid;

b0: SSB_TOP_v3
PORT MAP(   clk => aclk,
            reset => reset,
            --triggerin_TEMP => triggerin_TEMP,
            clk_enable => '1',
            dataIn_re => s00_axis_tdata,
            dataIn_im => s01_axis_tdata,
            validIn => b0_validIn,
            BW_sel => R1_s(0),
            pssenergyOut => pssenergyOut,
            pssenergyValidOut => b0_pssenergyValidOut,                          
            psscellidOut => psscellidOut, 
            psscellidValidOut => psscellidValidOut_s,
            cfoOut => cfoOut,
            cfoValidOut => cfoValidOut,
            endssbOut => endssbOut,
--            pbchOut_re => pbchOut_re,
--            pbchOut_im => pbchOut_im,
--            pbchValidOut => pbchValidOut,
--            ssscellidOut => ssscellidOut,
--            ssscellidValidOut => ssscellidValidOut
            tempOut_re => tempOut_re,
            tempOut_im => tempOut_im,
            tempValidOut => tempValidOut
);
psscellidValidOut <= psscellidValidOut_s;

--m00_axis_tvalid <= tempValidOut;
--m00_axis_tdata	<= tempOut_re;
--m00_axis_tkeep <= (others => '1');
--m00_axis_tlast <= '0';

--m01_axis_tvalid <= tempValidOut;
--m01_axis_tdata	<= tempOut_im;
--m01_axis_tkeep <= (others => '1');
--m01_axis_tlast <= '0';

pssenergyValidOut <= b0_pssenergyValidOut;  

b1_sync: for I in 0 to 31 generate
    vt_single_sync_inst_1 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => aclk,
        port_i => SSB_delayIn(I),
        port_o => b1_SSB_delayIn(I)
    );

    vt_single_sync_inst_2 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => aclk,
        port_i => R1(I),
        port_o => R1_s(I)
    );

end generate;


b1: packet_sync 
Port Map (  aclk => aclk,
            aresetn => aresetn,
            --
            syncIn => b0_pssenergyValidOut,
            delayIn => b1_SSB_delayIn(13 downto 0),
            syncOut => SSB_syncOut,
            slotLength => R1_s(15+1 downto 0+1),
            --
            s00_axis_tready	=> open,
            s00_axis_tdata => s02_axis_tdata,
            s00_axis_tkeep => s02_axis_tkeep,
            s00_axis_tlast => s02_axis_tlast,
            s00_axis_tvalid	 => s02_axis_tvalid,
            --
            s01_axis_tready	=> open,
            s01_axis_tdata => s03_axis_tdata,
            s01_axis_tkeep => s03_axis_tkeep,
            s01_axis_tlast => s03_axis_tlast,
            s01_axis_tvalid => s03_axis_tvalid,
            --
            m00_axis_tvalid => m00_axis_tvalid_s,
            m00_axis_tdata	=> m00_axis_tdata_s,
            m00_axis_tkeep => m00_axis_tkeep,
            m00_axis_tlast => m00_axis_tlast,
            m00_axis_tready => m00_axis_tready,
        
            m01_axis_tvalid => m01_axis_tvalid,
            m01_axis_tdata => m01_axis_tdata,
            m01_axis_tkeep => m01_axis_tkeep,
            m01_axis_tlast => m01_axis_tlast,
            m01_axis_tready => m01_axis_tready
);

m00_axis_tdata <= m00_axis_tdata_s;
m00_axis_tvalid <= m00_axis_tvalid_s;
triggerOut <= SSB_syncOut;

--ila0_blk : ila_SSB
--port map ( clk => aclk,
--           probe0 => m00_axis_tdata_s,
--           probe1(0) => m00_axis_tvalid_s,
--           probe2(0) => psscellidValidOut_s
--);

s00_axis_tready	<= '1'; 
s01_axis_tready	<= '1'; 
s02_axis_tready	<= '1'; 
s03_axis_tready	<= '1';

end behavioral;