create_clock -name clk -period 8 [get_ports clk]
set_dont_touch_network      [all_clocks]
set_fix_hold                [all_clocks]
set_clock_uncertainty -setup 0.5 [all_clocks]
set_clock_uncertainty -hold 0.02 [all_clocks] 
set_clock_latency      2.0  [all_clocks]
set_ideal_network           [get_ports clk]

set_input_delay  -max 3.0   -clock clk [remove_from_collection [all_inputs] [get_ports clk]]
set_input_delay  -min 0.0   -clock clk [remove_from_collection [all_inputs] [get_ports clk]]

set_drive        0.1   [all_inputs]

set_operating_conditions -max_library fsa0m_a_generic_core_ss1p62v125c -max WCCOM -min_library fsa0m_a_generic_core_ff1p98vm40c -min BCCOM
set auto_wire_load_selection

set_max_fanout 6 [all_inputs]
