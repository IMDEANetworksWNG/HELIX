----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/19/2023 03:58:31 PM
-- Design Name: 
-- Module Name: FFT_mod_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: latency 4055 clock cycles from triggerIn to first output sample -- 1740 used sub-carriers
--                      latency 3622 clock cycles from triggerIn to first output sample -- 876 used sub-carriers
--                      capable of processing 3 back to back slots (before FIFOs overflow) 
--                      PENDING: includes ready signaling: at the output and also using the FIFOs propagating it to the inputs 
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FFT_mod_top is
Port (  clk : in std_logic;
        rstn : in std_logic;
        sendPacketIn : in std_logic;
        triggerIn : in std_logic;
        dataIn_re : in std_logic_vector(31 downto 0);
        dataIn_im : in std_logic_vector(31 downto 0);
        validIn : in std_logic;
        readyIn : out std_logic;
        cpLengths : in std_logic_vector(9*2-1 downto 0);
        numOFDMSyms : in std_logic_vector(6 downto 0);
        numDataSC_div2 : in std_logic_vector(9 downto 0);
        numNullSC_div2 : in std_logic_vector(9 downto 0);
        triggerOut : out std_logic;
        dataOut_re : out std_logic_vector(31 downto 0);
        dataOut_im : out std_logic_vector(31 downto 0);
        validOut : out std_logic;
--        dataOut_re2 : out std_logic_vector(31 downto 0);
--        dataOut_im2 : out std_logic_vector(31 downto 0);
--        validOut2 : out std_logic;
        readyOut : in std_logic;
        lastOut : out std_logic
);
end FFT_mod_top;

architecture Behavioral of FFT_mod_top is

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

component FIFO_CP IS
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    data_count : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
    wr_rst_busy : OUT STD_LOGIC;
    rd_rst_busy : OUT STD_LOGIC
  );
END component;

component FIFO_postFFT IS
PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    data_count : OUT STD_LOGIC_VECTOR(14 DOWNTO 0);
    prog_full : OUT STD_LOGIC;
    wr_rst_busy : OUT STD_LOGIC;
    rd_rst_busy : OUT STD_LOGIC
);
END component;

component FIFO_preFFT IS
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    prog_full : OUT STD_LOGIC;
    prog_empty : OUT STD_LOGIC;
    prog_empty_thresh_assert : in STD_LOGIC_VECTOR(12 DOWNTO 0);
    prog_empty_thresh_negate : in STD_LOGIC_VECTOR(12 DOWNTO 0);
    data_count : OUT STD_LOGIC_VECTOR(13 DOWNTO 0);
    wr_rst_busy : OUT STD_LOGIC;
    rd_rst_busy : OUT STD_LOGIC
  );
END component;

constant fftScale : integer := 4;
constant nFFTdiv2 : integer := 2048/2;
signal rst : std_logic;
signal CP_length1, CP_length2 : integer range 0 to 2**9-1;
signal numOFDMSyms_int : integer range 0 to 2**7-1;
signal numDataSC_div2_int, numNullSC_div2_int : integer range 0 to 1023;
signal numDataSC_div4_int : integer range 0 to 511;

signal fftOut_re, fftOut_im : std_logic_vector(2*27-1 downto 0);
signal fftOutValid, fftStartOut, fftEndOut : std_logic;
signal b0_dataOut_re, b0_dataOut_im : std_logic_vector(16*2-1 downto 0);
signal b0_validOut : std_logic;

type b1_st_type is (b1_st_idle, b1_st_wait, b1_st_countCP);
signal b1_state : b1_st_type;
signal b1_countNFFTmCP : integer range 0 to 2**12-1;
signal b1_countSyms : integer range 0 to 2**5-1;
signal b1_CPwrEn, b1_CPwrEn_s, b1_rst,b1_enableOutSM : std_logic;
signal b1_CP_length : integer range 0 to 2**12-1;
signal b1_readPendingTrigger, b1_PendingTrigger : std_logic;

signal b2_1_dataIn, b2_1_dataOut : std_logic_vector(2*2*16-1 downto 0);
signal b2_1_full, b2_1_empty, b2_2_empty : std_logic;
signal b2_2_dataIn, b2_2_dataOut : std_logic_vector(2*2*16-1 downto 0);
signal b2_2_full, b2_2_prog_full : std_logic;
signal b2_2_dataCount : std_logic_vector(14 downto 0);
signal b2_1_dataCount : std_logic_vector(11 downto 0);

type b3_st_type is (b3_st_idle, b3_st_wait, b3_st_countCP, b3_st_countNFFT, b3_st_waitReady);
signal b3_state : b3_st_type;
signal b3_countNFFT, b3_countCP : integer range 0 to 2**12-1;
signal b3_countSyms : integer range 0 to 2**5-1;
signal b3_CPrdEn, b3_FFTrdEn : std_logic;
signal b3_CP_length : integer range 0 to 2**12-1;
signal b3_dataOut_re, b3_dataOut_im : std_logic_vector(16*2-1 downto 0);
signal b3_validOut : std_logic;
signal b3_readPendingTrigger, b3_PendingTrigger : std_logic;
signal b3_last : std_logic;

signal b4_1_full, b4_2_full : std_logic;
signal b4_1_dataOut, b4_2_dataOut : std_logic_vector(63 downto 0);
signal b4_1_dataCount, b4_2_dataCount : std_logic_vector(13 downto 0);
signal b4_1_prog_full, b4_2_prog_full : std_logic;
signal b4_1_prog_empty, b4_2_prog_empty : std_logic;
signal b4_1_prog_empty_s, b4_2_prog_empty_s : std_logic;
signal b4_1_empty, b4_2_empty : std_logic;
signal b4_prog_empty_thresh_assert, b4_prog_empty_thresh_negate : std_logic_vector(12 downto 0);

type b5_state_type is (b5_st_idle,b5_storeData);
signal b5_state : b5_state_type;
signal b5_1_validOut, b5_2_validOut : std_logic;
signal b5_1_validOut_r, b5_2_validOut_r : std_logic;
signal b5_dataIn, b5_dataIn_r : std_logic_vector(63 downto 0);
signal b5_countSC : integer range 0 to 1023;
signal b5_countSYM : integer range 0 to 31;
signal b5_rst : std_logic;
signal b5_enableRd : std_logic;
--signal b5_readPendingTrigger, b5_PendingTrigger : std_logic;

type b6_state_type is (b6_st_idle,b6_st_rdData,b6_st_waitReady, b6_st_waitnotEmpty);
signal b6_state : b6_state_type;
signal b6_1_rdData, b6_2_rdData : std_logic;
signal b6_countSC : integer range 0 to 1023;
signal b6_countSYM : integer range 0 to 31;
signal b6_dataOut_re, b6_dataOut_im : std_logic_vector(31 downto 0);
signal b6_validOut : std_logic;
signal b6_readPendingTrigger, b6_PendingTrigger : std_logic;
signal b6_prog_empty_thresh_negate, b6_prog_empty_thresh_negate_s : integer;

begin

rst <= not rstn;
CP_length1 <= to_integer(unsigned(cpLengths(9-1 downto 0)));
CP_length2 <= to_integer(unsigned(cpLengths(9*2-1 downto 9)));
numOFDMSyms_int <= to_integer(unsigned(numOFDMSyms));
numDataSC_div2_int <= to_integer(unsigned(numDataSC_div2));
numDataSC_div4_int <= to_integer(unsigned(numDataSC_div2(numDataSC_div2'high downto 1)));
numNullSC_div2_int <= to_integer(unsigned(numNullSC_div2));

--b5: state machine to control input data buffering 
process(clk)
begin
    if rising_edge(clk) then
--        b5_readPendingTrigger <= '0';
        b5_dataIn <= dataIn_im & dataIn_re;
        --b5_dataIn_r <= b5_dataIn;
        b5_1_validOut_r <= b5_1_validOut;
        b5_2_validOut_r <= b5_2_validOut;
        b5_1_validOut <= '0';
        b5_2_validOut <= '0';
        b5_enableRd <= '0';
        if rstn = '0' then
            b5_countSC <= 0;
            b5_countSYM <= 0;
            b5_rst <= '1';
            b5_state <= b5_st_idle;
--            b5_pendingTrigger <= '0';
        else
            b5_rst <= '0';
            case b5_state is 
                when b5_st_idle =>
                    b5_countSC <= 0;
                    b5_countSYM <= 0;
                    if triggerIn = '1' then
                        b5_state <= b5_storeData;
                        --if validIn = '1' then
                        if validIn = '1' and b4_1_prog_full='0' then
                            b5_1_validOut <= '1';
                            b5_countSC <= b5_countSC + 1;
                        end if;
                    end if;
                when b5_storeData =>
                    --if validIn = '1' then
                    if validIn = '1' and b4_1_prog_full='0' then
                        if b5_countSC = numDataSC_div2_int - 1 then
                            b5_countSYM <= 0;
                            b5_countSC <= 0;
                            b5_2_validOut <= '1';
                            if b5_countSYM = numOFDMSyms_int - 1 then
--                                if b5_PendingTrigger = '1' then
--                                    b5_readPendingTrigger <= '1';
--                                else
                                    b5_state <= b5_st_idle;
--                                end if;
                            else
                                b5_countSYM <= b5_countSYM + 1;
                            end if;
                            if b5_countSYM = 0 then
                                b5_enableRd <= '1';
                            end if;
                        elsif b5_countSC < numDataSC_div4_int then
                            b5_1_validOut <= '1';
                            b5_countSC <= b5_countSC + 1;
                        else
                            b5_2_validOut <= '1';
                            b5_countSC <= b5_countSC + 1;
                        end if;
                    end if;
            
                when others =>
                    b5_state <= b5_st_idle;
            end case;
        end if;
    end if;
end process;


b4_1: FIFO_preFFT 
PORT MAP (
    clk => clk,
    srst => b5_rst,
    din => b5_dataIn,
    wr_en => b5_1_validOut,
    rd_en => b6_1_rdData,  
    dout => b4_1_dataOut,
    full => b4_1_full,
    empty => b4_1_empty,
    data_count => b4_1_dataCount,
    prog_full => b4_1_prog_full,
    prog_empty => b4_1_prog_empty,
    prog_empty_thresh_assert => b4_prog_empty_thresh_assert,
    prog_empty_thresh_negate => b4_prog_empty_thresh_negate,
    wr_rst_busy => open,
    rd_rst_busy =>open
);

b4_2: FIFO_preFFT 
PORT MAP (
    clk => clk,
    srst => b5_rst,
    din => b5_dataIn,
    wr_en => b5_2_validOut,
    rd_en => b6_2_rdData,  
    dout => b4_2_dataOut,
    full => b4_2_full,
    empty => b4_2_empty,
    data_count => b4_2_dataCount,
    prog_full => b4_2_prog_full,
    prog_empty => b4_2_prog_empty,
    prog_empty_thresh_assert => b4_prog_empty_thresh_assert,
    prog_empty_thresh_negate => b4_prog_empty_thresh_negate,
    wr_rst_busy => open,
    rd_rst_busy =>open
);

readyIn <= not b4_1_prog_full;
b4_1_prog_empty_s <= b4_1_prog_empty;-- when sendPacketIn = '1' else b4_1_empty;
b4_2_prog_empty_s <= b4_2_prog_empty;-- when sendPacketIn = '1' else b4_2_empty;
b4_prog_empty_thresh_assert <= std_logic_vector(to_unsigned(256,b4_prog_empty_thresh_assert'length));
--b4_prog_empty_thresh_negate <= std_logic_vector(to_unsigned(3000,b4_prog_empty_thresh_assert'length)) when sendPacketIn = '1' 
--                                else std_logic_vector(to_unsigned(b6_prog_empty_thresh_negate_s,b4_prog_empty_thresh_assert'length));
b4_prog_empty_thresh_negate <= std_logic_vector(to_unsigned(b6_prog_empty_thresh_negate_s,b4_prog_empty_thresh_assert'length));

--b6: state machine to read data from buffers: introduce null sub-carriers and apply fftshift
process(clk)
begin
    if rising_edge(clk) then
        b6_1_rdData <= '0';
        b6_2_rdData <= '0';
        b6_readPendingTrigger <= '0';
        if rstn = '0' then
            b6_prog_empty_thresh_negate_s <= 3000;
            b6_prog_empty_thresh_negate <= 3000;
            b6_state <= b6_st_idle;
            b6_countSC <= 0;
            b6_countSYM <= 0;
            b6_validOut <= '0';
            b6_pendingTrigger <= '0';
        else
            if b5_enableRd = '1' then
                b6_pendingTrigger <= '1';
            elsif b6_readPendingTrigger = '1' then
                b6_pendingTrigger <= '0';
            end if;
            case b6_state is
                when b6_st_idle =>
                    b6_validOut <= '0';
                    b6_countSC <= 0;
                    b6_countSYM <= 0;
                    if  b6_pendingTrigger = '1' and b2_2_prog_full = '0' then
                        b6_readPendingTrigger <= '1';
                        if b4_1_prog_empty_s = '0' and b4_2_prog_empty_s = '0' then
                            b6_state <= b6_st_rdData;
                            b6_countSYM <= b6_countSYM + 1;
                            b6_2_rdData <= '1';
                        else
                            b6_state <= b6_st_waitnotEmpty;
                        end if;                     
                    end if;
                when b6_st_rdData =>
                    b6_countSC <= b6_countSC + 1;
                    if b6_countSC < numDataSC_div4_int-1 then
                        b6_2_rdData <= '1';
                        b6_dataOut_re <= b4_2_dataOut(31 downto 0);
                        b6_dataOut_im <= b4_2_dataOut(63 downto 32);
                        b6_validOut <= '1';
                    elsif b6_countSC = numDataSC_div4_int-1 then
                        b6_2_rdData <= '0';
                        b6_dataOut_re <= b4_2_dataOut(31 downto 0);
                        b6_dataOut_im <= b4_2_dataOut(63 downto 32);
                        b6_validOut <= '1';
                    elsif b6_countSC < numDataSC_div4_int+numNullSC_div2_int-1 then
                        b6_dataOut_re <= (others => '0');
                        b6_dataOut_im <= (others => '0');
                        b6_validOut <= '1';
                    elsif b6_countSC = numDataSC_div4_int+numNullSC_div2_int-1 then
                        b6_1_rdData <= '1';
                        b6_dataOut_re <= (others => '0');
                        b6_dataOut_im <= (others => '0');
                        b6_validOut <= '1';
                    elsif b6_countSC < nFFTdiv2-1 then
                        b6_1_rdData <= '1';
                        b6_dataOut_re <= b4_1_dataOut(31 downto 0);
                        b6_dataOut_im <= b4_1_dataOut(63 downto 32);
                        b6_validOut <= '1';
                    else
                        b6_dataOut_re <= b4_1_dataOut(31 downto 0);
                        b6_dataOut_im <= b4_1_dataOut(63 downto 32);
                        b6_validOut <= '1';
                        b6_countSC <= 0;
                        if b6_countSYM = numOFDMSyms_int then
                            if b6_pendingTrigger = '1' and b2_2_prog_full = '0' then
                                b6_readPendingTrigger <= '1';
                                b6_countSYM <= 1;
                                b6_2_rdData <= '1';
                            else
                                b6_state <= b6_st_idle;
                            end if;
                        elsif b4_1_prog_empty_s = '1' or b4_2_prog_empty_s = '1' then
                            b6_state <= b6_st_waitnotEmpty;
                        elsif b2_2_prog_full = '0' then
                            b6_2_rdData <= '1';
                            b6_countSYM <= b6_countSYM + 1;
                        else
                            b6_state <= b6_st_waitReady;
                        end if;
                    end if;
                when b6_st_waitReady => 
                    b6_validOut <= '0';
                    if b2_2_prog_full = '0' then
                        b6_2_rdData <= '1';
                        b6_countSYM <= b6_countSYM + 1;
                        b6_state <= b6_st_rdData;
                    end if;
                when b6_st_waitnotEmpty => 
                    b6_prog_empty_thresh_negate <= numDataSC_div4_int*(numOFDMSyms_int-b6_countSYM);
                    if b6_prog_empty_thresh_negate < 3000 then
                        b6_prog_empty_thresh_negate_s <= b6_prog_empty_thresh_negate-64;
                    else
                        b6_prog_empty_thresh_negate_s <= 3000;
                    end if;
                    
                    b6_validOut <= '0';   
                    if b4_1_prog_empty_s = '0' and b4_2_prog_empty_s = '0' then
                        b6_state <= b6_st_rdData;
                        b6_countSYM <= b6_countSYM + 1;
                        b6_2_rdData <= '1';
                    end if;
                when others => 
                    b6_state <= b6_st_idle;
            end case;
        end if;
    end if;
end process;

--dataOut_re2 <= b6_dataOut_re; 
--dataOut_im2 <= b6_dataOut_im; 
--validOut2 <= b6_validOut;

-- b0: IFFT engine
-- Re and Im inputs and Outputs are inverted to implement iFFT instead of FFT
FFT_engine : FFT_HDL_Optimized_Streaming 
PORT MAP (  clk => clk,
            reset => rst, 
            DataIn_re => b6_dataOut_im, 
            DataIn_im => b6_dataOut_re,
            ValidIn => b6_validOut,
            DataOut_re => fftOut_im,
            DataOut_im => fftOut_re,
            ValidOut => fftOutValid,
            startOut => fftStartOut,
            endOut => fftEndOut
);

--dataOut_re2 <= fftOut_re(2*27-1-fftScale downto 1*27+11-fftScale) & fftOut_re(1*27-1-fftScale downto 0*27+11-fftScale); 
--dataOut_im2 <= fftOut_im(2*27-1-fftScale downto 1*27+11-fftScale) & fftOut_im(1*27-1-fftScale downto 0*27+11-fftScale); 
--validOut2 <= fftOutValid;

b0_dataOut_re <= fftOut_re(2*27-1-fftScale downto 1*27+11-fftScale) & fftOut_re(1*27-1-fftScale downto 0*27+11-fftScale); 
b0_dataOut_im <= fftOut_im(2*27-1-fftScale downto 1*27+11-fftScale) & fftOut_im(1*27-1-fftScale downto 0*27+11-fftScale); 
b0_validOut <= fftOutValid;

--b1: CP state machine
process(clk)
begin
    if rising_edge(clk) then
        b1_enableOutSM <= '0';
        b1_readPendingTrigger <= '0';
        if rstn = '0' then
            b1_state <= b1_st_idle;
            b1_countNFFTmCP <= 0;
            b1_countSyms <= 0;
            b1_CPwrEn <= '0';
            b1_rst <= '1';
            b1_PendingTrigger <= '0';
        else
            b1_rst <= '0';
            if b6_readPendingTrigger = '1' then            
                b1_pendingTrigger <= '1';
            elsif b1_readPendingTrigger = '1' then
                b1_pendingTrigger <= '0';
            end if;
                
            case(b1_state) is 
                when b1_st_idle =>
                    b1_CPwrEn <= '0';
                    b1_countNFFTmCP <= 0;
                    b1_countSyms <= 0;
                    b1_CP_length <= CP_length1; -- The first symbol in the slot uses a different CP length
                    if b1_pendingTrigger = '1' then
                        b1_state <= b1_st_wait;
                        b1_readPendingTrigger <= '1';
                    end if;
                when b1_st_wait =>
                    
                    -- Count OFDM symbols in the slot 
                    if fftStartOut = '1' then
                        b1_countSyms <= b1_countSyms + 1;
                    end if;

                    if fftEndOut = '1' and b1_countSyms = 1 then
                        b1_enableOutSM <= '1';
                    end if;
                    
                    if fftEndOut = '1' and b1_countSyms > 0 then
                        b1_CP_length <= CP_length2;
                        if b1_countSyms = numOFDMSyms_int then
                            if b1_PendingTrigger = '1' then
                                b1_readPendingTrigger <= '1';
                                b1_countSyms <= 0;
                                b1_CP_length <= CP_length1; -- The first symbol in the slot uses a different CP length
                            else
                                b1_state <= b1_st_idle;
                            end if;
                        end if;
                    end if;
                    
                    if fftEndOut = '1' then
                        b1_countNFFTmCP <= 0;
                        b1_CPwrEn <= '0';
                    elsif b0_validOut = '1' then
                        b1_countNFFTmCP <= b1_countNFFTmCP + 1;
                        if b1_countNFFTmCP = nFFTdiv2 - b1_CP_length - 1 then 
                            b1_CPwrEn <= '1';
                        end if;
                    end if;
                    
                when others =>
                    b1_state <= b1_st_idle;
            end case;
        end if;
    end if;
end process;

--b2: FIFO to store the CPs 
b2_1_dataIn <= b0_dataOut_im & b0_dataOut_re;
b2_1: FIFO_CP 
PORT MAP (
    clk => clk,
    srst => b1_rst,
    din => b2_1_dataIn,
    wr_en => b1_CPwrEn,
    rd_en => b3_CPrdEn,       
    dout => b2_1_dataOut,
    full => b2_1_full,
    empty => b2_1_empty,
    data_count => b2_1_dataCount,
    wr_rst_busy => open,
    rd_rst_busy =>open
);

b2_2: FIFO_postFFT 
PORT MAP (
    clk => clk,
    srst => b1_rst,
    din => b2_1_dataIn,
    wr_en => b0_validOut,
    rd_en => b3_FFTrdEn,  
    dout => b2_2_dataOut,
    full => b2_2_full,
    empty => b2_2_empty,
    data_count => b2_2_dataCount,
    prog_full => b2_2_prog_full,
    wr_rst_busy => open,
    rd_rst_busy =>open
);

--b3: postFFT state machine
process(clk)
begin
    if rising_edge(clk) then
        b3_readPendingTrigger <= '0';
        b3_last <= '0';
        if rstn = '0' then
            b3_state <= b3_st_idle;
            triggerOut <= '0';
            b3_countNFFT <= 0;
            b3_countCP <= 0;
            b3_countSyms <= 0;
            b3_CPrdEn <= '0';
            b3_FFTrdEn <= '0';
            b3_dataOut_re <= (others => '0');
            b3_dataOut_im <= (others => '0');
            b3_validOut <= '0';
            b3_pendingTrigger <= '0';
        else
            --b1_rst <= '0';
            triggerOut <= '0';
            if b1_enableOutSM = '1' then
                b3_pendingTrigger <= '1';
            elsif b3_readPendingTrigger = '1' then
                b3_pendingTrigger <= '0';
            end if;
            case(b3_state) is 
                when b3_st_idle =>
                    b3_dataOut_re <= (others => '0');
                    b3_dataOut_im <= (others => '0');
                    b3_validOut <= '0';
                    b3_CPrdEn <= '0';
                    b3_FFTrdEn <= '0';
                    b3_FFTrdEn <= '0';
                    b3_countNFFT <= 0;
                    b3_countCP <= 0;
                    b3_countSyms <= 0;
                    b3_CP_length <= CP_length1; -- The first symbol in the slot uses a different CP length

                    if b3_pendingTrigger = '1' and readyOut = '1' and b2_1_empty = '0' then --b1_enableOutSM = '1' then
                        b3_readPendingTrigger <= '1';
                        b3_state <= b3_st_countCP;
                        b3_dataOut_re <= (others => '0');
                        b3_dataOut_im <= (others => '0');
                        b3_validOut <= '0';
                        b3_CPrdEn <= '1';
                        b3_countCP <= b3_countCP+1;
                        b3_countSyms <= b3_countSyms + 1;
                    end if;
                when b3_st_countCP =>
                    if b3_countCP = 1 and b3_countSyms = 1 then -- triggerOut aligned with first sample of the first OFDM symbol in the slot
                        triggerOut <= '1';
                    end if;
                    if b3_countCP = b3_CP_length then 
                        b3_dataOut_re <= b2_1_dataOut(2*16-1 downto 0);
                        b3_dataOut_im <= b2_1_dataOut(4*16-1 downto 2*16);
                        b3_validOut <= '1';
                        b3_CPrdEn <= '0';
                        b3_FFTrdEn <= '1';
                        b3_countCP <= 0;
                        b3_countNFFT <= b3_countNFFT + 1;
                        b3_state <= b3_st_countNFFT;
                    else
                        b3_dataOut_re <= b2_1_dataOut(2*16-1 downto 0);
                        b3_dataOut_im <= b2_1_dataOut(4*16-1 downto 2*16);
                        b3_validOut <= '1';
                        b3_CPrdEn <= '1';
                        b3_FFTrdEn <= '0';
                        b3_countCP <= b3_countCP+1;                   
                    end if;
                when b3_st_countNFFT =>
                    if b3_countNFFT = nFFTdiv2 then 
                        b3_dataOut_re <= b2_2_dataOut(2*16-1 downto 0);
                        b3_dataOut_im <= b2_2_dataOut(4*16-1 downto 2*16);
                        b3_validOut <= '1';
                        b3_FFTrdEn <= '0';
                        b3_countNFFT <= 0;    
                        if b3_countSyms > 0 then
                            b3_CP_length <= CP_length2; 
                        end if;
                        if b3_countSyms = numOFDMSyms_int then
                            b3_CPrdEn <= '0';
                            b3_countCP <= 0;
                            b3_last <= '1';
                            if b3_pendingTrigger = '1' and readyOut = '1' and b2_1_empty = '0' then 
                                b3_readPendingTrigger <= '1';
                                b3_state <= b3_st_countCP;
                                b3_CPrdEn <= '1';
                                b3_countCP <= 1;
                                b3_countSyms <= 1;
                                b3_CP_length <= CP_length1; -- The first symbol in the slot uses a different CP length
                            else
                                b3_state <= b3_st_idle;
                            end if;
                        elsif readyOut = '1' and b2_1_empty = '0' then
                            b3_CPrdEn <= '1';
                            b3_countCP <= b3_countCP+1;     
                            b3_countSyms <= b3_countSyms + 1;
                            b3_state <= b3_st_countCP;
                        else
                            b3_state <= b3_st_waitReady;
                        end if; 
                    else
                        b3_dataOut_re <= b2_2_dataOut(2*16-1 downto 0);
                        b3_dataOut_im <= b2_2_dataOut(4*16-1 downto 2*16);
                        b3_validOut <= '1';
                        b3_CPrdEn <= '0';
                        b3_FFTrdEn <= '1';
                        b3_countCP <= 0;
                        b3_countNFFT <= b3_countNFFT + 1;
                    end if;
                when b3_st_waitReady =>
                     b3_validOut <= '0';
                     if readyOut = '1' and b2_1_empty = '0' then
                        b3_CPrdEn <= '1';
                        b3_countCP <= b3_countCP+1;     
                        b3_countSyms <= b3_countSyms + 1;
                        b3_state <= b3_st_countCP;
                    end if;
                when others =>
                    b3_state <= b3_st_idle;
            end case;
        end if;
    end if;
end process;

dataOut_re <= b3_dataOut_re; 
dataOut_im <= b3_dataOut_im; 
validOut <= b3_validOut;
lastOut <= b3_last;

end Behavioral;
