onerror {quit -f}
vlib work
vlog -work work lcd_test.vo
vlog -work work lcd_test.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.lcd_test_vlg_vec_tst
vcd file -direction lcd_test.msim.vcd
vcd add -internal lcd_test_vlg_vec_tst/*
vcd add -internal lcd_test_vlg_vec_tst/i1/*
add wave /*
run -all
