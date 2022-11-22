onerror {quit -f}
vlib work
vlog -work work mul.vo
vlog -work work mul.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.mul_vlg_vec_tst
vcd file -direction mul.msim.vcd
vcd add -internal mul_vlg_vec_tst/*
vcd add -internal mul_vlg_vec_tst/i1/*
add wave /*
run -all
