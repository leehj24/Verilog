library verilog;
use verilog.vl_types.all;
entity controller_vlg_check_tst is
    port(
        load            : in     vl_logic;
        ready           : in     vl_logic;
        shift           : in     vl_logic;
        subshift        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end controller_vlg_check_tst;
