# We will use a 12.5 MHz clock, but design with 25 MHz to be sure it works.
dc::create_clock -name clk -period 40 -waveform {0 20} [dc::get_ports clk]
dc::set_driving_cell -cell INVD0BWP7T [dc::all_inputs]
dc::set_input_delay  .2 -clock clk [dc::all_inputs]
dc::set_output_delay .5 -clock clk [dc::all_outputs]
dc::set_load 1 [dc::all_outputs]
