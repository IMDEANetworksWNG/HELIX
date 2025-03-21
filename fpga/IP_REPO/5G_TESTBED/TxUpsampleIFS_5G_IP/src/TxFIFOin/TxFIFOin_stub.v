// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Wed Aug  2 14:38:22 2023
// Host        : DESKTOP-LLUTMNM running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/./Dropbox/./5G_NR_TESTBED_BLOCKS/VIV_TxUpsampleIFS/src/TxFIFOin/TxFIFOin_stub.v
// Design      : TxFIFOin
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu28dr-ffvg1517-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_4,Vivado 2019.1" *)
module TxFIFOin(clk, srst, din, wr_en, rd_en, dout, full, empty, 
  prog_full, wr_rst_busy, rd_rst_busy)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[64:0],wr_en,rd_en,dout[64:0],full,empty,prog_full,wr_rst_busy,rd_rst_busy" */;
  input clk;
  input srst;
  input [64:0]din;
  input wr_en;
  input rd_en;
  output [64:0]dout;
  output full;
  output empty;
  output prog_full;
  output wr_rst_busy;
  output rd_rst_busy;
endmodule
