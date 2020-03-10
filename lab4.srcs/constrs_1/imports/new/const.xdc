create_clock -period 10.000 [get_ports clk_in_hw]
# create_clock -period 2170.139 [get_ports clk_in]
# 115200 * 4 = 460800 => 1/460800 = 2170.1388888


#set_property IOSTANDARD LVCMOS33 [get_ports CLK_IN]
#set_property PACKAGE_PIN L5 [get_ports CLK_IN]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_IN_IBUF]


#set_property PACKAGE_PIN A12 [get_ports tx_out]
set_property PACKAGE_PIN A5 [get_ports tx_out_hw]

##set_property PACKAGE_PIN A5 [get_ports rx_in]
set_property PACKAGE_PIN A12 [get_ports rx_in_hw]

set_property PACKAGE_PIN L5 [get_ports clk_in_hw]
set_property IOSTANDARD LVCMOS33 [get_ports clk_in_hw]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_in_hw_IBUF]


set_property IOSTANDARD LVCMOS33 [get_ports {rx_data_hw[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data_hw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data_hw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data_hw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data_hw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data_hw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data_hw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data_hw[0]}]


set_property DRIVE 12 [get_ports {rx_data_hw[7]}]
set_property DRIVE 12 [get_ports {rx_data_hw[6]}]
set_property DRIVE 12 [get_ports {rx_data_hw[5]}]
set_property DRIVE 12 [get_ports {rx_data_hw[4]}]
set_property DRIVE 12 [get_ports {rx_data_hw[3]}]
set_property DRIVE 12 [get_ports {rx_data_hw[2]}]
set_property DRIVE 12 [get_ports {rx_data_hw[1]}]
set_property DRIVE 12 [get_ports {rx_data_hw[0]}]

set_property PACKAGE_PIN M4 [get_ports {rx_data_hw[0]}]
set_property PACKAGE_PIN M2 [get_ports {rx_data_hw[1]}]
set_property PACKAGE_PIN L2 [get_ports {rx_data_hw[2]}]
set_property PACKAGE_PIN K3 [get_ports {rx_data_hw[3]}]
set_property PACKAGE_PIN J3 [get_ports {rx_data_hw[4]}]
set_property PACKAGE_PIN H3 [get_ports {rx_data_hw[5]}]
set_property PACKAGE_PIN F4 [get_ports {rx_data_hw[6]}]
set_property PACKAGE_PIN F3 [get_ports {rx_data_hw[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports rx_in_hw]
set_property IOSTANDARD LVCMOS33 [get_ports tx_out_hw]


set_property PACKAGE_PIN A2 [get_ports tx_active]
set_property IOSTANDARD LVCMOS33 [get_ports tx_active]

set_property PACKAGE_PIN H13 [get_ports {segment_out[7]}]
set_property PACKAGE_PIN J13 [get_ports {segment_out[6]}]
set_property PACKAGE_PIN L12 [get_ports {segment_out[5]}]
set_property PACKAGE_PIN L14 [get_ports {segment_out[4]}]
set_property PACKAGE_PIN M12 [get_ports {segment_out[3]}]
set_property PACKAGE_PIN K12 [get_ports {segment_out[2]}]
set_property PACKAGE_PIN M14 [get_ports {segment_out[1]}]
set_property PACKAGE_PIN J12 [get_ports {segment_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment_out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {segment_out[0]}]
