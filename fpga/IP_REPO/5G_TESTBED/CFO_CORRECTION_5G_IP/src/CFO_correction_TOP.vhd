----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2022 12:53:34 PM
-- Design Name: 
-- Module Name: CFO_correction_TOP - Behavioral
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

entity CFO_correction_TOP is
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
    angleIn : IN std_logic_vector(19-1 DOWNTO 0); -- s[19 15]   
    angleIn_valid : IN std_logic;
    cfo_resetn : in std_logic;
    aclk : in std_logic;
    aresetn : in std_logic;
    s00_axi_aclk    : in std_logic;
    s00_axi_aresetn : in std_logic;
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
    --s00_axis_aclk	: in std_logic;
    --s00_axis_aresetn	: in std_logic;
    s00_axis_tready	: out std_logic;
    s00_axis_tdata	: in std_logic_vector(C_S00_AXIS_TDATA_WIDTH-1 downto 0);
    s00_axis_tkeep	: in std_logic_vector(4-1 downto 0);
    s00_axis_tlast	: in std_logic;
    s00_axis_tvalid	: in std_logic;
    --
    --s01_axis_aclk	: in std_logic;
    --s01_axis_aresetn	: in std_logic;
    s01_axis_tready	: out std_logic;
    s01_axis_tdata	: in std_logic_vector(C_S01_AXIS_TDATA_WIDTH-1 downto 0);
    s01_axis_tkeep	: in std_logic_vector(4-1 downto 0);
    s01_axis_tlast	: in std_logic;
    s01_axis_tvalid	: in std_logic;
    --
    --m00_axis_aclk	: in std_logic;
    --m00_axis_aresetn	: in std_logic;
    m00_axis_tvalid	: out std_logic;
    m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
    m00_axis_tkeep	: out std_logic_vector(4-1 downto 0);
    m00_axis_tlast	: out std_logic;
    m00_axis_tready	: in std_logic;

    --m01_axis_aclk	: in std_logic;
    --m01_axis_aresetn	: in std_logic;
    m01_axis_tvalid	: out std_logic;
    m01_axis_tdata	: out std_logic_vector(C_M01_AXIS_TDATA_WIDTH-1 downto 0);
    m01_axis_tkeep	: out std_logic_vector(4-1 downto 0);
    m01_axis_tlast	: out std_logic;
    m01_axis_tready	: in std_logic
);
end CFO_correction_TOP;

architecture Behavioral of CFO_correction_TOP is

component CFO_correction is
PORT(   clk                             : IN    std_logic; -- 245.76MHz 
        reset                           : IN    std_logic;
        dataIn_re                       : IN    std_logic_vector(2*16-1 DOWNTO 0);  -- s[16,15]
        dataIn_im                       : IN    std_logic_vector(2*16-1 DOWNTO 0);  -- s[16,15]
        validIn                         : IN    std_logic;
        angleIn                         : IN    std_logic_vector(19-1 DOWNTO 0); -- s[19 15]   
        angleIn_valid                   : IN    std_logic;
        BW_SEL                          : IN    std_logic;
        scalingOut                      : in    std_logic_vector(4 downto 0);
        dataOut_re                      : out   std_logic_vector(2*16-1 DOWNTO 0);  -- s[16,15]
        dataOut_im                      : out   std_logic_vector(2*16-1 DOWNTO 0);  -- s[16,15]
        validOut                        : out   std_logic
);
end component;

component CFO_correction_AXI_LITE is
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

--component ila_0 IS
--PORT (
--    clk : IN STD_LOGIC;
--    probe0 : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
--    probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe2 : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
--    probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe4 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
--);
--END component;

--signal aclk, std_logic;
signal reset : std_logic;

signal b0_angleIn : std_logic_vector(19-1 DOWNTO 0); -- s[19 15]   
signal b0_angleValidIn : std_logic;

signal b1_validIn : std_logic;
signal b1_dataOut_re, b1_dataOut_im : std_logic_vector(16*2-1 downto 0);
signal b1_validOut : std_logic;

signal b2_R0, b2_R0_s : std_logic_vector(31 downto 0);
signal BW_sel, BLK_en : std_logic;
signal scalingOut : std_logic_vector(4 downto 0);

begin

--aclk <= s00_axis_aclk;
--reset <= not s00_axis_aresetn;--aresetn;
reset <= not aresetn;
s00_axis_tready <= '1';
s01_axis_tready <= '1';

process(aclk)
begin
    if rising_edge(aclk) then
        if reset = '1' then
            b0_angleIn <= (others => '0');
            b0_angleValidIn <= '0';
        else
            b0_angleValidIn <= '0';
            if cfo_resetn = '0' or BLK_en = '0' then
                b0_angleIn <= (others => '0');
                b0_angleValidIn <= '1';
            elsif angleIn_valid = '1' then
                b0_angleIn <= std_logic_vector(signed(b0_angleIn) + signed(angleIn));
                b0_angleValidIn <= '1';
            end if;
        end if;
    end if;
end process;

b1_validIn <= s00_axis_tvalid and s01_axis_tvalid;

--ILA_BLK: ila_0 
--PORT MAP(
--    clk => aclk,
--    probe0 => angleIn,
--    probe1(0) => angleIn_valid,
--    probe2 => b0_angleIn,
--    probe3(0) => b0_angleValidIn,
--    probe4(0) => cfo_resetn,
--    probe5(0) => BLK_en
--);

b1: CFO_correction
port map (  clk => aclk, 
            reset => reset,
            dataIn_re => s00_axis_tdata,
            dataIn_im => s01_axis_tdata,
            validIn => b1_validIn,
            angleIn => b0_angleIn, 
            angleIn_valid => b0_angleValidIn,
            BW_SEL => BW_SEL,
            scalingOut => scalingOut,
            dataOut_re => b1_dataOut_re, --s[16 15]
            dataOut_im => b1_dataOut_im, --s[16 15]
            validOut => b1_validOut
);

process(aclk)
begin
    if rising_edge(aclk) then
        if BLK_en = '1' then -- CFO correction is enabled
            m00_axis_tvalid	<= b1_validOut;
            m00_axis_tdata	<= b1_dataOut_re;
            m00_axis_tkeep	<= (others => '1');
            m00_axis_tlast	<= '0';
            
            m01_axis_tvalid	<= b1_validOut;
            m01_axis_tdata	<= b1_dataOut_im;
            m01_axis_tkeep	<= (others => '1');
            m01_axis_tlast	<= '0';
        else -- CFO correction is disabled
            m00_axis_tkeep	<= (others => '1');
            m00_axis_tlast	<= '0';
            m00_axis_tvalid	<= b1_validIn;
            m01_axis_tkeep	<= (others => '1');
            m01_axis_tlast	<= '0';
            m01_axis_tvalid	<= b1_validIn;
            
            case scalingOut is
                when "00000" => --div1
                    m00_axis_tdata	<= s00_axis_tdata;
                    m01_axis_tdata	<= s01_axis_tdata;
                when "00001" =>  --div2
                    m00_axis_tdata(15 downto 0)	<= s00_axis_tdata(15) & s00_axis_tdata(15 downto 0+1);                             
                    m00_axis_tdata(31 downto 16)	<= s00_axis_tdata(31) & s00_axis_tdata(31 downto 16+1);                             
                    m01_axis_tdata(15 downto 0)	<= s01_axis_tdata(15) & s01_axis_tdata(15 downto 0+1);                             
                    m01_axis_tdata(31 downto 16)	<= s01_axis_tdata(31) & s01_axis_tdata(31 downto 16+1);                             
                when "00010" => --div4
                    m00_axis_tdata(15 downto 0)	<= s00_axis_tdata(15) & s00_axis_tdata(15) & s00_axis_tdata(15 downto 0+2);                             
                    m00_axis_tdata(31 downto 16) <= s00_axis_tdata(31) & s00_axis_tdata(31) & s00_axis_tdata(31 downto 16+2);                             
                    m01_axis_tdata(15 downto 0)	<= s01_axis_tdata(15) & s01_axis_tdata(15) & s01_axis_tdata(15 downto 0+2);                             
                    m01_axis_tdata(31 downto 16)	<= s01_axis_tdata(31) & s01_axis_tdata(31) & s01_axis_tdata(31 downto 16+2);                             
                when "00011" => --div8
                    m00_axis_tdata(15 downto 0)	<= s00_axis_tdata(15) & s00_axis_tdata(15) & s00_axis_tdata(15) & s00_axis_tdata(15 downto 0+3);                             
                    m00_axis_tdata(31 downto 16) <= s00_axis_tdata(31) & s00_axis_tdata(31) & s00_axis_tdata(31) & s00_axis_tdata(31 downto 16+3);                             
                    m01_axis_tdata(15 downto 0)	<= s01_axis_tdata(15) & s01_axis_tdata(15) & s01_axis_tdata(15) & s01_axis_tdata(15 downto 0+3);                             
                    m01_axis_tdata(31 downto 16)	<= s01_axis_tdata(31) & s01_axis_tdata(31) & s01_axis_tdata(31) & s01_axis_tdata(31 downto 16+3);                             
                when "00100" => --mul2
                    m00_axis_tdata(15 downto 0)	<= s00_axis_tdata(14 downto 0) & "0";                             
                    m00_axis_tdata(31 downto 16)	<= s00_axis_tdata(30 downto 16) & "0";                                 
                    m01_axis_tdata(15 downto 0)	<= s01_axis_tdata(14 downto 0) & "0";                             
                    m01_axis_tdata(31 downto 16)	<= s01_axis_tdata(30 downto 16) & "0";                             
                when "00101" => --mul4
                    m00_axis_tdata(15 downto 0)	<= s00_axis_tdata(13 downto 0) & "00";                             
                    m00_axis_tdata(31 downto 16)	<= s00_axis_tdata(29 downto 16) & "00";                                 
                    m01_axis_tdata(15 downto 0)	<= s01_axis_tdata(13 downto 0) & "00";                             
                    m01_axis_tdata(31 downto 16)	<= s01_axis_tdata(29 downto 16) & "00";                             
                when "00110" => --mul8
                    m00_axis_tdata(15 downto 0)	<= s00_axis_tdata(12 downto 0) & "000";                             
                    m00_axis_tdata(31 downto 16)	<= s00_axis_tdata(28 downto 16) & "000";                                 
                    m01_axis_tdata(15 downto 0)	<= s01_axis_tdata(12 downto 0) & "000";                             
                    m01_axis_tdata(31 downto 16)	<= s01_axis_tdata(28 downto 16) & "000";                             
                when others =>         
                    m00_axis_tdata	<= s00_axis_tdata;
                    m01_axis_tdata	<= s01_axis_tdata;
            end case;               
          
        end if;
    end if;
end process;

-- Instantiation of Axi Bus Interface S00_AXI
b2: CFO_correction_AXI_LITE
generic map (
    C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
    C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
)
port map (
    R1	=> b2_R0,
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

vt_single_sync_GEN : for ii in 0 to 31 generate
    vt_single_sync_inst_1 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => aclk,
        port_i => b2_R0(ii),
        port_o => b2_R0_s(ii)
    );
end generate;

BW_sel <= b2_R0_s(0);
BLK_en <= b2_R0_s(1);
scalingOut <= b2_R0_s(6 downto 2);

--vt_single_sync_inst_1 : vt_single_sync
--generic map(
--    STAGES => 2,
--    STARTUP_VALUE => '0'
--)
--port map(
--    clk => aclk,
--    port_i => b2_R0(0),
--    port_o => BW_sel
--);

--vt_single_sync_inst_2 : vt_single_sync
--generic map(
--    STAGES => 2,
--    STARTUP_VALUE => '0'
--)
--port map(
--    clk => aclk,
--    port_i => b2_R0(1),
--    port_o => BLK_en
--);
    
end Behavioral;
