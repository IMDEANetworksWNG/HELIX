----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/25/2024 12:23:05 PM
-- Design Name: 
-- Module Name: nrPDSCH_top - Behavioral
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

entity nrPDSCH_top is
PORT (
    s_axi_BUS_A_AWADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    s_axi_BUS_A_AWVALID : IN STD_LOGIC;
    s_axi_BUS_A_AWREADY : OUT STD_LOGIC;
    s_axi_BUS_A_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_BUS_A_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_BUS_A_WVALID : IN STD_LOGIC;
    s_axi_BUS_A_WREADY : OUT STD_LOGIC;
    s_axi_BUS_A_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_BUS_A_BVALID : OUT STD_LOGIC;
    s_axi_BUS_A_BREADY : IN STD_LOGIC;
    s_axi_BUS_A_ARADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    s_axi_BUS_A_ARVALID : IN STD_LOGIC;
    s_axi_BUS_A_ARREADY : OUT STD_LOGIC;
    s_axi_BUS_A_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_BUS_A_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_BUS_A_RVALID : OUT STD_LOGIC;
    s_axi_BUS_A_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    --triggerIn : OUT STD_LOGIC;
    triggerOut : OUT STD_LOGIC;
    busyOut : out std_logic;
    bitsIn_TVALID : IN STD_LOGIC;
    bitsIn_TREADY : OUT STD_LOGIC;
    bitsIn_TDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    bitsIn_TKEEP : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    bitsIn_TSTRB : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    bitsIn_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    symbolsOut_TVALID : OUT STD_LOGIC;
    symbolsOut_TREADY : IN STD_LOGIC;
    symbolsOut_TDATA : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    symbolsOut_TKEEP : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    symbolsOut_TSTRB : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    symbolsOut_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
end nrPDSCH_top;

architecture Behavioral of nrPDSCH_top is

component nrPDSCH_0 IS
  PORT (
    s_axi_BUS_A_AWADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    s_axi_BUS_A_AWVALID : IN STD_LOGIC;
    s_axi_BUS_A_AWREADY : OUT STD_LOGIC;
    s_axi_BUS_A_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_BUS_A_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_BUS_A_WVALID : IN STD_LOGIC;
    s_axi_BUS_A_WREADY : OUT STD_LOGIC;
    s_axi_BUS_A_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_BUS_A_BVALID : OUT STD_LOGIC;
    s_axi_BUS_A_BREADY : IN STD_LOGIC;
    s_axi_BUS_A_ARADDR : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    s_axi_BUS_A_ARVALID : IN STD_LOGIC;
    s_axi_BUS_A_ARREADY : OUT STD_LOGIC;
    s_axi_BUS_A_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_BUS_A_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_BUS_A_RVALID : OUT STD_LOGIC;
    s_axi_BUS_A_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    --triggerIn : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    --triggerIn_ap_vld : IN STD_LOGIC;
    --triggerOut : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    bitsIn_TVALID : IN STD_LOGIC;
    bitsIn_TREADY : OUT STD_LOGIC;
    bitsIn_TDATA : IN STD_LOGIC_VECTOR(63+8 DOWNTO 0);
    bitsIn_TKEEP : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    bitsIn_TSTRB : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    --bitsIn_TDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    --bitsIn_TKEEP : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    --bitsIn_TSTRB : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    bitsIn_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    symbolsOut_TVALID : OUT STD_LOGIC;
    symbolsOut_TREADY : IN STD_LOGIC;
    symbolsOut_TDATA : OUT STD_LOGIC_VECTOR(63+8 DOWNTO 0);
    symbolsOut_TKEEP : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    symbolsOut_TSTRB : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    --symbolsOut_TDATA : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    --symbolsOut_TKEEP : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    --symbolsOut_TSTRB : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    symbolsOut_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END component;


component ila_0 IS
  PORT (
    clk : IN STD_LOGIC;
    probe0 : IN STD_LOGIC;
    probe1 : IN STD_LOGIC;
    probe2 : IN STD_LOGIC
  );
END component;


signal dummy : std_logic_vector(6 downto 0);
signal symbolsOut_TLAST_s : std_logic;
signal symbolsOut_TKEEP_s, symbolsOut_TSTRB_s : std_logic_vector(8 downto 0);
signal symbolsOut_TVALID_s : std_logic;
signal triggerIn,triggerMask : std_logic;

signal triggerCount : integer range 0 to 3;

type state_type is (st_WAIT, st_BUSY);
signal state : state_type; 

begin

nrPDSCH_0_UUT: nrPDSCH_0
PORT MAP(
    s_axi_BUS_A_AWADDR => s_axi_BUS_A_AWADDR,
    s_axi_BUS_A_AWVALID => s_axi_BUS_A_AWVALID,
    s_axi_BUS_A_AWREADY => s_axi_BUS_A_AWREADY,
    s_axi_BUS_A_WDATA => s_axi_BUS_A_WDATA,
    s_axi_BUS_A_WSTRB => s_axi_BUS_A_WSTRB,
    s_axi_BUS_A_WVALID => s_axi_BUS_A_WVALID,
    s_axi_BUS_A_WREADY => s_axi_BUS_A_WREADY,
    s_axi_BUS_A_BRESP => s_axi_BUS_A_BRESP,
    s_axi_BUS_A_BVALID => s_axi_BUS_A_BVALID,
    s_axi_BUS_A_BREADY => s_axi_BUS_A_BREADY,
    s_axi_BUS_A_ARADDR => s_axi_BUS_A_ARADDR,
    s_axi_BUS_A_ARVALID => s_axi_BUS_A_ARVALID,
    s_axi_BUS_A_ARREADY => s_axi_BUS_A_ARREADY,
    s_axi_BUS_A_RDATA => s_axi_BUS_A_RDATA,
    s_axi_BUS_A_RRESP => s_axi_BUS_A_RRESP,
    s_axi_BUS_A_RVALID => s_axi_BUS_A_RVALID,
    s_axi_BUS_A_RREADY => s_axi_BUS_A_RREADY,
    ap_clk => ap_clk,
    ap_rst_n => ap_rst_n,
    bitsIn_TVALID => bitsIn_TVALID, --'0', 
    bitsIn_TREADY => bitsIn_TREADY,
    bitsIn_TDATA(63 downto 0) => bitsIn_TDATA,
    bitsIn_TDATA(64) => triggerIn,
    bitsIn_TDATA(63+8 downto 65) => (others => '0'),
    bitsIn_TLAST => bitsIn_TLAST,
    bitsIn_TKEEP => (others => '1'),
    bitsIn_TSTRB => (others => '1'),
    symbolsOut_TVALID => symbolsOut_TVALID_s,
    symbolsOut_TREADY => symbolsOut_TREADY,
    symbolsOut_TDATA(63 downto 0) => symbolsOut_TDATA,
    symbolsOut_TDATA(64) => triggerOut,
    symbolsOut_TDATA(63+8 downto 65) => dummy,
    symbolsOut_TLAST(0) => symbolsOut_TLAST_s,
    symbolsOut_TKEEP => symbolsOut_TKEEP_s,
    symbolsOut_TSTRB => symbolsOut_TSTRB_s
);

--process(ap_clk)
--begin
--    if rising_edge(ap_clk) then
--        if ap_rst_n = '0' then
--            busyOut <= '0';
--        else
--            if triggerIn = '1' and bitsIn_TVALID = '1' then
--                triggerCount <= triggerCount + 1;
--            elsif symbolsOut_TLAST_s = '1' and symbolsOut_TVALID_s = '1' then
--                triggerCount <= triggerCount - 1;
--            end if;         
--            if triggerCount > 0 then
--                 busyOut <= '1';
--            else
--                busyOut <= '0';
--            end if;
--        end if;
--    end if;
--end process;

process(ap_clk)
begin
    if rising_edge(ap_clk) then
        if ap_rst_n = '0' then
            --busyOut <= '0';
            --triggerIn <= '0';
            state <= st_WAIT;
        else
        case (state) is
            when st_WAIT =>
                if (bitsIn_TVALID = '1') then
                    state <= st_BUSY;
                end if;
            when st_BUSY =>
                if (symbolsOut_TLAST_s = '1' and symbolsOut_TVALID_s = '1') then
                      state <= st_WAIT;
                end if;
            when others =>
                state <= st_WAIT;
            end case;
        end if;
    end if;
end process;


--MOORE State-Machine - Outputs based on state only
busyOut <= '1' WHEN state = st_BUSY ELSE '0';
triggerMask <= '1' WHEN state = st_WAIT ELSE '0';
triggerIn <=(triggerMask and bitsIn_TVALID);

symbolsOut_TLAST(0) <= symbolsOut_TLAST_s;
symbolsOut_TKEEP <= symbolsOut_TKEEP_s(7 downto 0);
symbolsOut_TSTRB <= symbolsOut_TSTRB_s(7 downto 0);
symbolsOut_TVALID <= symbolsOut_TVALID_s;

end Behavioral;
