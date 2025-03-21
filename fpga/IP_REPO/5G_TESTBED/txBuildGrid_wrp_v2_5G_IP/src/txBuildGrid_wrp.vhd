----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/25/2024 05:24:11 PM
-- Design Name: 
-- Module Name: txBuildGrid_wrp - Behavioral
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


entity txBuildGrid_wrp is
PORT (
    s_axi_BUS_A_AWADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    s_axi_BUS_A_AWVALID : IN STD_LOGIC;
    s_axi_BUS_A_AWREADY : OUT STD_LOGIC;
    s_axi_BUS_A_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_BUS_A_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_BUS_A_WVALID : IN STD_LOGIC;
    s_axi_BUS_A_WREADY : OUT STD_LOGIC;
    s_axi_BUS_A_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_BUS_A_BVALID : OUT STD_LOGIC;
    s_axi_BUS_A_BREADY : IN STD_LOGIC;
    s_axi_BUS_A_ARADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    s_axi_BUS_A_ARVALID : IN STD_LOGIC;
    s_axi_BUS_A_ARREADY : OUT STD_LOGIC;
    s_axi_BUS_A_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_BUS_A_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_BUS_A_RVALID : OUT STD_LOGIC;
    s_axi_BUS_A_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    --triggerIn : in std_logic;
    triggerOut : out std_logic;
    busyOut : out std_logic;
    pdschIn_TVALID : IN STD_LOGIC;
    pdschIn_TREADY : OUT STD_LOGIC;
    pdschIn_TDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    pdschIn_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    pdschIn_TKEEP : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    pdschIn_TSTRB : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    ssbIn_TVALID : IN STD_LOGIC;
    ssbIn_TREADY : OUT STD_LOGIC;
    ssbIn_TDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    ssbIn_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    ssbIn_TKEEP : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    ssbIn_TSTRB : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    gridOut_TVALID : OUT STD_LOGIC;
    gridOut_TREADY : IN STD_LOGIC;
    gridOut_TDATA : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    gridOut_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    gridOut_TKEEP : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    gridOut_TSTRB : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
end txBuildGrid_wrp;

architecture Behavioral of txBuildGrid_wrp is

component txBuildGrid_0 IS
PORT (
    s_axi_BUS_A_AWADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    s_axi_BUS_A_AWVALID : IN STD_LOGIC;
    s_axi_BUS_A_AWREADY : OUT STD_LOGIC;
    s_axi_BUS_A_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_BUS_A_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_BUS_A_WVALID : IN STD_LOGIC;
    s_axi_BUS_A_WREADY : OUT STD_LOGIC;
    s_axi_BUS_A_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_BUS_A_BVALID : OUT STD_LOGIC;
    s_axi_BUS_A_BREADY : IN STD_LOGIC;
    s_axi_BUS_A_ARADDR : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    s_axi_BUS_A_ARVALID : IN STD_LOGIC;
    s_axi_BUS_A_ARREADY : OUT STD_LOGIC;
    s_axi_BUS_A_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_BUS_A_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_BUS_A_RVALID : OUT STD_LOGIC;
    s_axi_BUS_A_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    pdschIn_TVALID : IN STD_LOGIC;
    pdschIn_TREADY : OUT STD_LOGIC;
    pdschIn_TDATA : IN STD_LOGIC_VECTOR(71 DOWNTO 0);
    pdschIn_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    pdschIn_TKEEP : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    pdschIn_TSTRB : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    ssbIn_TVALID : IN STD_LOGIC;
    ssbIn_TREADY : OUT STD_LOGIC;
    ssbIn_TDATA : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    ssbIn_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    ssbIn_TKEEP : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    ssbIn_TSTRB : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    gridOut_TVALID : OUT STD_LOGIC;
    gridOut_TREADY : IN STD_LOGIC;
    gridOut_TDATA : OUT STD_LOGIC_VECTOR(71 DOWNTO 0);
    gridOut_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    gridOut_TKEEP : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    gridOut_TSTRB : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)--;
    --debugData : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END component;

signal dummy : std_logic_vector(6 downto 0);
signal gridOut_TLAST_s : std_logic;
signal gridOut_TKEEP_s, gridOut_TSTRB_s : std_logic_vector(8 downto 0);
signal gridOut_TVALID_s : std_logic;
signal triggerCount : integer range 0 to 3;

type state_type is (st_WAIT, st_BUSY);
signal state : state_type; 
signal triggerIn,triggerMask : std_logic;

begin

TXbuildGrid_UUT: txBuildGrid_0 
  PORT MAP(
    s_axi_BUS_A_AWADDR =>   s_axi_BUS_A_AWADDR,
    s_axi_BUS_A_AWVALID =>  s_axi_BUS_A_AWVALID,
    s_axi_BUS_A_AWREADY =>  s_axi_BUS_A_AWREADY,
    s_axi_BUS_A_WDATA =>    s_axi_BUS_A_WDATA,
    s_axi_BUS_A_WSTRB =>    s_axi_BUS_A_WSTRB,
    s_axi_BUS_A_WVALID =>   s_axi_BUS_A_WVALID,
    s_axi_BUS_A_WREADY =>   s_axi_BUS_A_WREADY,
    s_axi_BUS_A_BRESP =>    s_axi_BUS_A_BRESP,
    s_axi_BUS_A_BVALID =>   s_axi_BUS_A_BVALID,
    s_axi_BUS_A_BREADY =>   s_axi_BUS_A_BREADY,
    s_axi_BUS_A_ARADDR =>   s_axi_BUS_A_ARADDR,
    s_axi_BUS_A_ARVALID =>  s_axi_BUS_A_ARVALID,
    s_axi_BUS_A_ARREADY =>  s_axi_BUS_A_ARREADY,
    s_axi_BUS_A_RDATA =>    s_axi_BUS_A_RDATA,
    s_axi_BUS_A_RRESP =>    s_axi_BUS_A_RRESP,
    s_axi_BUS_A_RVALID =>   s_axi_BUS_A_RVALID,
    s_axi_BUS_A_RREADY =>   s_axi_BUS_A_RREADY,
    ap_clk => ap_clk,
    ap_rst_n => ap_rst_n,
    pdschIn_TVALID => pdschIn_TVALID,
    pdschIn_TREADY => pdschIn_TREADY,
    pdschIn_TDATA(63 downto 0) => pdschIn_TDATA,
    pdschIn_TDATA(64) => triggerIn,
    pdschIn_TDATA(63+8 downto 65) => (others => '0'), 
    pdschIn_TLAST => pdschIn_TLAST,
    pdschIn_TKEEP => (others => '1'),
    pdschIn_TSTRB => (others => '1'),
    ssbIn_TVALID => ssbIn_TVALID,
    ssbIn_TREADY => ssbIn_TREADY,
    ssbIn_TDATA => ssbIn_TDATA,
    ssbIn_TLAST => ssbIn_TLAST,
    ssbIn_TKEEP => ssbIn_TKEEP,
    ssbIn_TSTRB => ssbIn_TSTRB,
    gridOut_TVALID => gridOut_TVALID_s,
    gridOut_TREADY => gridOut_TREADY,
    gridOut_TDATA(63 downto 0) => gridOut_TDATA,
    gridOut_TDATA(64) => triggerOut,
    gridOut_TDATA(71 downto 65) => dummy,
    gridOut_TLAST(0) => gridOut_TLAST_s,
    gridOut_TKEEP => gridOut_TKEEP_s,
    gridOut_TSTRB => gridOut_TSTRB_s
  );

--process(ap_clk)
--begin
--    if rising_edge(ap_clk) then
--        if ap_rst_n = '0' then
--            busyOut <= '0';
--        else
--            if triggerIn = '1' and pdschIn_TVALID = '1' then
--                triggerCount <= triggerCount + 1;
--            elsif gridOut_TLAST_s = '1' and gridOut_TVALID_s = '1' then
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
                if (pdschIn_TVALID = '1') then
                    state <= st_BUSY;
                end if;
            when st_BUSY =>
                if gridOut_TLAST_s = '1' and gridOut_TVALID_s = '1' then
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
triggerIn <=(triggerMask and pdschIn_TVALID);

gridOut_TLAST(0) <= gridOut_TLAST_s;
gridOut_TKEEP <= gridOut_TKEEP_s(7 downto 0);
gridOut_TSTRB <= gridOut_TSTRB_s(7 downto 0);
gridOut_TVALID <= gridOut_TVALID_s;

end Behavioral;
