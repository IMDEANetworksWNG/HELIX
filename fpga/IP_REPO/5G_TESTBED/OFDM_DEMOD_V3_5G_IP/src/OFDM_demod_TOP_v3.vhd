----------------------------------------------------------------------------------
-- Create Date: 05/04/2022 04:32:01 PM
-- Design Name: 
-- Module Name: OFDM_demod_TOP_v2 - Behavioral
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


entity OFDM_demod_TOP_v3 is
Port (  clk : in std_logic;
        rstn : in std_logic;
        GlobalStart : in std_logic;
        --
        dataIn_re : in std_logic_vector(2*16-1 downto 0); -- s[16 15]
        dataIn_im : in std_logic_vector(2*16-1 downto 0); -- s[16 15]
        validIn : in std_logic;
        triggerIn : in std_logic;
        triggerIn_TEMP : in std_logic;
        --
        cpLengths : in std_logic_vector(17 downto 0);
        numOFDMSyms : in std_logic_vector(6 downto 0);
        nullFirst : in std_logic_vector(11 downto 0); -- Index of the first null subcarrier = Num Data subcarriers (no fftshift)
        nullLast : in std_logic_vector(11 downto 0); -- NumDataSC/2 + NumNullSC - 1 (no fftshift)  
        --
        countSCOut : out std_logic_vector(11 downto 0);
        countOFDMOut : out std_logic_vector(4 downto 0);
        fifoErrorOut : out std_logic;
        triggerOut : out std_logic;
        dataOut_re : out std_logic_vector(2*16-1 downto 0); -- s[16 10] (when configFFT = "0000001010101011")
        dataOut_im : out std_logic_vector(2*16-1 downto 0); -- s[16 10] (when configFFT = "0000001010101011")
        lastOut : out std_logic;
        validOut : out std_logic
);
end OFDM_demod_TOP_v3;

architecture Behavioral of OFDM_demod_TOP_v3 is

component FIFO_SYM_OFFSET IS
PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    wr_rst_busy : OUT STD_LOGIC;
    rd_rst_busy : OUT STD_LOGIC
);
end component;

component FFT_HDL_Optimized_Streaming IS
PORT(   clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        DataIn_re                         :   IN    std_logic_vector(2*16-1 downto 0);  -- sfix16_En13 [2]
        DataIn_im                         :   IN    std_logic_vector(2*16-1 downto 0);  -- sfix16_En13 [2]
        ValidIn                           :   IN    std_logic;
        DataOut_re                        :   OUT   std_logic_vector(2*27-1 downto 0);  -- sfix27_En13 [2]
        DataOut_im                        :   OUT   std_logic_vector(2*27-1 downto 0);  -- sfix27_En13 [2]
        ValidOut                          :   OUT   std_logic;
        startOut                          :   OUT   std_logic;
        endOut                            :   OUT   std_logic
);
END component;

component FFT_SHIFT_FIFO IS
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    wr_rst_busy : OUT STD_LOGIC;
    rd_rst_busy : OUT STD_LOGIC
  );
END component;

component ila_0_ofdm IS
PORT (  clk : IN STD_LOGIC;
        probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe2 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        probe3 : IN STD_LOGIC_VECTOR(4 DOWNTO 0)
);
END component;

constant NFFT : integer := 2048;
constant maxCP : integer := 512;
constant ONE : std_logic_vector(31 downto 0) := x"00000001";
constant SSR : integer := 2;

--b0: state machine
type state_type is (st1_IDLE, st2_PROCESS_SYMBOLS);
signal b0_state : state_type;
signal b0_cpL1, b0_cpL2, b0_cp : std_logic_vector(8 downto 0);
signal b0_countSym : integer range 0 to NFFT+maxCP-1 := 0;
signal b0_valid : std_logic;
signal b0_countOFDMsyms : integer range 0 to 127 := 0;
signal b0_data_re, b0_data_im : std_logic_vector(SSR*16-1 downto 0);
signal b0_data_re1_TEMP, b0_data_im1_TEMP : std_logic_vector(16-1 downto 0);
signal b0_data_re2_TEMP, b0_data_im2_TEMP : std_logic_vector(16-1 downto 0);
signal b0_FFT_start, b0_FFT_start_r : std_logic;
signal b0_FIFO_wr, b0_FIFO_rd, b0_lastOut : std_logic;
signal b0_force_rst : std_logic;

--b1: Symbol Offset FIFO
signal fifo_rst : std_logic;
signal b1_full, b1_empty : std_logic;
signal b1_fifoOut_re, b1_fifoOut_im : std_logic_vector(SSR*16-1 downto 0);

signal b1_fifoIn_re : std_logic_vector(31 downto 0);
signal b1_fifoIn_im : std_logic_vector(31 downto 0);

--b2: FFT engine
signal b2_dataIn_re : std_logic_vector(31 downto 0);
signal b2_dataIn_im : std_logic_vector(31 downto 0);
signal b2_validIn : std_logic;
signal b2_dataOut_re, b2_dataOut_im : std_logic_vector(27*2-1 downto 0);
signal b2_validOut : std_logic;
signal b2_startOut, b2_endOut : std_logic;

--b2_2: FFT_SHIFT
signal b2_2_dataIn_re, b2_2_dataIn_im : std_logic_vector(31 downto 0);
signal b2_2_validIn, b2_2_validOut, b2_2_fifoWr, b2_2_fifoWr2 : std_logic;
signal b2_2_count, b2_2_countOut : integer range 0 to 2047;
signal b2_2_enableOut, b2_2_fifoRd2 : std_logic;
signal b2_2_dataOut_re, b2_2_fifoOut_re : std_logic_vector(31 downto 0);
signal b2_2_dataOut_im, b2_2_fifoOut_im : std_logic_vector(31 downto 0);

--b3: symbol sync state machine0
type b3_state_type is (st1_IDLE, st2_COUNT);
signal b3_state : b3_state_type;
signal b3_first, b3_last : std_logic;
signal b3_countSC : integer range 0 to NFFT := 0;
signal b3_countOFDM : integer range 0 to 31 := 0;
signal b3_dataOut_re, b3_dataOut_im : std_logic_vector(31 downto 0);
signal b3_validOut : std_logic;
signal b3_countSC_temp : std_logic_vector(11 downto 0);
signal b3_countOFDM_temp : std_logic_vector(4 downto 0);

--b4: discard null sub-carriers 
signal b4_validOut : std_logic;
signal b4_dataOut_re, b4_dataOut_im : std_logic_vector(31 downto 0);
signal b4_countSC : integer range 0 to NFFT := 0;
signal b4_countOFDM : integer range 0 to 31 := 0;
signal b4_countSC_temp : std_logic_vector(11 downto 0);
signal b4_countOFDM_temp : std_logic_vector(4 downto 0);
signal b4_triggerOut : std_logic;
signal b4_lastOut : std_logic;

signal tempILAtrigger : std_logic;
signal trigOut1, trigOut1_ACK : std_logic;

begin

b0_cpL1 <= cpLengths(8 downto 0);
b0_cpL2 <= cpLengths(17 downto 9);


-- b0: state machine
process(clk)
begin
    if rising_edge(clk) then
        b0_data_re <= dataIn_re;
        b0_data_im <= dataIn_im;
        b0_FFT_start <= '0';
        b0_FFT_start_r <= b0_FFT_start;
        if (rstn = '0') or GlobalStart = '0' then
            b0_state <= st1_IDLE;
            b0_valid <= '0';
            b0_lastOut <= '0';
            b0_FIFO_wr <= '0';
            b0_force_rst <= '0';
            b0_countOFDMsyms <= 0;
            b0_countSym <= 0;
        else
            b0_force_rst <= '0';
            case (b0_state) is
                when st1_IDLE =>
                    b0_countOFDMsyms <= 0;
                    b0_countSym <= 0;
                    b0_lastOut <= '0';
                    b0_FIFO_wr <= '0';
                    b0_FIFO_rd <= '0';
                    b0_valid <= '0';
                    b0_force_rst <= '0';
                    if triggerIn = '1' then
                        if b1_empty = '0' then -- if FIFO not empty then reset the fifo and raise an error flag
                            b0_force_rst <= '1';
                        end if;
                        b0_state <= st2_PROCESS_SYMBOLS;
                        b0_cp <= b0_cpL1; -- Rule for first OFDM symbol
                        if validIn = '1' then
                            b0_countSym <= b0_countSym + 1;
                        end if;
                    end if;
                when st2_PROCESS_SYMBOLS => 
                    b0_valid <= '0';
                    b0_FIFO_wr <= '0';
                    b0_FIFO_rd <= '0';
                    b0_lastOut <= '0';
                    if validIn = '1' then
                        if b0_countSym < to_integer(unsigned(b0_cp(b0_cp'high downto SSR))) then -- half of the FIRST CP length
                            b0_countSym <= b0_countSym + 1;
                        elsif b0_countSym < to_integer(unsigned(b0_cp(b0_cp'high downto SSR-1))) then -- second half of the FIRST CP length (save on FIFO)
                            --b0_valid <= '1';
                            b0_countSym <= b0_countSym + 1;
                            b0_FIFO_wr <= '1';
                        elsif b0_countSym < to_integer(unsigned(b0_cp(b0_cp'high downto SSR))) + NFFT/SSR then -- count NFFT symbols
                            b0_valid <= '1';
                            b0_countSym <= b0_countSym + 1;
                        elsif b0_countSym < to_integer(unsigned(b0_cp(b0_cp'high downto SSR-1))) + NFFT/SSR-1 then -- count NFFT symbols + CP
                            b0_countSym <= b0_countSym + 1;
                            b0_FIFO_rd <= '1';
                        else
                            b0_lastOut <= '1';
                            b0_FIFO_rd <= '1';
                            b0_countSym <= 0;
                            b0_cp <= b0_cpL2; -- Rule for rest OFDM symbols
                            b0_FFT_start <= '1';
                            if b0_countOFDMsyms < to_integer(unsigned(numOFDMSyms))-1 then
                                b0_countOFDMsyms <= b0_countOFDMsyms + 1;
                            else
                                b0_countOFDMsyms <= 0;
                                b0_state <= st1_IDLE;
                            end if;
                        end if;
                    end if;
            end case;
        end if;
    end if;
end process;

b0_data_re1_TEMP <= b0_data_re(16-1 downto 0);
b0_data_re2_TEMP <= b0_data_re(2*16-1 downto 16);
b0_data_im1_TEMP <= b0_data_im(16-1 downto 0);
b0_data_im2_TEMP <= b0_data_im(2*16-1 downto 16);

fifoErrorOut <= b0_force_rst;
fifo_rst <= not rstn or b0_force_rst;

b1_fifoIn_re <= b0_data_re;
b1_fifoIn_im <= b0_data_im;

b1_re: FIFO_SYM_OFFSET
PORT MAP (
    clk => clk,
    srst => fifo_rst,
    din => b1_fifoIn_re,
    wr_en => b0_FIFO_wr,
    rd_en => b0_FIFO_rd,
    dout => b1_fifoOut_re,
    full => b1_full,
    empty => b1_empty,
    wr_rst_busy => open,
    rd_rst_busy => open
);

b1_im: FIFO_SYM_OFFSET
PORT MAP (
    clk => clk,
    srst => fifo_rst,
    din => b1_fifoIn_im,
    wr_en => b0_FIFO_wr,
    rd_en => b0_FIFO_rd,
    dout => b1_fifoOut_im,
    full => b1_full,
    empty => open,
    wr_rst_busy => open,
    rd_rst_busy => open
);
    
--dataOut_re <= b0_data_re when b0_FIFO_rd = '0' else b1_fifoOut_re;
--dataOut_im <= b0_data_im when b0_FIFO_rd = '0' else b1_fifoOut_im;
--validOut <= b0_valid or b0_FIFO_rd;

b2_dataIn_re <= b0_data_re when b0_FIFO_rd = '0' else b1_fifoOut_re;
b2_dataIn_im <= b0_data_im when b0_FIFO_rd = '0' else b1_fifoOut_im;
b2_validIn <= b0_valid or b0_FIFO_rd;

b2: FFT_HDL_Optimized_Streaming
PORT MAP(   clk => clk,
            reset => fifo_rst,
            DataIn_re => b2_dataIn_re,
            DataIn_im => b2_dataIn_im,
            ValidIn => b2_validIn,
            DataOut_re => b2_dataOut_re,
            DataOut_im => b2_dataOut_im,
            ValidOut => b2_validOut,
            startOut => b2_startOut,
            endOut => b2_endOut
);

process(clk)
    variable wait_trigger : std_logic;
begin
    if rising_edge(clk) then
        tempILAtrigger <= '0';
        if wait_trigger = '1' and b2_startOut = '1' then
            tempILAtrigger <= '1';
            wait_trigger := '0';
        end if;
            
        if triggerIn = '1' then
            wait_trigger := '1';
        end if;
    end if;
end process;

--dataOut_re <= b2_dataOut_re(2*27-1-6 downto 27+5) & b2_dataOut_re(27-1-6 downto 0+5);
--dataOut_im <= b2_dataOut_im(2*27-1-6 downto 27+5) & b2_dataOut_im(27-1-6 downto 0+5);
--validOut <= b2_validOut;

--ila_blk2: ila_1
--PORT MAP(   clk => clk,
--            probe0 => b2_2_dataIn_re,
--            probe1 => b2_2_dataIn_im,
--            probe2(0) => b2_2_validIn,
--            probe3(0) => triggerIn_TEMP,
--            probe4 => ONE(11 downto 0),
--            probe5 => ONE(4 downto 0),
--            probe6(0) => '0'
--);


--b2_2: fft shift implementation
process(clk)
begin
    if rising_edge(clk) then
        b2_2_dataIn_re <= b2_dataOut_re(2*27-1-6 downto 27+5) & b2_dataOut_re(27-1-6 downto 0+5);
        b2_2_dataIn_im <= b2_dataOut_im(2*27-1-6 downto 27+5) & b2_dataOut_im(27-1-6 downto 0+5);
        b2_2_validIn <= b2_validOut;
        if rstn = '0' then
            b2_2_count <= 0;
            b2_2_fifoWr <= '0';
            b2_2_enableOut <= '0';
            b2_2_countOut <= 0;
            b2_2_fifoRd2 <= '0';
            b2_2_dataOut_re <= (others => '0');
            b2_2_dataOut_im <= (others => '0');
        else
            if b2_startOut = '1' then
                b2_2_fifoWr <= '1';
            elsif b2_2_count = 511 then
                b2_2_fifoWr <= '0';
                b2_2_countOut <= 0; -- reset the output counter
                b2_2_enableOut <= '1';
            elsif b3_state = st1_IDLE and b2_2_countOut = NFFT/SSR then
                b2_2_enableOut <= '0';
                b2_2_countOut <= 0;
            end if;
            
            if b2_startOut = '1' then
                b2_2_count <= 0;
            elsif b2_2_validIn = '1' then 
                b2_2_count <= b2_2_count + 1;
            end if;
            
            b2_2_validOut <= '0';
            case b2_2_countOut is
                when 0 to NFFT/(2*SSR)-2 => 
                    if b2_2_validIn = '1' and b2_2_enableOut = '1' then
                        b2_2_fifoRd2 <= '0';
                        b2_2_dataOut_re <= b2_2_dataIn_re;
                        b2_2_dataOut_im <= b2_2_dataIn_im;
                        b2_2_validOut <= '1';
                        b2_2_countOut <= b2_2_countOut + 1;
                    end if;
                when NFFT/(2*SSR)-1 => 
                    if b2_2_validIn = '1' and b2_2_enableOut = '1' then
                        b2_2_fifoRd2 <= '1';
                        b2_2_dataOut_re <= b2_2_dataIn_re;
                        b2_2_dataOut_im <= b2_2_dataIn_im;
                        b2_2_validOut <= '1';
                        b2_2_countOut <= b2_2_countOut + 1;
                    end if;
                when NFFT/(2*SSR) to NFFT/(SSR)-2 => 
                    if b2_2_enableOut = '1' then
                        b2_2_fifoRd2 <= '1';
                        b2_2_dataOut_re <= b2_2_fifoOut_re;
                        b2_2_dataOut_im <= b2_2_fifoOut_im;
                        b2_2_validOut <= '1';
                        b2_2_countOut <= b2_2_countOut + 1;
                    end if;
                when NFFT/(SSR)-1 => 
                    if b2_2_enableOut = '1' then
                        b2_2_fifoRd2 <= '0';
                        b2_2_dataOut_re <= b2_2_fifoOut_re;
                        b2_2_dataOut_im <= b2_2_fifoOut_im;
                        b2_2_validOut <= '1';
                        b2_2_countOut <= b2_2_countOut + 1;
                    end if;
                when others => 
                        b2_2_fifoRd2 <= '0';
                        b2_2_validOut <= '0';
                        b2_2_dataOut_re <= (others => '0');
                        b2_2_dataOut_im <= (others => '0');
            end case;
        end if;
    end if;
end process;

b2_2_fifoWr2 <= b2_2_fifoWr and b2_2_validIn;
        
b2_2_fifo_re: FFT_SHIFT_FIFO 
PORT MAP(
    clk => clk,
    srst => fifo_rst,
    din => b2_2_dataIn_re,
    wr_en => b2_2_fifoWr2,
    rd_en => b2_2_fifoRd2,
    dout => b2_2_fifoOut_re,
    full => open,
    empty => open,
    wr_rst_busy => open,
    rd_rst_busy => open
);

b2_2_fifo_im: FFT_SHIFT_FIFO 
PORT MAP(
    clk => clk,
    srst => fifo_rst,
    din => b2_2_dataIn_im,
    wr_en => b2_2_fifoWr2,
    rd_en => b2_2_fifoRd2,
    dout => b2_2_fifoOut_im,
    full => open,
    empty => open,
    wr_rst_busy => open,
    rd_rst_busy => open
);

--dataOut_re <= b2_2_dataOut_re;
--dataOut_im <= b2_2_dataOut_im;
--validOut <= b2_2_validOut;

--ila_blk2: ila_1
--PORT MAP(   clk => clk,
--            probe0 => b2_2_dataOut_re,
--            probe1 => b2_2_dataOut_im,
--            probe2(0) => b2_2_validOut,
--            probe3(0) => triggerIn_TEMP,
--            probe4 => ONE(11 downto 0),
--            probe5 => ONE(4 downto 0),
--            probe6(0) => '0'
--);

--b3: symbol sync state machine
process(clk)
begin
    if rising_edge(clk) then
        b3_dataOut_re <= b2_2_dataOut_re;
        b3_dataOut_im <= b2_2_dataOut_im;
        b3_validOut <= b2_2_validOut;
        if (rstn = '0') or GlobalStart = '0' then
            b3_state <= st1_IDLE;
            b3_countSC <= NFFT/SSR-1;
            b3_countOFDM <= 0;
        else
            b3_first <= '0';
            b3_last <= '0';
            case (b3_state) is
                when st1_IDLE =>
                    if b0_state = st2_PROCESS_SYMBOLS then
                    --if triggerIn = '1' then
                        b3_state <= st2_COUNT;
                        b3_countSC <= NFFT/SSR-1;
                        b3_countOFDM <= 0;
                    end if;
                when st2_COUNT => 
                    if b2_2_validOut = '1' then
                        b3_countSC <= b3_countSC + 1;
                        if b3_countSC = NFFT/SSR-2 then
                            if b3_countOFDM = to_integer(unsigned(numOFDMSyms)) then
                                b3_state <= st1_IDLE;
                                b3_last <= '1';
                            end if;                        
                        elsif b3_countSC = NFFT/SSR-1 then
                            b3_first <= '1';
                            b3_countOFDM <= b3_countOFDM + 1;
                            b3_countSC <= 0;
                        end if;
                    end if;
            end case;
        end if;
    end if;
end process;

--dataOut_re <= b3_dataOut_re;
--dataOut_im <= b3_dataOut_im;
--validOut <= b3_validOut;

b3_countSC_temp <= std_logic_vector(to_unsigned(b3_countSC,b3_countSC_temp'length));
b3_countOFDM_temp <= std_logic_vector(to_unsigned(b3_countOFDM,b3_countOFDM_temp'length));

--ila_blk4: ila_1
--PORT MAP(   clk => clk,
--            probe0 => b3_dataOut_re,
--            probe1 => b3_dataOut_im,
--            probe2(0) => b3_validOut,
--            probe3(0) => triggerIn_TEMP,
--            probe4 => b3_countSC_temp,
--            probe5 => b3_countOFDM_temp,
--            probe6(0) => '0'
--);

--b4: discard null subcarriers (assumed ALWAYS to be at the borders of the channels) 
process(clk)
begin
    if rising_edge(clk) then
        b4_validOut <= '0';
        b4_lastOut <= '0';
        b4_dataOut_re <= b3_dataOut_re;
        b4_dataOut_im <= b3_dataOut_im;
        b4_countOFDM <= b3_countOFDM;
        b4_countSC <= b3_countSC-to_integer(unsigned(nullFirst(nullFirst'high downto SSR-1)));
        if b3_validOut = '1' then
            if b3_countSC > to_integer(unsigned(nullFirst(nullFirst'high downto SSR-1))) and b3_countSC < to_integer(unsigned(nullLast(nullLast'high downto SSR-1))) then -- with fftshift
                b4_validOut <= '1';
            end if;
            if b3_countSC = to_integer(unsigned(nullLast(nullLast'high downto SSR-1)))-1 and b3_countOFDM = to_integer(unsigned(numOFDMSyms)) then
                b4_lastOut <= '1';
            end if;
        end if;
    end if;
end process;

b4_countSC_temp <= std_logic_vector(to_unsigned(b4_countSC,b4_countSC_temp'length));
b4_countOFDM_temp <= std_logic_vector(to_unsigned(b4_countOFDM,b4_countOFDM_temp'length));


--ila_blk5: ila_0_ofdm
--PORT MAP(   clk => clk,
--            probe0(0) => b4_validOut,
--            probe1(0) => b4_lastOut,
--            probe2 => b4_countSC_temp,
--            probe3 => b4_countOFDM_temp
--);

b4_triggerOut <= '1' when (b4_validOut = '1' and b4_countSC = 1 and b4_countOFDM = 1) else '0';
triggerOut <= b4_triggerOut;

dataOut_re <= b4_dataOut_re;
dataOut_im <= b4_dataOut_im;
validOut <= b4_validOut;
lastOut <= b4_lastOut;  
countSCOut <= std_logic_vector(to_unsigned(b4_countSC,countSCOut'length));
countOFDMOut <= std_logic_vector(to_unsigned(b4_countOFDM,countOFDMOut'length));

end Behavioral;
