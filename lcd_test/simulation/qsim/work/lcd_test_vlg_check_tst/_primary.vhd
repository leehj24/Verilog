library verilog;
use verilog.vl_types.all;
entity lcd_test_vlg_check_tst is
    port(
        RS              : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        start           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end lcd_test_vlg_check_tst;
