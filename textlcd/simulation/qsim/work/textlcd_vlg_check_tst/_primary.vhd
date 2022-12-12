library verilog;
use verilog.vl_types.all;
entity textlcd_vlg_check_tst is
    port(
        LCD_BLON        : in     vl_logic;
        LCD_D           : in     vl_logic_vector(7 downto 0);
        LCD_EN          : in     vl_logic;
        LCD_ON          : in     vl_logic;
        LCD_RS          : in     vl_logic;
        LCD_RW          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end textlcd_vlg_check_tst;
