vlib work
vlog N_bit_counter.v D_flipflop.v testbench.v
vsim -voptargs=+acc work.testbench
add wave *
run -all
# quit -sim