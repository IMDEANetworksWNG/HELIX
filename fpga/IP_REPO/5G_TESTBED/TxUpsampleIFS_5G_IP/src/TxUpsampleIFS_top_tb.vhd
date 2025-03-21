----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/06/2023 02:08:28 PM
-- Design Name: 
-- Module Name: TxUpsampleIFS_top_tb - Behavioral
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

entity TxUpsampleIFS_top_tb is
end TxUpsampleIFS_top_tb;

architecture Behavioral of TxUpsampleIFS_top_tb is

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
        ir_remPAYLOAD_L : in std_logic_vector(2 downto 0); -- Remain of Payload length divided by 8 (when division is not exact)
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

COMPONENT TxUpsampleIFS_top_wrp is
generic (
    -- Parameters of Axi Slave Bus Interface S00_AXI
    C_S00_AXI_DATA_WIDTH	: integer	:= 32;
    C_S00_AXI_ADDR_WIDTH	: integer	:= 4;
    -- Parameters of Axi Slave Bus Interface S00_AXIS
    C_S00_AXIS_TDATA_WIDTH	: integer	:= 64;
    -- Parameters of Axi Master Bus Interface M00_AXIS
    C_M00_AXIS_TDATA_WIDTH	: integer	:= 64
);
Port ( 
    s00_axi_aclk	: in std_logic;
    s00_axi_aresetn	: in std_logic;
    s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
    --s00_axi_awprot	: in std_logic_vector(2 downto 0);
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
    --s00_axi_arprot	: in std_logic_vector(2 downto 0);
    s00_axi_arvalid	: in std_logic;
    s00_axi_arready	: out std_logic;
    s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
    s00_axi_rresp	: out std_logic_vector(1 downto 0);
    s00_axi_rvalid	: out std_logic;
    s00_axi_rready	: in std_logic;
    --
    triggerIn       : in std_logic;
    --ic_SEND_PKT     : in std_logic;
    aclk            : in std_logic;
    aresetn         : in std_logic;
    --s00_axis_aclk	: in std_logic;
    --s00_axis_aresetn : in std_logic;
    s00_axis_tready	: out std_logic;
    s00_axis_tdata	: in std_logic_vector(C_S00_AXIS_TDATA_WIDTH-1 downto 0);
    s00_axis_tkeep	: in std_logic_vector(8-1 downto 0);
    s00_axis_tlast	: in std_logic;
    s00_axis_tvalid	: in std_logic;
    --
    triggerOut      : out std_logic;
    busyOut         : out std_logic;
    --m00_axis_aclk	: in std_logic;
    --m00_axis_aresetn : in std_logic;
    m00_axis_tvalid	: out std_logic;
    m00_axis_tdata	: out std_logic_vector(C_M00_AXIS_TDATA_WIDTH-1 downto 0);
    m00_axis_tkeep	: out std_logic_vector(8-1 downto 0);
    m00_axis_tlast	: out std_logic;
    m00_axis_tready	: in std_logic
);
end COMPONENT;

constant clk_P_100 : time := 10 ns;

signal clk : std_logic := '0';
signal rstn : std_logic := '0';

signal b0_SEND_PKT : std_logic;
signal b0_load_data_r, b0_load_data_rr, b0_load_data_rrr, b0_load_data_rrrr, b0_load_data_rrrrr, b0_load_data_rrrrrr : std_logic;
signal b0_load_data, b0_ready : std_logic;
signal b0_valid : std_logic := '0';
signal b0_data : std_logic_vector(255 downto 0);
signal b0_validOut, b0_lastOut, b0_readyOut, b0_triggerOut : std_logic := '0';
signal b0_dataOut : std_logic_vector(63 downto 0);

signal s_axi_BUS_A_AWADDR : STD_LOGIC_VECTOR(3 DOWNTO 0) := (others => '0');
signal s_axi_BUS_A_AWVALID : STD_LOGIC := '0';
signal s_axi_BUS_A_AWREADY : STD_LOGIC;
signal s_axi_BUS_A_WDATA : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal s_axi_BUS_A_WVALID : STD_LOGIC := '0';
signal s_axi_BUS_A_WREADY : STD_LOGIC;
signal s_axi_BUS_A_BRESP : STD_LOGIC_VECTOR(1 DOWNTO 0);
signal s_axi_BUS_A_BVALID : STD_LOGIC;
signal s_axi_BUS_A_BREADY : STD_LOGIC;
signal s_axi_BUS_A_ARADDR : STD_LOGIC_VECTOR(3 DOWNTO 0) := (others => '0');
signal s_axi_BUS_A_ARVALID : STD_LOGIC := '0';
signal s_axi_BUS_A_ARREADY : STD_LOGIC;
signal s_axi_BUS_A_RDATA : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal s_axi_BUS_A_RRESP : STD_LOGIC_VECTOR(1 DOWNTO 0);
signal s_axi_BUS_A_RVALID : STD_LOGIC;
signal s_axi_BUS_A_RREADY : STD_LOGIC := '1';

signal b1_validOut, b1_triggerOut : std_logic;
signal b1_dataOut : std_logic_vector(63 downto 0);
signal b1_readyOut, b1_lastOut, b1_busyOut : std_logic;

constant b0_PAYLOAD_L :integer := 3996; 
constant b0_PAYLOADrem_L : integer := 6; 
constant BW_SEL : integer := 0;
constant IFS_samples : integer := 7372;

begin

clk100_process :process
begin
    clk <= '0';
    wait for clk_P_100/2;
    clk <= '1';
    wait for clk_P_100/2;
end process;

-- hold reset for 8 clock periods 
rstn <= '1' after clk_P_100*8;

-- INPUT DATA: -- split8 data
process(clk)
    file F1: text open read_mode is "dataIn_I.txt";
    file F2: text open read_mode is "dataIn_Q.txt";
    variable line1 : line;
    variable dataIn : std_logic_vector(16-1 downto 0);
    variable INIT : std_logic := '0';
    variable DATA_TRANSFERED : std_logic := '0';
    variable countLoad : integer := 0;
    variable ii : integer := 1;
begin
    if rising_edge(clk) then
        if rstn = '0' then
            b0_valid <= '0';
            file_close(F1); file_open(F1,"dataIn_I.txt",read_mode);
            file_close(F2); file_open(F2,"dataIn_Q.txt",read_mode);
            b0_data <= ((others => '0'));
            b0_valid <= '0';
            INIT := '0';
            countLoad := 0;
            DATA_TRANSFERED := '0';
        else
            if INIT = '0' then
                -- imag part
                for jj in 16-1 downto 8 loop
                    readline(F2,line1);
                    read(line1,dataIn);
                    b0_data(16*(jj+1)-1 downto 16*jj) <= dataIn;
                end loop;
                -- real part
                for jj in 8-1 downto 0 loop
                    readline(F1,line1);
                    read(line1,dataIn);
                    b0_data(16*(jj+1)-1 downto 16*jj) <= dataIn;
                end loop;
                INIT := '1';
            end if;
            
            if DATA_TRANSFERED = '0' then
                b0_load_data <= '0';
                if ii<b0_PAYLOAD_L then
                    b0_valid <= '1';
                    if b0_ready = '1' then
                        ii:=ii+1;
                        -- imag part
                        for jj in 16-1 downto 8 loop
                            readline(F2,line1);
                            read(line1,dataIn);
                            b0_data(16*(jj+1)-1 downto 16*jj) <= dataIn;
                        end loop;
                        -- real part
                        for jj in 8-1 downto 0 loop
                            readline(F1,line1);
                            read(line1,dataIn);
                            b0_data(16*(jj+1)-1 downto 16*jj) <= dataIn;
                        end loop;

                    end if;   
                else
                    DATA_TRANSFERED := '1';
                    b0_valid <= '0';
                end if;
            end if;
            
            if DATA_TRANSFERED = '1' then
                if countLoad < 32 then
                    countLoad := countLoad + 1;
                else             
                    b0_load_data <= '1';
                end if;             
            end if;
        end if;    
    end if;
end process;

-- Instantiate LBM
LBM_DATA: TX_BLOCK_TOP_v2 
    PORT MAP (
    CLK_OUT => clk,
    RST_OUT_N => rstn,
    -- AXI Stream Interface (from TX-DMA)
    S00_AXIS_tdata => b0_data,  
    S00_AXIS_tlast => '0',
    S00_AXIS_tready => b0_ready,
    S00_AXIS_tkeep => (others => '1'),
    S00_AXIS_tvalid => b0_valid,
    S00_AXIS_aclk => clk,
    S00_axis_aresetn => rstn,
    --
    ic_LOAD_DATA => b0_load_data_rrrrrr,
    ic_SEND_PKT => b0_SEND_PKT,
    ir_PAYLOAD_L => std_logic_vector(to_unsigned(b0_PAYLOAD_L,16)),
    ir_remPAYLOAD_L => std_logic_vector(to_unsigned(b0_PAYLOADrem_L,3)),
    ir_TIMER => std_logic_vector(to_unsigned(16,32)),
    triggerOut => b0_triggerOut,
    --
    M00_AXIS_tdata => b0_dataOut, 
    M00_AXIS_tlast => b0_lastOut,
    M00_AXIS_tready => b0_readyOut,
    M00_AXIS_tkeep => open,
    M00_AXIS_tvalid => b0_validOut
);

UUT: TxUpsampleIFS_top_wrp
Port map( 
    s00_axi_aclk	=> clk,
    s00_axi_aresetn	=> rstn,
    s00_axi_awaddr	=> s_axi_BUS_A_AWADDR,
    s00_axi_awvalid	=> s_axi_BUS_A_AWVALID,
    s00_axi_awready	=> s_axi_BUS_A_AWREADY,
    s00_axi_wdata	=> s_axi_BUS_A_WDATA,
    s00_axi_wstrb	=> (others => '1'),
    s00_axi_wvalid	=> s_axi_BUS_A_WVALID,
    s00_axi_wready	=> s_axi_BUS_A_WREADY,
    s00_axi_bresp	=> open,
    s00_axi_bvalid	=> open,
    s00_axi_bready	=> '1',
    s00_axi_araddr	=> s_axi_BUS_A_ARADDR,
    s00_axi_arvalid	=> s_axi_BUS_A_ARVALID,
    s00_axi_arready	=> s_axi_BUS_A_ARREADY,
    s00_axi_rdata	=> s_axi_BUS_A_RDATA,
    s00_axi_rresp	=> open,
    s00_axi_rvalid	=> s_axi_BUS_A_RVALID,
    s00_axi_rready	=> s_axi_BUS_A_RREADY,
    --
    triggerIn       => b0_triggerOut,
    --ic_SEND_PKT     : in std_logic;
    aclk            => clk,
    aresetn         => rstn,
    s00_axis_tready	=> b0_readyOut,
    s00_axis_tdata	=> b0_dataOut,
    s00_axis_tkeep	=> (others => '1'),
    s00_axis_tlast	=> b0_lastOut,
    s00_axis_tvalid	=> b0_validOut,
    --
    triggerOut      => b1_triggerOut,
    busyOut         => b1_busyOut,
    m00_axis_tvalid	=> b1_validOut,
    m00_axis_tdata	=> b1_dataOut,
    m00_axis_tkeep	=> open,
    m00_axis_tlast	=> b1_lastOut,
    m00_axis_tready	=> '1'
);


SEND_PKT_process :process
begin
    b0_SEND_PKT <= '0';
    wait for clk_P_100*6000;
    b0_SEND_PKT <= '1';
--    wait for clk_P_100*10000;
--    b0_SEND_PKT <= '0';
--    wait for clk_P_100*8000;
--    b0_SEND_PKT <= '1';
--    wait for clk_P_100*45000;
--    b0_SEND_PKT <= '0';
    wait;
end process;

process(clk)
begin
    if rising_edge(clk) then
        b0_load_data_r <= b0_load_data;
        b0_load_data_rr <= b0_load_data_r;
        b0_load_data_rrr <= b0_load_data_rr;
        b0_load_data_rrrr <= b0_load_data_rrr;
        b0_load_data_rrrrr <= b0_load_data_rrrr;
        b0_load_data_rrrrrr <= b0_load_data_rrrrr;
    end if;
end process;

--AXI lite data input for TxUpsampleIFS_top_wrp block
--process
--begin
--    wait for 400ns;
--    --IFS samples
--    s_axi_BUS_A_AWADDR  <= "0000";    s_axi_BUS_A_AWVALID <= '1'; wait for clk_P_100; s_axi_BUS_A_AWVALID <= '0';
--    s_axi_BUS_A_WDATA   <= std_logic_vector(to_unsigned(IFS_samples,32)); s_axi_BUS_A_WVALID <= '1';  wait for clk_P_100; s_axi_BUS_A_WVALID <= '0';
--    wait for clk_P_100*4;
--    --BW_sel 
--    s_axi_BUS_A_AWADDR <= "0100";     s_axi_BUS_A_AWVALID <= '1'; wait for clk_P_100; s_axi_BUS_A_AWVALID <= '0';
--    s_axi_BUS_A_WDATA <= std_logic_vector(to_unsigned(BW_SEL,32));   s_axi_BUS_A_WVALID <= '1';  wait for clk_P_100; s_axi_BUS_A_WVALID <= '0'; --684 (RE145)
--    wait;
--end process;
process
begin
    wait for 400ns;
    --IFS samples
    s_axi_BUS_A_AWADDR  <= "0000";    s_axi_BUS_A_AWVALID <= '1'; 
    s_axi_BUS_A_WDATA   <= std_logic_vector(to_unsigned(IFS_samples,32)); s_axi_BUS_A_WVALID <= '1';  
    wait for clk_P_100*2; s_axi_BUS_A_WVALID <= '0'; s_axi_BUS_A_AWVALID <= '0';
    wait for clk_P_100*4;
    --BW_sel 
    s_axi_BUS_A_AWADDR <= "0100";     s_axi_BUS_A_AWVALID <= '1'; 
    s_axi_BUS_A_WDATA <= std_logic_vector(to_unsigned(BW_SEL,32));   s_axi_BUS_A_WVALID <= '1';  
    wait for clk_P_100*2; s_axi_BUS_A_WVALID <= '0'; s_axi_BUS_A_AWVALID <= '0';
    wait;
end process;


--OUTPUT DATA
process(clk)
    file F1: text open read_mode is "dataOut_I.txt";
    file F2: text open read_mode is "dataOut_Q.txt";
    variable v_OLINE     : line;
    variable v_SPACE     : character;
begin
    if rising_edge(clk) then
        if rstn = '0' then
            file_close(F1);
            file_open(F1, "dataOut_I.txt", write_mode);
            file_close(F2);
            file_open(F2, "dataOut_Q.txt", write_mode);
        else
            if b1_validOut = '1' then
                write(v_OLINE, to_integer(signed(b1_dataOut(16-1 downto 0))), left, 16);
                writeline(F1, v_OLINE);
                write(v_OLINE, to_integer(signed(b1_dataOut(3*16-1 downto 2*16))), left, 16);
                writeline(F1, v_OLINE);

                write(v_OLINE, to_integer(signed(b1_dataOut(2*16-1 downto 1*16))), left, 16);
                writeline(F2, v_OLINE);
                write(v_OLINE, to_integer(signed(b1_dataOut(4*16-1 downto 3*16))), left, 16);
                writeline(F2, v_OLINE);
            end if;
        end if;
    end if;
end process;
--process(clk)
--    file F1: text open read_mode is "dataOut_I.txt";
--    file F2: text open read_mode is "dataOut_Q.txt";
--    variable v_OLINE     : line;
--    variable v_SPACE     : character;
--begin
--    if rising_edge(clk) then
--        if rstn = '0' then
--            file_close(F1);
--            file_open(F1, "dataOut_I.txt", write_mode);
--            file_close(F2);
--            file_open(F2, "dataOut_Q.txt", write_mode);
--        else
--            if b0_validOut = '1' and b0_readyOut = '1'then
--                write(v_OLINE, to_integer(signed(b0_dataOut(16-1 downto 0))), left, 16);
--                writeline(F1, v_OLINE);
--                write(v_OLINE, to_integer(signed(b0_dataOut(2*16-1 downto 1*16))), left, 16);
--                writeline(F1, v_OLINE);

--                write(v_OLINE, to_integer(signed(b0_dataOut(3*16-1 downto 2*16))), left, 16);
--                writeline(F2, v_OLINE);
--                write(v_OLINE, to_integer(signed(b0_dataOut(4*16-1 downto 3*16))), left, 16);
--                writeline(F2, v_OLINE);
--            end if;
--        end if;
--    end if;
--end process;

end Behavioral;
