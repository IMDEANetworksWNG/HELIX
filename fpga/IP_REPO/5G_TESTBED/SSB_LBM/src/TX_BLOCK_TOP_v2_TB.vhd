----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2022 11:09:35 AM
-- Design Name: 
-- Module Name: TX_BLOCK_TOP_v2_TB - Behavioral
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

use std.textio.all;
use ieee.std_logic_textio.all;

entity TX_BLOCK_TOP_v2_TB is
end TX_BLOCK_TOP_v2_TB;

architecture Behavioral of TX_BLOCK_TOP_v2_TB is

--UUT:
COMPONENT TX_BLOCK_TOP_v2 is
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
        ir_TIMER : in std_logic_vector(31 downto 0); -- Clock cycles of idle time between packets (TIME = irTIMER/61.44MHz)
        triggerOut : out std_logic;
        
        -- AXI Stream output (Real Part)
        M00_AXIS_tdata : out STD_LOGIC_VECTOR ( 4*16-1 downto 0 );
        M00_AXIS_tlast : out STD_LOGIC;
        M00_AXIS_tready : in STD_LOGIC;
        M00_AXIS_tkeep : out STD_LOGIC_VECTOR ( 8-1 downto 0 );
        M00_AXIS_tvalid : out STD_LOGIC
);
end COMPONENT;

--component FIR_UPSAMPLE_X8 IS
--  PORT (
--    aclk : IN STD_LOGIC;
--    s_axis_data_tvalid : IN STD_LOGIC;
--    s_axis_data_tready : OUT STD_LOGIC;
--    s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
--    m_axis_data_tvalid : OUT STD_LOGIC;
--    m_axis_data_tready : IN STD_LOGIC;
--    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
--  );
--END component;

-- SIGNALS
    --Inputs
    signal clk100 : std_logic := '0';
    signal rstn100 : std_logic := '0';
    signal clk220 : std_logic := '0';
    signal rstn220 : std_logic := '0';
    
    --Data input
    signal b0_data : std_logic_vector(255 downto 0):= (others => '0');
    signal b0_valid : std_logic := '0';
    signal b0_ready : std_logic;
    signal b0_last : std_logic;
    signal b0_keep : std_logic_vector(31 downto 0);
    signal b0_load_data : std_logic;
    signal b0_load_data_r, b0_load_data_rr, b0_load_data_rrr, b0_load_data_rrrr, b0_load_data_rrrrr, b0_load_data_rrrrrr : std_logic;
    signal b0_SEND_PKT : std_logic := '0'; 
    constant b0_PAYLOAD_L :integer := 3840;--3966;
    
    --Data output
--    signal b1_data_real : std_logic_vector(16-1 downto 0);
--    signal b1_valid_real : std_logic;
--    signal b1_ready_real : std_logic;
--    signal b1_last_real : std_logic;
--    signal b1_keep_real : std_logic_vector(1 downto 0);
--    signal b1_data_imag : std_logic_vector(16-1 downto 0);
--    signal b1_valid_imag : std_logic;
--    signal b1_ready_imag : std_logic;
--    signal b1_last_imag : std_logic;
--    signal b1_keep_imag : std_logic_vector(1 downto 0);

    signal b2_data : std_logic_vector(4*16-1 downto 0);
    signal b2_valid : std_logic;
    signal b2_ready : std_logic;
    signal b2_last : std_logic;
    signal b2_keep : std_logic_vector(8-1 downto 0);
    signal b2_trigger : std_Logic;
        
--    signal GOLDEN_OUTPUT : std_logic_vector(255 downto 0);
--    signal COMPARE_OUTPUT : std_logic_vector(255 downto 0);
    signal END_FILE : std_logic;
    signal ii_sig : std_logic_vector(15 downto 0);
    
-- CONSTANTS
    -- Clock period definitions
    constant clk_P_100 : time := 10 ns;
    constant clk_P_220 : time := 4.5455 ns;

--Procedures and functions
    procedure compare_outputs( OUT_DESIRED : in std_logic_vector(256-1 downto 0); 
                               OUT_BLOCK : in std_logic_vector(256-1 downto 0);
                               signal OUT_ERROR : out std_logic_vector(256-1 downto 0)) is
    
    variable ret_temp : std_logic := '0';
    begin
        for i in 0 to 256-1 loop
            if OUT_DESIRED(i) /= OUT_BLOCK(i) then
                OUT_ERROR(i) <= '1';
            else
                OUT_ERROR(i) <= '0';
            end if;
        end loop;
    end procedure;
    
begin

-- Clock process definitions
clk100_process :process
begin
    clk100 <= '0';
    wait for clk_P_100/2;
    clk100 <= '1';
    wait for clk_P_100/2;
end process;

clk220_process :process
begin
    clk220 <= '0';
    wait for clk_P_220/2;
    clk220 <= '1';
    wait for clk_P_220/2;
end process;

-- hold reset for 8 clock periods 
rstn100 <= '1' after clk_P_100*8;
rstn220 <= '1' after clk_P_220*8;

-- Instantiate the Unit Under Test (UUT)
uut: TX_BLOCK_TOP_v2 
    PORT MAP (
    CLK_OUT => clk220,
    RST_OUT_N => rstn220,
    -- AXI Stream Interface (from TX-DMA)
    S00_AXIS_tdata => b0_data,  
    S00_AXIS_tlast => b0_last,
    S00_AXIS_tready => b0_ready,
    S00_AXIS_tkeep => b0_keep,
    S00_AXIS_tvalid => b0_valid,
    S00_AXIS_aclk => clk100,
    S00_axis_aresetn => rstn100,
    --
    ic_LOAD_DATA => b0_load_data_rrrrrr,
    ic_SEND_PKT => b0_SEND_PKT,
    ir_PAYLOAD_L => std_logic_vector(to_unsigned(b0_PAYLOAD_L,16)),
    ir_TIMER => std_logic_vector(to_unsigned(20,32)),
    triggerOut => b2_trigger,
    --
    M00_AXIS_tdata => b2_data, 
    M00_AXIS_tlast => b2_last,
    M00_AXIS_tready => b2_ready,
    M00_AXIS_tkeep => b2_keep,
    M00_AXIS_tvalid => b2_valid
);

process
begin
    b2_ready <= '1';
    wait for 78 us;
    b2_ready <= '0';
    wait for 5 us;
    b2_ready <= '1';
    wait;
end process;
    
-- INPUT DATA: 
process(clk100)
    file F1: text open read_mode is "TX_BLOCK_TOP_TB_IN_re.txt";
    file F2: text open read_mode is "TX_BLOCK_TOP_TB_IN_im.txt";
    variable DATA_TRANSFERED : std_logic := '0';
    variable il_signals : line;
    variable ii : integer := 1;
    variable i_INPUT_VAR : std_logic_vector(15 downto 0);
    variable INIT : std_logic := '0';
begin
    if rising_edge(clk100) then
        b0_keep <= (others => '1');
        b0_last <= '0';
        if rstn100 = '0' then
            DATA_TRANSFERED := '0';
            b0_valid <= '0';
            file_close(F1);
            file_open(F1,"TX_BLOCK_TOP_TB_IN_re.txt",read_mode);
            file_close(F2);
            file_open(F2,"TX_BLOCK_TOP_TB_IN_im.txt",read_mode);
            INIT := '0';
        else
            if INIT = '0' then
                -- imag part
                for jj in 16-1 downto 8 loop
                    readline(F2,il_signals);
                    read(il_signals,i_INPUT_VAR);
                    b0_data(16*(jj+1)-1 downto 16*jj) <= i_INPUT_VAR;
                end loop;
                -- real part
                for jj in 8-1 downto 0 loop
                    readline(F1,il_signals);
                    read(il_signals,i_INPUT_VAR);
                    b0_data(16*(jj+1)-1 downto 16*jj) <= i_INPUT_VAR;
                end loop;
                INIT := '1';
            end if;
            if DATA_TRANSFERED ='0' then
                b0_load_data <= '0';
                if ii<b0_PAYLOAD_L then
                    b0_valid <= '1';
                    if b0_ready = '1' then
                        ii:=ii+1;
                        -- imag part
                        for jj in 16-1 downto 8 loop
                            readline(F2,il_signals);
                            read(il_signals,i_INPUT_VAR);
                            b0_data(16*(jj+1)-1 downto 16*jj) <= i_INPUT_VAR;
                        end loop;
                        -- real part
                        for jj in 8-1 downto 0 loop
                            readline(F1,il_signals);
                            read(il_signals,i_INPUT_VAR);
                            b0_data(16*(jj+1)-1 downto 16*jj) <= i_INPUT_VAR;
                        end loop;
                    end if;   
                else
                    DATA_TRANSFERED := '1';
                    b0_valid <= '0';
                end if;
            else
                b0_load_data <= '1';
            end if;                        
        end if;
    end if;
end process;	

-- OUTPUT DATA: 
process(clk220)
    file file_REAL: text open write_mode is "TB_BLOCK_v2_OUT_re.txt";
    file file_IMAG: text open write_mode is "TB_BLOCK_v2_OUT_im.txt";
--    file file_REAL2: text open write_mode is "TB_BLOCK_v2_FILT_OUT_re.txt";
--    file file_IMAG2: text open write_mode is "TB_BLOCK_v2_FILT_OUT_im.txt";
    variable il_signals : line;
    variable ii : integer := 1;
    variable WRITE_FILE : std_logic := '0';
begin
    if rising_edge(clk220) then
        ii_sig <= std_logic_vector(to_unsigned(ii,16));
        if rstn220 = '0' then
            file_close(file_REAL);
            file_open(file_REAL,"TB_BLOCK_v2_OUT_re.txt",write_mode);
            file_close(file_IMAG);
            file_open(file_IMAG,"TB_BLOCK_v2_OUT_im.txt",write_mode);
--            file_close(file_REAL2);
--            file_open(file_REAL2,"TB_BLOCK_v2_FILT_OUT_re.txt",write_mode);
--            file_close(file_IMAG2);
--            file_open(file_IMAG2,"TB_BLOCK_v2_FILT_OUT_im.txt",write_mode);
            END_FILE <= '0';
        else
            if b2_valid ='1' then
                for jj in 0 to 4-1 loop
                    if jj=0 or jj = 2 then
                        write(il_signals,to_integer(signed(b2_data((jj+1)*16-1 downto jj*16))));
                        writeline(file_REAL,il_signals);
                    else
                        write(il_signals,to_integer(signed(b2_data((jj+1)*16-1 downto jj*16))));
                        writeline(file_IMAG,il_signals);
                    end if;
                end loop;
            end if;
        end if;
    end if;
end process;	

process(clk100)
begin
    if rising_edge(clk100) then
        b0_load_data_r <= b0_load_data;
        b0_load_data_rr <= b0_load_data_r;
        b0_load_data_rrr <= b0_load_data_rr;
        b0_load_data_rrrr <= b0_load_data_rrr;
        b0_load_data_rrrrr <= b0_load_data_rrrr;
        b0_load_data_rrrrrr <= b0_load_data_rrrrr;
    end if;
end process;

--SEND_PKT_process :process
--begin
--    b0_SEND_PKT <= '0';
--    wait for clk_P_220*4000;
--    b0_SEND_PKT <= '1';
--    wait for clk_P_220*4;
--    b0_SEND_PKT <= '0';
--    wait for clk_P_220*2000;
--end process;

SEND_PKT_process :process
begin
    b0_SEND_PKT <= '0';
    wait for clk_P_220*10000;
    b0_SEND_PKT <= '1';
    wait for clk_P_220*40000;
    b0_SEND_PKT <= '0';
    wait for clk_P_220*40000;
end process;

end Behavioral;

