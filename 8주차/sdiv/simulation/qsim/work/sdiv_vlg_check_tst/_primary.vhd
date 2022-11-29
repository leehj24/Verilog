library verilog;
use verilog.vl_types.all;
entity sdiv_vlg_check_tst is
    port(
        quotient        : in     vl_logic_vector(3 downto 0);
        ready           : in     vl_logic;
        remainder       : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end sdiv_vlg_check_tst;
