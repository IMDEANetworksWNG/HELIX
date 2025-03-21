----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2022 11:11:07 AM
-- Design Name: 
-- Module Name: CE_nVar - Behavioral
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

entity CE_nVar is
Port (  clk : in std_logic;
        rstn : in std_logic;
        --
        b2_FiltInterpIn_re : in std_logic_vector(2*16-1 downto 0); 
        b2_FiltInterpIn_im : in std_logic_vector(2*16-1 downto 0); 
        b1_validOut : in std_logic;
        b6_dataIn_re : in std_logic_vector(2*16-1 downto 0); 
        b6_dataIn_im : in std_logic_vector(2*16-1 downto 0); 
        b5_validOut : in std_logic;
        triggerIn : in std_logic;
        CE_end : in std_logic;
        --
        Num_DMRS_inv : in std_logic_vector(15 downto 0); -- Inv of Number of DM_RS symbols s[16 15]
        scaling_nVar : in std_logic_vector(15 downto 0); -- s * (1/(numDMRS-1)) s[16 15]
        offsetIn : in std_logic_vector(3 downto 0);
        SCspacingIn : in std_logic_vector(4 downto 0);
        --
        nVarOut : out std_logic_vector(31 downto 0);
        nVarValidOut : out std_logic
);
end CE_nVar;

architecture Behavioral of CE_nVar is

component ComplexMult2 is
generic(AWIDTH : integer := 16;
        BWIDTH : integer := 16
);
port(   clk    : in  std_logic;
        ar, ai : in  std_logic_vector(AWIDTH - 1 downto 0);
        br, bi : in  std_logic_vector(BWIDTH - 1 downto 0);
        validIn : in std_logic;
        pr, pi : out std_logic_vector(AWIDTH + BWIDTH downto 0);
        validOut : out std_logic
);
end component;

component ila_0_nVar IS
PORT (
    clk : IN STD_LOGIC;
    probe0 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe3 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe4 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe5 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe6 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe7 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    probe8 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe9 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    probe10 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    probe11 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END component;

signal b6_SCcount : integer range 0 to 31;
signal b6_enable, b6_validOut : std_logic := '0';
signal b6_offset_count : integer range 0 to 31;
signal b6_dataIn_re_r, b6_dataIn_re_r2, b6_dataIn_re_r3 : std_logic_vector(31 downto 0);
signal b6_dataIn_im_r, b6_dataIn_im_r2, b6_dataIn_im_r3 : std_logic_vector(31 downto 0);
signal b6_CE_end_r, b6_CE_end_r2, b6_CE_end_r3 : std_logic;

signal b7_fifoDataIn, b7_fifoDataOut : std_logic_vector(63 downto 0);
signal b7_LSin_re1, b7_LSin_re2 : std_logic_vector(15 downto 0);
signal b7_LSin_im1, b7_LSin_im2 : std_logic_vector(15 downto 0);
signal b7_HestLSIn_re1, b7_HestLSIn_re2 : std_logic_vector(15 downto 0);
signal b7_HestLSIn_im1, b7_HestLSIn_im2 : std_logic_vector(15 downto 0);
signal b7_diff_LS_re1, b7_diff_LS_re2 : signed(15 downto 0);
signal b7_diff_LS_im1, b7_diff_LS_im2 : signed(15 downto 0);
signal b7_validOut : std_logic;
signal b7_CE_end : std_logic;

type b8_st_type is (ST_idle, ST_first, ST_acc);
signal b8_state : b8_st_type;
signal b8_FirstEna, b8_AccEna, b8_AccRst : std_logic;
signal b8_First_re1, b8_First_re2, b8_First_im1, b8_First_im2 : signed(15 downto 0);
signal b8_Sub_re1, b8_Sub_re2, b8_Sub_im1, b8_Sub_im2 : signed(15 downto 0);
signal b8_Abs2Sub_re1, b8_Abs2Sub_re2, b8_Abs2Sub_im1, b8_Abs2Sub_im2 : signed(31 downto 0);
signal b8_Abs2Sub1, b8_Abs2Sub2 : signed(31 downto 0);
signal b8_validOut, b8_validOut2, b8_validOut3, b8_validOut4, b8_validOut5, b8_validOut6 : std_logic;
signal b8_validOut7, b8_validOut8 : std_logic;
signal b8_Ex_re1, b8_Ex_re2, b8_Ex_im1, b8_Ex_im2 : signed(15 downto 0);
signal b8_Ex2_1, b8_Ex2_2 : signed(31 downto 0);
signal b8_Ex_re, b8_Ex_im : signed(15 downto 0);
signal b8_Ex2, b8_Ex2_r : signed(31 downto 0);
signal b8_Ex_abs2_1, b8_Ex_abs2_2, b8_Ex_abs2 : signed(31 downto 0);
signal b8_Ex_abs2_div_NumDMRS : signed(32+Num_DMRS_inv'length-1 downto 0);
signal b8_Ex_abs2_div_NumDMRS_red : signed(31 downto 0);
signal b8_nVar_pre : signed(31 downto 0);
signal b8_nVar : signed(32+scaling_nVar'length-1 downto 0);
signal b8_nVar_red : signed(31 downto 0);
signal b8_CE_end, b8_CE_end2, b8_CE_end3, b8_CE_end4, b8_CE_end5, b8_CE_end6, b8_CE_end7, b8_CE_end8 : std_logic;
signal b8_nVarOut : std_logic_vector(31 downto 0);
signal b8_nVarOutValid : std_logic;

component CE_FIFO_LS IS
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(63 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    wr_rst_busy : OUT STD_LOGIC;
    rd_rst_busy : OUT STD_LOGIC
  );
END component;

begin

--ila_0_nVar1: ila_0_nVar
--PORT MAP (  clk => clk,
--            probe0 => b2_FiltInterpIn_re,
--            probe1 => b2_FiltInterpIn_im,
--            probe2(0) => b1_validOut,
--            probe3 => b6_dataIn_re,
--            probe4 => b6_dataIn_im,
--            probe5(0) => b5_validOut,
--            probe6(0) => triggerIn,
--            probe7(0) => CE_end,
--            probe8 => Num_DMRS_inv,
--            probe9 => scaling_nVar,
--            probe10 => b8_nVarOut,
--            probe11(0) => b8_nVarOutValid
--);

--b6: Count subcarriers for nVar computation
process(clk)
begin
    if rising_edge(clk) then
        b6_CE_end_r <= CE_end;
        b6_CE_end_r2 <= b6_CE_end_r;
        b6_CE_end_r3 <= b6_CE_end_r2;
        b6_dataIn_re_r <= b6_dataIn_re;
        b6_dataIn_re_r2 <= b6_dataIn_re_r;
        b6_dataIn_re_r3 <= b6_dataIn_re_r2;
        b6_dataIn_im_r <= b6_dataIn_im;
        b6_dataIn_im_r2 <= b6_dataIn_im_r;
        b6_dataIn_im_r3 <= b6_dataIn_im_r2;
        if rstn = '0' or triggerIn = '1' then
            b6_SCcount <= to_integer(unsigned(SCspacingIn));
            b6_enable <= '0';
            b6_offset_count <= 0;
        else
            b6_validOut <= '0';
            if b5_validOut = '1' then
                if b6_offset_count = to_integer(unsigned(offsetIn)) then -- offset from the start of the ODFM symbol
                    b6_enable <= '1';
                else
                    b6_offset_count <= b6_offset_count + 1;
                end if;
            end if;
            
            if b6_enable = '1' and b5_validOut = '1' then
                if b6_SCcount = to_integer(unsigned(SCspacingIn)) then
                    b6_SCcount <= 0;
                    b6_validOut <= '1';
                else
                    b6_SCcount <=  b6_SCcount + 1;
                end if;
            end if;
        end if;
    end if;
end process;

--b7: Fifo to hold LS CE sub-carriers

b7_fifoDataIn <= b2_FiltInterpIn_im & b2_FiltInterpIn_re;

b7_FIFO: CE_FIFO_LS 
PORT MAP (
    clk => clk,
    srst => triggerIn,
    din => b7_fifoDataIn,
    wr_en => b1_validOut,
    rd_en => b6_validOut,
    dout => b7_fifoDataOut,
    full => open,
    empty => open,
    wr_rst_busy => open,
    rd_rst_busy => open
);

b7_LSin_im2 <= b7_fifoDataOut(63 downto 63-15);
b7_LSin_im1 <= b7_fifoDataOut(63-16 downto 63-15-16);
b7_LSin_re2 <= b7_fifoDataOut(63-16*2 downto 63-15-16*2);
b7_LSin_re1 <= b7_fifoDataOut(63-16*3 downto 63-15-16*3);
b7_HestLSIn_re1 <= b6_dataIn_re_r2(15 downto 0);
b7_HestLSIn_re2 <= b6_dataIn_re_r2(31 downto 16);
b7_HestLSIn_im1 <= b6_dataIn_im_r2(15 downto 0);
b7_HestLSIn_im2 <= b6_dataIn_im_r2(31 downto 16);


--b7: H_est-LS_est
process(clk)    
begin
    if rising_edge(clk) then
        b7_diff_LS_re1 <= signed(b7_HestLSIn_re1) - signed(b7_LSin_re1);
        b7_diff_LS_re2 <= signed(b7_HestLSIn_re2) - signed(b7_LSin_re2);
        b7_diff_LS_im1 <= signed(b7_HestLSIn_im1) - signed(b7_LSin_im1);
        b7_diff_LS_im2 <= signed(b7_HestLSIn_im2) - signed(b7_LSin_im2);
        b7_validOut <= b6_validOut;
        b7_CE_end <= b6_CE_end_r3;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if rstn = '0' then
            b8_state <= ST_idle;
            b8_AccEna <= '0';
            b8_AccRst <= '0';
            b8_FirstEna <= '0';
        else
            case b8_state is
                when ST_idle => 
                    b8_AccEna <= '0';
                    b8_FirstEna <= '0';
                    if triggerIn = '1' then
                        b8_AccRst <= '1';
                        b8_state <= ST_first;
                    end if;
                when ST_first => 
                    b8_AccEna <= '0';
                    b8_AccRst <= '0';
                    b8_FirstEna <= '1';
                    if b7_validOut = '1' then
                        b8_FirstEna <= '0';
                        b8_state <= ST_acc;
                        b8_AccEna <= '1';
                    end if;
                when ST_acc => 
                    b8_AccEna <= '1';
                    b8_AccRst <= '0';
                    b8_FirstEna <= '0';
                    if b8_nVarOutValid = '1' then
                        b8_state <= ST_idle;
                    end if;
                when others => 
                    b8_state <= ST_idle;
                    b8_AccEna <= '0';
                    b8_AccRst <= '0';
                    b8_FirstEna <= '0';
            end case;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        
        b8_Sub_re1 <= b7_diff_LS_re1 - b8_First_re1;
        b8_Sub_re2 <= b7_diff_LS_re2 - b8_First_re2;
        b8_Sub_im1 <= b7_diff_LS_im1 - b8_First_im1;
        b8_Sub_im2 <= b7_diff_LS_im2 - b8_First_im2;
        b8_validOut <= b7_validOut;
        b8_CE_end <= b7_CE_end;

        b8_Abs2Sub_re1 <= b8_Sub_re1 * b8_Sub_re1;
        b8_Abs2Sub_im1 <= b8_Sub_im1 * b8_Sub_im1;
        b8_Abs2Sub_re2 <= b8_Sub_re2 * b8_Sub_re2;
        b8_Abs2Sub_im2 <= b8_Sub_im2 * b8_Sub_im2;
        b8_validOut2 <= b8_validOut;
        b8_CE_end2 <= b8_CE_end;

        b8_Abs2Sub1 <= b8_Abs2Sub_re1 + b8_Abs2Sub_im1;
        b8_Abs2Sub2 <= b8_Abs2Sub_re2 + b8_Abs2Sub_im2;
        b8_validOut3 <= b8_validOut2;
        b8_CE_end3 <= b8_CE_end2;

        b8_validOut4 <= b8_validOut3;
        b8_CE_end4 <= b8_CE_end3;

        if b8_FirstEna = '1' then
            b8_First_re1 <= b7_diff_LS_re1;
            b8_First_re2 <= b7_diff_LS_re2;
            b8_First_im1 <= b7_diff_LS_im1;
            b8_First_im2 <= b7_diff_LS_im2;
        end if;
    
        if b8_AccRst = '1' then
            b8_Ex_re1 <= (others => '0');
            b8_Ex_re2 <= (others => '0');
            b8_Ex_im1 <= (others => '0');
            b8_Ex_im2 <= (others => '0');
        elsif b8_AccEna = '1' and b8_validOut = '1' then 
            b8_Ex_re1 <= b8_Ex_re1 + b8_Sub_re1;
            b8_Ex_re2 <= b8_Ex_re2 + b8_Sub_re2;
            b8_Ex_im1 <= b8_Ex_im1 + b8_Sub_im1;
            b8_Ex_im2 <= b8_Ex_im2 + b8_Sub_im2;
        end if;        

        if b8_AccRst = '1' then
            b8_Ex2_1 <= (others => '0');
            b8_Ex2_2 <= (others => '0');
        elsif b8_AccEna = '1' and b8_validOut3 = '1' then 
            b8_Ex2_1 <= b8_Ex2_1 + b8_Abs2Sub1;
            b8_Ex2_2 <= b8_Ex2_2 + b8_Abs2Sub2;
        end if;        
        
        b8_Ex_re <= b8_Ex_re1 + b8_Ex_re2; -- b8_validOut3
        b8_Ex_im <= b8_Ex_im1 + b8_Ex_im2;
        
        b8_Ex_abs2_1 <= b8_Ex_re * b8_Ex_re; -- b8_validOut4
        b8_Ex_abs2_2 <= b8_Ex_im * b8_Ex_im;
        b8_Ex_abs2 <= b8_Ex_abs2_1 + b8_Ex_abs2_2; -- b8_validOut5
        
        b8_Ex2 <= b8_Ex2_1 + b8_Ex2_2; -- b8_validOut5
        b8_validOut5 <= b8_validOut4;
        b8_CE_end5 <= b8_CE_end4;
        
        b8_Ex_abs2_div_NumDMRS <= b8_Ex_abs2 * signed(Num_DMRS_inv); -- s[32 20]*s[16 15] = s[48 35]
        b8_Ex2_r <= b8_Ex2; -- b8_validOut6
        b8_validOut6 <= b8_validOut5;
        b8_CE_end6 <= b8_CE_end5;
        
        b8_nVar_pre <= b8_Ex2_r - b8_Ex_abs2_div_NumDMRS_red;
        b8_validOut7 <= b8_validOut6;
        b8_CE_end7 <= b8_CE_end6;
        
        b8_nVar <= signed(scaling_nVar) * b8_nVar_pre; -- s[32 20]*s[16 15] = s[48 35]
        b8_validOut8 <= b8_validOut7;
        b8_CE_end8 <= b8_CE_end7;
        
    end if;
end process;

b8_Ex_abs2_div_NumDMRS_red <= b8_Ex_abs2_div_NumDMRS(b8_Ex_abs2_div_NumDMRS'length-2 downto b8_Ex_abs2_div_NumDMRS'length-32-1);
b8_nVar_red <= b8_nVar(b8_nVar'length-12-1 downto b8_nVar'length-12-32); -- s[32 31]

b8_nVarOut <= std_logic_vector(b8_nVar_red);
nVarOut <= b8_nVarOut;

b8_nVarOutValid <= b8_CE_end8;
nVarValidOut <= b8_nVarOutValid;

end Behavioral;
