# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"


}

proc update_PARAM_VALUE.BITSLIP_HIGH_CYCLES { PARAM_VALUE.BITSLIP_HIGH_CYCLES } {
	# Procedure called to update BITSLIP_HIGH_CYCLES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSLIP_HIGH_CYCLES { PARAM_VALUE.BITSLIP_HIGH_CYCLES } {
	# Procedure called to validate BITSLIP_HIGH_CYCLES
	return true
}

proc update_PARAM_VALUE.BITSLIP_LOW_CYCLES { PARAM_VALUE.BITSLIP_LOW_CYCLES } {
	# Procedure called to update BITSLIP_LOW_CYCLES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BITSLIP_LOW_CYCLES { PARAM_VALUE.BITSLIP_LOW_CYCLES } {
	# Procedure called to validate BITSLIP_LOW_CYCLES
	return true
}

proc update_PARAM_VALUE.COUNT_125US { PARAM_VALUE.COUNT_125US } {
	# Procedure called to update COUNT_125US when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COUNT_125US { PARAM_VALUE.COUNT_125US } {
	# Procedure called to validate COUNT_125US
	return true
}

proc update_PARAM_VALUE.CTRL_WIDTH { PARAM_VALUE.CTRL_WIDTH } {
	# Procedure called to update CTRL_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CTRL_WIDTH { PARAM_VALUE.CTRL_WIDTH } {
	# Procedure called to validate CTRL_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.HAS_COMMON { PARAM_VALUE.HAS_COMMON } {
	# Procedure called to update HAS_COMMON when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HAS_COMMON { PARAM_VALUE.HAS_COMMON } {
	# Procedure called to validate HAS_COMMON
	return true
}

proc update_PARAM_VALUE.HDR_WIDTH { PARAM_VALUE.HDR_WIDTH } {
	# Procedure called to update HDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HDR_WIDTH { PARAM_VALUE.HDR_WIDTH } {
	# Procedure called to validate HDR_WIDTH
	return true
}

proc update_PARAM_VALUE.PRBS31_ENABLE { PARAM_VALUE.PRBS31_ENABLE } {
	# Procedure called to update PRBS31_ENABLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PRBS31_ENABLE { PARAM_VALUE.PRBS31_ENABLE } {
	# Procedure called to validate PRBS31_ENABLE
	return true
}

proc update_PARAM_VALUE.RX_SERDES_PIPELINE { PARAM_VALUE.RX_SERDES_PIPELINE } {
	# Procedure called to update RX_SERDES_PIPELINE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RX_SERDES_PIPELINE { PARAM_VALUE.RX_SERDES_PIPELINE } {
	# Procedure called to validate RX_SERDES_PIPELINE
	return true
}

proc update_PARAM_VALUE.TX_SERDES_PIPELINE { PARAM_VALUE.TX_SERDES_PIPELINE } {
	# Procedure called to update TX_SERDES_PIPELINE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TX_SERDES_PIPELINE { PARAM_VALUE.TX_SERDES_PIPELINE } {
	# Procedure called to validate TX_SERDES_PIPELINE
	return true
}


proc update_MODELPARAM_VALUE.HAS_COMMON { MODELPARAM_VALUE.HAS_COMMON PARAM_VALUE.HAS_COMMON } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HAS_COMMON}] ${MODELPARAM_VALUE.HAS_COMMON}
}

proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.CTRL_WIDTH { MODELPARAM_VALUE.CTRL_WIDTH PARAM_VALUE.CTRL_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CTRL_WIDTH}] ${MODELPARAM_VALUE.CTRL_WIDTH}
}

proc update_MODELPARAM_VALUE.HDR_WIDTH { MODELPARAM_VALUE.HDR_WIDTH PARAM_VALUE.HDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HDR_WIDTH}] ${MODELPARAM_VALUE.HDR_WIDTH}
}

proc update_MODELPARAM_VALUE.PRBS31_ENABLE { MODELPARAM_VALUE.PRBS31_ENABLE PARAM_VALUE.PRBS31_ENABLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PRBS31_ENABLE}] ${MODELPARAM_VALUE.PRBS31_ENABLE}
}

proc update_MODELPARAM_VALUE.TX_SERDES_PIPELINE { MODELPARAM_VALUE.TX_SERDES_PIPELINE PARAM_VALUE.TX_SERDES_PIPELINE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TX_SERDES_PIPELINE}] ${MODELPARAM_VALUE.TX_SERDES_PIPELINE}
}

proc update_MODELPARAM_VALUE.RX_SERDES_PIPELINE { MODELPARAM_VALUE.RX_SERDES_PIPELINE PARAM_VALUE.RX_SERDES_PIPELINE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RX_SERDES_PIPELINE}] ${MODELPARAM_VALUE.RX_SERDES_PIPELINE}
}

proc update_MODELPARAM_VALUE.BITSLIP_HIGH_CYCLES { MODELPARAM_VALUE.BITSLIP_HIGH_CYCLES PARAM_VALUE.BITSLIP_HIGH_CYCLES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BITSLIP_HIGH_CYCLES}] ${MODELPARAM_VALUE.BITSLIP_HIGH_CYCLES}
}

proc update_MODELPARAM_VALUE.BITSLIP_LOW_CYCLES { MODELPARAM_VALUE.BITSLIP_LOW_CYCLES PARAM_VALUE.BITSLIP_LOW_CYCLES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BITSLIP_LOW_CYCLES}] ${MODELPARAM_VALUE.BITSLIP_LOW_CYCLES}
}

proc update_MODELPARAM_VALUE.COUNT_125US { MODELPARAM_VALUE.COUNT_125US PARAM_VALUE.COUNT_125US } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COUNT_125US}] ${MODELPARAM_VALUE.COUNT_125US}
}

