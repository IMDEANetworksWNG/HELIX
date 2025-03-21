set_property IOSTANDARD LVDS_25  [get_ports pl_clk_clk_p]
set_property IOSTANDARD LVDS_25  [get_ports pl_clk_clk_n]
set_property IOSTANDARD LVDS_25  [get_ports pl_sysref_clk_p]
set_property IOSTANDARD LVDS_25  [get_ports pl_sysref_clk_n]
set_property PACKAGE_PIN B8 [get_ports pl_clk_clk_p]
#set_property PACKAGE_PIN B7 [get_ports pl_clk_clk_n]
set_property PACKAGE_PIN B10 [get_ports pl_sysref_clk_p]
#set_property PACKAGE_PIN B9 [get_ports pl_sysref_clk_n]


set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets design_1_i/MTS_Block/util_ds_buf_0/U0/USE_IBUFDS.GEN_IBUFDS[0].IBUFDS_I/O]