library verilog;
use verilog.vl_types.all;
entity lcd_test is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        start           : out    vl_logic;
        RS              : out    vl_logic;
        data            : out    vl_logic_vector(7 downto 0);
        done            : in     vl_logic
    );
end lcd_test;
