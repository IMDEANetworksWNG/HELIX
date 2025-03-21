#set_property PACKAGE_PIN AA38 [get_ports gt_rxp_in_0]
#set_property PACKAGE_PIN AA39 [get_ports gt_rxn_in_0]
#set_property PACKAGE_PIN Y35 [get_ports gt_txp_out_0]
#set_property PACKAGE_PIN Y36 [get_ports gt_txn_out_0]

set_property PACKAGE_PIN N38 [get_ports gt_rxp_in_0]
set_property PACKAGE_PIN N39 [get_ports gt_rxn_in_0]
set_property PACKAGE_PIN P35 [get_ports gt_txp_out_0]
set_property PACKAGE_PIN P36 [get_ports gt_txn_out_0]


set_property PACKAGE_PIN M31 [get_ports user_mgt_si570_sysclk_clk_p]
set_property PACKAGE_PIN M32 [get_ports user_mgt_si570_sysclk_clk_n]

#set_property PACKAGE_PIN Y31 [get_ports user_mgt_si570_sysclk_clk_p]
#set_property PACKAGE_PIN Y32 [get_ports user_mgt_si570_sysclk_clk_n]

#create_clock -period 6.400 -name gt_ref_clk [get_ports user_mgt_si570_sysclk_clk_p]

#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets design_1_i/udp_stack/udp_stack_64b_0/inst/eth_10g_0_inst/inst/xcvr.eth_xcvr_gt_full_inst/inst/gen_gtwizard_gtye4_top.gtwizard_ultrascale_0_gtwizard_gtye4_inst/gen_gtwizard_gtye4.gen_common.gen_common_container[1].gen_enabled_common.gtye4_common_wrapper_inst/common_inst/qpll0outclk_out[0]]