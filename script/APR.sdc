create_clock -name clk -period 8 [get_ports {clk}]
set_clock_latency 2 [get_clocks{clk}]
set_clock_uncertainty -setup 0.5 [get_clocks {CLK}]
set_clock_uncertainty -hold 0.02 [get_clocks {CLK}]

set_input_delay 3 -clock clk [remove_from_collection [all_inputs][get_ports {clk}]]
set_output_delay 3 -clock clk [all_outputs]

set_drive 0.1 [all_inputs]
set_load -pin_load 20 [all_outputs]
#set_max_fanout 6 [all_inputs]
