# This constraints file contains default clock frequencies to be used during out-of-context flows such as
# OOC Synthesis and Hierarchical Designs. For best results the frequencies should be modified
# to match the target frequencies. 
# This constraints file is not used in normal top-down synthesis (the default flow of Vivado)
create_clock -name ap_clk -period 2.500 [get_ports ap_clk]
set_false_path -to 	[get_cells -hierarchical -filter {NAME =~ *vt_single_sync*/dff* && IS_SEQUENTIAL}]
set_false_path -from 	[get_cells -hierarchical -filter {NAME =~ *vt_single_sync*/dff* && IS_SEQUENTIAL}]
