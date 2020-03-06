create_clock -period 10.000 [get_ports clk_in]


#set_property IOSTANDARD LVCMOS33 [get_ports CLK_IN]
#set_property PACKAGE_PIN L5 [get_ports CLK_IN]
#set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_IN_IBUF]


#set_property PACKAGE_PIN A12 [get_ports tx_out]
set_property PACKAGE_PIN A5 [get_ports tx_out]
set_property IOSTANDARD LVCMOS33 [get_ports tx_out]

##set_property PACKAGE_PIN A5 [get_ports rx_in]
set_property PACKAGE_PIN A12 [get_ports rx_in]
set_property IOSTANDARD LVCMOS33 [get_ports rx_in]

set_property PACKAGE_PIN L5 [get_ports clk_in]
set_property IOSTANDARD LVCMOS33 [get_ports clk_in]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_in_IBUF]


set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rx_data[0]}]


set_property DRIVE 12 [get_ports {rx_data[7]}]
set_property DRIVE 12 [get_ports {rx_data[6]}]
set_property DRIVE 12 [get_ports {rx_data[5]}]
set_property DRIVE 12 [get_ports {rx_data[4]}]
set_property DRIVE 12 [get_ports {rx_data[3]}]
set_property DRIVE 12 [get_ports {rx_data[2]}]
set_property DRIVE 12 [get_ports {rx_data[1]}]
set_property DRIVE 12 [get_ports {rx_data[0]}]

set_property PACKAGE_PIN M4 [get_ports {rx_data[0]}]
set_property PACKAGE_PIN M2 [get_ports {rx_data[1]}]
set_property PACKAGE_PIN L2 [get_ports {rx_data[2]}]
set_property PACKAGE_PIN K3 [get_ports {rx_data[3]}]
set_property PACKAGE_PIN J3 [get_ports {rx_data[4]}]
set_property PACKAGE_PIN H3 [get_ports {rx_data[5]}]
set_property PACKAGE_PIN F4 [get_ports {rx_data[6]}]
set_property PACKAGE_PIN F3 [get_ports {rx_data[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports rx_in]
set_property IOSTANDARD LVCMOS33 [get_ports tx_out]

