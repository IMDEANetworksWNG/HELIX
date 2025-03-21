## ---- common false path
set_false_path -to 	[get_cells -hierarchical -filter {NAME =~ *vt_single_sync*/dff* && IS_SEQUENTIAL}]
set_false_path -from 	[get_cells -hierarchical -filter {NAME =~ *vt_single_sync*/dff* && IS_SEQUENTIAL}]

#set_property LOC FE_X0Y7 [get_cells *b5_LDPCblock*/FE_I]
set_property LOC FE_X0Y7 [get_cells LDPCtop/b5_LDPCblock/inst/*/FE_I]

#create_clock -period 4.100 -name s00_axis_aclk -waveform {0.000 2.050} [get_ports s00_axis_aclk]
#create_clock -period 1.500 -name coreClk -waveform {0.000 0.750} [get_ports coreClk]
#create_clock -period 10.000 -name s00_axi_aclk -waveform {0.000 5.000} [get_ports s00_axi_aclk]
