vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/axis_infrastructure_v1_1_0
vlib activehdl/axis_data_fifo_v2_0_9
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap axis_infrastructure_v1_1_0 activehdl/axis_infrastructure_v1_1_0
vmap axis_data_fifo_v2_0_9 activehdl/axis_data_fifo_v2_0_9
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../ipstatic/hdl" \
"/opt/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/opt/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/opt/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"/opt/Xilinx/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axis_infrastructure_v1_1_0  -v2k5 "+incdir+../../../ipstatic/hdl" \
"../../../ipstatic/hdl/axis_infrastructure_v1_1_vl_rfs.v" \

vlog -work axis_data_fifo_v2_0_9  -v2k5 "+incdir+../../../ipstatic/hdl" \
"../../../ipstatic/hdl/axis_data_fifo_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic/hdl" \
"../../../../tx_buffer.gen/sources_1/ip/axis_data_fifo_0/sim/axis_data_fifo_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

