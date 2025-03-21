----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2022 05:52:12 PM
-- Design Name: 
-- Module Name: packet_sync - Behavioral
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

entity packet_sync is
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
end packet_sync;

architecture Behavioral of packet_sync is

component PACKET_SYNC_MEM IS
PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    clkb : IN STD_LOGIC;
    enb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
);
END component;

--component ila_SSB IS
--PORT (
--    clk : IN STD_LOGIC;
--    probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
--    probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
--    probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
--);
--END component;

constant ONE : unsigned(13 DOWNTO 0) := "00000000000001";

signal wr_addr : unsigned(13 DOWNTO 0);
signal rd_addr : unsigned(13 DOWNTO 0);
signal b0_ena, b0_validIn : std_logic;
signal b0_dataIn, b0_dataOut : std_logic_vector(2*32-1 downto 0);
signal b0_validOut, b0_validOut_r : std_logic;
signal syncOut_s : std_logic;
signal lock : std_logic;

signal m00_axis_tdata_s, m01_axis_tdata_s : std_logic_vector(32-1 downto 0);
signal m00_axis_tlast_s, m01_axis_tlast_s : std_logic;
signal m00_axis_tvalid_s, m01_axis_tvalid_s : std_logic;

signal slotCounter : integer range 0 to 2**16-1 := 0;

begin

b0_ena <= aresetn;
b0_validIn <= s00_axis_tvalid and s01_axis_tvalid;
b0_dataIn <= s00_axis_tdata & s01_axis_tdata;

process(aclk)
begin
    if rising_edge(aclk) then
        if aresetn = '0' then
            wr_addr <= (others => '0');
            rd_addr <= (others => '0');
        else
            wr_addr <= rd_addr + unsigned(delayIn);
            if s00_axis_tvalid = '1' then
                rd_addr <= rd_addr + ONE(rd_addr'high downto 0);
            end if;
        end if;
        
        b0_validOut <= s00_axis_tvalid;
        b0_validOut_r <= b0_validOut;
    end if;
end process;

b0: PACKET_SYNC_MEM
PORT MAP(   clka => aclk,
            ena => b0_ena,
            wea(0) => b0_validIn,
            addra => std_logic_vector(wr_addr),
            dina => b0_dataIn,
            clkb => aclk,
            enb => b0_ena,
            addrb => std_logic_vector(rd_addr),
            doutb => b0_dataOut
);

process(aclk)
    variable ENA_var : std_logic;
begin
    if rising_edge(aclk) then
        if aresetn = '0' then
            syncOut_s <= '0';
        else
            if syncIn = '1' then
                syncOut_s <= '1';
            elsif b0_validOut = '1' then
                syncOut_s <= '0';
            end if;
        end if;
    end if;
end process;

--syncOut <= syncOut_s and b0_validOut;


process(aclk)
begin
    if rising_edge(aclk) then
        if aresetn = '0' then
            slotCounter <= 0;
            lock <= '0';
        else
            m00_axis_tdata_s <= b0_dataOut(4*16-1 downto 3*16+1) & (syncOut_s and b0_validOut) & b0_dataOut(3*16-1 downto 2*16+1) & (syncOut_s and b0_validOut);
            m01_axis_tdata_s <= b0_dataOut(2*16-1 downto 0);
            
            if syncOut_s = '1' and b0_validOut = '1' then
                slotCounter <= 0;
                m00_axis_tvalid_s <= b0_validOut;
                m00_axis_tlast_s <= '0';
                syncOut <= '1';
                lock <= '1';
            elsif slotCounter < to_integer(unsigned(slotLength)) and b0_validOut = '1' and lock <= '1' then
                slotCounter <= slotCounter + 1;
                m00_axis_tvalid_s <= b0_validOut;
                m00_axis_tlast_s <= '0';
                syncOut <= '0';
                lock <= '1';
            elsif slotCounter = to_integer(unsigned(slotLength))  and b0_validOut = '1' and lock <= '1'  then
                slotCounter <= slotCounter + 1;
                m00_axis_tvalid_s <= b0_validOut;
                m00_axis_tlast_s <= '1';
                syncOut <= '0';
                lock <= '0';
            else
                m00_axis_tlast_s <= '0';
                m00_axis_tvalid_s <= '0';
                syncOut <= '0';
                lock <= '0';
            end if;
        end if;
    end if;
end process;

m00_axis_tdata <= m00_axis_tdata_s;
m00_axis_tvalid <= m00_axis_tvalid_s;
m00_axis_tlast <= m00_axis_tlast_s;
m00_axis_tkeep <= (others => '1');

m01_axis_tdata <= m01_axis_tdata_s;
m01_axis_tvalid <= m00_axis_tvalid_s;
m01_axis_tlast <= m00_axis_tlast_s;
m01_axis_tkeep <= (others => '1');

--ila0_blk : ila_SSB
--port map ( clk => aclk,
--           probe0 => m00_axis_tdata_s(31 downto 0),
--           probe1(0) => syncOut_s,
--           probe2(0) => b0_validOut
--);

end Behavioral;
