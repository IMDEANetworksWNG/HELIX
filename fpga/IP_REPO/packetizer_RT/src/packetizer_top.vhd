----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2022 03:58:03 PM
-- Design Name: 
-- Module Name: packetizer_top - Behavioral
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

entity packetizer_top is
generic (
    -- Parameters of Axi Slave Bus Interface S00_AXI
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
    C_M00_AXIS_TDATA_WIDTH	: integer	:= 64
);
Port (  

        pssEnergy : in std_logic_vector(24 downto 0);
        pssEnergyValid : in std_logic;
        
        cfoIn : in std_logic_vector(18 downto 0);
        cfoValidIn : in std_logic;
        
        nVar : in std_logic_vector(31 downto 0);
        nVarValidIn : in std_logic;
        
        triggerIn : in std_logic;

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
        aclk	: in std_logic;
        aresetn	: in std_logic;
        
        s00_axis_tready	    : out std_logic;
        s00_axis_tdata	    : in std_logic_vector(C_S00_AXIS_TDATA_WIDTH-1 downto 0);
        s00_axis_tkeep      : in std_logic_vector(C_S00_AXIS_TDATA_WIDTH/8-1 downto 0);
        s00_axis_tlast      : in std_logic;
        s00_axis_tvalid	    : in std_logic;
        --

        s01_axis_tready	: out std_logic;
        s01_axis_tdata	: in std_logic_vector(C_S01_AXIS_TDATA_WIDTH-1 downto 0);
        s01_axis_tkeep	: in std_logic_vector(C_S01_AXIS_TDATA_WIDTH/8-1 downto 0);
        s01_axis_tlast	: in std_logic;
        s01_axis_tvalid	: in std_logic;
        --


        m00_axis_tvalid	: out std_logic;
        m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
        m00_axis_tkeep	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH/8-1 downto 0);
        m00_axis_tlast	: out std_logic;
        m00_axis_tready	: in std_logic;
        m00_axis_tuser	: out std_logic_vector(1 downto 0)


);
end packetizer_top;

architecture Behavioral of packetizer_top is

component PACKETIZER_AXI_LITE is
generic (
    C_S_AXI_DATA_WIDTH	: integer	:= 32;
    C_S_AXI_ADDR_WIDTH	: integer	:= 4
);
port (
    R0    : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    R1    : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    R2    : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    --
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



  component CHAN_FIFO_2 IS
    PORT (
      s_axis_aclk : IN STD_LOGIC;
      s_axis_aresetn : IN STD_LOGIC;

      s_axis_tvalid : IN STD_LOGIC;
      s_axis_tready : OUT STD_LOGIC;
      s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
      s_axis_tlast : IN STD_LOGIC;
      
      m_axis_tvalid : OUT STD_LOGIC;
      m_axis_tready : IN STD_LOGIC;
      m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
      m_axis_tlast : OUT STD_LOGIC
    );
END component;

component POW_FIFO IS
  PORT (
    srst : IN STD_LOGIC;
    clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    valid : OUT STD_LOGIC;
    wr_rst_busy : OUT STD_LOGIC;
    rd_rst_busy : OUT STD_LOGIC
  );
END component;

--component ila_0 IS
--PORT (
--    clk : IN STD_LOGIC;
--    probe0 : IN STD_LOGIC;
--    probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--    probe3 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe4 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
--    probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe8 : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
--);
--END component;

constant one : std_logic_vector(63 downto 0) := x"0000000000000001";

signal clk : std_logic;
signal rst_n, rst : std_logic;

signal R0, R1, R2 : std_logic_vector(31 downto 0);
signal R0_s, R1_s, R2_s : std_logic_vector(31 downto 0);

signal dataIn_re, dataIn_im : std_logic_vector(31 downto 0);
signal validIn, lastIn : std_logic;

signal saveData, saveChanVals, savePowVals, saveTimeVals, saveCFOVals : std_logic;
signal numPackets : std_logic_vector(19 downto 0);
signal timeScale : std_logic_vector(6 downto 0);

type state_type is (st1_WAIT_TRIGGER,st2_IDLE, st3_SEND_CHAN_VALS, st4_SEND_POWER,st5_SEND_NOISE, st5_SEND_TIME, st6_SEND_CFO);
signal b1_state : state_type;
signal state_temp : std_logic_vector(2 downto 0);
signal b1_dataOutRe, b1_dataOutIm : std_logic_vector(31 downto 0);  
signal b1_validOut : std_logic;
signal b1_countPackets : integer range 0 to 2**20-1 := 0;
signal b1_FIFO_rst,b1_FIFO_arst : std_logic := '0';
signal b1_countSamples : integer range 0 to 2**17-1;
signal b1_countReady, b1_countEN : std_logic;


--Chan FIFO
signal b3_dataIn, b3_dataOut : std_logic_vector(63 downto 0);
signal b3_valid, b3_ready : std_logic;
signal b3_last : std_logic;

--Pow FIFO
signal b4_dataIn, b4_dataOut : std_logic_vector(63 downto 0);
signal b4_valid,b4_ready : std_logic;
signal b4_full, b4_empty : std_logic;

--Time FIFO
signal b5_dataOut : std_logic_vector(63 downto 0);
signal b5_valid , b5_ready: std_logic;
signal b5_full, b5_empty : std_logic;

--TimeStamp
signal b6_counterTimeStamp : std_logic_vector(63 downto 0);
signal b6_counterScale : integer range 0 to 2**7-1;

--CFO FIFO
signal b7_dataIn, b7_dataOut, b1_countSamples_TEMP : std_logic_vector(63 downto 0);
signal b7_valid,b7_ready : std_logic;
signal b7_full, b7_empty : std_logic;

--CFO FIFO
signal b8_dataIn, b8_dataOut, b8_countSamples_TEMP : std_logic_vector(63 downto 0);
signal b8_valid,b8_ready : std_logic;
signal b8_full, b8_empty : std_logic;

signal start,previous_state, enable, triggerIN_s: std_logic;

begin

clk <= aclk;
rst_n <= aresetn;
rst <= not aresetn;

-- Instantiation of Axi Bus Interface S00_AXI
b0: PACKETIZER_AXI_LITE
generic map (
    C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
    C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH
)
port map (
    R0 => R0,
    R1 => R1,
    R2 => R2,
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

        vt_single_sync_inst_3 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => clk,
        port_i => triggerIN,
        port_o => triggerIN_s
    );

vt_single_sync_gen1: for ii in 0 to 31 generate
    vt_single_sync_inst_0 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => clk,
        port_i => R0(ii),
        port_o => R0_s(ii)
    );

    vt_single_sync_inst_1 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => clk,
        port_i => R1(ii),
        port_o => R1_s(ii)
    );

    vt_single_sync_inst_2 : vt_single_sync
    generic map(
        STAGES => 2,
        STARTUP_VALUE => '0'
    )
    port map(
        clk => clk,
        port_i => R2(ii),
        port_o => R2_s(ii)
    );
    
end generate;



enable <= R0_s(0);
saveData <= R0_s(4);
saveChanVals <= R0_s(5);
savePowVals <= R0_s(6);
saveTimeVals <= R0_s(7);
saveCFOVals <= R0_s(8);
--
numPackets <= R0_s(31 downto 12);
timeScale <= R1_s(6 downto 0);


--ilablk: ila_0
--PORT MAP(
--    clk => clk,
--    probe0 => b3_ready,
--    probe1(0) => m00_axis_tready,
--    probe2 => b8_dataOut(31 downto 0),
--    probe3(0) => b8_ready,
--    probe4 => state_temp,
--    probe5(0) => b8_valid,
--    probe6(0) => triggerIn_s,
--    probe7(0) => b4_ready,
--    probe8 => b4_dataOut(31 downto 0)
--);
--b1: Packet counter
process(clk)
begin
    if rising_edge(clk) then
        if (rst_n = '0') then
            b1_state <= st1_WAIT_TRIGGER;
            b1_countPackets <= 0;
            b1_FIFO_rst <= '1';
        else
            b1_FIFO_rst <= '0';
            case (b1_state) is
                when st1_WAIT_TRIGGER =>
                    state_temp <= "000";
                    if start = '1' and enable = '1' then
                        if saveChanVals = '1' then
                            b1_state <= st3_SEND_CHAN_VALS;
                        elsif savePowVals = '1' then 
                            b1_state <= st4_SEND_POWER;
                        elsif saveCFOVals = '1' then 
                            b1_state <= st6_SEND_CFO;
                        end if;
                    end if;
                when st2_IDLE =>  
                    state_temp <= "001";
                    if m00_axis_tready = '1' then -- This will send dummy data as tlast
                        if b1_countPackets < to_integer(unsigned(numPackets)-1) then
                            b1_countPackets <= b1_countPackets + 1;
                            if saveChanVals = '1' then
                                b1_state <= st3_SEND_CHAN_VALS;
                            elsif savePowVals = '1' then 
                                b1_state <= st4_SEND_POWER;
                            elsif saveCFOVals = '1' then 
                                b1_state <= st6_SEND_CFO;
                            end if;
                        else
                            b1_countPackets <= 0;
                            b1_state <= st1_WAIT_TRIGGER;
                        end if;
                    end if;    
                when st3_SEND_CHAN_VALS => 
                    state_temp <= "010";
                    if b3_last = '1' and m00_axis_tready = '1' then
                        if savePowVals = '1' then 
                            b1_state <= st4_SEND_POWER;
                        elsif saveCFOVals = '1' then 
                            b1_state <= st6_SEND_CFO;
                        else
                            b1_state <= st2_IDLE;
                        end if;                
                    end if;
                when st4_SEND_POWER => 
                    state_temp <= "011";
                    if m00_axis_tready = '1'then
                         b1_state <= st5_SEND_NOISE;
                    end if;
                when st5_SEND_NOISE => 
                    state_temp <= "100";                  
                       if m00_axis_tready = '1'  then
                           if saveCFOVals = '1' then 
                                b1_state <= st6_SEND_CFO;
                            else
                                b1_state <= st2_IDLE;
                            end if;  
                       end if;   
--                when st5_SEND_TIME => 
--                    state_temp <= "100";
--                        b1_readFIFOTime <= '1';
--                        if b5_valid = '1' and b1_readFIFOTime = '1' then
--                            b1_readFIFOTime <= '0';
--                            b1_state <= st6_SEND_CFO;
--                        end if;
--                    end if;
                when st6_SEND_CFO => 
                    state_temp <= "101";                  
                        if m00_axis_tready = '1'  then
                            b1_state <= st2_IDLE;
                        end if;  

                when others => 
                    b1_state <= st1_WAIT_TRIGGER;
            end case;
        end if;
    end if;
end process;

with b1_state select
    m00_axis_tdata  <= b3_dataOut when st3_SEND_CHAN_VALS,
                     b4_dataOut when st4_SEND_POWER,
                     b8_dataOut when st5_SEND_NOISE,
                     b7_dataOut when st6_SEND_CFO,
                     (others => '0') when others;

with b1_state select
    m00_axis_tvalid <= '1' when st2_IDLE,  
                     b3_valid when st3_SEND_CHAN_VALS,
                     b4_valid when st4_SEND_POWER,
                     b8_valid when st5_SEND_NOISE,
                     b7_valid when st6_SEND_CFO,
                     '0' when others;


    -- Set ready signal for the selected input only
b3_ready <= '1' when (b1_state = st3_SEND_CHAN_VALS and m00_axis_tready = '1') else '0';
b4_ready <= '1' when (b1_state = st4_SEND_POWER and m00_axis_tready = '1') else '0';
b8_ready <= '1' when (b1_state = st5_SEND_NOISE and m00_axis_tready = '1') else '0';
b7_ready <= '1' when (b1_state = st6_SEND_CFO and m00_axis_tready = '1') else '0';

m00_axis_tlast <= '1' when (b1_state = st2_IDLE) else '0';
    

b1_FIFO_arst<=not(b1_FIFO_rst);
b3_dataIn <= s01_axis_tdata & s00_axis_tdata;
b3: CHAN_FIFO_2
PORT MAP(
      s_axis_aclk => clk,
      s_axis_aresetn => b1_FIFO_arst,
      s_axis_tvalid => s00_axis_tvalid,
      s_axis_tready => s00_axis_tready,
      s_axis_tdata => b3_dataIn,
      s_axis_tlast => s00_axis_tlast,
      
      m_axis_tvalid => b3_valid,
      m_axis_tready => b3_ready,
      m_axis_tdata => b3_dataOut,
      m_axis_tlast => b3_last
);


b4_dataIn(b4_dataIn'high downto pssEnergy'high+1) <= (others => '0');
b4_dataIn(pssEnergy'high downto 0) <= pssEnergy;

b4: POW_FIFO
PORT MAP(
    srst => b1_FIFO_rst,
    clk => clk,
    din => b4_dataIn,
    wr_en => pssEnergyValid,
    rd_en => b4_ready,
    dout => b4_dataOut,
    full => b4_full,
    empty => b4_empty,
    valid => b4_valid,
    wr_rst_busy => open,
    rd_rst_busy => open
);

b5: POW_FIFO
PORT MAP(
    srst => b1_FIFO_rst,
    clk => clk,
    din => b6_counterTimeStamp,
    wr_en => pssEnergyValid,
    rd_en => b5_ready,
    dout => b5_dataOut,
    full => b5_full,
    empty => b5_empty,
    valid => b5_valid,
    wr_rst_busy => open,
    rd_rst_busy => open
);

-- b6: Compute timeStamp 
--process(clk)
--begin
--    if rising_edge(clk) then
--        --if (rst_n = '0') or b1_state = st6_FINISH then
--        if adc_global_start = '0' then
--            b6_counterTimeStamp <= (others => '0');
--            b6_counterScale <= 0;
--        else
--            if b6_counterScale = to_integer(unsigned(timeScale)) then
--               b6_counterScale <= 0;
--               b6_counterTimeStamp <= std_logic_vector(unsigned(b6_counterTimeStamp) + unsigned(one));
--            else
--                b6_counterScale <= b6_counterScale + 1;
--            end if;
--        end if;
--    end if;
--end process;


b7_dataIn <= std_logic_vector(resize(signed(cfoIn),b7_dataIn'length));

b7: POW_FIFO
PORT MAP(
    srst => b1_FIFO_rst,
    clk => clk,
    din => b7_dataIn,
    wr_en => cfoValidIn,
    rd_en => b7_ready,
    dout => b7_dataOut,
    full => b7_full,
    empty => b7_empty,
    valid => b7_valid,
    wr_rst_busy => open,
    rd_rst_busy => open
);

b8_dataIn(b4_dataIn'high downto nVar'high+1) <= (others => '0');
b8_dataIn(nVar'high downto 0) <= nVar;

b8: POW_FIFO
PORT MAP(
    srst => b1_FIFO_rst,
    clk => clk,
    din => b8_dataIn,
    wr_en => nVarValidIn,
    rd_en => b8_ready,
    dout => b8_dataOut,
    full => b8_full,
    empty => b8_empty,
    valid => b8_valid,
    wr_rst_busy => open,
    rd_rst_busy => open
);




m00_axis_tkeep <= (others => '1');
m00_axis_tuser <= b"10";


process(clk)
begin
        if rising_edge(clk) then
            if (triggerIN_s = '1' and previous_state = '0') then
                start <= '1';
            else
                start <= '0';
            end if;
            previous_state <= triggerIN_s;
        end if;
end process;
    

end Behavioral;
