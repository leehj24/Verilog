library verilog;
use verilog.vl_types.all;
entity lcd_test_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        done            : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lcd_test_vlg_sample_tst;
