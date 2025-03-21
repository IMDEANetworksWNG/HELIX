
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity AXI_MUX_top is
    generic (
        AXI_DATA_WIDTH : integer := 64
    );
    port (
        --! AXI clk
        aclk   : in std_logic;
        --! Synchronous reset. Active low
        aresetn : in std_logic;
        --! Mux Sel input
        MuxSel : in std_logic_vector(2 downto 0);
        --! @virtualbus AXIS_Mux0 Input for MUX_SEL = 0
        s00_axis_tready : out std_logic; 
        s00_axis_tdata : in std_logic_vector(AXI_DATA_WIDTH - 1 downto 0); 
        s00_axis_tkeep : in std_logic_vector(AXI_DATA_WIDTH/8 - 1 downto 0); 
        s00_axis_tlast : in std_logic; 
        s00_axis_tvalid : in std_logic; --! @end         
        --! @virtualbus AXIS_Mux1 Input for MUX_SEL = 1
        --!
        s01_axis_tready : out std_logic; 
        s01_axis_tdata : in std_logic_vector(AXI_DATA_WIDTH - 1 downto 0); 
        s01_axis_tkeep : in std_logic_vector(AXI_DATA_WIDTH/8 - 1 downto 0); 
        s01_axis_tlast : in std_logic; 
        s01_axis_tvalid : in std_logic;

        --! @virtualbus AXIS_Mux2 Input for MUX_SEL = 2
        --!
        s02_axis_tready : out std_logic; 
        s02_axis_tdata : in std_logic_vector(AXI_DATA_WIDTH - 1 downto 0); 
        s02_axis_tkeep : in std_logic_vector(AXI_DATA_WIDTH/8 - 1 downto 0); 
        s02_axis_tlast : in std_logic; 
        s02_axis_tvalid : in std_logic;

        --! @virtualbus AXIS_Mux3 Input for MUX_SEL = 3
        --!
        s03_axis_tready : out std_logic; 
        s03_axis_tdata : in std_logic_vector(AXI_DATA_WIDTH - 1 downto 0); 
        s03_axis_tkeep : in std_logic_vector(AXI_DATA_WIDTH/8 - 1 downto 0); 
        s03_axis_tlast : in std_logic; 
        s03_axis_tvalid : in std_logic;

        --! @virtualbus AXIS_Mux3 Input for MUX_SEL = 4
        --!
        s04_axis_tready : out std_logic; 
        s04_axis_tdata : in std_logic_vector(AXI_DATA_WIDTH - 1 downto 0); 
        s04_axis_tkeep : in std_logic_vector(AXI_DATA_WIDTH/8 - 1 downto 0); 
        s04_axis_tlast : in std_logic; 
        s04_axis_tvalid : in std_logic;

        --! @virtualbus AXIS_Mux3 Input for MUX_SEL = 5
        --!
        s05_axis_tready : out std_logic; 
        s05_axis_tdata : in std_logic_vector(AXI_DATA_WIDTH - 1 downto 0); 
        s05_axis_tkeep : in std_logic_vector(AXI_DATA_WIDTH/8 - 1 downto 0); 
        s05_axis_tlast : in std_logic; 
        s05_axis_tvalid : in std_logic;

        --! @virtualbus AXIS_Mux3 Input for MUX_SEL = 6
        --!
        s06_axis_tready : out std_logic; 
        s06_axis_tdata : in std_logic_vector(AXI_DATA_WIDTH - 1 downto 0); 
        s06_axis_tkeep : in std_logic_vector(AXI_DATA_WIDTH/8 - 1 downto 0); 
        s06_axis_tlast : in std_logic; 
        s06_axis_tvalid : in std_logic;

        --! @virtualbus AXIS_Out @dir out Mux Output
        --!
        m00_axis_tvalid : out std_logic;
        m00_axis_tdata : out std_logic_vector(AXI_DATA_WIDTH - 1 downto 0);
        m00_axis_tkeep : out std_logic_vector(AXI_DATA_WIDTH/8 - 1 downto 0);
        m00_axis_tlast : out std_logic;
        m00_axis_tready : in std_logic --! @end 
    );
end entity;

architecture rtl of AXI_MUX_top is

begin

process (aclk)
begin
    if rising_edge(aclk) then
        if aresetn = '0' then
            m00_axis_tvalid <= '0';
            s00_axis_tready <= '0';
            m00_axis_tkeep <= (others => '1');
            m00_axis_tlast <= '0';
            m00_axis_tdata <= (others => '0');
        else
            s00_axis_tready <= '1';
            s01_axis_tready <= '1';
            s02_axis_tready <= '1';
            s03_axis_tready <= '1';
            s04_axis_tready <= '1';
            s05_axis_tready <= '1';
            s06_axis_tready <= '1';
            
            case MuxSel is 
                when "000" =>   m00_axis_tdata <= s00_axis_tdata;
                                m00_axis_tvalid <= s00_axis_tvalid;
                                m00_axis_tkeep <= s00_axis_tkeep;
                                m00_axis_tlast <= s00_axis_tlast;
                                
                when "001" =>   m00_axis_tdata <= s01_axis_tdata;
                                m00_axis_tvalid <= s01_axis_tvalid;
                                m00_axis_tkeep <= s01_axis_tkeep;
                                m00_axis_tlast <= s01_axis_tlast;
                                
                when "010" =>   m00_axis_tdata <= s02_axis_tdata;
                                m00_axis_tvalid <= s02_axis_tvalid;
                                m00_axis_tkeep <= s02_axis_tkeep;
                                m00_axis_tlast <= s02_axis_tlast;
                                
                when "011" =>   m00_axis_tdata <= s03_axis_tdata;
                                m00_axis_tvalid <= s03_axis_tvalid;
                                m00_axis_tkeep <= s03_axis_tkeep;
                                m00_axis_tlast <= s03_axis_tlast;
                                
                when "100" =>   m00_axis_tdata <= s04_axis_tdata;
                                m00_axis_tvalid <= s04_axis_tvalid;
                                m00_axis_tkeep <= s04_axis_tkeep;
                                m00_axis_tlast <= s04_axis_tlast;
                                
                when "101" =>   m00_axis_tdata <= s05_axis_tdata;
                                m00_axis_tvalid <= s05_axis_tvalid;
                                m00_axis_tkeep <= s05_axis_tkeep;
                                m00_axis_tlast <= s05_axis_tlast;

                when "110" =>   m00_axis_tdata <= s06_axis_tdata;
                                m00_axis_tvalid <= s06_axis_tvalid;
                                m00_axis_tkeep <= s06_axis_tkeep;
                                m00_axis_tlast <= s06_axis_tlast;
                                
                when others =>  m00_axis_tdata <= s00_axis_tdata;
                                m00_axis_tvalid <= s00_axis_tvalid;
                                m00_axis_tkeep <= s00_axis_tkeep;
                                m00_axis_tlast <= s00_axis_tlast;
            end case;
        end if;
    end if;
end process;

end architecture;