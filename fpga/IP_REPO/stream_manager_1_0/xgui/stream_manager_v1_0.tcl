# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"

}

proc update_PARAM_VALUE.C_M01_RF_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M01_RF_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M01_RF_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M01_RF_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M01_RF_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M01_RF_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S01_RF_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S01_RF_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S01_RF_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S01_RF_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S01_RF_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S01_RF_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_M00_UDP_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M00_UDP_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M00_UDP_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_UDP_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M00_UDP_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M00_UDP_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to update C_S00_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to validate C_S00_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to update C_S00_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to validate C_S00_AXI_HIGHADDR
	return true
}

proc update_PARAM_VALUE.C_S00_UDP_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S00_UDP_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S00_UDP_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_UDP_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S00_UDP_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S00_UDP_AXIS_TDATA_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.C_M01_RF_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M01_RF_AXIS_TDATA_WIDTH PARAM_VALUE.C_M01_RF_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M01_RF_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M01_RF_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S01_RF_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S01_RF_AXIS_TDATA_WIDTH PARAM_VALUE.C_S01_RF_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S01_RF_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S01_RF_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_UDP_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M00_UDP_AXIS_TDATA_WIDTH PARAM_VALUE.C_M00_UDP_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_UDP_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M00_UDP_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_UDP_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S00_UDP_AXIS_TDATA_WIDTH PARAM_VALUE.C_S00_UDP_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_UDP_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_UDP_AXIS_TDATA_WIDTH}
}

