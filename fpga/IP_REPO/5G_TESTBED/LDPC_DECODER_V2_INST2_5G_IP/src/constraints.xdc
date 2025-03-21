## ---- common false path
set_false_path -to 	[get_cells -hierarchical -filter {NAME =~ *vt_single_sync*/dff* && IS_SEQUENTIAL}]
set_false_path -from 	[get_cells -hierarchical -filter {NAME =~ *vt_single_sync*/dff* && IS_SEQUENTIAL}]

#set_property LOC FE_X0Y7 [get_cells LDPCtop/b5_LDPCblock/inst/*/FE_I]
set_property LOC FE_X0Y6 [get_cells LDPCtop/b5_LDPCblock/inst/*/FE_I]
#set_property LOC FE_X0Y5 [get_cells LDPCtop/b5_LDPCblock/inst/*/FE_I]
#set_property LOC FE_X0Y2 [get_cells LDPCtop/b5_LDPCblock/inst/*/FE_I]
#set_property LOC FE_X0Y1 [get_cells LDPCtop/b5_LDPCblock/inst/*/FE_I]
#set_property LOC FE_X0Y0 [get_cells LDPCtop/b5_LDPCblock/inst/*/FE_I]


