----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/26/2024 02:02:06 AM
-- Design Name: 
-- Module Name: demapper_M_QAM_wrp - Behavioral
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

entity demapper_M_QAM_wrp is
PORT (
    s_axi_BUS_A_AWADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_BUS_A_AWVALID : IN STD_LOGIC;
    s_axi_BUS_A_AWREADY : OUT STD_LOGIC;
    s_axi_BUS_A_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_BUS_A_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_BUS_A_WVALID : IN STD_LOGIC;
    s_axi_BUS_A_WREADY : OUT STD_LOGIC;
    s_axi_BUS_A_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_BUS_A_BVALID : OUT STD_LOGIC;
    s_axi_BUS_A_BREADY : IN STD_LOGIC;
    s_axi_BUS_A_ARADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_BUS_A_ARVALID : IN STD_LOGIC;
    s_axi_BUS_A_ARREADY : OUT STD_LOGIC;
    s_axi_BUS_A_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_BUS_A_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_BUS_A_RVALID : OUT STD_LOGIC;
    s_axi_BUS_A_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    AXIL_clk : IN STD_LOGIC;
    AXIL_rst_n : IN STD_LOGIC;
    symbolsIn_I_TVALID : IN STD_LOGIC;
    symbolsIn_I_TREADY : OUT STD_LOGIC;
    symbolsIn_I_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    symbolsIn_I_TLAST : IN STD_LOGIC;
    symbolsIn_I_TKEEP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    symbolsIn_Q_TVALID : IN STD_LOGIC;
    symbolsIn_Q_TREADY : OUT STD_LOGIC;
    symbolsIn_Q_TDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    symbolsIn_Q_TLAST : IN STD_LOGIC;
    symbolsIn_Q_TKEEP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    LLRout_I_TVALID : OUT STD_LOGIC;
    LLRout_I_TREADY : IN STD_LOGIC;
    LLRout_I_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    LLRout_I_TLAST : OUT STD_LOGIC;
    LLRout_I_TKEEP : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    LLRout_Q_TVALID : OUT STD_LOGIC;
    LLRout_Q_TREADY : IN STD_LOGIC;
    LLRout_Q_TDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    LLRout_Q_TLAST : OUT STD_LOGIC;
    LLRout_Q_TKEEP : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    --triggerIn : IN STD_LOGIC;
    triggerOut : OUT STD_LOGIC;
    debugg : out std_logic_vector(5 downto 0);
    busyOut : out std_logic
);
end demapper_M_QAM_wrp;

architecture Behavioral of demapper_M_QAM_wrp is

component demapper_M_QAM_top_0 IS
  PORT (
    s_axi_BUS_A_AWADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_BUS_A_AWVALID : IN STD_LOGIC;
    s_axi_BUS_A_AWREADY : OUT STD_LOGIC;
    s_axi_BUS_A_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_BUS_A_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_BUS_A_WVALID : IN STD_LOGIC;
    s_axi_BUS_A_WREADY : OUT STD_LOGIC;
    s_axi_BUS_A_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_BUS_A_BVALID : OUT STD_LOGIC;
    s_axi_BUS_A_BREADY : IN STD_LOGIC;
    s_axi_BUS_A_ARADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_BUS_A_ARVALID : IN STD_LOGIC;
    s_axi_BUS_A_ARREADY : OUT STD_LOGIC;
    s_axi_BUS_A_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_BUS_A_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_BUS_A_RVALID : OUT STD_LOGIC;
    s_axi_BUS_A_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    AXIL_clk : IN STD_LOGIC;
    ap_rst_n_AXIL_clk : IN STD_LOGIC;
    symbolsIn_TVALID : IN STD_LOGIC;
    symbolsIn_TREADY : OUT STD_LOGIC;
    symbolsIn_TDATA : IN STD_LOGIC_VECTOR(71 DOWNTO 0);
    symbolsIn_TLAST : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    symbolsIn_TKEEP : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    symbolsIn_TSTRB : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    LLRout_TVALID : OUT STD_LOGIC;
    LLRout_TREADY : IN STD_LOGIC;
    LLRout_TDATA : OUT STD_LOGIC_VECTOR(71 DOWNTO 0);
    LLRout_TLAST : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    LLRout_TKEEP : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
    LLRout_TSTRB : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
  );
END component;

COMPONENT axis_data_fifo_1
  PORT (
    s_axis_aresetn : IN STD_LOGIC;
    s_axis_aclk : IN STD_LOGIC;
    s_axis_tvalid : IN STD_LOGIC;
    s_axis_tready : OUT STD_LOGIC;
    s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_axis_tlast : IN STD_LOGIC;
    --s_axis_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_tvalid : OUT STD_LOGIC;
    m_axis_tready : IN STD_LOGIC;
    m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axis_tlast : OUT STD_LOGIC--;
    --m_axis_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0) 
  );
END COMPONENT;

COMPONENT axis_data_fifo_0
  PORT (
    s_axis_aresetn : IN STD_LOGIC;
    s_axis_aclk : IN STD_LOGIC;
    s_axis_tvalid : IN STD_LOGIC;
    s_axis_tready : OUT STD_LOGIC;
    s_axis_tdata : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    s_axis_tlast : IN STD_LOGIC;
    --s_axis_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_tvalid : OUT STD_LOGIC;
    m_axis_tready : IN STD_LOGIC;
    m_axis_tdata : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    m_axis_tlast : OUT STD_LOGIC--;
    --m_axis_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0) 
  );
END COMPONENT;

signal symbolsIn_TREADY : std_logic;
signal symbolsIn_TDATA : std_logic_vector(63 downto 0);

signal b0_m_axis_tvalid :  STD_LOGIC;
signal b0_m_axis_tready :  STD_LOGIC;
signal b0_m_axis_tdata :  STD_LOGIC_VECTOR(63 DOWNTO 0);
signal b0_m_axis_tlast :  STD_LOGIC;
signal b0_m_axis_tuser :  STD_LOGIC_VECTOR(0 DOWNTO 0);

signal b00_m_axis_tvalid :  STD_LOGIC;
signal b00_m_axis_tready :  STD_LOGIC;
signal b00_m_axis_tdata :  STD_LOGIC_VECTOR(63 DOWNTO 0);
signal b00_m_axis_tlast :  STD_LOGIC;
signal b00_m_axis_tuser :  STD_LOGIC_VECTOR(0 DOWNTO 0);


signal LLRout_TDATA_s : std_logic_vector(63+8 downto 0);
signal LLRout_TVALID_s : STD_LOGIC;
signal LLRout_TREADY_s : STD_LOGIC;
signal LLRout_TLAST_s : STD_LOGIC_VECTOR(0 DOWNTO 0);
signal LLRout_TKEEP_s : STD_LOGIC_VECTOR(8 DOWNTO 0);

type st_type is (st_idle, st_count);
signal b2_state : st_type;
signal b2_symbolsIn_TREADY, b2_symbolsIn_TVALID, b2_symbolsIn_TLAST : std_logic;
signal b2_count : integer range 0 to 15;
constant count : integer := 6;
signal b2_demapper_dataIn : std_logic_vector(63+8 downto 0);
signal b2_dummy : std_logic;

begin

symbolsIn_I_TREADY <= symbolsIn_TREADY;
symbolsIn_Q_TREADY <= symbolsIn_TREADY;
symbolsIn_TDATA <= symbolsIn_Q_TDATA & symbolsIn_I_TDATA;

b00_fifo_in : axis_data_fifo_1
  PORT MAP (
    s_axis_aresetn => ap_rst_n,
    s_axis_aclk => ap_clk,
    s_axis_tvalid => symbolsIn_I_TVALID,
    s_axis_tready => symbolsIn_TREADY,
    s_axis_tdata => symbolsIn_TDATA,
    s_axis_tlast => symbolsIn_I_TLAST,
    --s_axis_tuser(0) => triggerIn,
    m_axis_tvalid => b00_m_axis_tvalid,
    m_axis_tready => b00_m_axis_tready,
    m_axis_tdata => b00_m_axis_tdata,
    m_axis_tlast => b00_m_axis_tlast--,
    --m_axis_tuser => b00_m_axis_tuser
);
 
b0_fifo_in : axis_data_fifo_0
  PORT MAP (
    s_axis_aresetn => ap_rst_n,
    s_axis_aclk => ap_clk,
    s_axis_tvalid => b00_m_axis_tvalid,
    s_axis_tready => b00_m_axis_tready,
    s_axis_tdata => b00_m_axis_tdata,
    s_axis_tlast => b00_m_axis_tlast,
    --s_axis_tuser => b00_m_axis_tuser,
    m_axis_tvalid => b0_m_axis_tvalid,
    m_axis_tready => b0_m_axis_tready,
    m_axis_tdata => b0_m_axis_tdata,
    m_axis_tlast => b0_m_axis_tlast--,
    --m_axis_tuser => b0_m_axis_tuser
);

--b2: state machine 
process(ap_clk)
begin
    if rising_edge(ap_clk) then
        if ap_rst_n = '0' then
            b2_state <= st_idle;
            b2_count <= 0;
        else
            case b2_state is 
                when  st_idle =>
                    if b0_m_axis_tlast = '1' and b0_m_axis_tvalid = '1' and b2_symbolsIn_TREADY = '1' then
                        b2_state <= st_count;
                    end if;
                    b2_count <= 0; 
                when st_count =>  
                    if b2_count > count then
                        b2_count <= 0;
                        b2_state <= st_idle;
                    else 
                        b2_count <= b2_count + 1;
                    end if;         
                when others => 
                    b2_count <= 0;
                    b2_state <= st_idle;
            end case;                             
        end if;
    end if;
end process;  
   
b2_demapper_dataIn(63 downto 0) <= b0_m_axis_tdata;
b2_demapper_dataIn(64) <= b0_m_axis_tdata(0) when b2_state <= st_idle else '0'; -- TriggerIn embedded in LSB of inputData. 
b2_demapper_dataIn(65) <= '0' when b2_state <= st_idle else '1';        
b2_demapper_dataIn(71 downto 66) <= (others => '0');

b0_m_axis_tready <= b2_symbolsIn_TREADY when b2_state <= st_idle else '0';        

b2_symbolsIn_TVALID <= b0_m_axis_tvalid when b2_state <= st_idle else '1'; 
b2_symbolsIn_TLAST <= b0_m_axis_tlast when b2_state <= st_idle else '0'; 


b1_demapper: demapper_M_QAM_top_0
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
    AXIL_clk => AXIL_clk,
    ap_rst_n_AXIL_clk => AXIL_rst_n,
    symbolsIn_TVALID => b2_symbolsIn_TVALID,  
    symbolsIn_TREADY => b2_symbolsIn_TREADY,
    symbolsIn_TDATA=> b2_demapper_dataIn,
    symbolsIn_TLAST(0) => b2_symbolsIn_TLAST,
    symbolsIn_TKEEP => (others => '1'),
    symbolsIn_TSTRB => (others => '1'),
    LLRout_TVALID => LLRout_TVALID_s,
    LLRout_TREADY => LLRout_TREADY_s,
    LLRout_TDATA => LLRout_TDATA_s,
    LLRout_TLAST => LLRout_TLAST_s,
    LLRout_TKEEP => LLRout_TKEEP_s,
    LLRout_TSTRB => open
);

LLRout_I_TDATA <= LLRout_TDATA_s(31 downto 17) & LLRout_TDATA_s(64) & LLRout_TDATA_s(15 downto 1) & LLRout_TDATA_s(64);
LLRout_Q_TDATA <= LLRout_TDATA_s(63 downto 32);
LLRout_TREADY_s <= LLRout_I_TREADY;
LLRout_I_TVALID <= LLRout_TVALID_s when LLRout_TDATA_s(65) = '0' else '0';
LLRout_Q_TVALID <= LLRout_TVALID_s when LLRout_TDATA_s(65) = '0' else '0';
LLRout_I_TLAST <= LLRout_TLAST_s(0);
LLRout_Q_TLAST <= LLRout_TLAST_s(0);
LLRout_I_TKEEP <= LLRout_TKEEP_s(3 downto 0);
LLRout_Q_TKEEP <= LLRout_TKEEP_s(7 downto 4);

debugg <= LLRout_TDATA_s(71 downto 66);
triggerOut <=   LLRout_TDATA_s(64);
--triggerOut <=   '0' when LLRout_TDATA_s(64) = 'X' else LLRout_TDATA_s(64);
--b2_dummy <=     LLRout_TDATA_s(65);
b2_dummy <=     '0' when LLRout_TDATA_s(65) = 'X' else LLRout_TDATA_s(65);

end Behavioral;
