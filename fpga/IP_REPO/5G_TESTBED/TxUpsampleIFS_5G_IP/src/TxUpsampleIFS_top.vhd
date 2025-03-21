----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/02/2023 12:32:56 PM
-- Design Name: 
-- Module Name: TxUpsampleIFS_top - Behavioral
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

entity TxUpsampleIFS_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        dataIn_re : in std_logic_vector(31 downto 0);
        dataIn_im : in std_logic_vector(31 downto 0);
        validIn : in std_logic;
        readyIn : out std_logic;
        triggerIn : in std_logic;
        lastIn : in std_logic;
        --busyIn : in std_logic;
        --ic_SEND_PKT : in std_logic;
        ic_BW_SEL : in std_logic;
        ic_TIMER : in std_logic_vector(31 downto 0); -- Clock cycles of idle time between packets (TIME = irTIMER/61.44MHz)
        dataOut_re : out std_logic_vector(31 downto 0);
        dataOut_im : out std_logic_vector(31 downto 0);
        validOut : out std_logic;
        readyOut : in std_logic;
        lastOut : out std_logic;
        triggerOut : out std_logic
);
end TxUpsampleIFS_top;

architecture Behavioral of TxUpsampleIFS_top is

component TxFIFOin IS
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(64 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(64 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    prog_full : OUT STD_LOGIC;
    prog_empty : OUT STD_LOGIC;
    wr_rst_busy : OUT STD_LOGIC;
    rd_rst_busy : OUT STD_LOGIC
  );
END component;

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

constant ZEROES : std_logic_vector(63 downto 0) := (others => '0');

signal rst : std_logic;

signal b0_dataIn : std_logic_vector(64 downto 0);
signal b0_dataOut : std_logic_vector(64 downto 0);
signal b0_empty, b0_prog_full, b0_full, b0_prog_empty, b0_wr_en : std_logic;

signal b1_rd_en : std_logic;
type b1_st_type is (st1_IDLE, st2_SEND_PAYLOAD_HIGH_BW, st2_SEND_PAYLOAD_LOW_BW, st3_TIMER, st4_WAIT);
signal b1_state : b1_st_type;
signal b1_validL, b1_validH, b1_ready, b1_ready1, b1_ready2, b1_last : std_logic;
signal b1_triggerOut : std_logic;
signal b1_dataL_re, b1_dataL_im : std_logic_vector(15 downto 0);
signal b1_dataH_re, b1_dataH_im : std_logic_vector(31 downto 0);
--signal b1_countSamples : integer range 0 to 2**16-1;
signal b1_countWait : integer range 0 to 7 := 0;
signal b1_countTimer : integer := 0;
signal b1_Tick_LBW : std_logic;
signal b1_pendingTrigger, b1_readPendingTrigger : std_logic;

signal b2_data_re, b2_data_im : std_logic_vector(2*24-1 downto 0);
signal b2_data_re_red, b2_data_im_red : std_logic_vector(2*16-1 downto 0);
signal b2_valid_re, b2_valid_im : std_logic;

begin

rst <= not rstn;

--b0_dataIn <= triggerIn & dataIn_im & dataIn_re;
b0_dataIn <= lastIn & dataIn_im & dataIn_re;
b0_wr_en <= validIn and not b0_prog_full;
--b0: input FIFO
b0: TxFIFOin
PORT MAP(
    clk => clk,
    srst => rst,
    din => b0_dataIn,
    wr_en => b0_wr_en, --validIn,
    rd_en => b1_rd_en,
    dout => b0_dataOut,
    full => b0_full,
    empty => b0_empty,
    prog_full => b0_prog_full,
    prog_empty => b0_prog_empty,
    wr_rst_busy => open,
    rd_rst_busy => open
);

readyIn <= not b0_prog_full;

--b1 state Machine
process(clk)
begin
    if rising_edge(clk) then
        triggerOut <= b1_triggerOut;
        b1_readPendingTrigger <= '0';
        b1_last <= '0'; 
        if (rstn = '0') then
            b1_state <= st1_IDLE;
            b1_validL <= '0';
            b1_validH <= '0';
            b1_rd_en <= '0';
            b1_last <= '0';
            b1_dataL_re <= (others => '0');
            b1_dataL_im <= (others => '0');
            b1_dataH_re <= (others => '0');
            b1_dataH_im <= (others => '0');
            b1_triggerOut <= '0';
            b1_Tick_LBW <= '0';
            b1_countWait <= 0;
            b1_countTimer <= 0;
            b1_pendingTrigger <= '0';
        else
            b1_rd_en <= '0';
            b1_validL <= '0';
            b1_validH <= '0';
            b1_triggerOut <= '0';
            
            if triggerIn = '1' then
                b1_pendingTrigger <= '1';
            elsif b1_readPendingTrigger = '1' then
                b1_pendingTrigger <= '0';
            end if;
            
            case (b1_state) is
                when st1_IDLE =>
                    --if ic_SEND_PKT = '1' and ic_BW_SEL = '1' and b0_empty = '0' then
                    if b1_pendingTrigger = '1' and ic_BW_SEL = '1' and b0_prog_empty = '0' then
                        b1_readPendingTrigger <= '1';
                        b1_state <= st2_SEND_PAYLOAD_LOW_BW;
                        --b1_rd_en <= '1';
                        b1_triggerOut <= '1';
                    elsif b1_pendingTrigger = '1' and ic_BW_SEL = '0' and b0_prog_empty = '0' then
                        b1_readPendingTrigger <= '1';
                        b1_state <= st2_SEND_PAYLOAD_HIGH_BW;
                        b1_rd_en <= '1';
                        b1_triggerOut <= '1';
                    end if;
                    b1_dataL_re <= (others => '0');
                    b1_dataL_im <= (others => '0');
                    b1_dataH_re <= (others => '0');
                    b1_dataH_im <= (others => '0');
                    b1_Tick_LBW <= '0';
                    
                when st2_SEND_PAYLOAD_LOW_BW =>
                    b1_validL <= '1';
                    if b1_ready='1' then
                        b1_state <= st4_WAIT;
                        b1_Tick_LBW <= not b1_Tick_LBW;
                    end if;
                    if b1_Tick_LBW = '0' then
                        b1_dataL_re <= b0_dataOut(15 downto 0);
                        b1_dataL_im <= b0_dataOut(32+15 downto 32);
                    else
                        b1_dataL_re <= b0_dataOut(31 downto 16);
                        b1_dataL_im <= b0_dataOut(63 downto 32+16);
                        
                        if b0_dataOut(64) = '1' then
                            b1_last <= '1';
                            if ic_TIMER /= ZEROES(ic_TIMER'high downto 0) then 
                                b1_state <= st3_TIMER;
--                            elsif ic_SEND_PKT = '0' or b0_empty = '1' then
--                                b1_state <= st1_IDLE;
--                            else
--                                b1_triggerOut <= '1';
--                            end if;
                            else
                                b1_state <= st1_IDLE;
                            end if;
                        end if;
                        b1_rd_en <= '1';
                    end if;
                    
                when st2_SEND_PAYLOAD_HIGH_BW =>
                    b1_dataH_re <= b0_dataOut(31 downto 0);
                    b1_dataH_im <= b0_dataOut(63 downto 32);
                    b1_validH <= '1';
                    if b0_dataOut(64) = '1' then
                        b1_last <= '1';
                        if ic_TIMER /= ZEROES(ic_TIMER'high downto 0) then 
                            b1_state <= st3_TIMER;
--                        elsif ic_SEND_PKT = '0' or b0_empty = '1' then
--                            b1_state <= st1_IDLE;
--                        else
--                            b1_triggerOut <= '1';
--                            b1_rd_en <= '1';
--                        end if;
                        else
                            b1_state <= st1_IDLE;
                        end if;
                    else
                        b1_rd_en <= '1';
                    end if;
                when st3_TIMER =>
                    if b1_countWait < 3 then
                        b1_countWait <= b1_countWait + 1;
                    else
                        b1_countWait <= 0;
                        --b1_validL <= '1';
                    end if;
                    b1_dataL_re <= (others => '0');
                    b1_dataL_im <= (others => '0');
                    b1_dataH_re <= (others => '0');
                    b1_dataH_im <= (others => '0');
                    if b1_countTimer < to_integer(unsigned(ic_TIMER)) then
                        b1_countTimer <= b1_countTimer+1;
                    else
                        b1_state <= st1_IDLE;
                        b1_countTimer <= 0;
                    end if;
                when st4_WAIT =>
                    if b1_countWait < 2 then
                        b1_countWait <= b1_countWait + 1;
                    else
                        b1_countWait <= 0;
                        b1_state <= st2_SEND_PAYLOAD_LOW_BW;
                    end if;
                end case;
            end if;
    end if;
end process;

--dataOut_re <= b1_dataH_re;-- when ic_BW_SEL = '0' else b1_dataL_re;
--dataOut_im <= b1_dataH_im;-- when ic_BW_SEL = '0' else b1_dataL_im;
--validOut <= b1_validH;-- when ic_BW_SEL = '0' else b1_validL;
--triggerOut <= b1_triggerOut;

--b2: upsampling filters
FIR_BLOCK_REAL: FIR_UPSAMPLE_X8 
PORT MAP(   aclk => clk,
            s_axis_data_tvalid => b1_validL,
            s_axis_data_tready => b1_ready1,
            s_axis_data_tdata => b1_dataL_re,
            m_axis_data_tvalid => b2_valid_re,
            m_axis_data_tready => '1',
            m_axis_data_tdata => b2_data_re
);

FIR_BLOCK_IMAG: FIR_UPSAMPLE_X8 
PORT MAP(   aclk => clk,
            s_axis_data_tvalid => b1_validL,
            s_axis_data_tready => b1_ready2,
            s_axis_data_tdata => b1_dataL_im,
            m_axis_data_tvalid => b2_valid_im,
            m_axis_data_tready => '1',
            m_axis_data_tdata => b2_data_im
);

b1_ready <= b1_ready1 and b1_ready2;
b2_data_re_red <= b2_data_re(47-8 downto 32-8) & b2_data_re(23-8 downto 8-8);
b2_data_im_red <= b2_data_im(47-8 downto 32-8) & b2_data_im(23-8 downto 8-8);

dataOut_re <= b1_dataH_re when ic_BW_SEL = '0' else b2_data_re_red;
dataOut_im <= b1_dataH_im when ic_BW_SEL = '0' else b2_data_im_red;
validOut <= b1_validH when ic_BW_SEL = '0' else b2_valid_re;
lastOut <= b1_last;

--M00_AXIS_tdata <= b2_data_im(47-8 downto 32-8) & b2_data_re(47-8 downto 32-8) & b2_data_im(23-8 downto 8-8) & b2_data_re(23-8 downto 8-8) when ir_BW_SEL = '1' else

end Behavioral;
