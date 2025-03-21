-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Tool Version Limit: 2019.12
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity txBuildGrid_BUS_A_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 7;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    dmrsSym1              :out  STD_LOGIC_VECTOR(15 downto 0);
    dmrsSym2              :out  STD_LOGIC_VECTOR(15 downto 0);
    ssbSym1               :out  STD_LOGIC_VECTOR(15 downto 0);
    ssbSym2               :out  STD_LOGIC_VECTOR(15 downto 0);
    numSC                 :out  STD_LOGIC_VECTOR(15 downto 0);
    numOFDM               :out  STD_LOGIC_VECTOR(15 downto 0);
    dmrsSpacing           :out  STD_LOGIC_VECTOR(15 downto 0);
    dmrsOffset            :out  STD_LOGIC_VECTOR(15 downto 0);
    ptrsOffset            :out  STD_LOGIC_VECTOR(15 downto 0);
    ssbFirstSC            :out  STD_LOGIC_VECTOR(15 downto 0);
    ssbLastSC             :out  STD_LOGIC_VECTOR(15 downto 0);
    configuredBlock       :out  STD_LOGIC_VECTOR(0 downto 0)
);
end entity txBuildGrid_BUS_A_s_axi;

-- ------------------------Address Info-------------------
-- 0x00 : reserved
-- 0x04 : reserved
-- 0x08 : reserved
-- 0x0c : reserved
-- 0x10 : Data signal of dmrsSym1
--        bit 15~0 - dmrsSym1[15:0] (Read/Write)
--        others   - reserved
-- 0x14 : reserved
-- 0x18 : Data signal of dmrsSym2
--        bit 15~0 - dmrsSym2[15:0] (Read/Write)
--        others   - reserved
-- 0x1c : reserved
-- 0x20 : Data signal of ssbSym1
--        bit 15~0 - ssbSym1[15:0] (Read/Write)
--        others   - reserved
-- 0x24 : reserved
-- 0x28 : Data signal of ssbSym2
--        bit 15~0 - ssbSym2[15:0] (Read/Write)
--        others   - reserved
-- 0x2c : reserved
-- 0x30 : Data signal of numSC
--        bit 15~0 - numSC[15:0] (Read/Write)
--        others   - reserved
-- 0x34 : reserved
-- 0x38 : Data signal of numOFDM
--        bit 15~0 - numOFDM[15:0] (Read/Write)
--        others   - reserved
-- 0x3c : reserved
-- 0x40 : Data signal of dmrsSpacing
--        bit 15~0 - dmrsSpacing[15:0] (Read/Write)
--        others   - reserved
-- 0x44 : reserved
-- 0x48 : Data signal of dmrsOffset
--        bit 15~0 - dmrsOffset[15:0] (Read/Write)
--        others   - reserved
-- 0x4c : reserved
-- 0x50 : Data signal of ptrsOffset
--        bit 15~0 - ptrsOffset[15:0] (Read/Write)
--        others   - reserved
-- 0x54 : reserved
-- 0x58 : Data signal of ssbFirstSC
--        bit 15~0 - ssbFirstSC[15:0] (Read/Write)
--        others   - reserved
-- 0x5c : reserved
-- 0x60 : Data signal of ssbLastSC
--        bit 15~0 - ssbLastSC[15:0] (Read/Write)
--        others   - reserved
-- 0x64 : reserved
-- 0x68 : Data signal of configuredBlock
--        bit 0  - configuredBlock[0] (Read/Write)
--        others - reserved
-- 0x6c : reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of txBuildGrid_BUS_A_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_DMRSSYM1_DATA_0        : INTEGER := 16#10#;
    constant ADDR_DMRSSYM1_CTRL          : INTEGER := 16#14#;
    constant ADDR_DMRSSYM2_DATA_0        : INTEGER := 16#18#;
    constant ADDR_DMRSSYM2_CTRL          : INTEGER := 16#1c#;
    constant ADDR_SSBSYM1_DATA_0         : INTEGER := 16#20#;
    constant ADDR_SSBSYM1_CTRL           : INTEGER := 16#24#;
    constant ADDR_SSBSYM2_DATA_0         : INTEGER := 16#28#;
    constant ADDR_SSBSYM2_CTRL           : INTEGER := 16#2c#;
    constant ADDR_NUMSC_DATA_0           : INTEGER := 16#30#;
    constant ADDR_NUMSC_CTRL             : INTEGER := 16#34#;
    constant ADDR_NUMOFDM_DATA_0         : INTEGER := 16#38#;
    constant ADDR_NUMOFDM_CTRL           : INTEGER := 16#3c#;
    constant ADDR_DMRSSPACING_DATA_0     : INTEGER := 16#40#;
    constant ADDR_DMRSSPACING_CTRL       : INTEGER := 16#44#;
    constant ADDR_DMRSOFFSET_DATA_0      : INTEGER := 16#48#;
    constant ADDR_DMRSOFFSET_CTRL        : INTEGER := 16#4c#;
    constant ADDR_PTRSOFFSET_DATA_0      : INTEGER := 16#50#;
    constant ADDR_PTRSOFFSET_CTRL        : INTEGER := 16#54#;
    constant ADDR_SSBFIRSTSC_DATA_0      : INTEGER := 16#58#;
    constant ADDR_SSBFIRSTSC_CTRL        : INTEGER := 16#5c#;
    constant ADDR_SSBLASTSC_DATA_0       : INTEGER := 16#60#;
    constant ADDR_SSBLASTSC_CTRL         : INTEGER := 16#64#;
    constant ADDR_CONFIGUREDBLOCK_DATA_0 : INTEGER := 16#68#;
    constant ADDR_CONFIGUREDBLOCK_CTRL   : INTEGER := 16#6c#;
    constant ADDR_BITS         : INTEGER := 7;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_dmrsSym1        : UNSIGNED(15 downto 0) := (others => '0');
    signal int_dmrsSym2        : UNSIGNED(15 downto 0) := (others => '0');
    signal int_ssbSym1         : UNSIGNED(15 downto 0) := (others => '0');
    signal int_ssbSym2         : UNSIGNED(15 downto 0) := (others => '0');
    signal int_numSC           : UNSIGNED(15 downto 0) := (others => '0');
    signal int_numOFDM         : UNSIGNED(15 downto 0) := (others => '0');
    signal int_dmrsSpacing     : UNSIGNED(15 downto 0) := (others => '0');
    signal int_dmrsOffset      : UNSIGNED(15 downto 0) := (others => '0');
    signal int_ptrsOffset      : UNSIGNED(15 downto 0) := (others => '0');
    signal int_ssbFirstSC      : UNSIGNED(15 downto 0) := (others => '0');
    signal int_ssbLastSC       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_configuredBlock : UNSIGNED(0 downto 0) := (others => '0');


begin
-- ----------------------- Instantiation------------------


-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 0));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    rdata_data <= (others => '0');
                    case (TO_INTEGER(raddr)) is
                    when ADDR_DMRSSYM1_DATA_0 =>
                        rdata_data <= RESIZE(int_dmrsSym1(15 downto 0), 32);
                    when ADDR_DMRSSYM2_DATA_0 =>
                        rdata_data <= RESIZE(int_dmrsSym2(15 downto 0), 32);
                    when ADDR_SSBSYM1_DATA_0 =>
                        rdata_data <= RESIZE(int_ssbSym1(15 downto 0), 32);
                    when ADDR_SSBSYM2_DATA_0 =>
                        rdata_data <= RESIZE(int_ssbSym2(15 downto 0), 32);
                    when ADDR_NUMSC_DATA_0 =>
                        rdata_data <= RESIZE(int_numSC(15 downto 0), 32);
                    when ADDR_NUMOFDM_DATA_0 =>
                        rdata_data <= RESIZE(int_numOFDM(15 downto 0), 32);
                    when ADDR_DMRSSPACING_DATA_0 =>
                        rdata_data <= RESIZE(int_dmrsSpacing(15 downto 0), 32);
                    when ADDR_DMRSOFFSET_DATA_0 =>
                        rdata_data <= RESIZE(int_dmrsOffset(15 downto 0), 32);
                    when ADDR_PTRSOFFSET_DATA_0 =>
                        rdata_data <= RESIZE(int_ptrsOffset(15 downto 0), 32);
                    when ADDR_SSBFIRSTSC_DATA_0 =>
                        rdata_data <= RESIZE(int_ssbFirstSC(15 downto 0), 32);
                    when ADDR_SSBLASTSC_DATA_0 =>
                        rdata_data <= RESIZE(int_ssbLastSC(15 downto 0), 32);
                    when ADDR_CONFIGUREDBLOCK_DATA_0 =>
                        rdata_data <= RESIZE(int_configuredBlock(0 downto 0), 32);
                    when others =>
                        NULL;
                    end case;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    dmrsSym1             <= STD_LOGIC_VECTOR(int_dmrsSym1);
    dmrsSym2             <= STD_LOGIC_VECTOR(int_dmrsSym2);
    ssbSym1              <= STD_LOGIC_VECTOR(int_ssbSym1);
    ssbSym2              <= STD_LOGIC_VECTOR(int_ssbSym2);
    numSC                <= STD_LOGIC_VECTOR(int_numSC);
    numOFDM              <= STD_LOGIC_VECTOR(int_numOFDM);
    dmrsSpacing          <= STD_LOGIC_VECTOR(int_dmrsSpacing);
    dmrsOffset           <= STD_LOGIC_VECTOR(int_dmrsOffset);
    ptrsOffset           <= STD_LOGIC_VECTOR(int_ptrsOffset);
    ssbFirstSC           <= STD_LOGIC_VECTOR(int_ssbFirstSC);
    ssbLastSC            <= STD_LOGIC_VECTOR(int_ssbLastSC);
    configuredBlock      <= STD_LOGIC_VECTOR(int_configuredBlock);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_DMRSSYM1_DATA_0) then
                    int_dmrsSym1(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_dmrsSym1(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_DMRSSYM2_DATA_0) then
                    int_dmrsSym2(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_dmrsSym2(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_SSBSYM1_DATA_0) then
                    int_ssbSym1(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_ssbSym1(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_SSBSYM2_DATA_0) then
                    int_ssbSym2(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_ssbSym2(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_NUMSC_DATA_0) then
                    int_numSC(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_numSC(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_NUMOFDM_DATA_0) then
                    int_numOFDM(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_numOFDM(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_DMRSSPACING_DATA_0) then
                    int_dmrsSpacing(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_dmrsSpacing(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_DMRSOFFSET_DATA_0) then
                    int_dmrsOffset(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_dmrsOffset(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_PTRSOFFSET_DATA_0) then
                    int_ptrsOffset(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_ptrsOffset(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_SSBFIRSTSC_DATA_0) then
                    int_ssbFirstSC(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_ssbFirstSC(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_SSBLASTSC_DATA_0) then
                    int_ssbLastSC(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_ssbLastSC(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_CONFIGUREDBLOCK_DATA_0) then
                    int_configuredBlock(0 downto 0) <= (UNSIGNED(WDATA(0 downto 0)) and wmask(0 downto 0)) or ((not wmask(0 downto 0)) and int_configuredBlock(0 downto 0));
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------

end architecture behave;
