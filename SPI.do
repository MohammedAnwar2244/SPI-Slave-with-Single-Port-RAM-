vlib work
vlog slave.v RAM.v top_module.v 
vsim -voptargs=+acc work.top_module_tb
add wave*
run -all 
