----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2022 10:56:48 AM
-- Design Name: 
-- Module Name: TX_BLOCK_TOP_v2 - Behavioral
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

entity TX_BLOCK_TOP_v2 is
Port (  CLK_OUT : in std_logic; -- 61.44MHz (PL/DAC domain)
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
end TX_BLOCK_TOP_v2;

architecture Behavioral of TX_BLOCK_TOP_v2 is

--TYPES:
--type state_type is (st1_IDLE, st2_SEND_PAYLOAD_HIGH_BW, st2_SEND_PAYLOAD_LOW_BW, st3_TIMER, st4_WAIT);
type state_type is (st1_IDLE, st2_SEND_PAYLOAD_HIGH_BW, st3_TIMER);
type type_a8x16std is array (0 to 8-1) of std_logic_vector(16-1 downto 0);

--CONTANTS
constant ONES : std_logic_vector(31 downto 0) := (others => '1');
     	 
--COMPONENTS:
COMPONENT DATA_MEM is
Port (  CLK220 : in std_logic; -- 220MHz (DAC domain)
        RST220_N : in std_logic; 
        -- AXI Stream Interface (from TX-DMA)
        S00_AXIS_0_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 ); 
        S00_AXIS_0_tlast : in STD_LOGIC;
        S00_AXIS_0_tready : out STD_LOGIC;
        S00_AXIS_0_tkeep : in STD_LOGIC_VECTOR ( 31 downto 0 );
        S00_AXIS_0_tvalid : in STD_LOGIC;
        S00_AXIS_0_aclk : in STD_LOGIC; -- 100MHz (PS domain)
        S00_axis_0_aresetn : in STD_LOGIC;
        --
        ic_LOAD_DATA : in std_logic; -- 1: load data to FIFO; 0: loopback mode
        --
        M00_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 ); 
        M00_AXIS_0_tlast : out STD_LOGIC;
        M00_AXIS_0_tready : in STD_LOGIC;
        M00_AXIS_0_tkeep : out STD_LOGIC_VECTOR ( 31 downto 0 );
        M00_AXIS_0_tvalid : out STD_LOGIC
);
end COMPONENT;

component FIR_UPSAMPLE_X8 IS
PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tready : IN STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(24*2-1 DOWNTO 0)
);
END component;

-- SIGNALS
    
--b0:
signal b0_data : std_logic_vector(255 downto 0);
signal b0_data_re, b0_data_im : type_a8x16std;
signal b0_valid : std_logic;
signal b0_ready : std_logic;
signal b0_last : std_logic;
signal b0_keep : std_logic_vector(31 downto 0);

-- b1: STATE MACHINE
signal state : state_type;
--signal b1_validL : std_logic;
signal b1_validH : std_logic;
--signal b1_dataL_re, b1_dataL_im : std_logic_vector(16-1 downto 0);
signal b1_dataH_re, b1_dataH_im : std_logic_vector(2*16-1 downto 0);
signal b1_ready, b1_ready1, b1_ready2 : std_logic;
signal b1_lastH : std_logic;
signal b1_keep : std_logic_vector(31 downto 0);
signal b1_trigger : std_logic;
signal b1_data_re, b1_data_im : type_a8x16std;

signal b2_data_re, b2_data_im : std_logic_vector(2*24-1 downto 0);
signal b2_valid_re, b2_valid_im : std_logic;

signal PAYLOAD_TEMP : integer;
signal COUNTER_TEMP : integer;
signal remPAYLOADint : integer range 0 to 7;

begin

-- b0:DATA_MEM
b0: DATA_MEM PORT MAP (
    CLK220 => CLK_OUT,
    RST220_N => RST_OUT_N,
    -- AXI Stream Interface (from TX-DMA)
    S00_AXIS_0_tdata => S00_AXIS_tdata,  
    S00_AXIS_0_tlast => S00_AXIS_tlast,
    S00_AXIS_0_tready => S00_AXIS_tready,
    S00_AXIS_0_tkeep => S00_AXIS_tkeep,
    S00_AXIS_0_tvalid => S00_AXIS_tvalid,
    S00_AXIS_0_aclk => S00_AXIS_aclk,
    S00_axis_0_aresetn => S00_AXIS_aresetn,
    --
    ic_LOAD_DATA => ic_LOAD_DATA,
    --
    M00_AXIS_0_tdata => b0_data, 
    M00_AXIS_0_tlast => b0_last,
    M00_AXIS_0_tready => b0_ready,
    M00_AXIS_0_tkeep => b0_keep,
    M00_AXIS_0_tvalid => b0_valid
);

b0_DATA_GEN : for ii in 0 to 7 generate
    b0_data_re(7-ii) <=  b0_data((ii+1)*16-1 downto (ii)*16); 
    b0_data_im(7-ii) <=  b0_data(128+((ii+1)*16)-1 downto 128+((ii)*16)); 
end generate;

remPAYLOADint <= to_integer(unsigned(ir_remPAYLOAD_L));

-- b1: State Machine
process(CLK_OUT)
    variable TIMER_i : integer := 0;
    variable COUNT_i : integer range 0 to 7 := 0;
    variable PAYLOAD_i : integer := 0;
begin
    if rising_edge(CLK_OUT) then
        b1_trigger <= '0';
        triggerOut <= b1_trigger;
        PAYLOAD_TEMP <= PAYLOAD_i;
        COUNTER_TEMP <= COUNT_i;
        --b1_validH <= '0';
        --b1_lastH <= '0';
        if (RST_OUT_N = '0') then
            state <= st1_IDLE;
            b1_keep <= (others => '1');
            b0_ready <= '0';
            b1_dataH_re <= (others => '0');
            b1_dataH_im <= (others => '0');
            b1_lastH <= '0';
            b1_validH <= '0';
            COUNT_i := 0;
            PAYLOAD_i := 0;
            TIMER_i := 0;
        else
            b0_ready <= '0';
            case (state) is
                when st1_IDLE =>
                    if ic_SEND_PKT = '1' then
                        state <= st2_SEND_PAYLOAD_HIGH_BW;
                        b1_trigger <= '1';
                    end if;
                    b1_dataH_re <= (others => '0');
                    b1_dataH_im <= (others => '0');
                    b1_validH <= '0';
                    b1_lastH <= '0';
                    COUNT_i := 0;
                    PAYLOAD_i := 0;
                    TIMER_i := 0;
                when st2_SEND_PAYLOAD_HIGH_BW =>
                    if PAYLOAD_i < to_integer(unsigned(ir_PAYLOAD_L))-1 then
                        b1_lastH <= '0';
                        if b1_validH = '0' or (b1_ready='1' and b1_validH = '1') then
                            b1_validH <= '1';
                            case(COUNT_i) is
                                when 0 to 3 => 
                                    b1_dataH_re <= b0_data_re(COUNT_i+1) & b0_data_re(COUNT_i);
                                    b1_dataH_im <= b0_data_im(COUNT_i+1) & b0_data_im(COUNT_i);
                                    b1_data_re <= b0_data_re;
                                    b1_data_im <= b0_data_im;
                                    COUNT_i := COUNT_i + 2;
                                when 4 to 5 => 
                                    b1_dataH_re <= b0_data_re(COUNT_i+1) & b0_data_re(COUNT_i);
                                    b1_dataH_im <= b0_data_im(COUNT_i+1) & b0_data_im(COUNT_i);
                                    COUNT_i := COUNT_i + 2;
                                    b0_ready <= '1';
                                when others => 
                                    b1_dataH_re <= b1_data_re(COUNT_i+1) & b1_data_re(COUNT_i);
                                    b1_dataH_im <= b1_data_im(COUNT_i+1) & b1_data_im(COUNT_i);
                                    COUNT_i := 0;
                                    PAYLOAD_i := PAYLOAD_i + 1;
                            end case;
                        end if;
                    elsif PAYLOAD_i < to_integer(unsigned(ir_PAYLOAD_L)) then
                        b1_lastH <= '0';
                        if b1_validH = '0' or (b1_ready='1' and b1_validH = '1') then
                            case(COUNT_i) is
                                when 0 to 3 => 
                                    b1_dataH_re <= b0_data_re(COUNT_i+1) & b0_data_re(COUNT_i);
                                    b1_dataH_im <= b0_data_im(COUNT_i+1) & b0_data_im(COUNT_i);
                                    b1_data_re <= b0_data_re;
                                    b1_data_im <= b0_data_im;
                                    if remPAYLOADint = COUNT_i then
                                        b0_ready <= '1';
                                        PAYLOAD_i := PAYLOAD_i + 1;
                                        COUNT_i := 0;
                                        b1_lastH <= '1';
                                    else
                                        COUNT_i := COUNT_i + 2;
                                    end if;
                                when 4 to 5 => 
                                    b1_dataH_re <= b0_data_re(COUNT_i+1) & b0_data_re(COUNT_i);
                                    b1_dataH_im <= b0_data_im(COUNT_i+1) & b0_data_im(COUNT_i);
                                    b0_ready <= '1';
                                    if remPAYLOADint = COUNT_i then
                                        PAYLOAD_i := PAYLOAD_i + 1;
                                        COUNT_i := 0;
                                        b1_lastH <= '1';
                                    else
                                        COUNT_i := COUNT_i + 2;
                                    end if;
                                when others => 
                                    b1_dataH_re <= b1_data_re(COUNT_i+1) & b1_data_re(COUNT_i);
                                    b1_dataH_im <= b1_data_im(COUNT_i+1) & b1_data_im(COUNT_i);
                                    b1_lastH <= '1';
                                    COUNT_i := 0;
                                    PAYLOAD_i := PAYLOAD_i + 1;
                            end case;
                        end if;
                    else
                        if (b1_ready='1' and b1_validH = '1') then
                            b1_dataH_re <= (others => '0');
                            b1_dataH_im <= (others => '0');
                            b1_validH <= '0';
                            b1_lastH <= '0';
                            PAYLOAD_i := 0;
                            COUNT_i := 0;
                            state <= st3_TIMER;
                        end if;
                    end if;                 
                when st3_TIMER =>
                    b1_dataH_re <= (others => '0');
                    b1_dataH_im <= (others => '0');
                    b1_validH <= '0';
                    b1_lastH <= '0';
                    if TIMER_i < to_integer(unsigned(ir_TIMER)) then
                        TIMER_i := TIMER_i+1;
                    else
                        state <= st1_IDLE;
                        TIMER_i := 0;
                    end if;
                end case;
            end if;
    end if;
end process;

--ila_0_blk: ila_0 
--PORT MAP (  clk => CLK_OUT,
--            probe0 => b0_data,
--            probe1(0) => b0_ready,
--            probe2(0) => b0_valid,
--            probe3 => b1_dataL_re,
--            probe4(0) => b1_validL,
--            probe5 => b1_dataH_re,
--            probe6(0) => b1_validH
--);

b1_ready <= M00_AXIS_tready; --b1_ready1 and b1_ready2;
M00_AXIS_tdata <= b1_dataH_im(2*16-1 downto 16) & b1_dataH_im(16-1 downto 0) & b1_dataH_re(2*16-1 downto 16) & b1_dataH_re(16-1 downto 0);
M00_AXIS_tlast <= b1_lastH;
M00_AXIS_tkeep <= (others => '1');
M00_AXIS_tvalid <= b1_validH;

end behavioral;

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

--entity TX_BLOCK_TOP_v2 is
--Port (  CLK_OUT : in std_logic; -- 61.44MHz (PL/DAC domain)
--        RST_OUT_N : in std_logic;
        
--        -- AXI Stream Interface (from TX-DMA)
--        S00_AXIS_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 ); -- {Q[0] .. Q[8-1] I[0] .. I[8-1]}
--        S00_AXIS_tlast : in STD_LOGIC;
--        S00_AXIS_tready : out STD_LOGIC;
--        S00_AXIS_tkeep : in STD_LOGIC_VECTOR ( 31 downto 0 );
--        S00_AXIS_tvalid : in STD_LOGIC;
--        S00_AXIS_aclk : in STD_LOGIC; -- 100MHz (PS domain)
--        S00_axis_aresetn : in STD_LOGIC;
--        -- Control Inputs
--        ic_LOAD_DATA : in std_logic; -- 0: load data to FIFO; 1: loopback mode
--        ic_SEND_PKT : in std_logic; -- Transmit ONE packet
--        --Register Inputs
--        ir_PAYLOAD_L : in std_logic_vector(15 downto 0); -- Payload length divided by 8
--        ir_TIMER : in std_logic_vector(31 downto 0); -- Clock cycles of idle time between packets (TIME = irTIMER/61.44MHz)
--        --ir_BW_SEL : in std_logic;
--        triggerOut : out std_logic;
--        -- AXI Stream output (Imag / Real Part)
--        M00_AXIS_tdata : out STD_LOGIC_VECTOR ( 4*16-1 downto 0 );
--        M00_AXIS_tlast : out STD_LOGIC;
--        M00_AXIS_tready : in STD_LOGIC;
--        M00_AXIS_tkeep : out STD_LOGIC_VECTOR ( 8-1 downto 0 );
--        M00_AXIS_tvalid : out STD_LOGIC
--);
--end TX_BLOCK_TOP_v2;

--architecture Behavioral of TX_BLOCK_TOP_v2 is

----TYPES:
----type state_type is (st1_IDLE, st2_SEND_PAYLOAD_HIGH_BW, st2_SEND_PAYLOAD_LOW_BW, st3_TIMER, st4_WAIT);
--type state_type is (st1_IDLE, st2_SEND_PAYLOAD_HIGH_BW, st3_TIMER);
--type type_a8x16std is array (0 to 8-1) of std_logic_vector(16-1 downto 0);

----CONTANTS
--constant ONES : std_logic_vector(31 downto 0) := (others => '1');
     	 
----COMPONENTS:
--COMPONENT DATA_MEM is
--Port (  CLK220 : in std_logic; -- 220MHz (DAC domain)
--        RST220_N : in std_logic; 
--        -- AXI Stream Interface (from TX-DMA)
--        S00_AXIS_0_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 ); 
--        S00_AXIS_0_tlast : in STD_LOGIC;
--        S00_AXIS_0_tready : out STD_LOGIC;
--        S00_AXIS_0_tkeep : in STD_LOGIC_VECTOR ( 31 downto 0 );
--        S00_AXIS_0_tvalid : in STD_LOGIC;
--        S00_AXIS_0_aclk : in STD_LOGIC; -- 100MHz (PS domain)
--        S00_axis_0_aresetn : in STD_LOGIC;
--        --
--        ic_LOAD_DATA : in std_logic; -- 1: load data to FIFO; 0: loopback mode
--        --
--        M00_AXIS_0_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 ); 
--        M00_AXIS_0_tlast : out STD_LOGIC;
--        M00_AXIS_0_tready : in STD_LOGIC;
--        M00_AXIS_0_tkeep : out STD_LOGIC_VECTOR ( 31 downto 0 );
--        M00_AXIS_0_tvalid : out STD_LOGIC
--);
--end COMPONENT;

--component FIR_UPSAMPLE_X8 IS
--PORT (
--    aclk : IN STD_LOGIC;
--    s_axis_data_tvalid : IN STD_LOGIC;
--    s_axis_data_tready : OUT STD_LOGIC;
--    s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
--    m_axis_data_tvalid : OUT STD_LOGIC;
--    m_axis_data_tready : IN STD_LOGIC;
--    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(24*2-1 DOWNTO 0)
--);
--END component;

---- SIGNALS
    
----b0:
--signal b0_data : std_logic_vector(255 downto 0);
--signal b0_data_re, b0_data_im : type_a8x16std;
--signal b0_valid : std_logic;
--signal b0_ready : std_logic;
--signal b0_last : std_logic;
--signal b0_keep : std_logic_vector(31 downto 0);

---- b1: STATE MACHINE
--signal state : state_type;
----signal b1_validL : std_logic;
--signal b1_validH : std_logic;
----signal b1_dataL_re, b1_dataL_im : std_logic_vector(16-1 downto 0);
--signal b1_dataH_re, b1_dataH_im : std_logic_vector(2*16-1 downto 0);
--signal b1_ready, b1_ready1, b1_ready2 : std_logic;
--signal b1_lastH : std_logic;
--signal b1_keep : std_logic_vector(31 downto 0);
--signal b1_trigger : std_logic;

--signal b2_data_re, b2_data_im : std_logic_vector(2*24-1 downto 0);
--signal b2_valid_re, b2_valid_im : std_logic;

--signal PAYLOAD_TEMP : integer;
--signal COUNTER_TEMP : integer;

--begin

---- b0:DATA_MEM
--b0: DATA_MEM PORT MAP (
--    CLK220 => CLK_OUT,
--    RST220_N => RST_OUT_N,
--    -- AXI Stream Interface (from TX-DMA)
--    S00_AXIS_0_tdata => S00_AXIS_tdata,  
--    S00_AXIS_0_tlast => S00_AXIS_tlast,
--    S00_AXIS_0_tready => S00_AXIS_tready,
--    S00_AXIS_0_tkeep => S00_AXIS_tkeep,
--    S00_AXIS_0_tvalid => S00_AXIS_tvalid,
--    S00_AXIS_0_aclk => S00_AXIS_aclk,
--    S00_axis_0_aresetn => S00_AXIS_aresetn,
--    --
--    ic_LOAD_DATA => ic_LOAD_DATA,
--    --
--    M00_AXIS_0_tdata => b0_data, 
--    M00_AXIS_0_tlast => b0_last,
--    M00_AXIS_0_tready => b0_ready,
--    M00_AXIS_0_tkeep => b0_keep,
--    M00_AXIS_0_tvalid => b0_valid
--);

--b0_DATA_GEN : for ii in 0 to 7 generate
--    b0_data_re(7-ii) <=  b0_data((ii+1)*16-1 downto (ii)*16); 
--    b0_data_im(7-ii) <=  b0_data(128+((ii+1)*16)-1 downto 128+((ii)*16)); 
--end generate;

---- b1: State Machine
--process(CLK_OUT)
--    variable TIMER_i : integer := 0;
--    variable COUNT_i : integer range 0 to 7 := 0;
--    variable PAYLOAD_i : integer := 0;
--begin
--    if rising_edge(CLK_OUT) then
--        b1_trigger <= '0';
--        triggerOut <= b1_trigger;
--        PAYLOAD_TEMP <= PAYLOAD_i;
--        COUNTER_TEMP <= COUNT_i;
--        b1_validH <= '0';
--        b1_lastH <= '0';
--        if (RST_OUT_N = '0') then
--            state <= st1_IDLE;
--            b1_keep <= (others => '1');
--            b0_ready <= '0';
--            b1_dataH_re <= (others => '0');
--            b1_dataH_im <= (others => '0');
--            COUNT_i := 0;
--            PAYLOAD_i := 0;
--            TIMER_i := 0;
--        else
--            b0_ready <= '0';
--            case (state) is
--                when st1_IDLE =>
--                    if ic_SEND_PKT = '1' then
--                        state <= st2_SEND_PAYLOAD_HIGH_BW;
--                        b1_trigger <= '1';
--                    end if;
--                    b1_dataH_re <= (others => '0');
--                    b1_dataH_im <= (others => '0');
--                    COUNT_i := 0;
--                    PAYLOAD_i := 0;
--                    TIMER_i := 0;
--                when st2_SEND_PAYLOAD_HIGH_BW =>
--                    if PAYLOAD_i < to_integer(unsigned(ir_PAYLOAD_L))-1 then
--                        b1_dataH_re <= b0_data_re(COUNT_i+1) & b0_data_re(COUNT_i);
--                        b1_dataH_im <= b0_data_im(COUNT_i+1) & b0_data_im(COUNT_i);
--                        if b1_ready='1' then
--                            b1_validH <= '1';
--                            case(COUNT_i) is
--                                when 0 to 3 => 
--                                    COUNT_i := COUNT_i + 2;
--                                when 4 to 5 => 
--                                    COUNT_i := COUNT_i + 2;
--                                    b0_ready <= '1';
--                                when others => 
--                                    COUNT_i := 0;
--                                    PAYLOAD_i := PAYLOAD_i + 1;
--                            end case;
--                        end if;
--                    elsif PAYLOAD_i < to_integer(unsigned(ir_PAYLOAD_L)) then
--                        b1_dataH_re <= b0_data_re(COUNT_i+1) & b0_data_re(COUNT_i);
--                        b1_dataH_im <= b0_data_im(COUNT_i+1) & b0_data_im(COUNT_i);
--                        if b1_ready='1' then
--                            b1_validH <= '1';
--                            case(COUNT_i) is
--                                when 0 to 3 => 
--                                    COUNT_i := COUNT_i + 2;
--                                when 4 to 5 => 
--                                    COUNT_i := COUNT_i + 2;
--                                    b0_ready <= '1';
--                                when others => 
--                                    b1_lastH <= '1';
--                                    COUNT_i := 0;
--                                    PAYLOAD_i := PAYLOAD_i + 1;
--                            end case;
--                        end if;
--                    else
--                        b1_dataH_re <= (others => '0');
--                        b1_dataH_im <= (others => '0');
--                        PAYLOAD_i := 0;
--                        COUNT_i := 0;
--                        state <= st3_TIMER;
--                    end if;
--                when st3_TIMER =>
--                    b1_dataH_re <= (others => '0');
--                    b1_dataH_im <= (others => '0');
--                    if TIMER_i < to_integer(unsigned(ir_TIMER)) then
--                        TIMER_i := TIMER_i+1;
--                    else
--                        state <= st1_IDLE;
--                        TIMER_i := 0;
--                    end if;
--                end case;
--            end if;
--    end if;
--end process;

----ila_0_blk: ila_0 
----PORT MAP (  clk => CLK_OUT,
----            probe0 => b0_data,
----            probe1(0) => b0_ready,
----            probe2(0) => b0_valid,
----            probe3 => b1_dataL_re,
----            probe4(0) => b1_validL,
----            probe5 => b1_dataH_re,
----            probe6(0) => b1_validH
----);

--b1_ready <= M00_AXIS_tready; --b1_ready1 and b1_ready2;
--M00_AXIS_tdata <= b1_dataH_im(2*16-1 downto 16) & b1_dataH_im(16-1 downto 0) & b1_dataH_re(2*16-1 downto 16) & b1_dataH_re(16-1 downto 0);
--M00_AXIS_tlast <= b1_lastH;
--M00_AXIS_tkeep <= (others => '1');
--M00_AXIS_tvalid <= b1_validH;

--end behavioral;
