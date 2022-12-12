library verilog;
use verilog.vl_types.all;
entity textlcd_vlg_sample_tst is
    port(
        CLK_50          : in     vl_logic;
        KEY             : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end textlcd_vlg_sample_tst;
