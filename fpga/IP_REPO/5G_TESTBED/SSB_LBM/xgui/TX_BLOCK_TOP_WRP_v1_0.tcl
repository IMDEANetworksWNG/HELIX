# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_M00_AXIS_TDATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXIS_TDATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S00_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LOAD_DATA_LBM_I_BIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MUX_LBM_I_BIT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RST_I_BIT" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_M00_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH { PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_M00_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH } {
	# Procedure called to update C_S00_AXIS_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH { PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH } {
	# Procedure called to validate C_S00_AXIS_TDATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.LOAD_DATA_LBM_I_BIT { PARAM_VALUE.LOAD_DATA_LBM_I_BIT } {
	# Procedure called to update LOAD_DATA_LBM_I_BIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LOAD_DATA_LBM_I_BIT { PARAM_VALUE.LOAD_DATA_LBM_I_BIT } {
	# Procedure called to validate LOAD_DATA_LBM_I_BIT
	return true
}

proc update_PARAM_VALUE.MUX_LBM_I_BIT { PARAM_VALUE.MUX_LBM_I_BIT } {
	# Procedure called to update MUX_LBM_I_BIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MUX_LBM_I_BIT { PARAM_VALUE.MUX_LBM_I_BIT } {
	# Procedure called to validate MUX_LBM_I_BIT
	return true
}

proc update_PARAM_VALUE.RST_I_BIT { PARAM_VALUE.RST_I_BIT } {
	# Procedure called to update RST_I_BIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RST_I_BIT { PARAM_VALUE.RST_I_BIT } {
	# Procedure called to validate RST_I_BIT
	return true
}


proc update_MODELPARAM_VALUE.RST_I_BIT { MODELPARAM_VALUE.RST_I_BIT PARAM_VALUE.RST_I_BIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RST_I_BIT}] ${MODELPARAM_VALUE.RST_I_BIT}
}

proc update_MODELPARAM_VALUE.MUX_LBM_I_BIT { MODELPARAM_VALUE.MUX_LBM_I_BIT PARAM_VALUE.MUX_LBM_I_BIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MUX_LBM_I_BIT}] ${MODELPARAM_VALUE.MUX_LBM_I_BIT}
}

proc update_MODELPARAM_VALUE.LOAD_DATA_LBM_I_BIT { MODELPARAM_VALUE.LOAD_DATA_LBM_I_BIT PARAM_VALUE.LOAD_DATA_LBM_I_BIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LOAD_DATA_LBM_I_BIT}] ${MODELPARAM_VALUE.LOAD_DATA_LBM_I_BIT}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_S00_AXIS_TDATA_WIDTH PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXIS_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH { MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M00_AXIS_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_M00_AXIS_TDATA_WIDTH}
}

