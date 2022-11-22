library verilog;
use verilog.vl_types.all;
entity datapath_vlg_check_tst is
    port(
        lt              : in     vl_logic;
        quotient        : in     vl_logic_vector(3 downto 0);
        remainder       : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end datapath_vlg_check_tst;
