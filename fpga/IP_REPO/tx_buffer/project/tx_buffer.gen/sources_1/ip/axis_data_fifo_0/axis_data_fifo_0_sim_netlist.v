// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2_AR000035739_AR000034905 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Mar  6 11:52:00 2025
// Host        : srv-wng-avocado running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/./Vivado/ZCU208/ip_creation/tx_buffer/project/tx_buffer.gen/sources_1/ip/axis_data_fifo_0/axis_data_fifo_0_sim_netlist.v
// Design      : axis_data_fifo_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu48dr-fsvg1517-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "axis_data_fifo_0,axis_data_fifo_v2_0_9_top,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axis_data_fifo_v2_0_9_top,Vivado 2022.2_AR000035739_AR000034905" *) 
(* NotValidForBitStream *)
module axis_data_fifo_0
   (s_axis_aresetn,
    s_axis_aclk,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tlast,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tlast,
    prog_empty);
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_RSTIF RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_RSTIF, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_CLKIF CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_CLKIF, ASSOCIATED_BUSIF S_AXIS, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input s_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) input [63:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) output [63:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.0, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_tlast;
  output prog_empty;

  wire [63:0]m_axis_tdata;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire prog_empty;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire [63:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire NLW_inst_almost_empty_UNCONNECTED;
  wire NLW_inst_almost_full_UNCONNECTED;
  wire NLW_inst_dbiterr_UNCONNECTED;
  wire NLW_inst_prog_full_UNCONNECTED;
  wire NLW_inst_sbiterr_UNCONNECTED;
  wire [31:0]NLW_inst_axis_rd_data_count_UNCONNECTED;
  wire [31:0]NLW_inst_axis_wr_data_count_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tid_UNCONNECTED;
  wire [7:0]NLW_inst_m_axis_tkeep_UNCONNECTED;
  wire [7:0]NLW_inst_m_axis_tstrb_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tuser_UNCONNECTED;

  (* C_ACLKEN_CONV_MODE = "0" *) 
  (* C_AXIS_SIGNAL_SET = "19" *) 
  (* C_AXIS_TDATA_WIDTH = "64" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "1" *) 
  (* C_ECC_MODE = "0" *) 
  (* C_FAMILY = "zynquplus" *) 
  (* C_FIFO_DEPTH = "16384" *) 
  (* C_FIFO_MEMORY_TYPE = "auto" *) 
  (* C_FIFO_MODE = "1" *) 
  (* C_IS_ACLK_ASYNC = "0" *) 
  (* C_PROG_EMPTY_THRESH = "1400" *) 
  (* C_PROG_FULL_THRESH = "11" *) 
  (* C_SYNCHRONIZER_STAGE = "3" *) 
  (* C_USE_ADV_FEATURES = "825372720" *) 
  (* G_INDX_SS_TDATA = "1" *) 
  (* G_INDX_SS_TDEST = "6" *) 
  (* G_INDX_SS_TID = "5" *) 
  (* G_INDX_SS_TKEEP = "3" *) 
  (* G_INDX_SS_TLAST = "4" *) 
  (* G_INDX_SS_TREADY = "0" *) 
  (* G_INDX_SS_TSTRB = "2" *) 
  (* G_INDX_SS_TUSER = "7" *) 
  (* G_MASK_SS_TDATA = "2" *) 
  (* G_MASK_SS_TDEST = "64" *) 
  (* G_MASK_SS_TID = "32" *) 
  (* G_MASK_SS_TKEEP = "8" *) 
  (* G_MASK_SS_TLAST = "16" *) 
  (* G_MASK_SS_TREADY = "1" *) 
  (* G_MASK_SS_TSTRB = "4" *) 
  (* G_MASK_SS_TUSER = "128" *) 
  (* G_TASK_SEVERITY_ERR = "2" *) 
  (* G_TASK_SEVERITY_INFO = "0" *) 
  (* G_TASK_SEVERITY_WARNING = "1" *) 
  (* LP_CDC_SYNC_STAGES = "3" *) 
  (* LP_CLOCKING_MODE = "common_clock" *) 
  (* LP_ECC_MODE = "no_ecc" *) 
  (* LP_FIFO_DEPTH = "16384" *) 
  (* LP_FIFO_MEMORY_TYPE = "auto" *) 
  (* LP_M_ACLKEN_CAN_TOGGLE = "0" *) 
  (* LP_PACKET_FIFO = "false" *) 
  (* LP_PROG_EMPTY_THRESH = "1400" *) 
  (* LP_PROG_FULL_THRESH = "11" *) 
  (* LP_RD_DATA_COUNT_WIDTH = "15" *) 
  (* LP_RELATED_CLOCKS = "0" *) 
  (* LP_S_ACLKEN_CAN_TOGGLE = "0" *) 
  (* LP_TDATA_WIDTH = "64" *) 
  (* LP_TDEST_WIDTH = "1" *) 
  (* LP_TID_WIDTH = "1" *) 
  (* LP_TUSER_WIDTH = "1" *) 
  (* LP_USE_ADV_FEATURES = "825372720" *) 
  (* LP_WR_DATA_COUNT_WIDTH = "15" *) 
  axis_data_fifo_0_axis_data_fifo_v2_0_9_top inst
       (.almost_empty(NLW_inst_almost_empty_UNCONNECTED),
        .almost_full(NLW_inst_almost_full_UNCONNECTED),
        .axis_rd_data_count(NLW_inst_axis_rd_data_count_UNCONNECTED[31:0]),
        .axis_wr_data_count(NLW_inst_axis_wr_data_count_UNCONNECTED[31:0]),
        .dbiterr(NLW_inst_dbiterr_UNCONNECTED),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .m_axis_aclk(1'b0),
        .m_axis_aclken(1'b1),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(NLW_inst_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_inst_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_inst_m_axis_tkeep_UNCONNECTED[7:0]),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(NLW_inst_m_axis_tstrb_UNCONNECTED[7:0]),
        .m_axis_tuser(NLW_inst_m_axis_tuser_UNCONNECTED[0]),
        .m_axis_tvalid(m_axis_tvalid),
        .prog_empty(prog_empty),
        .prog_full(NLW_inst_prog_full_UNCONNECTED),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_aclken(1'b1),
        .s_axis_aresetn(s_axis_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_tuser(1'b0),
        .s_axis_tvalid(s_axis_tvalid),
        .sbiterr(NLW_inst_sbiterr_UNCONNECTED));
endmodule

(* C_ACLKEN_CONV_MODE = "0" *) (* C_AXIS_SIGNAL_SET = "19" *) (* C_AXIS_TDATA_WIDTH = "64" *) 
(* C_AXIS_TDEST_WIDTH = "1" *) (* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TUSER_WIDTH = "1" *) 
(* C_ECC_MODE = "0" *) (* C_FAMILY = "zynquplus" *) (* C_FIFO_DEPTH = "16384" *) 
(* C_FIFO_MEMORY_TYPE = "auto" *) (* C_FIFO_MODE = "1" *) (* C_IS_ACLK_ASYNC = "0" *) 
(* C_PROG_EMPTY_THRESH = "1400" *) (* C_PROG_FULL_THRESH = "11" *) (* C_SYNCHRONIZER_STAGE = "3" *) 
(* C_USE_ADV_FEATURES = "825372720" *) (* G_INDX_SS_TDATA = "1" *) (* G_INDX_SS_TDEST = "6" *) 
(* G_INDX_SS_TID = "5" *) (* G_INDX_SS_TKEEP = "3" *) (* G_INDX_SS_TLAST = "4" *) 
(* G_INDX_SS_TREADY = "0" *) (* G_INDX_SS_TSTRB = "2" *) (* G_INDX_SS_TUSER = "7" *) 
(* G_MASK_SS_TDATA = "2" *) (* G_MASK_SS_TDEST = "64" *) (* G_MASK_SS_TID = "32" *) 
(* G_MASK_SS_TKEEP = "8" *) (* G_MASK_SS_TLAST = "16" *) (* G_MASK_SS_TREADY = "1" *) 
(* G_MASK_SS_TSTRB = "4" *) (* G_MASK_SS_TUSER = "128" *) (* G_TASK_SEVERITY_ERR = "2" *) 
(* G_TASK_SEVERITY_INFO = "0" *) (* G_TASK_SEVERITY_WARNING = "1" *) (* LP_CDC_SYNC_STAGES = "3" *) 
(* LP_CLOCKING_MODE = "common_clock" *) (* LP_ECC_MODE = "no_ecc" *) (* LP_FIFO_DEPTH = "16384" *) 
(* LP_FIFO_MEMORY_TYPE = "auto" *) (* LP_M_ACLKEN_CAN_TOGGLE = "0" *) (* LP_PACKET_FIFO = "false" *) 
(* LP_PROG_EMPTY_THRESH = "1400" *) (* LP_PROG_FULL_THRESH = "11" *) (* LP_RD_DATA_COUNT_WIDTH = "15" *) 
(* LP_RELATED_CLOCKS = "0" *) (* LP_S_ACLKEN_CAN_TOGGLE = "0" *) (* LP_TDATA_WIDTH = "64" *) 
(* LP_TDEST_WIDTH = "1" *) (* LP_TID_WIDTH = "1" *) (* LP_TUSER_WIDTH = "1" *) 
(* LP_USE_ADV_FEATURES = "825372720" *) (* LP_WR_DATA_COUNT_WIDTH = "15" *) (* ORIG_REF_NAME = "axis_data_fifo_v2_0_9_top" *) 
module axis_data_fifo_0_axis_data_fifo_v2_0_9_top
   (s_axis_aclk,
    s_axis_aresetn,
    s_axis_aclken,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    almost_full,
    prog_full,
    axis_wr_data_count,
    injectsbiterr,
    injectdbiterr,
    m_axis_aclk,
    m_axis_aclken,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    almost_empty,
    prog_empty,
    axis_rd_data_count,
    sbiterr,
    dbiterr);
  input s_axis_aclk;
  input s_axis_aresetn;
  input s_axis_aclken;
  input s_axis_tvalid;
  output s_axis_tready;
  input [63:0]s_axis_tdata;
  input [7:0]s_axis_tstrb;
  input [7:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [0:0]s_axis_tuser;
  output almost_full;
  output prog_full;
  output [31:0]axis_wr_data_count;
  input injectsbiterr;
  input injectdbiterr;
  input m_axis_aclk;
  input m_axis_aclken;
  output m_axis_tvalid;
  input m_axis_tready;
  output [63:0]m_axis_tdata;
  output [7:0]m_axis_tstrb;
  output [7:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [0:0]m_axis_tuser;
  output almost_empty;
  output prog_empty;
  output [31:0]axis_rd_data_count;
  output sbiterr;
  output dbiterr;

  wire \<const0> ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_100 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_101 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_102 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_104 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_105 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_106 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_107 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_108 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_109 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_110 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_111 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_112 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_113 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_114 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_115 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_116 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_117 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_118 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_119 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_120 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_121 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_86 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_87 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_88 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_89 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_90 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_91 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_92 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_93 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_94 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_95 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_96 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_97 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_98 ;
  wire \gen_fifo.xpm_fifo_axis_inst_n_99 ;
  wire [63:0]m_axis_tdata;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire prog_empty;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire [63:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [0:0]\NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tdest_UNCONNECTED ;
  wire [0:0]\NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tid_UNCONNECTED ;
  wire [7:0]\NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tkeep_UNCONNECTED ;
  wire [7:0]\NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tstrb_UNCONNECTED ;
  wire [0:0]\NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tuser_UNCONNECTED ;

  assign almost_empty = \<const0> ;
  assign almost_full = \<const0> ;
  assign axis_rd_data_count[31] = \<const0> ;
  assign axis_rd_data_count[30] = \<const0> ;
  assign axis_rd_data_count[29] = \<const0> ;
  assign axis_rd_data_count[28] = \<const0> ;
  assign axis_rd_data_count[27] = \<const0> ;
  assign axis_rd_data_count[26] = \<const0> ;
  assign axis_rd_data_count[25] = \<const0> ;
  assign axis_rd_data_count[24] = \<const0> ;
  assign axis_rd_data_count[23] = \<const0> ;
  assign axis_rd_data_count[22] = \<const0> ;
  assign axis_rd_data_count[21] = \<const0> ;
  assign axis_rd_data_count[20] = \<const0> ;
  assign axis_rd_data_count[19] = \<const0> ;
  assign axis_rd_data_count[18] = \<const0> ;
  assign axis_rd_data_count[17] = \<const0> ;
  assign axis_rd_data_count[16] = \<const0> ;
  assign axis_rd_data_count[15] = \<const0> ;
  assign axis_rd_data_count[14] = \<const0> ;
  assign axis_rd_data_count[13] = \<const0> ;
  assign axis_rd_data_count[12] = \<const0> ;
  assign axis_rd_data_count[11] = \<const0> ;
  assign axis_rd_data_count[10] = \<const0> ;
  assign axis_rd_data_count[9] = \<const0> ;
  assign axis_rd_data_count[8] = \<const0> ;
  assign axis_rd_data_count[7] = \<const0> ;
  assign axis_rd_data_count[6] = \<const0> ;
  assign axis_rd_data_count[5] = \<const0> ;
  assign axis_rd_data_count[4] = \<const0> ;
  assign axis_rd_data_count[3] = \<const0> ;
  assign axis_rd_data_count[2] = \<const0> ;
  assign axis_rd_data_count[1] = \<const0> ;
  assign axis_rd_data_count[0] = \<const0> ;
  assign axis_wr_data_count[31] = \<const0> ;
  assign axis_wr_data_count[30] = \<const0> ;
  assign axis_wr_data_count[29] = \<const0> ;
  assign axis_wr_data_count[28] = \<const0> ;
  assign axis_wr_data_count[27] = \<const0> ;
  assign axis_wr_data_count[26] = \<const0> ;
  assign axis_wr_data_count[25] = \<const0> ;
  assign axis_wr_data_count[24] = \<const0> ;
  assign axis_wr_data_count[23] = \<const0> ;
  assign axis_wr_data_count[22] = \<const0> ;
  assign axis_wr_data_count[21] = \<const0> ;
  assign axis_wr_data_count[20] = \<const0> ;
  assign axis_wr_data_count[19] = \<const0> ;
  assign axis_wr_data_count[18] = \<const0> ;
  assign axis_wr_data_count[17] = \<const0> ;
  assign axis_wr_data_count[16] = \<const0> ;
  assign axis_wr_data_count[15] = \<const0> ;
  assign axis_wr_data_count[14] = \<const0> ;
  assign axis_wr_data_count[13] = \<const0> ;
  assign axis_wr_data_count[12] = \<const0> ;
  assign axis_wr_data_count[11] = \<const0> ;
  assign axis_wr_data_count[10] = \<const0> ;
  assign axis_wr_data_count[9] = \<const0> ;
  assign axis_wr_data_count[8] = \<const0> ;
  assign axis_wr_data_count[7] = \<const0> ;
  assign axis_wr_data_count[6] = \<const0> ;
  assign axis_wr_data_count[5] = \<const0> ;
  assign axis_wr_data_count[4] = \<const0> ;
  assign axis_wr_data_count[3] = \<const0> ;
  assign axis_wr_data_count[2] = \<const0> ;
  assign axis_wr_data_count[1] = \<const0> ;
  assign axis_wr_data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[7] = \<const0> ;
  assign m_axis_tkeep[6] = \<const0> ;
  assign m_axis_tkeep[5] = \<const0> ;
  assign m_axis_tkeep[4] = \<const0> ;
  assign m_axis_tkeep[3] = \<const0> ;
  assign m_axis_tkeep[2] = \<const0> ;
  assign m_axis_tkeep[1] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tstrb[7] = \<const0> ;
  assign m_axis_tstrb[6] = \<const0> ;
  assign m_axis_tstrb[5] = \<const0> ;
  assign m_axis_tstrb[4] = \<const0> ;
  assign m_axis_tstrb[3] = \<const0> ;
  assign m_axis_tstrb[2] = \<const0> ;
  assign m_axis_tstrb[1] = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign prog_full = \<const0> ;
  assign sbiterr = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* AXIS_DATA_WIDTH = "84" *) 
  (* AXIS_FINAL_DATA_WIDTH = "84" *) 
  (* CASCADE_HEIGHT = "0" *) 
  (* CDC_SYNC_STAGES = "3" *) 
  (* CLOCKING_MODE = "common_clock" *) 
  (* ECC_MODE = "no_ecc" *) 
  (* EN_ADV_FEATURE_AXIS = "16'b0001001000000000" *) 
  (* EN_ADV_FEATURE_AXIS_INT = "16'b0001001000000000" *) 
  (* EN_ALMOST_EMPTY_INT = "1'b0" *) 
  (* EN_ALMOST_FULL_INT = "1'b0" *) 
  (* EN_DATA_VALID_INT = "1'b1" *) 
  (* FIFO_DEPTH = "16384" *) 
  (* FIFO_MEMORY_TYPE = "auto" *) 
  (* LOG_DEPTH_AXIS = "14" *) 
  (* PACKET_FIFO = "false" *) 
  (* PKT_SIZE_LT8 = "1'b0" *) 
  (* PROG_EMPTY_THRESH = "1400" *) 
  (* PROG_FULL_THRESH = "11" *) 
  (* P_COMMON_CLOCK = "1" *) 
  (* P_ECC_MODE = "0" *) 
  (* P_FIFO_MEMORY_TYPE = "0" *) 
  (* P_PKT_MODE = "0" *) 
  (* RD_DATA_COUNT_WIDTH = "15" *) 
  (* RELATED_CLOCKS = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* TDATA_OFFSET = "64" *) 
  (* TDATA_WIDTH = "64" *) 
  (* TDEST_OFFSET = "82" *) 
  (* TDEST_WIDTH = "1" *) 
  (* TID_OFFSET = "81" *) 
  (* TID_WIDTH = "1" *) 
  (* TKEEP_OFFSET = "80" *) 
  (* TSTRB_OFFSET = "72" *) 
  (* TUSER_MAX_WIDTH = "4013" *) 
  (* TUSER_OFFSET = "83" *) 
  (* TUSER_WIDTH = "1" *) 
  (* USE_ADV_FEATURES = "825372720" *) 
  (* USE_ADV_FEATURES_INT = "825372720" *) 
  (* WR_DATA_COUNT_WIDTH = "15" *) 
  (* XPM_MODULE = "TRUE" *) 
  axis_data_fifo_0_xpm_fifo_axis \gen_fifo.xpm_fifo_axis_inst 
       (.almost_empty_axis(\gen_fifo.xpm_fifo_axis_inst_n_119 ),
        .almost_full_axis(\gen_fifo.xpm_fifo_axis_inst_n_102 ),
        .dbiterr_axis(\gen_fifo.xpm_fifo_axis_inst_n_121 ),
        .injectdbiterr_axis(1'b0),
        .injectsbiterr_axis(1'b0),
        .m_aclk(s_axis_aclk),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(\NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tdest_UNCONNECTED [0]),
        .m_axis_tid(\NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tid_UNCONNECTED [0]),
        .m_axis_tkeep(\NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tkeep_UNCONNECTED [7:0]),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(\NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tstrb_UNCONNECTED [7:0]),
        .m_axis_tuser(\NLW_gen_fifo.xpm_fifo_axis_inst_m_axis_tuser_UNCONNECTED [0]),
        .m_axis_tvalid(m_axis_tvalid),
        .prog_empty_axis(prog_empty),
        .prog_full_axis(\gen_fifo.xpm_fifo_axis_inst_n_86 ),
        .rd_data_count_axis({\gen_fifo.xpm_fifo_axis_inst_n_104 ,\gen_fifo.xpm_fifo_axis_inst_n_105 ,\gen_fifo.xpm_fifo_axis_inst_n_106 ,\gen_fifo.xpm_fifo_axis_inst_n_107 ,\gen_fifo.xpm_fifo_axis_inst_n_108 ,\gen_fifo.xpm_fifo_axis_inst_n_109 ,\gen_fifo.xpm_fifo_axis_inst_n_110 ,\gen_fifo.xpm_fifo_axis_inst_n_111 ,\gen_fifo.xpm_fifo_axis_inst_n_112 ,\gen_fifo.xpm_fifo_axis_inst_n_113 ,\gen_fifo.xpm_fifo_axis_inst_n_114 ,\gen_fifo.xpm_fifo_axis_inst_n_115 ,\gen_fifo.xpm_fifo_axis_inst_n_116 ,\gen_fifo.xpm_fifo_axis_inst_n_117 ,\gen_fifo.xpm_fifo_axis_inst_n_118 }),
        .s_aclk(s_axis_aclk),
        .s_aresetn(s_axis_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tuser(1'b0),
        .s_axis_tvalid(s_axis_tvalid),
        .sbiterr_axis(\gen_fifo.xpm_fifo_axis_inst_n_120 ),
        .wr_data_count_axis({\gen_fifo.xpm_fifo_axis_inst_n_87 ,\gen_fifo.xpm_fifo_axis_inst_n_88 ,\gen_fifo.xpm_fifo_axis_inst_n_89 ,\gen_fifo.xpm_fifo_axis_inst_n_90 ,\gen_fifo.xpm_fifo_axis_inst_n_91 ,\gen_fifo.xpm_fifo_axis_inst_n_92 ,\gen_fifo.xpm_fifo_axis_inst_n_93 ,\gen_fifo.xpm_fifo_axis_inst_n_94 ,\gen_fifo.xpm_fifo_axis_inst_n_95 ,\gen_fifo.xpm_fifo_axis_inst_n_96 ,\gen_fifo.xpm_fifo_axis_inst_n_97 ,\gen_fifo.xpm_fifo_axis_inst_n_98 ,\gen_fifo.xpm_fifo_axis_inst_n_99 ,\gen_fifo.xpm_fifo_axis_inst_n_100 ,\gen_fifo.xpm_fifo_axis_inst_n_101 }));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "4" *) (* INIT = "0" *) 
(* INIT_SYNC_FF = "1" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "true" *) 
(* xpm_cdc = "SYNC_RST" *) 
module axis_data_fifo_0_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [3:0]syncstages_ff;

  assign dest_rst = syncstages_ff[3];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module axis_data_fifo_0_xpm_counter_updn__parameterized0
   (Q,
    \FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ,
    leaving_empty0,
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg ,
    S,
    \count_value_i_reg[7]_0 ,
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0 ,
    \count_value_i_reg[0]_0 ,
    rd_en,
    ram_empty_i,
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] ,
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 ,
    clr_full,
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg ,
    ram_wr_en_i,
    \count_value_i_reg[0]_1 ,
    wr_clk);
  output [13:0]Q;
  output \FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ;
  output leaving_empty0;
  output \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg ;
  output [5:0]S;
  output [6:0]\count_value_i_reg[7]_0 ;
  output \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0 ;
  input [1:0]\count_value_i_reg[0]_0 ;
  input rd_en;
  input ram_empty_i;
  input [13:0]\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] ;
  input [13:0]\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 ;
  input clr_full;
  input \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg ;
  input ram_wr_en_i;
  input [0:0]\count_value_i_reg[0]_1 ;
  input wr_clk;

  wire \FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ;
  wire [13:0]Q;
  wire [5:0]S;
  wire clr_full;
  wire \count_value_i[0]_i_1__1_n_0 ;
  wire \count_value_i[10]_i_1__0_n_0 ;
  wire \count_value_i[11]_i_1__0_n_0 ;
  wire \count_value_i[11]_i_2__0_n_0 ;
  wire \count_value_i[12]_i_1__0_n_0 ;
  wire \count_value_i[13]_i_1__0_n_0 ;
  wire \count_value_i[13]_i_2__0_n_0 ;
  wire \count_value_i[1]_i_1__1_n_0 ;
  wire \count_value_i[2]_i_1__1_n_0 ;
  wire \count_value_i[3]_i_1__1_n_0 ;
  wire \count_value_i[4]_i_1__1_n_0 ;
  wire \count_value_i[5]_i_1__0_n_0 ;
  wire \count_value_i[6]_i_1__0_n_0 ;
  wire \count_value_i[6]_i_2__0_n_0 ;
  wire \count_value_i[7]_i_1__0_n_0 ;
  wire \count_value_i[8]_i_1__0_n_0 ;
  wire \count_value_i[9]_i_1__0_n_0 ;
  wire \count_value_i[9]_i_2__0_n_0 ;
  wire [1:0]\count_value_i_reg[0]_0 ;
  wire [0:0]\count_value_i_reg[0]_1 ;
  wire [6:0]\count_value_i_reg[7]_0 ;
  wire \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg ;
  wire \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0 ;
  wire \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_10_n_0 ;
  wire \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_11_n_0 ;
  wire \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_12_n_0 ;
  wire \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_13_n_0 ;
  wire \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_14_n_0 ;
  wire [13:0]\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 ;
  wire \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_5_n_0 ;
  wire \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_6_n_0 ;
  wire \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_7_n_0 ;
  wire \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_8_n_0 ;
  wire \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_9_n_0 ;
  wire \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg ;
  wire [13:0]\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] ;
  wire going_full1;
  wire leaving_empty0;
  wire ram_empty_i;
  wire ram_wr_en_i;
  wire rd_en;
  wire wr_clk;

  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h10EF)) 
    \count_value_i[0]_i_1__1 
       (.I0(rd_en),
        .I1(\count_value_i_reg[0]_0 [0]),
        .I2(\count_value_i_reg[0]_0 [1]),
        .I3(Q[0]),
        .O(\count_value_i[0]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[10]_i_1__0 
       (.I0(Q[8]),
        .I1(\count_value_i[11]_i_2__0_n_0 ),
        .I2(Q[7]),
        .I3(Q[9]),
        .I4(Q[10]),
        .O(\count_value_i[10]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[11]_i_1__0 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(\count_value_i[11]_i_2__0_n_0 ),
        .I3(Q[8]),
        .I4(Q[10]),
        .I5(Q[11]),
        .O(\count_value_i[11]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[11]_i_2__0 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(\count_value_i[6]_i_2__0_n_0 ),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\count_value_i[11]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[12]_i_1__0 
       (.I0(Q[10]),
        .I1(\count_value_i[13]_i_2__0_n_0 ),
        .I2(Q[11]),
        .I3(Q[12]),
        .O(\count_value_i[12]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[13]_i_1__0 
       (.I0(Q[11]),
        .I1(\count_value_i[13]_i_2__0_n_0 ),
        .I2(Q[10]),
        .I3(Q[12]),
        .I4(Q[13]),
        .O(\count_value_i[13]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[13]_i_2__0 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(Q[5]),
        .I3(\count_value_i[9]_i_2__0_n_0 ),
        .I4(Q[6]),
        .I5(Q[8]),
        .O(\count_value_i[13]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT5 #(
    .INIT(32'h02FFFD00)) 
    \count_value_i[1]_i_1__1 
       (.I0(\count_value_i_reg[0]_0 [1]),
        .I1(\count_value_i_reg[0]_0 [0]),
        .I2(rd_en),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\count_value_i[1]_i_1__1_n_0 ));
  LUT3 #(
    .INIT(8'h78)) 
    \count_value_i[2]_i_1__1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\count_value_i[2]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[3]_i_1__1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(\count_value_i[3]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[4]_i_1__1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(\count_value_i[4]_i_1__1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[5]_i_1__0 
       (.I0(Q[3]),
        .I1(\count_value_i[6]_i_2__0_n_0 ),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[5]),
        .O(\count_value_i[5]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[6]_i_1__0 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(\count_value_i[6]_i_2__0_n_0 ),
        .I3(Q[3]),
        .I4(Q[5]),
        .I5(Q[6]),
        .O(\count_value_i[6]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h0000AAA200000000)) 
    \count_value_i[6]_i_2__0 
       (.I0(Q[1]),
        .I1(\count_value_i_reg[0]_0 [1]),
        .I2(\count_value_i_reg[0]_0 [0]),
        .I3(rd_en),
        .I4(ram_empty_i),
        .I5(Q[0]),
        .O(\count_value_i[6]_i_2__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[7]_i_1__0 
       (.I0(Q[5]),
        .I1(\count_value_i[9]_i_2__0_n_0 ),
        .I2(Q[6]),
        .I3(Q[7]),
        .O(\count_value_i[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[8]_i_1__0 
       (.I0(Q[6]),
        .I1(\count_value_i[9]_i_2__0_n_0 ),
        .I2(Q[5]),
        .I3(Q[7]),
        .I4(Q[8]),
        .O(\count_value_i[8]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[9]_i_1__0 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\count_value_i[9]_i_2__0_n_0 ),
        .I3(Q[6]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(\count_value_i[9]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[9]_i_2__0 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(\count_value_i[9]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[0] 
       (.C(wr_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[0]_i_1__1_n_0 ),
        .Q(Q[0]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[10] 
       (.C(wr_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[10]_i_1__0_n_0 ),
        .Q(Q[10]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[11] 
       (.C(wr_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[11]_i_1__0_n_0 ),
        .Q(Q[11]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[12] 
       (.C(wr_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[12]_i_1__0_n_0 ),
        .Q(Q[12]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[13] 
       (.C(wr_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[13]_i_1__0_n_0 ),
        .Q(Q[13]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[1] 
       (.C(wr_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[1]_i_1__1_n_0 ),
        .Q(Q[1]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[2] 
       (.C(wr_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[2]_i_1__1_n_0 ),
        .Q(Q[2]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[3] 
       (.C(wr_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[3]_i_1__1_n_0 ),
        .Q(Q[3]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[4] 
       (.C(wr_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[4]_i_1__1_n_0 ),
        .Q(Q[4]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[5] 
       (.C(wr_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[5]_i_1__0_n_0 ),
        .Q(Q[5]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[6] 
       (.C(wr_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[6]_i_1__0_n_0 ),
        .Q(Q[6]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[7] 
       (.C(wr_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[7]_i_1__0_n_0 ),
        .Q(Q[7]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[8] 
       (.C(wr_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[8]_i_1__0_n_0 ),
        .Q(Q[8]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[9] 
       (.C(wr_clk),
        .CE(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .D(\count_value_i[9]_i_1__0_n_0 ),
        .Q(Q[9]),
        .R(\count_value_i_reg[0]_1 ));
  LUT6 #(
    .INIT(64'h0545044404440444)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_i_1 
       (.I0(clr_full),
        .I1(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg ),
        .I2(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .I3(leaving_empty0),
        .I4(going_full1),
        .I5(ram_wr_en_i),
        .O(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0 ));
  LUT6 #(
    .INIT(64'hFABAFBBBFBBBFBBB)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_1 
       (.I0(clr_full),
        .I1(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg ),
        .I2(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ),
        .I3(leaving_empty0),
        .I4(going_full1),
        .I5(ram_wr_en_i),
        .O(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_10 
       (.I0(Q[6]),
        .I1(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 [6]),
        .I2(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 [8]),
        .I3(Q[8]),
        .I4(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 [7]),
        .I5(Q[7]),
        .O(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_11 
       (.I0(Q[12]),
        .I1(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 [12]),
        .I2(Q[13]),
        .I3(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 [13]),
        .O(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_12 
       (.I0(Q[3]),
        .I1(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 [3]),
        .I2(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 [5]),
        .I3(Q[5]),
        .I4(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 [4]),
        .I5(Q[4]),
        .O(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_13 
       (.I0(Q[0]),
        .I1(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 [0]),
        .I2(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 [2]),
        .I3(Q[2]),
        .I4(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 [1]),
        .I5(Q[1]),
        .O(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_14 
       (.I0(Q[9]),
        .I1(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 [9]),
        .I2(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 [11]),
        .I3(Q[11]),
        .I4(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 [10]),
        .I5(Q[10]),
        .O(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_14_n_0 ));
  LUT5 #(
    .INIT(32'h20000000)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_3 
       (.I0(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_5_n_0 ),
        .I1(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_6_n_0 ),
        .I2(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_7_n_0 ),
        .I3(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_8_n_0 ),
        .I4(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_9_n_0 ),
        .O(leaving_empty0));
  LUT5 #(
    .INIT(32'h20000000)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4 
       (.I0(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_10_n_0 ),
        .I1(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_11_n_0 ),
        .I2(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_12_n_0 ),
        .I3(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_13_n_0 ),
        .I4(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_14_n_0 ),
        .O(going_full1));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_5 
       (.I0(Q[6]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [6]),
        .I2(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [8]),
        .I3(Q[8]),
        .I4(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [7]),
        .I5(Q[7]),
        .O(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_6 
       (.I0(Q[12]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [12]),
        .I2(Q[13]),
        .I3(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [13]),
        .O(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_7 
       (.I0(Q[3]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [3]),
        .I2(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [5]),
        .I3(Q[5]),
        .I4(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [4]),
        .I5(Q[4]),
        .O(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_8 
       (.I0(Q[0]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [0]),
        .I2(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [2]),
        .I3(Q[2]),
        .I4(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [1]),
        .I5(Q[1]),
        .O(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_9 
       (.I0(Q[9]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [9]),
        .I2(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [11]),
        .I3(Q[11]),
        .I4(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [10]),
        .I5(Q[10]),
        .O(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[13]_i_2 
       (.I0(Q[13]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [13]),
        .O(S[5]));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[13]_i_3 
       (.I0(Q[12]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [12]),
        .O(S[4]));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[13]_i_4 
       (.I0(Q[11]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [11]),
        .O(S[3]));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[13]_i_5 
       (.I0(Q[10]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [10]),
        .O(S[2]));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[13]_i_6 
       (.I0(Q[9]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [9]),
        .O(S[1]));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[13]_i_7 
       (.I0(Q[8]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [8]),
        .O(S[0]));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_3 
       (.I0(Q[7]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [7]),
        .O(\count_value_i_reg[7]_0 [6]));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_4 
       (.I0(Q[6]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [6]),
        .O(\count_value_i_reg[7]_0 [5]));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_5 
       (.I0(Q[5]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [5]),
        .O(\count_value_i_reg[7]_0 [4]));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_6 
       (.I0(Q[4]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [4]),
        .O(\count_value_i_reg[7]_0 [3]));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_7 
       (.I0(Q[3]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [3]),
        .O(\count_value_i_reg[7]_0 [2]));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_8 
       (.I0(Q[2]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [2]),
        .O(\count_value_i_reg[7]_0 [1]));
  LUT2 #(
    .INIT(4'h9)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_9 
       (.I0(Q[1]),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] [1]),
        .O(\count_value_i_reg[7]_0 [0]));
  LUT4 #(
    .INIT(16'h00FD)) 
    \gen_sdpram.xpm_memory_base_inst_i_2 
       (.I0(\count_value_i_reg[0]_0 [1]),
        .I1(\count_value_i_reg[0]_0 [0]),
        .I2(rd_en),
        .I3(ram_empty_i),
        .O(\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] ));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module axis_data_fifo_0_xpm_counter_updn__parameterized0_0
   (ram_empty_i0,
    Q,
    D,
    \gen_pntr_flags_cc.ram_empty_i_reg ,
    leaving_empty0,
    ram_wr_en_i,
    ram_empty_i,
    wr_en,
    \count_value_i_reg[6]_0 ,
    \count_value_i_reg[13]_0 ,
    rst_d1,
    \gen_pntr_flags_cc.ram_empty_i_i_2_0 ,
    DI,
    S,
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] ,
    wr_clk);
  output ram_empty_i0;
  output [13:0]Q;
  output [13:0]D;
  input \gen_pntr_flags_cc.ram_empty_i_reg ;
  input leaving_empty0;
  input ram_wr_en_i;
  input ram_empty_i;
  input wr_en;
  input \count_value_i_reg[6]_0 ;
  input [0:0]\count_value_i_reg[13]_0 ;
  input rst_d1;
  input [13:0]\gen_pntr_flags_cc.ram_empty_i_i_2_0 ;
  input [0:0]DI;
  input [7:0]S;
  input [5:0]\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] ;
  input wr_clk;

  wire [13:0]D;
  wire [0:0]DI;
  wire [13:0]Q;
  wire [7:0]S;
  wire \count_value_i[0]_i_1_n_0 ;
  wire \count_value_i[10]_i_1__1_n_0 ;
  wire \count_value_i[11]_i_1__1_n_0 ;
  wire \count_value_i[11]_i_2__1_n_0 ;
  wire \count_value_i[12]_i_1__1_n_0 ;
  wire \count_value_i[13]_i_1__1_n_0 ;
  wire \count_value_i[13]_i_2__1_n_0 ;
  wire \count_value_i[1]_i_1_n_0 ;
  wire \count_value_i[2]_i_1_n_0 ;
  wire \count_value_i[3]_i_1_n_0 ;
  wire \count_value_i[4]_i_1_n_0 ;
  wire \count_value_i[5]_i_1__1_n_0 ;
  wire \count_value_i[6]_i_1__1_n_0 ;
  wire \count_value_i[6]_i_2__1_n_0 ;
  wire \count_value_i[7]_i_1__1_n_0 ;
  wire \count_value_i[8]_i_1__1_n_0 ;
  wire \count_value_i[9]_i_1__1_n_0 ;
  wire \count_value_i[9]_i_2__1_n_0 ;
  wire [0:0]\count_value_i_reg[13]_0 ;
  wire \count_value_i_reg[6]_0 ;
  wire [13:0]\gen_pntr_flags_cc.ram_empty_i_i_2_0 ;
  wire \gen_pntr_flags_cc.ram_empty_i_i_3_n_0 ;
  wire \gen_pntr_flags_cc.ram_empty_i_i_4_n_0 ;
  wire \gen_pntr_flags_cc.ram_empty_i_i_5_n_0 ;
  wire \gen_pntr_flags_cc.ram_empty_i_i_6_n_0 ;
  wire \gen_pntr_flags_cc.ram_empty_i_i_7_n_0 ;
  wire \gen_pntr_flags_cc.ram_empty_i_reg ;
  wire [5:0]\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_3 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_4 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_5 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_6 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_7 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_0 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_1 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_2 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_3 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_4 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_5 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_6 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_7 ;
  wire going_empty1;
  wire leaving_empty0;
  wire ram_empty_i;
  wire ram_empty_i0;
  wire ram_wr_en_i;
  wire rst_d1;
  wire wr_clk;
  wire wr_en;
  wire [7:5]\NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_CO_UNCONNECTED ;
  wire [7:6]\NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_O_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \count_value_i[0]_i_1 
       (.I0(Q[0]),
        .O(\count_value_i[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[10]_i_1__1 
       (.I0(Q[8]),
        .I1(\count_value_i[11]_i_2__1_n_0 ),
        .I2(Q[7]),
        .I3(Q[9]),
        .I4(Q[10]),
        .O(\count_value_i[10]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[11]_i_1__1 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(\count_value_i[11]_i_2__1_n_0 ),
        .I3(Q[8]),
        .I4(Q[10]),
        .I5(Q[11]),
        .O(\count_value_i[11]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[11]_i_2__1 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(\count_value_i[6]_i_2__1_n_0 ),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\count_value_i[11]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[12]_i_1__1 
       (.I0(Q[10]),
        .I1(\count_value_i[13]_i_2__1_n_0 ),
        .I2(Q[11]),
        .I3(Q[12]),
        .O(\count_value_i[12]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[13]_i_1__1 
       (.I0(Q[11]),
        .I1(\count_value_i[13]_i_2__1_n_0 ),
        .I2(Q[10]),
        .I3(Q[12]),
        .I4(Q[13]),
        .O(\count_value_i[13]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[13]_i_2__1 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(Q[5]),
        .I3(\count_value_i[9]_i_2__1_n_0 ),
        .I4(Q[6]),
        .I5(Q[8]),
        .O(\count_value_i[13]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_value_i[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\count_value_i[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_value_i[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\count_value_i[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(\count_value_i[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[4]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(\count_value_i[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[5]_i_1__1 
       (.I0(Q[3]),
        .I1(\count_value_i[6]_i_2__1_n_0 ),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[5]),
        .O(\count_value_i[5]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[6]_i_1__1 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(\count_value_i[6]_i_2__1_n_0 ),
        .I3(Q[3]),
        .I4(Q[5]),
        .I5(Q[6]),
        .O(\count_value_i[6]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \count_value_i[6]_i_2__1 
       (.I0(Q[1]),
        .I1(wr_en),
        .I2(\count_value_i_reg[6]_0 ),
        .I3(\count_value_i_reg[13]_0 ),
        .I4(rst_d1),
        .I5(Q[0]),
        .O(\count_value_i[6]_i_2__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[7]_i_1__1 
       (.I0(Q[5]),
        .I1(\count_value_i[9]_i_2__1_n_0 ),
        .I2(Q[6]),
        .I3(Q[7]),
        .O(\count_value_i[7]_i_1__1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[8]_i_1__1 
       (.I0(Q[6]),
        .I1(\count_value_i[9]_i_2__1_n_0 ),
        .I2(Q[5]),
        .I3(Q[7]),
        .I4(Q[8]),
        .O(\count_value_i[8]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[9]_i_1__1 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\count_value_i[9]_i_2__1_n_0 ),
        .I3(Q[6]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(\count_value_i[9]_i_1__1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[9]_i_2__1 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(ram_wr_en_i),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(\count_value_i[9]_i_2__1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[0] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(\count_value_i_reg[13]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[10] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[10]_i_1__1_n_0 ),
        .Q(Q[10]),
        .R(\count_value_i_reg[13]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[11] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[11]_i_1__1_n_0 ),
        .Q(Q[11]),
        .R(\count_value_i_reg[13]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[12] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[12]_i_1__1_n_0 ),
        .Q(Q[12]),
        .R(\count_value_i_reg[13]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[13] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[13]_i_1__1_n_0 ),
        .Q(Q[13]),
        .R(\count_value_i_reg[13]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[1] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(\count_value_i_reg[13]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[2] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(\count_value_i_reg[13]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[3] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[3]_i_1_n_0 ),
        .Q(Q[3]),
        .R(\count_value_i_reg[13]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[4] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[4]_i_1_n_0 ),
        .Q(Q[4]),
        .R(\count_value_i_reg[13]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[5] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[5]_i_1__1_n_0 ),
        .Q(Q[5]),
        .R(\count_value_i_reg[13]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[6] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[6]_i_1__1_n_0 ),
        .Q(Q[6]),
        .R(\count_value_i_reg[13]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[7] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[7]_i_1__1_n_0 ),
        .Q(Q[7]),
        .R(\count_value_i_reg[13]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[8] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[8]_i_1__1_n_0 ),
        .Q(Q[8]),
        .R(\count_value_i_reg[13]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[9] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[9]_i_1__1_n_0 ),
        .Q(Q[9]),
        .R(\count_value_i_reg[13]_0 ));
  LUT5 #(
    .INIT(32'h0FFF0088)) 
    \gen_pntr_flags_cc.ram_empty_i_i_1 
       (.I0(\gen_pntr_flags_cc.ram_empty_i_reg ),
        .I1(going_empty1),
        .I2(leaving_empty0),
        .I3(ram_wr_en_i),
        .I4(ram_empty_i),
        .O(ram_empty_i0));
  LUT5 #(
    .INIT(32'h20000000)) 
    \gen_pntr_flags_cc.ram_empty_i_i_2 
       (.I0(\gen_pntr_flags_cc.ram_empty_i_i_3_n_0 ),
        .I1(\gen_pntr_flags_cc.ram_empty_i_i_4_n_0 ),
        .I2(\gen_pntr_flags_cc.ram_empty_i_i_5_n_0 ),
        .I3(\gen_pntr_flags_cc.ram_empty_i_i_6_n_0 ),
        .I4(\gen_pntr_flags_cc.ram_empty_i_i_7_n_0 ),
        .O(going_empty1));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pntr_flags_cc.ram_empty_i_i_3 
       (.I0(Q[6]),
        .I1(\gen_pntr_flags_cc.ram_empty_i_i_2_0 [6]),
        .I2(\gen_pntr_flags_cc.ram_empty_i_i_2_0 [8]),
        .I3(Q[8]),
        .I4(\gen_pntr_flags_cc.ram_empty_i_i_2_0 [7]),
        .I5(Q[7]),
        .O(\gen_pntr_flags_cc.ram_empty_i_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \gen_pntr_flags_cc.ram_empty_i_i_4 
       (.I0(Q[12]),
        .I1(\gen_pntr_flags_cc.ram_empty_i_i_2_0 [12]),
        .I2(Q[13]),
        .I3(\gen_pntr_flags_cc.ram_empty_i_i_2_0 [13]),
        .O(\gen_pntr_flags_cc.ram_empty_i_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pntr_flags_cc.ram_empty_i_i_5 
       (.I0(Q[3]),
        .I1(\gen_pntr_flags_cc.ram_empty_i_i_2_0 [3]),
        .I2(\gen_pntr_flags_cc.ram_empty_i_i_2_0 [5]),
        .I3(Q[5]),
        .I4(\gen_pntr_flags_cc.ram_empty_i_i_2_0 [4]),
        .I5(Q[4]),
        .O(\gen_pntr_flags_cc.ram_empty_i_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pntr_flags_cc.ram_empty_i_i_6 
       (.I0(Q[0]),
        .I1(\gen_pntr_flags_cc.ram_empty_i_i_2_0 [0]),
        .I2(\gen_pntr_flags_cc.ram_empty_i_i_2_0 [2]),
        .I3(Q[2]),
        .I4(\gen_pntr_flags_cc.ram_empty_i_i_2_0 [1]),
        .I5(Q[1]),
        .O(\gen_pntr_flags_cc.ram_empty_i_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \gen_pntr_flags_cc.ram_empty_i_i_7 
       (.I0(Q[9]),
        .I1(\gen_pntr_flags_cc.ram_empty_i_i_2_0 [9]),
        .I2(\gen_pntr_flags_cc.ram_empty_i_i_2_0 [11]),
        .I3(Q[11]),
        .I4(\gen_pntr_flags_cc.ram_empty_i_i_2_0 [10]),
        .I5(Q[10]),
        .O(\gen_pntr_flags_cc.ram_empty_i_i_7_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1 
       (.CI(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_CO_UNCONNECTED [7:5],\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_3 ,\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_4 ,\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_5 ,\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_6 ,\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,Q[12:8]}),
        .O({\NLW_gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13]_i_1_O_UNCONNECTED [7:6],D[13:8]}),
        .S({1'b0,1'b0,\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] }));
  (* ADDER_THRESHOLD = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  CARRY8 \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1 
       (.CI(Q[0]),
        .CI_TOP(1'b0),
        .CO({\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_0 ,\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_1 ,\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_2 ,\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_3 ,\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_4 ,\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_5 ,\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_6 ,\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_i_1_n_7 }),
        .DI({Q[7:1],DI}),
        .O(D[7:0]),
        .S(S));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module axis_data_fifo_0_xpm_counter_updn__parameterized1
   (Q,
    \count_value_i_reg[0]_0 ,
    \count_value_i_reg[1]_0 ,
    rd_en,
    ram_empty_i,
    \count_value_i_reg[0]_1 ,
    wr_clk);
  output [13:0]Q;
  input \count_value_i_reg[0]_0 ;
  input [1:0]\count_value_i_reg[1]_0 ;
  input rd_en;
  input ram_empty_i;
  input [0:0]\count_value_i_reg[0]_1 ;
  input wr_clk;

  wire [13:0]Q;
  wire \count_value_i[0]_i_1__2_n_0 ;
  wire \count_value_i[10]_i_1_n_0 ;
  wire \count_value_i[11]_i_1_n_0 ;
  wire \count_value_i[11]_i_2_n_0 ;
  wire \count_value_i[12]_i_1_n_0 ;
  wire \count_value_i[13]_i_1_n_0 ;
  wire \count_value_i[13]_i_2_n_0 ;
  wire \count_value_i[1]_i_1__2_n_0 ;
  wire \count_value_i[2]_i_1__2_n_0 ;
  wire \count_value_i[3]_i_1__2_n_0 ;
  wire \count_value_i[4]_i_1__2_n_0 ;
  wire \count_value_i[5]_i_1_n_0 ;
  wire \count_value_i[6]_i_1_n_0 ;
  wire \count_value_i[6]_i_2_n_0 ;
  wire \count_value_i[7]_i_1_n_0 ;
  wire \count_value_i[8]_i_1_n_0 ;
  wire \count_value_i[9]_i_1_n_0 ;
  wire \count_value_i[9]_i_2_n_0 ;
  wire \count_value_i_reg[0]_0 ;
  wire [0:0]\count_value_i_reg[0]_1 ;
  wire [1:0]\count_value_i_reg[1]_0 ;
  wire ram_empty_i;
  wire rd_en;
  wire wr_clk;

  LUT4 #(
    .INIT(16'h10EF)) 
    \count_value_i[0]_i_1__2 
       (.I0(rd_en),
        .I1(\count_value_i_reg[1]_0 [0]),
        .I2(\count_value_i_reg[1]_0 [1]),
        .I3(Q[0]),
        .O(\count_value_i[0]_i_1__2_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[10]_i_1 
       (.I0(Q[8]),
        .I1(\count_value_i[11]_i_2_n_0 ),
        .I2(Q[7]),
        .I3(Q[9]),
        .I4(Q[10]),
        .O(\count_value_i[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[11]_i_1 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(\count_value_i[11]_i_2_n_0 ),
        .I3(Q[8]),
        .I4(Q[10]),
        .I5(Q[11]),
        .O(\count_value_i[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[11]_i_2 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(\count_value_i[6]_i_2_n_0 ),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\count_value_i[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[12]_i_1 
       (.I0(Q[10]),
        .I1(\count_value_i[13]_i_2_n_0 ),
        .I2(Q[11]),
        .I3(Q[12]),
        .O(\count_value_i[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[13]_i_1 
       (.I0(Q[11]),
        .I1(\count_value_i[13]_i_2_n_0 ),
        .I2(Q[10]),
        .I3(Q[12]),
        .I4(Q[13]),
        .O(\count_value_i[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[13]_i_2 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(Q[5]),
        .I3(\count_value_i[9]_i_2_n_0 ),
        .I4(Q[6]),
        .I5(Q[8]),
        .O(\count_value_i[13]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h02FFFD00)) 
    \count_value_i[1]_i_1__2 
       (.I0(\count_value_i_reg[1]_0 [1]),
        .I1(\count_value_i_reg[1]_0 [0]),
        .I2(rd_en),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(\count_value_i[1]_i_1__2_n_0 ));
  LUT3 #(
    .INIT(8'h78)) 
    \count_value_i[2]_i_1__2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\count_value_i[2]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[3]_i_1__2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(\count_value_i[3]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[4]_i_1__2 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(\count_value_i[4]_i_1__2_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[5]_i_1 
       (.I0(Q[3]),
        .I1(\count_value_i[6]_i_2_n_0 ),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[5]),
        .O(\count_value_i[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[6]_i_1 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(\count_value_i[6]_i_2_n_0 ),
        .I3(Q[3]),
        .I4(Q[5]),
        .I5(Q[6]),
        .O(\count_value_i[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000AAA200000000)) 
    \count_value_i[6]_i_2 
       (.I0(Q[1]),
        .I1(\count_value_i_reg[1]_0 [1]),
        .I2(\count_value_i_reg[1]_0 [0]),
        .I3(rd_en),
        .I4(ram_empty_i),
        .I5(Q[0]),
        .O(\count_value_i[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[7]_i_1 
       (.I0(Q[5]),
        .I1(\count_value_i[9]_i_2_n_0 ),
        .I2(Q[6]),
        .I3(Q[7]),
        .O(\count_value_i[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[8]_i_1 
       (.I0(Q[6]),
        .I1(\count_value_i[9]_i_2_n_0 ),
        .I2(Q[5]),
        .I3(Q[7]),
        .I4(Q[8]),
        .O(\count_value_i[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[9]_i_1 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\count_value_i[9]_i_2_n_0 ),
        .I3(Q[6]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(\count_value_i[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[9]_i_2 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(\count_value_i_reg[0]_0 ),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(\count_value_i[9]_i_2_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \count_value_i_reg[0] 
       (.C(wr_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[0]_i_1__2_n_0 ),
        .Q(Q[0]),
        .S(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[10] 
       (.C(wr_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[10]_i_1_n_0 ),
        .Q(Q[10]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[11] 
       (.C(wr_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[11]_i_1_n_0 ),
        .Q(Q[11]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[12] 
       (.C(wr_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[12]_i_1_n_0 ),
        .Q(Q[12]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[13] 
       (.C(wr_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[13]_i_1_n_0 ),
        .Q(Q[13]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[1] 
       (.C(wr_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[1]_i_1__2_n_0 ),
        .Q(Q[1]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[2] 
       (.C(wr_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[2]_i_1__2_n_0 ),
        .Q(Q[2]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[3] 
       (.C(wr_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[3]_i_1__2_n_0 ),
        .Q(Q[3]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[4] 
       (.C(wr_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[4]_i_1__2_n_0 ),
        .Q(Q[4]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[5] 
       (.C(wr_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[5]_i_1_n_0 ),
        .Q(Q[5]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[6] 
       (.C(wr_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[6]_i_1_n_0 ),
        .Q(Q[6]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[7] 
       (.C(wr_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[7]_i_1_n_0 ),
        .Q(Q[7]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[8] 
       (.C(wr_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[8]_i_1_n_0 ),
        .Q(Q[8]),
        .R(\count_value_i_reg[0]_1 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[9] 
       (.C(wr_clk),
        .CE(\count_value_i_reg[0]_0 ),
        .D(\count_value_i[9]_i_1_n_0 ),
        .Q(Q[9]),
        .R(\count_value_i_reg[0]_1 ));
endmodule

(* ORIG_REF_NAME = "xpm_counter_updn" *) 
module axis_data_fifo_0_xpm_counter_updn__parameterized1_1
   (Q,
    ram_wr_en_i,
    wr_en,
    \count_value_i_reg[6]_0 ,
    \count_value_i_reg[0]_0 ,
    rst_d1,
    wr_clk);
  output [13:0]Q;
  input ram_wr_en_i;
  input wr_en;
  input \count_value_i_reg[6]_0 ;
  input [0:0]\count_value_i_reg[0]_0 ;
  input rst_d1;
  input wr_clk;

  wire [13:0]Q;
  wire \count_value_i[0]_i_1__0_n_0 ;
  wire \count_value_i[10]_i_1__2_n_0 ;
  wire \count_value_i[11]_i_1__2_n_0 ;
  wire \count_value_i[11]_i_2__2_n_0 ;
  wire \count_value_i[12]_i_1__2_n_0 ;
  wire \count_value_i[13]_i_1__2_n_0 ;
  wire \count_value_i[13]_i_2__2_n_0 ;
  wire \count_value_i[1]_i_1__0_n_0 ;
  wire \count_value_i[2]_i_1__0_n_0 ;
  wire \count_value_i[3]_i_1__0_n_0 ;
  wire \count_value_i[4]_i_1__0_n_0 ;
  wire \count_value_i[5]_i_1__2_n_0 ;
  wire \count_value_i[6]_i_1__2_n_0 ;
  wire \count_value_i[6]_i_2__2_n_0 ;
  wire \count_value_i[7]_i_1__2_n_0 ;
  wire \count_value_i[8]_i_1__2_n_0 ;
  wire \count_value_i[9]_i_1__2_n_0 ;
  wire \count_value_i[9]_i_2__2_n_0 ;
  wire [0:0]\count_value_i_reg[0]_0 ;
  wire \count_value_i_reg[6]_0 ;
  wire ram_wr_en_i;
  wire rst_d1;
  wire wr_clk;
  wire wr_en;

  LUT1 #(
    .INIT(2'h1)) 
    \count_value_i[0]_i_1__0 
       (.I0(Q[0]),
        .O(\count_value_i[0]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[10]_i_1__2 
       (.I0(Q[8]),
        .I1(\count_value_i[11]_i_2__2_n_0 ),
        .I2(Q[7]),
        .I3(Q[9]),
        .I4(Q[10]),
        .O(\count_value_i[10]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[11]_i_1__2 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(\count_value_i[11]_i_2__2_n_0 ),
        .I3(Q[8]),
        .I4(Q[10]),
        .I5(Q[11]),
        .O(\count_value_i[11]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[11]_i_2__2 
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(Q[2]),
        .I3(\count_value_i[6]_i_2__2_n_0 ),
        .I4(Q[3]),
        .I5(Q[5]),
        .O(\count_value_i[11]_i_2__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[12]_i_1__2 
       (.I0(Q[10]),
        .I1(\count_value_i[13]_i_2__2_n_0 ),
        .I2(Q[11]),
        .I3(Q[12]),
        .O(\count_value_i[12]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[13]_i_1__2 
       (.I0(Q[11]),
        .I1(\count_value_i[13]_i_2__2_n_0 ),
        .I2(Q[10]),
        .I3(Q[12]),
        .I4(Q[13]),
        .O(\count_value_i[13]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[13]_i_2__2 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(Q[5]),
        .I3(\count_value_i[9]_i_2__2_n_0 ),
        .I4(Q[6]),
        .I5(Q[8]),
        .O(\count_value_i[13]_i_2__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count_value_i[1]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\count_value_i[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count_value_i[2]_i_1__0 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\count_value_i[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[3]_i_1__0 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(\count_value_i[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[4]_i_1__0 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(\count_value_i[4]_i_1__0_n_0 ));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[5]_i_1__2 
       (.I0(Q[3]),
        .I1(\count_value_i[6]_i_2__2_n_0 ),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[5]),
        .O(\count_value_i[5]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[6]_i_1__2 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(\count_value_i[6]_i_2__2_n_0 ),
        .I3(Q[3]),
        .I4(Q[5]),
        .I5(Q[6]),
        .O(\count_value_i[6]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000800000000)) 
    \count_value_i[6]_i_2__2 
       (.I0(Q[1]),
        .I1(wr_en),
        .I2(\count_value_i_reg[6]_0 ),
        .I3(\count_value_i_reg[0]_0 ),
        .I4(rst_d1),
        .I5(Q[0]),
        .O(\count_value_i[6]_i_2__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count_value_i[7]_i_1__2 
       (.I0(Q[5]),
        .I1(\count_value_i[9]_i_2__2_n_0 ),
        .I2(Q[6]),
        .I3(Q[7]),
        .O(\count_value_i[7]_i_1__2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count_value_i[8]_i_1__2 
       (.I0(Q[6]),
        .I1(\count_value_i[9]_i_2__2_n_0 ),
        .I2(Q[5]),
        .I3(Q[7]),
        .I4(Q[8]),
        .O(\count_value_i[8]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count_value_i[9]_i_1__2 
       (.I0(Q[7]),
        .I1(Q[5]),
        .I2(\count_value_i[9]_i_2__2_n_0 ),
        .I3(Q[6]),
        .I4(Q[8]),
        .I5(Q[9]),
        .O(\count_value_i[9]_i_1__2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count_value_i[9]_i_2__2 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[0]),
        .I3(ram_wr_en_i),
        .I4(Q[1]),
        .I5(Q[3]),
        .O(\count_value_i[9]_i_2__2_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \count_value_i_reg[0] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[0]_i_1__0_n_0 ),
        .Q(Q[0]),
        .S(\count_value_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[10] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[10]_i_1__2_n_0 ),
        .Q(Q[10]),
        .R(\count_value_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[11] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[11]_i_1__2_n_0 ),
        .Q(Q[11]),
        .R(\count_value_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[12] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[12]_i_1__2_n_0 ),
        .Q(Q[12]),
        .R(\count_value_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[13] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[13]_i_1__2_n_0 ),
        .Q(Q[13]),
        .R(\count_value_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[1] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[1]_i_1__0_n_0 ),
        .Q(Q[1]),
        .R(\count_value_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[2] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[2]_i_1__0_n_0 ),
        .Q(Q[2]),
        .R(\count_value_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[3] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[3]_i_1__0_n_0 ),
        .Q(Q[3]),
        .R(\count_value_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[4] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[4]_i_1__0_n_0 ),
        .Q(Q[4]),
        .R(\count_value_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[5] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[5]_i_1__2_n_0 ),
        .Q(Q[5]),
        .R(\count_value_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[6] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[6]_i_1__2_n_0 ),
        .Q(Q[6]),
        .R(\count_value_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[7] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[7]_i_1__2_n_0 ),
        .Q(Q[7]),
        .R(\count_value_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[8] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[8]_i_1__2_n_0 ),
        .Q(Q[8]),
        .R(\count_value_i_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_value_i_reg[9] 
       (.C(wr_clk),
        .CE(ram_wr_en_i),
        .D(\count_value_i[9]_i_1__2_n_0 ),
        .Q(Q[9]),
        .R(\count_value_i_reg[0]_0 ));
endmodule

(* AXIS_DATA_WIDTH = "84" *) (* AXIS_FINAL_DATA_WIDTH = "84" *) (* CASCADE_HEIGHT = "0" *) 
(* CDC_SYNC_STAGES = "3" *) (* CLOCKING_MODE = "common_clock" *) (* ECC_MODE = "no_ecc" *) 
(* EN_ADV_FEATURE_AXIS = "16'b0001001000000000" *) (* EN_ADV_FEATURE_AXIS_INT = "16'b0001001000000000" *) (* EN_ALMOST_EMPTY_INT = "1'b0" *) 
(* EN_ALMOST_FULL_INT = "1'b0" *) (* EN_DATA_VALID_INT = "1'b1" *) (* FIFO_DEPTH = "16384" *) 
(* FIFO_MEMORY_TYPE = "auto" *) (* LOG_DEPTH_AXIS = "14" *) (* ORIG_REF_NAME = "xpm_fifo_axis" *) 
(* PACKET_FIFO = "false" *) (* PKT_SIZE_LT8 = "1'b0" *) (* PROG_EMPTY_THRESH = "1400" *) 
(* PROG_FULL_THRESH = "11" *) (* P_COMMON_CLOCK = "1" *) (* P_ECC_MODE = "0" *) 
(* P_FIFO_MEMORY_TYPE = "0" *) (* P_PKT_MODE = "0" *) (* RD_DATA_COUNT_WIDTH = "15" *) 
(* RELATED_CLOCKS = "0" *) (* SIM_ASSERT_CHK = "0" *) (* TDATA_OFFSET = "64" *) 
(* TDATA_WIDTH = "64" *) (* TDEST_OFFSET = "82" *) (* TDEST_WIDTH = "1" *) 
(* TID_OFFSET = "81" *) (* TID_WIDTH = "1" *) (* TKEEP_OFFSET = "80" *) 
(* TSTRB_OFFSET = "72" *) (* TUSER_MAX_WIDTH = "4013" *) (* TUSER_OFFSET = "83" *) 
(* TUSER_WIDTH = "1" *) (* USE_ADV_FEATURES = "825372720" *) (* USE_ADV_FEATURES_INT = "825372720" *) 
(* WR_DATA_COUNT_WIDTH = "15" *) (* XPM_MODULE = "TRUE" *) (* dont_touch = "true" *) 
module axis_data_fifo_0_xpm_fifo_axis
   (s_aresetn,
    s_aclk,
    m_aclk,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    prog_full_axis,
    wr_data_count_axis,
    almost_full_axis,
    prog_empty_axis,
    rd_data_count_axis,
    almost_empty_axis,
    injectsbiterr_axis,
    injectdbiterr_axis,
    sbiterr_axis,
    dbiterr_axis);
  input s_aresetn;
  input s_aclk;
  input m_aclk;
  input s_axis_tvalid;
  output s_axis_tready;
  input [63:0]s_axis_tdata;
  input [7:0]s_axis_tstrb;
  input [7:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [0:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [63:0]m_axis_tdata;
  output [7:0]m_axis_tstrb;
  output [7:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [0:0]m_axis_tuser;
  output prog_full_axis;
  output [14:0]wr_data_count_axis;
  output almost_full_axis;
  output prog_empty_axis;
  output [14:0]rd_data_count_axis;
  output almost_empty_axis;
  input injectsbiterr_axis;
  input injectdbiterr_axis;
  output sbiterr_axis;
  output dbiterr_axis;

  wire \<const0> ;
  wire \gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1_n_0 ;
  wire [63:0]m_axis_tdata;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire prog_empty_axis;
  wire rst_axis;
  wire s_aclk;
  wire s_aresetn;
  wire [63:0]s_axis_tdata;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire xpm_fifo_base_inst_i_1_n_0;
  wire NLW_xpm_fifo_base_inst_almost_empty_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_almost_full_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_dbiterr_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_empty_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_full_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_overflow_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_prog_full_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_rd_rst_busy_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_sbiterr_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_underflow_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_wr_ack_UNCONNECTED;
  wire NLW_xpm_fifo_base_inst_wr_rst_busy_UNCONNECTED;
  wire [82:64]NLW_xpm_fifo_base_inst_dout_UNCONNECTED;
  wire [14:0]NLW_xpm_fifo_base_inst_rd_data_count_UNCONNECTED;
  wire [14:0]NLW_xpm_fifo_base_inst_wr_data_count_UNCONNECTED;

  assign almost_empty_axis = \<const0> ;
  assign almost_full_axis = \<const0> ;
  assign dbiterr_axis = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tkeep[7] = \<const0> ;
  assign m_axis_tkeep[6] = \<const0> ;
  assign m_axis_tkeep[5] = \<const0> ;
  assign m_axis_tkeep[4] = \<const0> ;
  assign m_axis_tkeep[3] = \<const0> ;
  assign m_axis_tkeep[2] = \<const0> ;
  assign m_axis_tkeep[1] = \<const0> ;
  assign m_axis_tkeep[0] = \<const0> ;
  assign m_axis_tstrb[7] = \<const0> ;
  assign m_axis_tstrb[6] = \<const0> ;
  assign m_axis_tstrb[5] = \<const0> ;
  assign m_axis_tstrb[4] = \<const0> ;
  assign m_axis_tstrb[3] = \<const0> ;
  assign m_axis_tstrb[2] = \<const0> ;
  assign m_axis_tstrb[1] = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign m_axis_tuser[0] = \<const0> ;
  assign prog_full_axis = \<const0> ;
  assign rd_data_count_axis[14] = \<const0> ;
  assign rd_data_count_axis[13] = \<const0> ;
  assign rd_data_count_axis[12] = \<const0> ;
  assign rd_data_count_axis[11] = \<const0> ;
  assign rd_data_count_axis[10] = \<const0> ;
  assign rd_data_count_axis[9] = \<const0> ;
  assign rd_data_count_axis[8] = \<const0> ;
  assign rd_data_count_axis[7] = \<const0> ;
  assign rd_data_count_axis[6] = \<const0> ;
  assign rd_data_count_axis[5] = \<const0> ;
  assign rd_data_count_axis[4] = \<const0> ;
  assign rd_data_count_axis[3] = \<const0> ;
  assign rd_data_count_axis[2] = \<const0> ;
  assign rd_data_count_axis[1] = \<const0> ;
  assign rd_data_count_axis[0] = \<const0> ;
  assign sbiterr_axis = \<const0> ;
  assign wr_data_count_axis[14] = \<const0> ;
  assign wr_data_count_axis[13] = \<const0> ;
  assign wr_data_count_axis[12] = \<const0> ;
  assign wr_data_count_axis[11] = \<const0> ;
  assign wr_data_count_axis[10] = \<const0> ;
  assign wr_data_count_axis[9] = \<const0> ;
  assign wr_data_count_axis[8] = \<const0> ;
  assign wr_data_count_axis[7] = \<const0> ;
  assign wr_data_count_axis[6] = \<const0> ;
  assign wr_data_count_axis[5] = \<const0> ;
  assign wr_data_count_axis[4] = \<const0> ;
  assign wr_data_count_axis[3] = \<const0> ;
  assign wr_data_count_axis[2] = \<const0> ;
  assign wr_data_count_axis[1] = \<const0> ;
  assign wr_data_count_axis[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* DEF_VAL = "1'b0" *) 
  (* DEST_SYNC_FF = "4" *) 
  (* INIT = "0" *) 
  (* INIT_SYNC_FF = "1" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* VERSION = "0" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  (* XPM_MODULE = "TRUE" *) 
  axis_data_fifo_0_xpm_cdc_sync_rst \gaxis_rst_sync.xpm_cdc_sync_rst_inst 
       (.dest_clk(s_aclk),
        .dest_rst(rst_axis),
        .src_rst(\gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1 
       (.I0(s_aresetn),
        .O(\gaxis_rst_sync.xpm_cdc_sync_rst_inst_i_1_n_0 ));
  (* CASCADE_HEIGHT = "0" *) 
  (* CDC_DEST_SYNC_FF = "3" *) 
  (* COMMON_CLOCK = "1" *) 
  (* DOUT_RESET_VALUE = "" *) 
  (* ECC_MODE = "0" *) 
  (* ENABLE_ECC = "0" *) 
  (* EN_ADV_FEATURE = "16'b0001001000000000" *) 
  (* EN_AE = "1'b0" *) 
  (* EN_AF = "1'b0" *) 
  (* EN_DVLD = "1'b1" *) 
  (* EN_OF = "1'b0" *) 
  (* EN_PE = "1'b1" *) 
  (* EN_PF = "1'b0" *) 
  (* EN_RDC = "1'b0" *) 
  (* EN_UF = "1'b0" *) 
  (* EN_WACK = "1'b0" *) 
  (* EN_WDC = "1'b0" *) 
  (* FG_EQ_ASYM_DOUT = "1'b0" *) 
  (* FIFO_MEMORY_TYPE = "0" *) 
  (* FIFO_MEM_TYPE = "0" *) 
  (* FIFO_READ_DEPTH = "16384" *) 
  (* FIFO_READ_LATENCY = "0" *) 
  (* FIFO_SIZE = "1376256" *) 
  (* FIFO_WRITE_DEPTH = "16384" *) 
  (* FULL_RESET_VALUE = "1" *) 
  (* FULL_RST_VAL = "1'b1" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* PE_THRESH_ADJ = "1398" *) 
  (* PE_THRESH_MAX = "16379" *) 
  (* PE_THRESH_MIN = "5" *) 
  (* PF_THRESH_ADJ = "9" *) 
  (* PF_THRESH_MAX = "16379" *) 
  (* PF_THRESH_MIN = "5" *) 
  (* PROG_EMPTY_THRESH = "1400" *) 
  (* PROG_FULL_THRESH = "11" *) 
  (* RD_DATA_COUNT_WIDTH = "15" *) 
  (* RD_DC_WIDTH_EXT = "15" *) 
  (* RD_LATENCY = "2" *) 
  (* RD_MODE = "1" *) 
  (* RD_PNTR_WIDTH = "14" *) 
  (* READ_DATA_WIDTH = "84" *) 
  (* READ_MODE = "1" *) 
  (* READ_MODE_LL = "1" *) 
  (* RELATED_CLOCKS = "0" *) 
  (* REMOVE_WR_RD_PROT_LOGIC = "0" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* USE_ADV_FEATURES = "825372720" *) 
  (* VERSION = "0" *) 
  (* WAKEUP_TIME = "0" *) 
  (* WIDTH_RATIO = "1" *) 
  (* WRITE_DATA_WIDTH = "84" *) 
  (* WR_DATA_COUNT_WIDTH = "15" *) 
  (* WR_DC_WIDTH_EXT = "15" *) 
  (* WR_DEPTH_LOG = "14" *) 
  (* WR_PNTR_WIDTH = "14" *) 
  (* WR_RD_RATIO = "0" *) 
  (* WR_WIDTH_LOG = "7" *) 
  (* XPM_MODULE = "TRUE" *) 
  (* both_stages_valid = "3" *) 
  (* invalid = "0" *) 
  (* stage1_valid = "2" *) 
  (* stage2_valid = "1" *) 
  axis_data_fifo_0_xpm_fifo_base xpm_fifo_base_inst
       (.almost_empty(NLW_xpm_fifo_base_inst_almost_empty_UNCONNECTED),
        .almost_full(NLW_xpm_fifo_base_inst_almost_full_UNCONNECTED),
        .data_valid(m_axis_tvalid),
        .dbiterr(NLW_xpm_fifo_base_inst_dbiterr_UNCONNECTED),
        .din({s_axis_tlast,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s_axis_tdata}),
        .dout({m_axis_tlast,NLW_xpm_fifo_base_inst_dout_UNCONNECTED[82:64],m_axis_tdata}),
        .empty(NLW_xpm_fifo_base_inst_empty_UNCONNECTED),
        .full(NLW_xpm_fifo_base_inst_full_UNCONNECTED),
        .full_n(s_axis_tready),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .overflow(NLW_xpm_fifo_base_inst_overflow_UNCONNECTED),
        .prog_empty(prog_empty_axis),
        .prog_full(NLW_xpm_fifo_base_inst_prog_full_UNCONNECTED),
        .rd_clk(1'b0),
        .rd_data_count(NLW_xpm_fifo_base_inst_rd_data_count_UNCONNECTED[14:0]),
        .rd_en(xpm_fifo_base_inst_i_1_n_0),
        .rd_rst_busy(NLW_xpm_fifo_base_inst_rd_rst_busy_UNCONNECTED),
        .rst(rst_axis),
        .sbiterr(NLW_xpm_fifo_base_inst_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .underflow(NLW_xpm_fifo_base_inst_underflow_UNCONNECTED),
        .wr_ack(NLW_xpm_fifo_base_inst_wr_ack_UNCONNECTED),
        .wr_clk(s_aclk),
        .wr_data_count(NLW_xpm_fifo_base_inst_wr_data_count_UNCONNECTED[14:0]),
        .wr_en(s_axis_tvalid),
        .wr_rst_busy(NLW_xpm_fifo_base_inst_wr_rst_busy_UNCONNECTED));
  LUT2 #(
    .INIT(4'h8)) 
    xpm_fifo_base_inst_i_1
       (.I0(m_axis_tvalid),
        .I1(m_axis_tready),
        .O(xpm_fifo_base_inst_i_1_n_0));
endmodule

(* CASCADE_HEIGHT = "0" *) (* CDC_DEST_SYNC_FF = "3" *) (* COMMON_CLOCK = "1" *) 
(* DOUT_RESET_VALUE = "" *) (* ECC_MODE = "0" *) (* ENABLE_ECC = "0" *) 
(* EN_ADV_FEATURE = "16'b0001001000000000" *) (* EN_AE = "1'b0" *) (* EN_AF = "1'b0" *) 
(* EN_DVLD = "1'b1" *) (* EN_OF = "1'b0" *) (* EN_PE = "1'b1" *) 
(* EN_PF = "1'b0" *) (* EN_RDC = "1'b0" *) (* EN_UF = "1'b0" *) 
(* EN_WACK = "1'b0" *) (* EN_WDC = "1'b0" *) (* FG_EQ_ASYM_DOUT = "1'b0" *) 
(* FIFO_MEMORY_TYPE = "0" *) (* FIFO_MEM_TYPE = "0" *) (* FIFO_READ_DEPTH = "16384" *) 
(* FIFO_READ_LATENCY = "0" *) (* FIFO_SIZE = "1376256" *) (* FIFO_WRITE_DEPTH = "16384" *) 
(* FULL_RESET_VALUE = "1" *) (* FULL_RST_VAL = "1'b1" *) (* ORIG_REF_NAME = "xpm_fifo_base" *) 
(* PE_THRESH_ADJ = "1398" *) (* PE_THRESH_MAX = "16379" *) (* PE_THRESH_MIN = "5" *) 
(* PF_THRESH_ADJ = "9" *) (* PF_THRESH_MAX = "16379" *) (* PF_THRESH_MIN = "5" *) 
(* PROG_EMPTY_THRESH = "1400" *) (* PROG_FULL_THRESH = "11" *) (* RD_DATA_COUNT_WIDTH = "15" *) 
(* RD_DC_WIDTH_EXT = "15" *) (* RD_LATENCY = "2" *) (* RD_MODE = "1" *) 
(* RD_PNTR_WIDTH = "14" *) (* READ_DATA_WIDTH = "84" *) (* READ_MODE = "1" *) 
(* READ_MODE_LL = "1" *) (* RELATED_CLOCKS = "0" *) (* REMOVE_WR_RD_PROT_LOGIC = "0" *) 
(* SIM_ASSERT_CHK = "0" *) (* USE_ADV_FEATURES = "825372720" *) (* VERSION = "0" *) 
(* WAKEUP_TIME = "0" *) (* WIDTH_RATIO = "1" *) (* WRITE_DATA_WIDTH = "84" *) 
(* WR_DATA_COUNT_WIDTH = "15" *) (* WR_DC_WIDTH_EXT = "15" *) (* WR_DEPTH_LOG = "14" *) 
(* WR_PNTR_WIDTH = "14" *) (* WR_RD_RATIO = "0" *) (* WR_WIDTH_LOG = "7" *) 
(* XPM_MODULE = "TRUE" *) (* both_stages_valid = "3" *) (* invalid = "0" *) 
(* keep_hierarchy = "soft" *) (* stage1_valid = "2" *) (* stage2_valid = "1" *) 
module axis_data_fifo_0_xpm_fifo_base
   (sleep,
    rst,
    wr_clk,
    wr_en,
    din,
    full,
    full_n,
    prog_full,
    wr_data_count,
    overflow,
    wr_rst_busy,
    almost_full,
    wr_ack,
    rd_clk,
    rd_en,
    dout,
    empty,
    prog_empty,
    rd_data_count,
    underflow,
    rd_rst_busy,
    almost_empty,
    data_valid,
    injectsbiterr,
    injectdbiterr,
    sbiterr,
    dbiterr);
  input sleep;
  input rst;
  input wr_clk;
  input wr_en;
  input [83:0]din;
  output full;
  output full_n;
  output prog_full;
  output [14:0]wr_data_count;
  output overflow;
  output wr_rst_busy;
  output almost_full;
  output wr_ack;
  input rd_clk;
  input rd_en;
  output [83:0]dout;
  output empty;
  output prog_empty;
  output [14:0]rd_data_count;
  output underflow;
  output rd_rst_busy;
  output almost_empty;
  output data_valid;
  input injectsbiterr;
  input injectdbiterr;
  output sbiterr;
  output dbiterr;

  wire \<const0> ;
  wire clr_full;
  wire [13:0]count_value_i__0;
  wire [1:0]curr_fwft_state;
  wire data_valid;
  wire data_valid_fwft1;
  wire [13:0]diff_pntr_pe;
  wire [83:0]din;
  wire [83:0]\^dout ;
  wire full_n;
  wire \gen_fwft.empty_fwft_i_reg_n_0 ;
  wire \gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0 ;
  wire \gen_fwft.ram_regout_en ;
  wire \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[0] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[10] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[11] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[12] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[13] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[1] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[2] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[3] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[4] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[5] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[6] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[7] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[8] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[9] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_3_n_0 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_4_n_0 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_5_n_0 ;
  wire leaving_empty0;
  wire [1:0]next_fwft_state__0;
  wire prog_empty;
  wire prog_empty_i1;
  wire ram_empty_i;
  wire ram_empty_i0;
  wire ram_wr_en_i;
  wire rd_en;
  wire [13:0]rd_pntr_ext;
  wire rdp_inst_n_14;
  wire rdp_inst_n_16;
  wire rdp_inst_n_17;
  wire rdp_inst_n_18;
  wire rdp_inst_n_19;
  wire rdp_inst_n_20;
  wire rdp_inst_n_21;
  wire rdp_inst_n_22;
  wire rdp_inst_n_23;
  wire rdp_inst_n_24;
  wire rdp_inst_n_25;
  wire rdp_inst_n_26;
  wire rdp_inst_n_27;
  wire rdp_inst_n_28;
  wire rdp_inst_n_29;
  wire rdp_inst_n_30;
  wire rdpp1_inst_n_0;
  wire rdpp1_inst_n_1;
  wire rdpp1_inst_n_10;
  wire rdpp1_inst_n_11;
  wire rdpp1_inst_n_12;
  wire rdpp1_inst_n_13;
  wire rdpp1_inst_n_2;
  wire rdpp1_inst_n_3;
  wire rdpp1_inst_n_4;
  wire rdpp1_inst_n_5;
  wire rdpp1_inst_n_6;
  wire rdpp1_inst_n_7;
  wire rdpp1_inst_n_8;
  wire rdpp1_inst_n_9;
  wire read_only;
  wire read_only_q;
  wire rst;
  wire rst_d1;
  wire rst_d1_inst_n_1;
  wire sleep;
  wire wr_clk;
  wire wr_en;
  wire [13:0]wr_pntr_ext;
  wire write_only;
  wire write_only_q;
  wire xpm_fifo_rst_inst_n_1;
  wire xpm_fifo_rst_inst_n_2;
  wire xpm_fifo_rst_inst_n_3;
  wire \NLW_gen_sdpram.xpm_memory_base_inst_dbiterra_UNCONNECTED ;
  wire \NLW_gen_sdpram.xpm_memory_base_inst_dbiterrb_UNCONNECTED ;
  wire \NLW_gen_sdpram.xpm_memory_base_inst_sbiterra_UNCONNECTED ;
  wire \NLW_gen_sdpram.xpm_memory_base_inst_sbiterrb_UNCONNECTED ;
  wire [83:0]\NLW_gen_sdpram.xpm_memory_base_inst_douta_UNCONNECTED ;
  wire [82:64]\NLW_gen_sdpram.xpm_memory_base_inst_doutb_UNCONNECTED ;

  assign almost_empty = \<const0> ;
  assign almost_full = \<const0> ;
  assign dbiterr = \<const0> ;
  assign dout[83] = \^dout [83];
  assign dout[82] = \<const0> ;
  assign dout[81] = \<const0> ;
  assign dout[80] = \<const0> ;
  assign dout[79] = \<const0> ;
  assign dout[78] = \<const0> ;
  assign dout[77] = \<const0> ;
  assign dout[76] = \<const0> ;
  assign dout[75] = \<const0> ;
  assign dout[74] = \<const0> ;
  assign dout[73] = \<const0> ;
  assign dout[72] = \<const0> ;
  assign dout[71] = \<const0> ;
  assign dout[70] = \<const0> ;
  assign dout[69] = \<const0> ;
  assign dout[68] = \<const0> ;
  assign dout[67] = \<const0> ;
  assign dout[66] = \<const0> ;
  assign dout[65] = \<const0> ;
  assign dout[64] = \<const0> ;
  assign dout[63:0] = \^dout [63:0];
  assign empty = \<const0> ;
  assign full = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[14] = \<const0> ;
  assign rd_data_count[13] = \<const0> ;
  assign rd_data_count[12] = \<const0> ;
  assign rd_data_count[11] = \<const0> ;
  assign rd_data_count[10] = \<const0> ;
  assign rd_data_count[9] = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign rd_rst_busy = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[14] = \<const0> ;
  assign wr_data_count[13] = \<const0> ;
  assign wr_data_count[12] = \<const0> ;
  assign wr_data_count[11] = \<const0> ;
  assign wr_data_count[10] = \<const0> ;
  assign wr_data_count[9] = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  assign wr_rst_busy = \<const0> ;
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT4 #(
    .INIT(16'h6A85)) 
    \FSM_sequential_gen_fwft.curr_fwft_state[0]_i_1 
       (.I0(curr_fwft_state[0]),
        .I1(rd_en),
        .I2(curr_fwft_state[1]),
        .I3(ram_empty_i),
        .O(next_fwft_state__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT4 #(
    .INIT(16'h3FF0)) 
    \FSM_sequential_gen_fwft.curr_fwft_state[1]_i_1 
       (.I0(ram_empty_i),
        .I1(rd_en),
        .I2(curr_fwft_state[1]),
        .I3(curr_fwft_state[0]),
        .O(next_fwft_state__0[1]));
  (* FSM_ENCODED_STATES = "invalid:00,stage1_valid:01,both_stages_valid:10,stage2_valid:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_gen_fwft.curr_fwft_state_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(next_fwft_state__0[0]),
        .Q(curr_fwft_state[0]),
        .R(xpm_fifo_rst_inst_n_1));
  (* FSM_ENCODED_STATES = "invalid:00,stage1_valid:01,both_stages_valid:10,stage2_valid:11" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_gen_fwft.curr_fwft_state_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(next_fwft_state__0[1]),
        .Q(curr_fwft_state[1]),
        .R(xpm_fifo_rst_inst_n_1));
  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT4 #(
    .INIT(16'hF380)) 
    \gen_fwft.empty_fwft_i_i_1 
       (.I0(rd_en),
        .I1(curr_fwft_state[0]),
        .I2(curr_fwft_state[1]),
        .I3(\gen_fwft.empty_fwft_i_reg_n_0 ),
        .O(data_valid_fwft1));
  FDSE #(
    .INIT(1'b1)) 
    \gen_fwft.empty_fwft_i_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(data_valid_fwft1),
        .Q(\gen_fwft.empty_fwft_i_reg_n_0 ),
        .S(xpm_fifo_rst_inst_n_1));
  LUT4 #(
    .INIT(16'h3575)) 
    \gen_fwft.gdvld_fwft.data_valid_fwft_i_1 
       (.I0(\gen_fwft.empty_fwft_i_reg_n_0 ),
        .I1(curr_fwft_state[1]),
        .I2(curr_fwft_state[0]),
        .I3(rd_en),
        .O(\gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_fwft.gdvld_fwft.data_valid_fwft_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gen_fwft.gdvld_fwft.data_valid_fwft_i_1_n_0 ),
        .Q(data_valid),
        .R(xpm_fifo_rst_inst_n_1));
  FDSE #(
    .INIT(1'b1)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(rdp_inst_n_30),
        .Q(\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0 ),
        .S(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(rdp_inst_n_16),
        .Q(full_n),
        .R(xpm_fifo_rst_inst_n_1));
  FDSE #(
    .INIT(1'b1)) 
    \gen_pntr_flags_cc.ram_empty_i_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(ram_empty_i0),
        .Q(ram_empty_i),
        .S(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(diff_pntr_pe[0]),
        .Q(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[0] ),
        .R(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[10] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(diff_pntr_pe[10]),
        .Q(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[10] ),
        .R(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[11] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(diff_pntr_pe[11]),
        .Q(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[11] ),
        .R(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[12] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(diff_pntr_pe[12]),
        .Q(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[12] ),
        .R(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(diff_pntr_pe[13]),
        .Q(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[13] ),
        .R(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(diff_pntr_pe[1]),
        .Q(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[1] ),
        .R(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(diff_pntr_pe[2]),
        .Q(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[2] ),
        .R(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[3] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(diff_pntr_pe[3]),
        .Q(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[3] ),
        .R(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[4] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(diff_pntr_pe[4]),
        .Q(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[4] ),
        .R(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[5] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(diff_pntr_pe[5]),
        .Q(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[5] ),
        .R(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[6] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(diff_pntr_pe[6]),
        .Q(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[6] ),
        .R(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(diff_pntr_pe[7]),
        .Q(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[7] ),
        .R(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[8] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(diff_pntr_pe[8]),
        .Q(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[8] ),
        .R(xpm_fifo_rst_inst_n_1));
  FDRE #(
    .INIT(1'b0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[9] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(diff_pntr_pe[9]),
        .Q(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[9] ),
        .R(xpm_fifo_rst_inst_n_1));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_2 
       (.I0(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_3_n_0 ),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[13] ),
        .I2(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[11] ),
        .I3(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[12] ),
        .I4(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_4_n_0 ),
        .I5(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_5_n_0 ),
        .O(prog_empty_i1));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_3 
       (.I0(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[3] ),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[0] ),
        .I2(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[9] ),
        .I3(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[7] ),
        .O(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_4 
       (.I0(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[10] ),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[8] ),
        .I2(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[6] ),
        .O(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h8000)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_5 
       (.I0(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[2] ),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[1] ),
        .I2(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[5] ),
        .I3(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg_n_0_[4] ),
        .O(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_5_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(xpm_fifo_rst_inst_n_2),
        .Q(prog_empty),
        .R(1'b0));
  FDRE \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.read_only_q_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(read_only),
        .Q(read_only_q),
        .R(xpm_fifo_rst_inst_n_1));
  FDRE \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg 
       (.C(wr_clk),
        .CE(1'b1),
        .D(write_only),
        .Q(write_only_q),
        .R(xpm_fifo_rst_inst_n_1));
  (* ADDR_WIDTH_A = "14" *) 
  (* ADDR_WIDTH_B = "14" *) 
  (* AUTO_SLEEP_TIME = "0" *) 
  (* BYTE_WRITE_WIDTH_A = "84" *) 
  (* BYTE_WRITE_WIDTH_B = "84" *) 
  (* CASCADE_HEIGHT = "0" *) 
  (* CLOCKING_MODE = "0" *) 
  (* ECC_BIT_RANGE = "[7:0]" *) 
  (* ECC_MODE = "0" *) 
  (* ECC_TYPE = "NONE" *) 
  (* IGNORE_INIT_SYNTH = "0" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* MAX_NUM_CHAR = "0" *) 
  (* \MEM.ADDRESS_SPACE  *) 
  (* \MEM.ADDRESS_SPACE_BEGIN  = "0" *) 
  (* \MEM.ADDRESS_SPACE_DATA_LSB  = "0" *) 
  (* \MEM.ADDRESS_SPACE_DATA_MSB  = "64" *) 
  (* \MEM.ADDRESS_SPACE_END  = "16383" *) 
  (* \MEM.CORE_MEMORY_WIDTH  = "65" *) 
  (* MEMORY_INIT_FILE = "none" *) 
  (* MEMORY_INIT_PARAM = "" *) 
  (* MEMORY_OPTIMIZATION = "true" *) 
  (* MEMORY_PRIMITIVE = "0" *) 
  (* MEMORY_SIZE = "1376256" *) 
  (* MEMORY_TYPE = "1" *) 
  (* MESSAGE_CONTROL = "0" *) 
  (* NUM_CHAR_LOC = "0" *) 
  (* P_ECC_MODE = "no_ecc" *) 
  (* P_ENABLE_BYTE_WRITE_A = "0" *) 
  (* P_ENABLE_BYTE_WRITE_B = "0" *) 
  (* P_MAX_DEPTH_DATA = "16384" *) 
  (* P_MEMORY_OPT = "yes" *) 
  (* P_MEMORY_PRIMITIVE = "auto" *) 
  (* P_MIN_WIDTH_DATA = "84" *) 
  (* P_MIN_WIDTH_DATA_A = "84" *) 
  (* P_MIN_WIDTH_DATA_B = "84" *) 
  (* P_MIN_WIDTH_DATA_ECC = "84" *) 
  (* P_MIN_WIDTH_DATA_LDW = "4" *) 
  (* P_MIN_WIDTH_DATA_SHFT = "84" *) 
  (* P_NUM_COLS_WRITE_A = "1" *) 
  (* P_NUM_COLS_WRITE_B = "1" *) 
  (* P_NUM_ROWS_READ_A = "1" *) 
  (* P_NUM_ROWS_READ_B = "1" *) 
  (* P_NUM_ROWS_WRITE_A = "1" *) 
  (* P_NUM_ROWS_WRITE_B = "1" *) 
  (* P_SDP_WRITE_MODE = "yes" *) 
  (* P_WIDTH_ADDR_LSB_READ_A = "0" *) 
  (* P_WIDTH_ADDR_LSB_READ_B = "0" *) 
  (* P_WIDTH_ADDR_LSB_WRITE_A = "0" *) 
  (* P_WIDTH_ADDR_LSB_WRITE_B = "0" *) 
  (* P_WIDTH_ADDR_READ_A = "14" *) 
  (* P_WIDTH_ADDR_READ_B = "14" *) 
  (* P_WIDTH_ADDR_WRITE_A = "14" *) 
  (* P_WIDTH_ADDR_WRITE_B = "14" *) 
  (* P_WIDTH_COL_WRITE_A = "84" *) 
  (* P_WIDTH_COL_WRITE_B = "84" *) 
  (* READ_DATA_WIDTH_A = "84" *) 
  (* READ_DATA_WIDTH_B = "84" *) 
  (* READ_LATENCY_A = "2" *) 
  (* READ_LATENCY_B = "2" *) 
  (* READ_RESET_VALUE_A = "0" *) 
  (* READ_RESET_VALUE_B = "" *) 
  (* RST_MODE_A = "SYNC" *) 
  (* RST_MODE_B = "SYNC" *) 
  (* SIM_ASSERT_CHK = "0" *) 
  (* USE_EMBEDDED_CONSTRAINT = "0" *) 
  (* USE_MEM_INIT = "0" *) 
  (* USE_MEM_INIT_MMI = "0" *) 
  (* VERSION = "0" *) 
  (* WAKEUP_TIME = "0" *) 
  (* WRITE_DATA_WIDTH_A = "84" *) 
  (* WRITE_DATA_WIDTH_B = "84" *) 
  (* WRITE_MODE_A = "2" *) 
  (* WRITE_MODE_B = "2" *) 
  (* WRITE_PROTECT = "1" *) 
  (* XPM_MODULE = "TRUE" *) 
  (* rsta_loop_iter = "84" *) 
  (* rstb_loop_iter = "84" *) 
  axis_data_fifo_0_xpm_memory_base \gen_sdpram.xpm_memory_base_inst 
       (.addra(wr_pntr_ext),
        .addrb(rd_pntr_ext),
        .clka(wr_clk),
        .clkb(1'b0),
        .dbiterra(\NLW_gen_sdpram.xpm_memory_base_inst_dbiterra_UNCONNECTED ),
        .dbiterrb(\NLW_gen_sdpram.xpm_memory_base_inst_dbiterrb_UNCONNECTED ),
        .dina({din[83],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,din[63:0]}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(\NLW_gen_sdpram.xpm_memory_base_inst_douta_UNCONNECTED [83:0]),
        .doutb(\^dout ),
        .ena(1'b0),
        .enb(rdp_inst_n_14),
        .injectdbiterra(1'b0),
        .injectdbiterrb(1'b0),
        .injectsbiterra(1'b0),
        .injectsbiterrb(1'b0),
        .regcea(1'b0),
        .regceb(\gen_fwft.ram_regout_en ),
        .rsta(1'b0),
        .rstb(xpm_fifo_rst_inst_n_1),
        .sbiterra(\NLW_gen_sdpram.xpm_memory_base_inst_sbiterra_UNCONNECTED ),
        .sbiterrb(\NLW_gen_sdpram.xpm_memory_base_inst_sbiterrb_UNCONNECTED ),
        .sleep(sleep),
        .wea(ram_wr_en_i),
        .web(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'h62)) 
    \gen_sdpram.xpm_memory_base_inst_i_3 
       (.I0(curr_fwft_state[0]),
        .I1(curr_fwft_state[1]),
        .I2(rd_en),
        .O(\gen_fwft.ram_regout_en ));
  axis_data_fifo_0_xpm_counter_updn__parameterized0 rdp_inst
       (.\FSM_sequential_gen_fwft.curr_fwft_state_reg[1] (rdp_inst_n_14),
        .Q(rd_pntr_ext),
        .S({rdp_inst_n_17,rdp_inst_n_18,rdp_inst_n_19,rdp_inst_n_20,rdp_inst_n_21,rdp_inst_n_22}),
        .clr_full(clr_full),
        .\count_value_i_reg[0]_0 (curr_fwft_state),
        .\count_value_i_reg[0]_1 (xpm_fifo_rst_inst_n_1),
        .\count_value_i_reg[7]_0 ({rdp_inst_n_23,rdp_inst_n_24,rdp_inst_n_25,rdp_inst_n_26,rdp_inst_n_27,rdp_inst_n_28,rdp_inst_n_29}),
        .\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg (rdp_inst_n_16),
        .\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_0 (rdp_inst_n_30),
        .\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_4_0 (count_value_i__0),
        .\gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_reg (\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0 ),
        .\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] (wr_pntr_ext),
        .leaving_empty0(leaving_empty0),
        .ram_empty_i(ram_empty_i),
        .ram_wr_en_i(ram_wr_en_i),
        .rd_en(rd_en),
        .wr_clk(wr_clk));
  axis_data_fifo_0_xpm_counter_updn__parameterized1 rdpp1_inst
       (.Q({rdpp1_inst_n_0,rdpp1_inst_n_1,rdpp1_inst_n_2,rdpp1_inst_n_3,rdpp1_inst_n_4,rdpp1_inst_n_5,rdpp1_inst_n_6,rdpp1_inst_n_7,rdpp1_inst_n_8,rdpp1_inst_n_9,rdpp1_inst_n_10,rdpp1_inst_n_11,rdpp1_inst_n_12,rdpp1_inst_n_13}),
        .\count_value_i_reg[0]_0 (rdp_inst_n_14),
        .\count_value_i_reg[0]_1 (xpm_fifo_rst_inst_n_1),
        .\count_value_i_reg[1]_0 (curr_fwft_state),
        .ram_empty_i(ram_empty_i),
        .rd_en(rd_en),
        .wr_clk(wr_clk));
  axis_data_fifo_0_xpm_fifo_reg_bit rst_d1_inst
       (.DI(rst_d1_inst_n_1),
        .Q(xpm_fifo_rst_inst_n_1),
        .clr_full(clr_full),
        .\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg (\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0 ),
        .\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_0 (rdp_inst_n_14),
        .\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_1 (\gen_fwft.empty_fwft_i_reg_n_0 ),
        .read_only(read_only),
        .rst(rst),
        .rst_d1(rst_d1),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .write_only(write_only));
  axis_data_fifo_0_xpm_counter_updn__parameterized0_0 wrp_inst
       (.D(diff_pntr_pe),
        .DI(rst_d1_inst_n_1),
        .Q(wr_pntr_ext),
        .S({rdp_inst_n_23,rdp_inst_n_24,rdp_inst_n_25,rdp_inst_n_26,rdp_inst_n_27,rdp_inst_n_28,rdp_inst_n_29,xpm_fifo_rst_inst_n_3}),
        .\count_value_i_reg[13]_0 (xpm_fifo_rst_inst_n_1),
        .\count_value_i_reg[6]_0 (\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0 ),
        .\gen_pntr_flags_cc.ram_empty_i_i_2_0 ({rdpp1_inst_n_0,rdpp1_inst_n_1,rdpp1_inst_n_2,rdpp1_inst_n_3,rdpp1_inst_n_4,rdpp1_inst_n_5,rdpp1_inst_n_6,rdpp1_inst_n_7,rdpp1_inst_n_8,rdpp1_inst_n_9,rdpp1_inst_n_10,rdpp1_inst_n_11,rdpp1_inst_n_12,rdpp1_inst_n_13}),
        .\gen_pntr_flags_cc.ram_empty_i_reg (rdp_inst_n_14),
        .\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[13] ({rdp_inst_n_17,rdp_inst_n_18,rdp_inst_n_19,rdp_inst_n_20,rdp_inst_n_21,rdp_inst_n_22}),
        .leaving_empty0(leaving_empty0),
        .ram_empty_i(ram_empty_i),
        .ram_empty_i0(ram_empty_i0),
        .ram_wr_en_i(ram_wr_en_i),
        .rst_d1(rst_d1),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
  axis_data_fifo_0_xpm_counter_updn__parameterized1_1 wrpp1_inst
       (.Q(count_value_i__0),
        .\count_value_i_reg[0]_0 (xpm_fifo_rst_inst_n_1),
        .\count_value_i_reg[6]_0 (\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0 ),
        .ram_wr_en_i(ram_wr_en_i),
        .rst_d1(rst_d1),
        .wr_clk(wr_clk),
        .wr_en(wr_en));
  axis_data_fifo_0_xpm_fifo_rst xpm_fifo_rst_inst
       (.Q(xpm_fifo_rst_inst_n_1),
        .S(xpm_fifo_rst_inst_n_3),
        .\count_value_i_reg[13] (\gen_pntr_flags_cc.gen_full_rst_val.ram_full_i_reg_n_0 ),
        .\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7] (rdp_inst_n_14),
        .\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_0 (\gen_fwft.empty_fwft_i_reg_n_0 ),
        .\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_1 (rd_pntr_ext[0]),
        .\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg (xpm_fifo_rst_inst_n_2),
        .prog_empty(prog_empty),
        .prog_empty_i1(prog_empty_i1),
        .ram_wr_en_i(ram_wr_en_i),
        .read_only_q(read_only_q),
        .rst(rst),
        .rst_d1(rst_d1),
        .wr_clk(wr_clk),
        .wr_en(wr_en),
        .write_only_q(write_only_q));
endmodule

(* ORIG_REF_NAME = "xpm_fifo_reg_bit" *) 
module axis_data_fifo_0_xpm_fifo_reg_bit
   (rst_d1,
    DI,
    clr_full,
    write_only,
    read_only,
    Q,
    wr_clk,
    wr_en,
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg ,
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_0 ,
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_1 ,
    rst);
  output rst_d1;
  output [0:0]DI;
  output clr_full;
  output write_only;
  output read_only;
  input [0:0]Q;
  input wr_clk;
  input wr_en;
  input \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg ;
  input \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_0 ;
  input \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_1 ;
  input rst;

  wire [0:0]DI;
  wire [0:0]Q;
  wire clr_full;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_0 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_1 ;
  wire read_only;
  wire rst;
  wire rst_d1;
  wire wr_clk;
  wire wr_en;
  wire write_only;

  FDRE #(
    .INIT(1'b0)) 
    d_out_int_reg
       (.C(wr_clk),
        .CE(1'b1),
        .D(Q),
        .Q(rst_d1),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h04)) 
    \gen_pntr_flags_cc.gen_full_rst_val.ram_full_n_i_2 
       (.I0(rst),
        .I1(rst_d1),
        .I2(Q),
        .O(clr_full));
  LUT6 #(
    .INIT(64'hFFFFFFFF0010FFFF)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_2 
       (.I0(rst_d1),
        .I1(Q),
        .I2(wr_en),
        .I3(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg ),
        .I4(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_0 ),
        .I5(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_1 ),
        .O(DI));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT5 #(
    .INIT(32'h44444044)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.read_only_q_i_1 
       (.I0(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_1 ),
        .I1(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_0 ),
        .I2(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg ),
        .I3(wr_en),
        .I4(rst_d1),
        .O(read_only));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT5 #(
    .INIT(32'h04000404)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_i_1 
       (.I0(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg ),
        .I1(wr_en),
        .I2(rst_d1),
        .I3(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_1 ),
        .I4(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg_0 ),
        .O(write_only));
endmodule

(* ORIG_REF_NAME = "xpm_fifo_rst" *) 
module axis_data_fifo_0_xpm_fifo_rst
   (ram_wr_en_i,
    Q,
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg ,
    S,
    rst,
    wr_en,
    \count_value_i_reg[13] ,
    rst_d1,
    write_only_q,
    prog_empty,
    prog_empty_i1,
    read_only_q,
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7] ,
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_0 ,
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_1 ,
    wr_clk);
  output ram_wr_en_i;
  output [0:0]Q;
  output \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg ;
  output [0:0]S;
  input rst;
  input wr_en;
  input \count_value_i_reg[13] ;
  input rst_d1;
  input write_only_q;
  input prog_empty;
  input prog_empty_i1;
  input read_only_q;
  input \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7] ;
  input \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_0 ;
  input [0:0]\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_1 ;
  input wr_clk;

  wire [0:0]Q;
  wire [0:0]S;
  wire \count_value_i_reg[13] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7] ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_0 ;
  wire [0:0]\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_1 ;
  wire \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg ;
  wire [1:0]\gen_rst_cc.fifo_wr_rst_cc ;
  wire p_0_in;
  wire \power_on_rst_reg_n_0_[0] ;
  wire prog_empty;
  wire prog_empty_i1;
  wire ram_wr_en_i;
  wire read_only_q;
  wire rst;
  wire rst_d1;
  wire rst_i;
  wire wr_clk;
  wire wr_en;
  wire write_only_q;

  LUT5 #(
    .INIT(32'hFF2F00D0)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe[7]_i_10 
       (.I0(ram_wr_en_i),
        .I1(\count_value_i_reg[13] ),
        .I2(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7] ),
        .I3(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_0 ),
        .I4(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.diff_pntr_pe_reg[7]_1 ),
        .O(S));
  LUT5 #(
    .INIT(32'hFFFFFC4C)) 
    \gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.prog_empty_i_i_1 
       (.I0(write_only_q),
        .I1(prog_empty),
        .I2(prog_empty_i1),
        .I3(read_only_q),
        .I4(Q),
        .O(\gen_pntr_flags_cc.wrp_eq_rdp_pf_cc.gpe_cc_sym.write_only_q_reg ));
  LUT2 #(
    .INIT(4'hE)) 
    \gen_rst_cc.fifo_wr_rst_cc[2]_i_1 
       (.I0(p_0_in),
        .I1(rst),
        .O(rst_i));
  FDSE #(
    .INIT(1'b0)) 
    \gen_rst_cc.fifo_wr_rst_cc_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(1'b0),
        .Q(\gen_rst_cc.fifo_wr_rst_cc [0]),
        .S(rst_i));
  FDSE #(
    .INIT(1'b0)) 
    \gen_rst_cc.fifo_wr_rst_cc_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gen_rst_cc.fifo_wr_rst_cc [0]),
        .Q(\gen_rst_cc.fifo_wr_rst_cc [1]),
        .S(rst_i));
  FDSE #(
    .INIT(1'b0)) 
    \gen_rst_cc.fifo_wr_rst_cc_reg[2] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\gen_rst_cc.fifo_wr_rst_cc [1]),
        .Q(Q),
        .S(rst_i));
  LUT4 #(
    .INIT(16'h0002)) 
    \gen_sdpram.xpm_memory_base_inst_i_1 
       (.I0(wr_en),
        .I1(\count_value_i_reg[13] ),
        .I2(Q),
        .I3(rst_d1),
        .O(ram_wr_en_i));
  FDRE #(
    .INIT(1'b1)) 
    \power_on_rst_reg[0] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(1'b0),
        .Q(\power_on_rst_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \power_on_rst_reg[1] 
       (.C(wr_clk),
        .CE(1'b1),
        .D(\power_on_rst_reg_n_0_[0] ),
        .Q(p_0_in),
        .R(1'b0));
endmodule

(* ADDR_WIDTH_A = "14" *) (* ADDR_WIDTH_B = "14" *) (* AUTO_SLEEP_TIME = "0" *) 
(* BYTE_WRITE_WIDTH_A = "84" *) (* BYTE_WRITE_WIDTH_B = "84" *) (* CASCADE_HEIGHT = "0" *) 
(* CLOCKING_MODE = "0" *) (* ECC_BIT_RANGE = "[7:0]" *) (* ECC_MODE = "0" *) 
(* ECC_TYPE = "NONE" *) (* IGNORE_INIT_SYNTH = "0" *) (* MAX_NUM_CHAR = "0" *) 
(* MEMORY_INIT_FILE = "none" *) (* MEMORY_INIT_PARAM = "" *) (* MEMORY_OPTIMIZATION = "true" *) 
(* MEMORY_PRIMITIVE = "0" *) (* MEMORY_SIZE = "1376256" *) (* MEMORY_TYPE = "1" *) 
(* MESSAGE_CONTROL = "0" *) (* NUM_CHAR_LOC = "0" *) (* ORIG_REF_NAME = "xpm_memory_base" *) 
(* P_ECC_MODE = "no_ecc" *) (* P_ENABLE_BYTE_WRITE_A = "0" *) (* P_ENABLE_BYTE_WRITE_B = "0" *) 
(* P_MAX_DEPTH_DATA = "16384" *) (* P_MEMORY_OPT = "yes" *) (* P_MEMORY_PRIMITIVE = "auto" *) 
(* P_MIN_WIDTH_DATA = "84" *) (* P_MIN_WIDTH_DATA_A = "84" *) (* P_MIN_WIDTH_DATA_B = "84" *) 
(* P_MIN_WIDTH_DATA_ECC = "84" *) (* P_MIN_WIDTH_DATA_LDW = "4" *) (* P_MIN_WIDTH_DATA_SHFT = "84" *) 
(* P_NUM_COLS_WRITE_A = "1" *) (* P_NUM_COLS_WRITE_B = "1" *) (* P_NUM_ROWS_READ_A = "1" *) 
(* P_NUM_ROWS_READ_B = "1" *) (* P_NUM_ROWS_WRITE_A = "1" *) (* P_NUM_ROWS_WRITE_B = "1" *) 
(* P_SDP_WRITE_MODE = "yes" *) (* P_WIDTH_ADDR_LSB_READ_A = "0" *) (* P_WIDTH_ADDR_LSB_READ_B = "0" *) 
(* P_WIDTH_ADDR_LSB_WRITE_A = "0" *) (* P_WIDTH_ADDR_LSB_WRITE_B = "0" *) (* P_WIDTH_ADDR_READ_A = "14" *) 
(* P_WIDTH_ADDR_READ_B = "14" *) (* P_WIDTH_ADDR_WRITE_A = "14" *) (* P_WIDTH_ADDR_WRITE_B = "14" *) 
(* P_WIDTH_COL_WRITE_A = "84" *) (* P_WIDTH_COL_WRITE_B = "84" *) (* READ_DATA_WIDTH_A = "84" *) 
(* READ_DATA_WIDTH_B = "84" *) (* READ_LATENCY_A = "2" *) (* READ_LATENCY_B = "2" *) 
(* READ_RESET_VALUE_A = "0" *) (* READ_RESET_VALUE_B = "" *) (* RST_MODE_A = "SYNC" *) 
(* RST_MODE_B = "SYNC" *) (* SIM_ASSERT_CHK = "0" *) (* USE_EMBEDDED_CONSTRAINT = "0" *) 
(* USE_MEM_INIT = "0" *) (* USE_MEM_INIT_MMI = "0" *) (* VERSION = "0" *) 
(* WAKEUP_TIME = "0" *) (* WRITE_DATA_WIDTH_A = "84" *) (* WRITE_DATA_WIDTH_B = "84" *) 
(* WRITE_MODE_A = "2" *) (* WRITE_MODE_B = "2" *) (* WRITE_PROTECT = "1" *) 
(* XPM_MODULE = "TRUE" *) (* keep_hierarchy = "soft" *) (* rsta_loop_iter = "84" *) 
(* rstb_loop_iter = "84" *) 
module axis_data_fifo_0_xpm_memory_base
   (sleep,
    clka,
    rsta,
    ena,
    regcea,
    wea,
    addra,
    dina,
    injectsbiterra,
    injectdbiterra,
    douta,
    sbiterra,
    dbiterra,
    clkb,
    rstb,
    enb,
    regceb,
    web,
    addrb,
    dinb,
    injectsbiterrb,
    injectdbiterrb,
    doutb,
    sbiterrb,
    dbiterrb);
  input sleep;
  input clka;
  input rsta;
  input ena;
  input regcea;
  input [0:0]wea;
  input [13:0]addra;
  input [83:0]dina;
  input injectsbiterra;
  input injectdbiterra;
  output [83:0]douta;
  output sbiterra;
  output dbiterra;
  input clkb;
  input rstb;
  input enb;
  input regceb;
  input [0:0]web;
  input [13:0]addrb;
  input [83:0]dinb;
  input injectsbiterrb;
  input injectdbiterrb;
  output [83:0]doutb;
  output sbiterrb;
  output dbiterrb;

  wire \<const0> ;
  wire [13:0]addra;
  wire [13:0]addrb;
  wire clka;
  wire [83:0]dina;
  wire [83:0]\^doutb ;
  wire enb;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][0]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][10]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][11]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][12]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][13]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][14]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][15]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][16]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][17]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][18]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][19]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][1]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][20]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][21]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][22]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][23]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][24]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][25]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][26]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][27]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][28]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][29]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][2]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][30]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][31]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][32]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][33]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][34]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][35]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][3]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][4]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][5]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][6]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][7]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][8]_i_1_n_0 ;
  wire \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][9]_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_mux_sel_b_pos_0_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_100 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_101 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_102 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_103 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_104 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_105 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_106 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_107 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_108 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_109 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_110 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_111 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_112 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_113 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_114 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_115 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_116 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_117 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_118 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_119 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_120 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_121 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_122 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_123 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_124 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_125 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_126 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_127 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_128 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_129 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_130 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_131 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_144 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_145 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_146 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_147 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_100 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_101 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_102 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_103 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_104 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_105 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_106 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_107 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_108 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_109 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_110 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_111 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_112 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_113 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_114 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_115 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_116 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_117 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_118 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_119 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_120 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_121 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_122 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_123 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_124 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_125 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_126 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_127 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_128 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_129 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_130 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_131 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_144 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_145 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_146 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_147 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_1_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_2_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_0 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_1 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_136 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_137 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_138 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_139 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_36 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_37 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_38 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_39 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_40 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_41 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_42 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_43 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_44 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_45 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_46 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_47 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_48 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_49 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_50 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_51 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_52 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_53 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_54 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_55 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_56 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_57 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_58 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_59 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_60 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_61 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_62 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_63 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_64 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_65 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_66 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_67 ;
  wire \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ;
  wire regceb;
  wire rstb;
  wire sleep;
  wire [0:0]wea;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_CASDOUTA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_CASDOUTPA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_CASDOUTA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_CASDOUTPA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_CASDOUTA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_CASDOUTPA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_CASDOUTA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_CASDOUTPA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_CASDOUTA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_CASDOUTPA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_CASDOUTA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_CASDOUTPA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_CASDOUTA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_CASDOUTPA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASOUTDBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASOUTSBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTPA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_DOUTADOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_DOUTPADOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTA_UNCONNECTED ;
  wire [31:16]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTPA_UNCONNECTED ;
  wire [3:2]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTA_UNCONNECTED ;
  wire [31:16]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTPA_UNCONNECTED ;
  wire [3:2]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTA_UNCONNECTED ;
  wire [31:16]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTPA_UNCONNECTED ;
  wire [3:2]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTA_UNCONNECTED ;
  wire [31:16]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTPA_UNCONNECTED ;
  wire [3:2]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_CASDOUTA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_CASDOUTPA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTA_UNCONNECTED ;
  wire [31:16]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTPA_UNCONNECTED ;
  wire [3:2]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTA_UNCONNECTED ;
  wire [31:16]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTPA_UNCONNECTED ;
  wire [3:2]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTA_UNCONNECTED ;
  wire [31:16]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTPA_UNCONNECTED ;
  wire [3:2]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASOUTDBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASOUTSBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTPA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTADOUT_UNCONNECTED ;
  wire [31:16]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTPADOUTP_UNCONNECTED ;
  wire [3:2]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTA_UNCONNECTED ;
  wire [31:8]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTPA_UNCONNECTED ;
  wire [3:1]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTA_UNCONNECTED ;
  wire [31:8]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTPA_UNCONNECTED ;
  wire [3:1]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTA_UNCONNECTED ;
  wire [31:8]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTPA_UNCONNECTED ;
  wire [3:1]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASOUTDBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASOUTSBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTPA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTADOUT_UNCONNECTED ;
  wire [31:8]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTPADOUTP_UNCONNECTED ;
  wire [3:1]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASOUTDBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASOUTSBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTPA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTADOUT_UNCONNECTED ;
  wire [31:2]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_CASDOUTA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_CASDOUTPA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_CASDOUTA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_CASDOUTPA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_CASDOUTA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_CASDOUTPA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_CASDOUTA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_CASDOUTPA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASOUTDBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASOUTSBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTB_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTPA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTPB_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_DOUTADOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_DOUTPADOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_CASDOUTA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_CASDOUTPA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_RDADDRECC_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DBITERR_UNCONNECTED ;
  wire \NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_SBITERR_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_CASDOUTA_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_CASDOUTPA_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTADOUT_UNCONNECTED ;
  wire [31:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTBDOUT_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTPADOUTP_UNCONNECTED ;
  wire [3:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTPBDOUTP_UNCONNECTED ;
  wire [7:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_ECCPARITY_UNCONNECTED ;
  wire [8:0]\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_RDADDRECC_UNCONNECTED ;

  assign dbiterra = \<const0> ;
  assign dbiterrb = \<const0> ;
  assign douta[83] = \<const0> ;
  assign douta[82] = \<const0> ;
  assign douta[81] = \<const0> ;
  assign douta[80] = \<const0> ;
  assign douta[79] = \<const0> ;
  assign douta[78] = \<const0> ;
  assign douta[77] = \<const0> ;
  assign douta[76] = \<const0> ;
  assign douta[75] = \<const0> ;
  assign douta[74] = \<const0> ;
  assign douta[73] = \<const0> ;
  assign douta[72] = \<const0> ;
  assign douta[71] = \<const0> ;
  assign douta[70] = \<const0> ;
  assign douta[69] = \<const0> ;
  assign douta[68] = \<const0> ;
  assign douta[67] = \<const0> ;
  assign douta[66] = \<const0> ;
  assign douta[65] = \<const0> ;
  assign douta[64] = \<const0> ;
  assign douta[63] = \<const0> ;
  assign douta[62] = \<const0> ;
  assign douta[61] = \<const0> ;
  assign douta[60] = \<const0> ;
  assign douta[59] = \<const0> ;
  assign douta[58] = \<const0> ;
  assign douta[57] = \<const0> ;
  assign douta[56] = \<const0> ;
  assign douta[55] = \<const0> ;
  assign douta[54] = \<const0> ;
  assign douta[53] = \<const0> ;
  assign douta[52] = \<const0> ;
  assign douta[51] = \<const0> ;
  assign douta[50] = \<const0> ;
  assign douta[49] = \<const0> ;
  assign douta[48] = \<const0> ;
  assign douta[47] = \<const0> ;
  assign douta[46] = \<const0> ;
  assign douta[45] = \<const0> ;
  assign douta[44] = \<const0> ;
  assign douta[43] = \<const0> ;
  assign douta[42] = \<const0> ;
  assign douta[41] = \<const0> ;
  assign douta[40] = \<const0> ;
  assign douta[39] = \<const0> ;
  assign douta[38] = \<const0> ;
  assign douta[37] = \<const0> ;
  assign douta[36] = \<const0> ;
  assign douta[35] = \<const0> ;
  assign douta[34] = \<const0> ;
  assign douta[33] = \<const0> ;
  assign douta[32] = \<const0> ;
  assign douta[31] = \<const0> ;
  assign douta[30] = \<const0> ;
  assign douta[29] = \<const0> ;
  assign douta[28] = \<const0> ;
  assign douta[27] = \<const0> ;
  assign douta[26] = \<const0> ;
  assign douta[25] = \<const0> ;
  assign douta[24] = \<const0> ;
  assign douta[23] = \<const0> ;
  assign douta[22] = \<const0> ;
  assign douta[21] = \<const0> ;
  assign douta[20] = \<const0> ;
  assign douta[19] = \<const0> ;
  assign douta[18] = \<const0> ;
  assign douta[17] = \<const0> ;
  assign douta[16] = \<const0> ;
  assign douta[15] = \<const0> ;
  assign douta[14] = \<const0> ;
  assign douta[13] = \<const0> ;
  assign douta[12] = \<const0> ;
  assign douta[11] = \<const0> ;
  assign douta[10] = \<const0> ;
  assign douta[9] = \<const0> ;
  assign douta[8] = \<const0> ;
  assign douta[7] = \<const0> ;
  assign douta[6] = \<const0> ;
  assign douta[5] = \<const0> ;
  assign douta[4] = \<const0> ;
  assign douta[3] = \<const0> ;
  assign douta[2] = \<const0> ;
  assign douta[1] = \<const0> ;
  assign douta[0] = \<const0> ;
  assign doutb[83] = \^doutb [83];
  assign doutb[82] = \<const0> ;
  assign doutb[81] = \<const0> ;
  assign doutb[80] = \<const0> ;
  assign doutb[79] = \<const0> ;
  assign doutb[78] = \<const0> ;
  assign doutb[77] = \<const0> ;
  assign doutb[76] = \<const0> ;
  assign doutb[75] = \<const0> ;
  assign doutb[74] = \<const0> ;
  assign doutb[73] = \<const0> ;
  assign doutb[72] = \<const0> ;
  assign doutb[71] = \<const0> ;
  assign doutb[70] = \<const0> ;
  assign doutb[69] = \<const0> ;
  assign doutb[68] = \<const0> ;
  assign doutb[67] = \<const0> ;
  assign doutb[66] = \<const0> ;
  assign doutb[65] = \<const0> ;
  assign doutb[64] = \<const0> ;
  assign doutb[63:0] = \^doutb [63:0];
  assign sbiterra = \<const0> ;
  assign sbiterrb = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][0]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_131 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_131 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][10]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_121 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_121 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][11]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_120 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_120 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][12]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_119 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_119 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][13]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_118 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_118 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][14]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_117 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_117 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][15]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_116 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_116 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][16]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_115 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_115 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][17]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_114 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_114 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][18]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_113 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_113 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][19]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_112 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_112 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][1]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_130 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_130 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][20]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_111 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_111 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][21]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_110 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_110 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][22]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_109 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_109 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][23]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_108 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_108 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][24]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_107 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_107 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][25]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_106 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_106 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][26]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_105 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_105 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][27]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_104 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_104 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][28]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_103 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_103 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][29]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_102 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_102 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][2]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_129 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_129 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][30]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_101 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_101 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][31]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_100 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_100 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][32]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_147 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_147 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][32]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][33]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_146 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_146 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][33]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][34]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_145 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_145 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][34]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][35]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_144 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_144 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][35]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][3]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_128 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_128 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][4]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_127 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_127 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][5]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_126 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_126 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][6]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_125 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_125 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][7]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_124 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_124 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][8]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_123 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_123 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][9]_i_1 
       (.I0(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_122 ),
        .I1(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_122 ),
        .O(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][0] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][0]_i_1_n_0 ),
        .Q(\^doutb [0]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][10] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][10]_i_1_n_0 ),
        .Q(\^doutb [10]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][11] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][11]_i_1_n_0 ),
        .Q(\^doutb [11]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][12] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][12]_i_1_n_0 ),
        .Q(\^doutb [12]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][13] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][13]_i_1_n_0 ),
        .Q(\^doutb [13]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][14] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][14]_i_1_n_0 ),
        .Q(\^doutb [14]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][15] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][15]_i_1_n_0 ),
        .Q(\^doutb [15]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][16] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][16]_i_1_n_0 ),
        .Q(\^doutb [16]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][17] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][17]_i_1_n_0 ),
        .Q(\^doutb [17]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][18] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][18]_i_1_n_0 ),
        .Q(\^doutb [18]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][19] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][19]_i_1_n_0 ),
        .Q(\^doutb [19]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][1] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][1]_i_1_n_0 ),
        .Q(\^doutb [1]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][20] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][20]_i_1_n_0 ),
        .Q(\^doutb [20]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][21] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][21]_i_1_n_0 ),
        .Q(\^doutb [21]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][22] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][22]_i_1_n_0 ),
        .Q(\^doutb [22]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][23] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][23]_i_1_n_0 ),
        .Q(\^doutb [23]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][24] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][24]_i_1_n_0 ),
        .Q(\^doutb [24]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][25] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][25]_i_1_n_0 ),
        .Q(\^doutb [25]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][26] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][26]_i_1_n_0 ),
        .Q(\^doutb [26]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][27] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][27]_i_1_n_0 ),
        .Q(\^doutb [27]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][28] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][28]_i_1_n_0 ),
        .Q(\^doutb [28]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][29] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][29]_i_1_n_0 ),
        .Q(\^doutb [29]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][2] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][2]_i_1_n_0 ),
        .Q(\^doutb [2]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][30] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][30]_i_1_n_0 ),
        .Q(\^doutb [30]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][31] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][31]_i_1_n_0 ),
        .Q(\^doutb [31]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][32] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][32]_i_1_n_0 ),
        .Q(\^doutb [32]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][33] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][33]_i_1_n_0 ),
        .Q(\^doutb [33]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][34] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][34]_i_1_n_0 ),
        .Q(\^doutb [34]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][35] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][35]_i_1_n_0 ),
        .Q(\^doutb [35]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][3] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][3]_i_1_n_0 ),
        .Q(\^doutb [3]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][4] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][4]_i_1_n_0 ),
        .Q(\^doutb [4]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][5] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][5]_i_1_n_0 ),
        .Q(\^doutb [5]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][6] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][6]_i_1_n_0 ),
        .Q(\^doutb [6]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][7] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][7]_i_1_n_0 ),
        .Q(\^doutb [7]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][8] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][8]_i_1_n_0 ),
        .Q(\^doutb [8]),
        .R(rstb));
  FDRE #(
    .INIT(1'b0)) 
    \gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe_reg[0][9] 
       (.C(clka),
        .CE(regceb),
        .D(\gen_rd_b.gen_doutb_pipe.gen_stage.doutb_pipe[0][9]_i_1_n_0 ),
        .Q(\^doutb [9]),
        .R(rstb));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \gen_wr_a.gen_word_narrow.mem_mux_sel_b_pos_0_i_1 
       (.I0(addrb[13]),
        .I1(enb),
        .I2(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .O(\gen_wr_a.gen_word_narrow.mem_mux_sel_b_pos_0_i_1_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTA.ADDRESS_END  = "1023" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTB.ADDRESS_END  = "1023" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_0" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("FIRST"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_0 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_139 }),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_1_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_2_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_0_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_1 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[11]),
        .I3(addra[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_2 
       (.I0(enb),
        .I1(addrb[12]),
        .I2(addrb[13]),
        .I3(addrb[10]),
        .I4(addrb[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h00000002)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3 
       (.I0(wea),
        .I1(addra[10]),
        .I2(addra[11]),
        .I3(addra[12]),
        .I4(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_0_i_3_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "1024" *) 
  (* \MEM.PORTA.ADDRESS_END  = "2047" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "1024" *) 
  (* \MEM.PORTB.ADDRESS_END  = "2047" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_1" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "1024" *) 
  (* ram_addr_end = "2047" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_1 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_0_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_1_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "10240" *) 
  (* \MEM.PORTA.ADDRESS_END  = "11263" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "10240" *) 
  (* \MEM.PORTB.ADDRESS_END  = "11263" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_10" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "10240" *) 
  (* ram_addr_end = "11263" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_10 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_1_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_2_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_10_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_1 
       (.I0(addra[12]),
        .I1(addra[10]),
        .I2(addra[13]),
        .I3(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_2 
       (.I0(enb),
        .I1(addrb[11]),
        .I2(addrb[13]),
        .I3(addrb[12]),
        .I4(addrb[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3 
       (.I0(wea),
        .I1(addra[11]),
        .I2(addra[13]),
        .I3(addra[10]),
        .I4(addra[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_10_i_3_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "11264" *) 
  (* \MEM.PORTA.ADDRESS_END  = "12287" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "11264" *) 
  (* \MEM.PORTB.ADDRESS_END  = "12287" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_11" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "11264" *) 
  (* ram_addr_end = "12287" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_11 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_10_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_1_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_2_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_11_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_1 
       (.I0(addra[10]),
        .I1(addra[12]),
        .I2(addra[13]),
        .I3(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_2 
       (.I0(enb),
        .I1(addrb[11]),
        .I2(addrb[13]),
        .I3(addrb[12]),
        .I4(addrb[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3 
       (.I0(wea),
        .I1(addra[11]),
        .I2(addra[13]),
        .I3(addra[12]),
        .I4(addra[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_11_i_3_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "12288" *) 
  (* \MEM.PORTA.ADDRESS_END  = "13311" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "12288" *) 
  (* \MEM.PORTB.ADDRESS_END  = "13311" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_12" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "12288" *) 
  (* ram_addr_end = "13311" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_12 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_11_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_1_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_2_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_12_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h0008)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_1 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[11]),
        .I3(addra[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h02000000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_2 
       (.I0(enb),
        .I1(addrb[11]),
        .I2(addrb[10]),
        .I3(addrb[12]),
        .I4(addrb[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h02000000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3 
       (.I0(wea),
        .I1(addra[10]),
        .I2(addra[11]),
        .I3(addra[12]),
        .I4(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_12_i_3_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "13312" *) 
  (* \MEM.PORTA.ADDRESS_END  = "14335" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "13312" *) 
  (* \MEM.PORTB.ADDRESS_END  = "14335" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_13" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "13312" *) 
  (* ram_addr_end = "14335" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_13 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_12_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_1_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_2_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_13_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_1 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[10]),
        .I3(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_2 
       (.I0(enb),
        .I1(addrb[11]),
        .I2(addrb[10]),
        .I3(addrb[12]),
        .I4(addrb[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3 
       (.I0(wea),
        .I1(addra[11]),
        .I2(addra[10]),
        .I3(addra[12]),
        .I4(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_13_i_3_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "14336" *) 
  (* \MEM.PORTA.ADDRESS_END  = "15359" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "14336" *) 
  (* \MEM.PORTB.ADDRESS_END  = "15359" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_14" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "14336" *) 
  (* ram_addr_end = "15359" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_14 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_13_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_1_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_2_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_14_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_1 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[11]),
        .I3(addra[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_2 
       (.I0(enb),
        .I1(addrb[10]),
        .I2(addrb[11]),
        .I3(addrb[12]),
        .I4(addrb[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3 
       (.I0(wea),
        .I1(addra[10]),
        .I2(addra[11]),
        .I3(addra[12]),
        .I4(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_14_i_3_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "15360" *) 
  (* \MEM.PORTA.ADDRESS_END  = "16383" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "15360" *) 
  (* \MEM.PORTB.ADDRESS_END  = "16383" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_15" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "15360" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_15 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTB_UNCONNECTED [31:0]),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASDOUTPB_UNCONNECTED [3:0]),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_14_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASOUTDBITERR_UNCONNECTED ),
        .CASOUTSBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_CASOUTSBITERR_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT({\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_100 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_101 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_102 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_103 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_104 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_105 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_106 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_107 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_108 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_109 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_110 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_111 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_112 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_113 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_114 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_115 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_116 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_117 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_118 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_119 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_120 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_121 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_122 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_123 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_124 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_125 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_126 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_127 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_128 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_129 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_130 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_131 }),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP({\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_144 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_145 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_146 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_n_147 }),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_1_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_2_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_15_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_1 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[11]),
        .I3(addra[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_2 
       (.I0(enb),
        .I1(addrb[10]),
        .I2(addrb[11]),
        .I3(addrb[12]),
        .I4(addrb[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3 
       (.I0(wea),
        .I1(addra[10]),
        .I2(addra[11]),
        .I3(addra[12]),
        .I4(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_15_i_3_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTA.ADDRESS_END  = "2047" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTA.DATA_LSB  = "36" *) 
  (* \MEM.PORTA.DATA_MSB  = "53" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTB.ADDRESS_END  = "2047" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTB.DATA_LSB  = "36" *) 
  (* \MEM.PORTB.DATA_MSB  = "53" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_16" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "2047" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "53" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("FIRST"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_16 
       (.ADDRARDADDR({addra[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTB_UNCONNECTED [31:16],\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_CASDOUTPB_UNCONNECTED [3:2],\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_139 }),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[51:36]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,dina[53:52]}),
        .DINPBDINP({1'b0,1'b0,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_1_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_2_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_16_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_1 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_2 
       (.I0(enb),
        .I1(addrb[11]),
        .I2(addrb[12]),
        .I3(addrb[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3 
       (.I0(wea),
        .I1(addra[11]),
        .I2(addra[12]),
        .I3(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_16_i_3_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "2048" *) 
  (* \MEM.PORTA.ADDRESS_END  = "4095" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTA.DATA_LSB  = "36" *) 
  (* \MEM.PORTA.DATA_MSB  = "53" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "2048" *) 
  (* \MEM.PORTB.ADDRESS_END  = "4095" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTB.DATA_LSB  = "36" *) 
  (* \MEM.PORTB.DATA_MSB  = "53" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_17" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "2048" *) 
  (* ram_addr_end = "4095" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "53" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_17 
       (.ADDRARDADDR({addra[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTB_UNCONNECTED [31:16],\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_CASDOUTPB_UNCONNECTED [3:2],\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_16_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[51:36]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,dina[53:52]}),
        .DINPBDINP({1'b0,1'b0,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_17_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_1 
       (.I0(addrb[12]),
        .I1(addrb[13]),
        .I2(addrb[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_2 
       (.I0(addra[11]),
        .I1(addra[13]),
        .I2(addra[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_3 
       (.I0(enb),
        .I1(addrb[12]),
        .I2(addrb[13]),
        .I3(addrb[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4 
       (.I0(wea),
        .I1(addra[12]),
        .I2(addra[13]),
        .I3(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_17_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "4096" *) 
  (* \MEM.PORTA.ADDRESS_END  = "6143" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTA.DATA_LSB  = "36" *) 
  (* \MEM.PORTA.DATA_MSB  = "53" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "4096" *) 
  (* \MEM.PORTB.ADDRESS_END  = "6143" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTB.DATA_LSB  = "36" *) 
  (* \MEM.PORTB.DATA_MSB  = "53" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_18" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "4096" *) 
  (* ram_addr_end = "6143" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "53" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_18 
       (.ADDRARDADDR({addra[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTB_UNCONNECTED [31:16],\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_CASDOUTPB_UNCONNECTED [3:2],\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_17_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[51:36]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,dina[53:52]}),
        .DINPBDINP({1'b0,1'b0,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_18_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_1 
       (.I0(addrb[11]),
        .I1(addrb[13]),
        .I2(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_2 
       (.I0(addra[12]),
        .I1(addra[13]),
        .I2(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_3 
       (.I0(enb),
        .I1(addrb[11]),
        .I2(addrb[13]),
        .I3(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4 
       (.I0(wea),
        .I1(addra[11]),
        .I2(addra[13]),
        .I3(addra[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_18_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "6144" *) 
  (* \MEM.PORTA.ADDRESS_END  = "8191" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTA.DATA_LSB  = "36" *) 
  (* \MEM.PORTA.DATA_MSB  = "53" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "6144" *) 
  (* \MEM.PORTB.ADDRESS_END  = "8191" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTB.DATA_LSB  = "36" *) 
  (* \MEM.PORTB.DATA_MSB  = "53" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_19" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "6144" *) 
  (* ram_addr_end = "8191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "53" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_19 
       (.ADDRARDADDR({addra[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTB_UNCONNECTED [31:16],\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_CASDOUTPB_UNCONNECTED [3:2],\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_18_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[51:36]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,dina[53:52]}),
        .DINPBDINP({1'b0,1'b0,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_19_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_1 
       (.I0(addrb[13]),
        .I1(addrb[11]),
        .I2(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_2 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_3 
       (.I0(enb),
        .I1(addrb[13]),
        .I2(addrb[11]),
        .I3(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4 
       (.I0(wea),
        .I1(addra[11]),
        .I2(addra[12]),
        .I3(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_19_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_1 
       (.I0(addrb[10]),
        .I1(addrb[12]),
        .I2(addrb[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_2 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[10]),
        .I3(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_3 
       (.I0(enb),
        .I1(addrb[11]),
        .I2(addrb[10]),
        .I3(addrb[12]),
        .I4(addrb[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4 
       (.I0(wea),
        .I1(addra[11]),
        .I2(addra[10]),
        .I3(addra[12]),
        .I4(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "2048" *) 
  (* \MEM.PORTA.ADDRESS_END  = "3071" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "2048" *) 
  (* \MEM.PORTB.ADDRESS_END  = "3071" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_2" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "2048" *) 
  (* ram_addr_end = "3071" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_2 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_1_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_2_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "8192" *) 
  (* \MEM.PORTA.ADDRESS_END  = "10239" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTA.DATA_LSB  = "36" *) 
  (* \MEM.PORTA.DATA_MSB  = "53" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "8192" *) 
  (* \MEM.PORTB.ADDRESS_END  = "10239" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTB.DATA_LSB  = "36" *) 
  (* \MEM.PORTB.DATA_MSB  = "53" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_20" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "8192" *) 
  (* ram_addr_end = "10239" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "53" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_20 
       (.ADDRARDADDR({addra[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTB_UNCONNECTED [31:16],\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_CASDOUTPB_UNCONNECTED [3:2],\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_19_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[51:36]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,dina[53:52]}),
        .DINPBDINP({1'b0,1'b0,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_20_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_1 
       (.I0(addrb[11]),
        .I1(addrb[12]),
        .I2(addrb[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_2 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_3 
       (.I0(enb),
        .I1(addrb[11]),
        .I2(addrb[12]),
        .I3(addrb[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4 
       (.I0(wea),
        .I1(addra[11]),
        .I2(addra[12]),
        .I3(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_20_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "10240" *) 
  (* \MEM.PORTA.ADDRESS_END  = "12287" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTA.DATA_LSB  = "36" *) 
  (* \MEM.PORTA.DATA_MSB  = "53" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "10240" *) 
  (* \MEM.PORTB.ADDRESS_END  = "12287" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTB.DATA_LSB  = "36" *) 
  (* \MEM.PORTB.DATA_MSB  = "53" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_21" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "10240" *) 
  (* ram_addr_end = "12287" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "53" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_21 
       (.ADDRARDADDR({addra[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTB_UNCONNECTED [31:16],\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_CASDOUTPB_UNCONNECTED [3:2],\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_20_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[51:36]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,dina[53:52]}),
        .DINPBDINP({1'b0,1'b0,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_21_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_1 
       (.I0(addrb[11]),
        .I1(addrb[13]),
        .I2(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'h40)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_2 
       (.I0(addra[12]),
        .I1(addra[13]),
        .I2(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_3 
       (.I0(enb),
        .I1(addrb[11]),
        .I2(addrb[13]),
        .I3(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4 
       (.I0(wea),
        .I1(addra[11]),
        .I2(addra[13]),
        .I3(addra[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_21_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "12288" *) 
  (* \MEM.PORTA.ADDRESS_END  = "14335" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTA.DATA_LSB  = "36" *) 
  (* \MEM.PORTA.DATA_MSB  = "53" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "12288" *) 
  (* \MEM.PORTB.ADDRESS_END  = "14335" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTB.DATA_LSB  = "36" *) 
  (* \MEM.PORTB.DATA_MSB  = "53" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_22" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "12288" *) 
  (* ram_addr_end = "14335" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "53" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_22 
       (.ADDRARDADDR({addra[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTB_UNCONNECTED [31:16],\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_CASDOUTPB_UNCONNECTED [3:2],\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_21_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[51:36]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,dina[53:52]}),
        .DINPBDINP({1'b0,1'b0,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_22_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_1 
       (.I0(addrb[11]),
        .I1(addrb[12]),
        .I2(addrb[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_2 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_3 
       (.I0(enb),
        .I1(addrb[11]),
        .I2(addrb[12]),
        .I3(addrb[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4 
       (.I0(wea),
        .I1(addra[11]),
        .I2(addra[12]),
        .I3(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_22_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "14336" *) 
  (* \MEM.PORTA.ADDRESS_END  = "16383" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTA.DATA_LSB  = "36" *) 
  (* \MEM.PORTA.DATA_MSB  = "53" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "14336" *) 
  (* \MEM.PORTB.ADDRESS_END  = "16383" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTB.DATA_LSB  = "36" *) 
  (* \MEM.PORTB.DATA_MSB  = "53" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_23" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "14336" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "36" *) 
  (* ram_slice_end = "53" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_23 
       (.ADDRARDADDR({addra[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[10:0],1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTB_UNCONNECTED [31:0]),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASDOUTPB_UNCONNECTED [3:0]),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_22_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_1_n_0 ),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(enb),
        .CASOUTDBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASOUTDBITERR_UNCONNECTED ),
        .CASOUTSBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_CASOUTSBITERR_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[51:36]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,dina[53:52]}),
        .DINPBDINP({1'b0,1'b0,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTBDOUT_UNCONNECTED [31:16],\^doutb [51:36]}),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_DOUTPBDOUTP_UNCONNECTED [3:2],\^doutb [53:52]}),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(regceb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(rstb),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_23_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_1 
       (.I0(addrb[12]),
        .I1(addrb[13]),
        .I2(addrb[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_2 
       (.I0(addra[11]),
        .I1(addra[13]),
        .I2(addra[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_3 
       (.I0(enb),
        .I1(addrb[12]),
        .I2(addrb[13]),
        .I3(addrb[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4 
       (.I0(wea),
        .I1(addra[12]),
        .I2(addra[13]),
        .I3(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_23_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTA.ADDRESS_END  = "4095" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* \MEM.PORTA.DATA_LSB  = "54" *) 
  (* \MEM.PORTA.DATA_MSB  = "62" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTB.ADDRESS_END  = "4095" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* \MEM.PORTB.DATA_LSB  = "54" *) 
  (* \MEM.PORTB.DATA_MSB  = "62" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_24" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "4095" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "54" *) 
  (* ram_slice_end = "62" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("FIRST"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_24 
       (.ADDRARDADDR({addra[11:0],1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[11:0],1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTB_UNCONNECTED [31:8],\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_CASDOUTPB_UNCONNECTED [3:1],\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_139 }),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[61:54]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,1'b0,dina[62]}),
        .DINPBDINP({1'b0,1'b0,1'b0,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_1_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_2_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_24_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_1 
       (.I0(addra[12]),
        .I1(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_2 
       (.I0(enb),
        .I1(addrb[13]),
        .I2(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3 
       (.I0(wea),
        .I1(addra[13]),
        .I2(addra[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_24_i_3_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "4096" *) 
  (* \MEM.PORTA.ADDRESS_END  = "8191" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* \MEM.PORTA.DATA_LSB  = "54" *) 
  (* \MEM.PORTA.DATA_MSB  = "62" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "4096" *) 
  (* \MEM.PORTB.ADDRESS_END  = "8191" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* \MEM.PORTB.DATA_LSB  = "54" *) 
  (* \MEM.PORTB.DATA_MSB  = "62" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_25" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "4096" *) 
  (* ram_addr_end = "8191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "54" *) 
  (* ram_slice_end = "62" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_25 
       (.ADDRARDADDR({addra[11:0],1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[11:0],1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTB_UNCONNECTED [31:8],\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_CASDOUTPB_UNCONNECTED [3:1],\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_24_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[61:54]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,1'b0,dina[62]}),
        .DINPBDINP({1'b0,1'b0,1'b0,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_25_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_1 
       (.I0(addrb[13]),
        .I1(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_2 
       (.I0(addra[12]),
        .I1(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_3 
       (.I0(enb),
        .I1(addrb[13]),
        .I2(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4 
       (.I0(wea),
        .I1(addra[13]),
        .I2(addra[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_25_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "8192" *) 
  (* \MEM.PORTA.ADDRESS_END  = "12287" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* \MEM.PORTA.DATA_LSB  = "54" *) 
  (* \MEM.PORTA.DATA_MSB  = "62" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "8192" *) 
  (* \MEM.PORTB.ADDRESS_END  = "12287" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* \MEM.PORTB.DATA_LSB  = "54" *) 
  (* \MEM.PORTB.DATA_MSB  = "62" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_26" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "8192" *) 
  (* ram_addr_end = "12287" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "54" *) 
  (* ram_slice_end = "62" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_26 
       (.ADDRARDADDR({addra[11:0],1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[11:0],1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTB_UNCONNECTED [31:8],\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_CASDOUTPB_UNCONNECTED [3:1],\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_25_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[61:54]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,1'b0,dina[62]}),
        .DINPBDINP({1'b0,1'b0,1'b0,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_26_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_1 
       (.I0(addrb[12]),
        .I1(addrb[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_2 
       (.I0(addra[13]),
        .I1(addra[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_3 
       (.I0(enb),
        .I1(addrb[12]),
        .I2(addrb[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4 
       (.I0(wea),
        .I1(addra[12]),
        .I2(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_26_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "12288" *) 
  (* \MEM.PORTA.ADDRESS_END  = "16383" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* \MEM.PORTA.DATA_LSB  = "54" *) 
  (* \MEM.PORTA.DATA_MSB  = "62" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "12288" *) 
  (* \MEM.PORTB.ADDRESS_END  = "16383" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p1_d8" *) 
  (* \MEM.PORTB.DATA_LSB  = "54" *) 
  (* \MEM.PORTB.DATA_MSB  = "62" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_27" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "12288" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "54" *) 
  (* ram_slice_end = "62" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(9),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(9)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_27 
       (.ADDRARDADDR({addra[11:0],1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[11:0],1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b0),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTB_UNCONNECTED [31:0]),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASDOUTPB_UNCONNECTED [3:0]),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_26_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_1_n_0 ),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(enb),
        .CASOUTDBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASOUTDBITERR_UNCONNECTED ),
        .CASOUTSBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_CASOUTSBITERR_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[61:54]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,1'b0,dina[62]}),
        .DINPBDINP({1'b0,1'b0,1'b0,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTBDOUT_UNCONNECTED [31:8],\^doutb [61:54]}),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_DOUTPBDOUTP_UNCONNECTED [3:1],\^doutb [62]}),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(regceb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(rstb),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_27_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_1 
       (.I0(addrb[13]),
        .I1(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_2 
       (.I0(addra[12]),
        .I1(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_3 
       (.I0(enb),
        .I1(addrb[13]),
        .I2(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4 
       (.I0(wea),
        .I1(addra[13]),
        .I2(addra[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_27_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTA.ADDRESS_END  = "16383" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* \MEM.PORTA.DATA_LSB  = "63" *) 
  (* \MEM.PORTA.DATA_MSB  = "64" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "0" *) 
  (* \MEM.PORTB.ADDRESS_END  = "16383" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d2" *) 
  (* \MEM.PORTB.DATA_LSB  = "63" *) 
  (* \MEM.PORTB.DATA_MSB  = "64" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_28" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "16383" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "63" *) 
  (* ram_slice_end = "64" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("NONE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(1),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(2),
    .READ_WIDTH_B(2),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(2),
    .WRITE_WIDTH_B(2)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_28 
       (.ADDRARDADDR({addra,1'b0}),
        .ADDRBWRADDR({addrb,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTB_UNCONNECTED [31:0]),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASDOUTPB_UNCONNECTED [3:0]),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASOUTDBITERR_UNCONNECTED ),
        .CASOUTSBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_CASOUTSBITERR_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DBITERR_UNCONNECTED ),
        .DINADIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,dina[83],dina[63]}),
        .DINBDIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1}),
        .DINPADINP({1'b0,1'b0,1'b0,1'b0}),
        .DINPBDINP({1'b0,1'b0,1'b0,1'b0}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT({\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTBDOUT_UNCONNECTED [31:2],\^doutb [83],\^doutb [63]}),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(1'b1),
        .ENBWREN(enb),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(regceb),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(rstb),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_28_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({wea,wea,wea,wea}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_1 
       (.I0(addrb[11]),
        .I1(addrb[12]),
        .I2(addrb[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_2 
       (.I0(addra[13]),
        .I1(addra[12]),
        .I2(addra[11]),
        .I3(addra[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_3 
       (.I0(enb),
        .I1(addrb[10]),
        .I2(addrb[11]),
        .I3(addrb[12]),
        .I4(addrb[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4 
       (.I0(wea),
        .I1(addra[10]),
        .I2(addra[11]),
        .I3(addra[12]),
        .I4(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_2_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "3072" *) 
  (* \MEM.PORTA.ADDRESS_END  = "4095" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "3072" *) 
  (* \MEM.PORTB.ADDRESS_END  = "4095" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_3" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "3072" *) 
  (* ram_addr_end = "4095" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_3 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_2_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_3_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_1 
       (.I0(addrb[12]),
        .I1(addrb[11]),
        .I2(addrb[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_2 
       (.I0(addra[12]),
        .I1(addra[13]),
        .I2(addra[11]),
        .I3(addra[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_3 
       (.I0(enb),
        .I1(addrb[10]),
        .I2(addrb[11]),
        .I3(addrb[13]),
        .I4(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4 
       (.I0(wea),
        .I1(addra[10]),
        .I2(addra[11]),
        .I3(addra[13]),
        .I4(addra[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_3_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "4096" *) 
  (* \MEM.PORTA.ADDRESS_END  = "5119" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "4096" *) 
  (* \MEM.PORTB.ADDRESS_END  = "5119" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_4" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "4096" *) 
  (* ram_addr_end = "5119" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_4 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_3_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_4_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hFD)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_1 
       (.I0(addrb[12]),
        .I1(addrb[11]),
        .I2(addrb[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h0002)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_2 
       (.I0(addra[12]),
        .I1(addra[10]),
        .I2(addra[13]),
        .I3(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00020000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_3 
       (.I0(enb),
        .I1(addrb[11]),
        .I2(addrb[13]),
        .I3(addrb[10]),
        .I4(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00020000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4 
       (.I0(wea),
        .I1(addra[11]),
        .I2(addra[13]),
        .I3(addra[10]),
        .I4(addra[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_4_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "5120" *) 
  (* \MEM.PORTA.ADDRESS_END  = "6143" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "5120" *) 
  (* \MEM.PORTB.ADDRESS_END  = "6143" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_5" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "5120" *) 
  (* ram_addr_end = "6143" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_5 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_4_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_5_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_1 
       (.I0(addrb[11]),
        .I1(addrb[12]),
        .I2(addrb[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_2 
       (.I0(addra[13]),
        .I1(addra[11]),
        .I2(addra[12]),
        .I3(addra[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_3 
       (.I0(enb),
        .I1(addrb[10]),
        .I2(addrb[12]),
        .I3(addrb[11]),
        .I4(addrb[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4 
       (.I0(wea),
        .I1(addra[10]),
        .I2(addra[12]),
        .I3(addra[11]),
        .I4(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_5_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "6144" *) 
  (* \MEM.PORTA.ADDRESS_END  = "7167" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "6144" *) 
  (* \MEM.PORTB.ADDRESS_END  = "7167" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_6" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "6144" *) 
  (* ram_addr_end = "7167" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_6 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_5_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_6_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_1 
       (.I0(addrb[10]),
        .I1(addrb[12]),
        .I2(addrb[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_2 
       (.I0(addra[13]),
        .I1(addra[10]),
        .I2(addra[12]),
        .I3(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h02000000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_3 
       (.I0(enb),
        .I1(addrb[10]),
        .I2(addrb[13]),
        .I3(addrb[11]),
        .I4(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4 
       (.I0(wea),
        .I1(addra[11]),
        .I2(addra[12]),
        .I3(addra[10]),
        .I4(addra[13]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_6_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "7168" *) 
  (* \MEM.PORTA.ADDRESS_END  = "8191" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "7168" *) 
  (* \MEM.PORTB.ADDRESS_END  = "8191" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_7" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "7168" *) 
  (* ram_addr_end = "8191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("LAST"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_7 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTB_UNCONNECTED [31:0]),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASDOUTPB_UNCONNECTED [3:0]),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_6_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASOUTDBITERR_UNCONNECTED ),
        .CASOUTSBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_CASOUTSBITERR_UNCONNECTED ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT({\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_100 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_101 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_102 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_103 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_104 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_105 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_106 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_107 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_108 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_109 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_110 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_111 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_112 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_113 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_114 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_115 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_116 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_117 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_118 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_119 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_120 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_121 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_122 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_123 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_124 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_125 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_126 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_127 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_128 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_129 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_130 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_131 }),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP({\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_144 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_145 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_146 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_n_147 }),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_2_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_3_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_7_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_1 
       (.I0(addrb[10]),
        .I1(addrb[12]),
        .I2(addrb[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_2 
       (.I0(addra[10]),
        .I1(addra[13]),
        .I2(addra[12]),
        .I3(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h20000000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_3 
       (.I0(enb),
        .I1(addrb[13]),
        .I2(addrb[10]),
        .I3(addrb[11]),
        .I4(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00800000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4 
       (.I0(wea),
        .I1(addra[11]),
        .I2(addra[12]),
        .I3(addra[13]),
        .I4(addra[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_7_i_4_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "8192" *) 
  (* \MEM.PORTA.ADDRESS_END  = "9215" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "8192" *) 
  (* \MEM.PORTB.ADDRESS_END  = "9215" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_8" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "8192" *) 
  (* ram_addr_end = "9215" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("FIRST"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_8 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({1'b0,1'b0,1'b0,1'b0}),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(1'b0),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(1'b1),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_139 }),
        .CASINDBITERR(1'b0),
        .CASINSBITERR(1'b0),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_1_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_2_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_8_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_1 
       (.I0(addra[12]),
        .I1(addra[11]),
        .I2(addra[13]),
        .I3(addra[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_2 
       (.I0(enb),
        .I1(addrb[10]),
        .I2(addrb[13]),
        .I3(addrb[11]),
        .I4(addrb[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h00000020)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3 
       (.I0(wea),
        .I1(addra[10]),
        .I2(addra[13]),
        .I3(addra[11]),
        .I4(addra[12]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_8_i_3_n_0 ));
  (* \MEM.PORTA.ADDRESS_BEGIN  = "9216" *) 
  (* \MEM.PORTA.ADDRESS_END  = "10239" *) 
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTA.DATA_LSB  = "0" *) 
  (* \MEM.PORTA.DATA_MSB  = "35" *) 
  (* \MEM.PORTB.ADDRESS_BEGIN  = "9216" *) 
  (* \MEM.PORTB.ADDRESS_END  = "10239" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p4_d32" *) 
  (* \MEM.PORTB.DATA_LSB  = "0" *) 
  (* \MEM.PORTB.DATA_MSB  = "35" *) 
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RDADDR_COLLISION_HWCONFIG = "DELAYED_WRITE" *) 
  (* RTL_RAM_BITS = "1376256" *) 
  (* RTL_RAM_NAME = "inst/gen_fifo.xpm_fifo_axis_inst/xpm_fifo_base_inst/gen_sdpram.xpm_memory_base_inst/gen_wr_a.gen_word_narrow.mem_reg_bram_9" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "9216" *) 
  (* ram_addr_end = "10239" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "35" *) 
  RAMB36E2 #(
    .CASCADE_ORDER_A("NONE"),
    .CASCADE_ORDER_B("MIDDLE"),
    .CLOCK_DOMAINS("COMMON"),
    .DOA_REG(0),
    .DOB_REG(0),
    .ENADDRENA("FALSE"),
    .ENADDRENB("FALSE"),
    .EN_ECC_PIPE("FALSE"),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RDADDRCHANGEA("FALSE"),
    .RDADDRCHANGEB("FALSE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(36),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SLEEP_ASYNC("FALSE"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(36)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_9 
       (.ADDRARDADDR({addra[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({addrb[9:0],1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ADDRENA(1'b1),
        .ADDRENB(1'b1),
        .CASDIMUXA(1'b0),
        .CASDIMUXB(1'b0),
        .CASDINA({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .CASDINB({\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_67 }),
        .CASDINPA({1'b0,1'b0,1'b0,1'b0}),
        .CASDINPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_139 }),
        .CASDOMUXA(1'b0),
        .CASDOMUXB(\gen_wr_a.gen_word_narrow.mem_reg_bram_1_i_1_n_0 ),
        .CASDOMUXEN_A(1'b1),
        .CASDOMUXEN_B(enb),
        .CASDOUTA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_CASDOUTA_UNCONNECTED [31:0]),
        .CASDOUTB({\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_36 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_37 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_38 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_39 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_40 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_41 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_42 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_43 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_44 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_45 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_46 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_47 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_48 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_49 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_50 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_51 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_52 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_53 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_54 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_55 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_56 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_57 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_58 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_59 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_60 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_61 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_62 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_63 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_64 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_65 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_66 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_67 }),
        .CASDOUTPA(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_CASDOUTPA_UNCONNECTED [3:0]),
        .CASDOUTPB({\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_136 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_137 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_138 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_139 }),
        .CASINDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_0 ),
        .CASINSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_8_n_1 ),
        .CASOREGIMUXA(1'b0),
        .CASOREGIMUXB(1'b0),
        .CASOREGIMUXEN_A(1'b1),
        .CASOREGIMUXEN_B(1'b1),
        .CASOUTDBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_0 ),
        .CASOUTSBITERR(\gen_wr_a.gen_word_narrow.mem_reg_bram_9_n_1 ),
        .CLKARDCLK(clka),
        .CLKBWRCLK(clka),
        .DBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DBITERR_UNCONNECTED ),
        .DINADIN(dina[31:0]),
        .DINBDIN({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DINPADINP(dina[35:32]),
        .DINPBDINP({1'b1,1'b1,1'b1,1'b1}),
        .DOUTADOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTADOUT_UNCONNECTED [31:0]),
        .DOUTBDOUT(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTBDOUT_UNCONNECTED [31:0]),
        .DOUTPADOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTPADOUTP_UNCONNECTED [3:0]),
        .DOUTPBDOUTP(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_DOUTPBDOUTP_UNCONNECTED [3:0]),
        .ECCPARITY(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_ECCPARITY_UNCONNECTED [7:0]),
        .ECCPIPECE(1'b1),
        .ENARDEN(\gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_1_n_0 ),
        .ENBWREN(\gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_2_n_0 ),
        .INJECTDBITERR(1'b0),
        .INJECTSBITERR(1'b0),
        .RDADDRECC(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_RDADDRECC_UNCONNECTED [8:0]),
        .REGCEAREGCE(1'b1),
        .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(\NLW_gen_wr_a.gen_word_narrow.mem_reg_bram_9_SBITERR_UNCONNECTED ),
        .SLEEP(1'b0),
        .WEA({\gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3_n_0 ,\gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3_n_0 }),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_1 
       (.I0(addra[11]),
        .I1(addra[12]),
        .I2(addra[13]),
        .I3(addra[10]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_2 
       (.I0(enb),
        .I1(addrb[10]),
        .I2(addrb[13]),
        .I3(addrb[12]),
        .I4(addrb[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00000080)) 
    \gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3 
       (.I0(wea),
        .I1(addra[10]),
        .I2(addra[13]),
        .I3(addra[12]),
        .I4(addra[11]),
        .O(\gen_wr_a.gen_word_narrow.mem_reg_bram_9_i_3_n_0 ));
  FDRE \gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0 
       (.C(clka),
        .CE(1'b1),
        .D(\gen_wr_a.gen_word_narrow.mem_mux_sel_b_pos_0_i_1_n_0 ),
        .Q(\gen_wr_a.gen_word_narrow.mem_reg_mux_sel_b_pos_0_n_0 ),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
