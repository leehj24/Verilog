library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        start           : in     vl_logic;
        lt              : in     vl_logic;
        load            : out    vl_logic;
        shift           : out    vl_logic;
        subshift        : out    vl_logic;
        ready           : out    vl_logic
    );
end controller;
