library verilog;
use verilog.vl_types.all;
entity textlcd is
    port(
        CLK_50          : in     vl_logic;
        KEY             : in     vl_logic_vector(3 downto 0);
        LCD_RS          : out    vl_logic;
        LCD_RW          : out    vl_logic;
        LCD_EN          : out    vl_logic;
        LCD_D           : out    vl_logic_vector(7 downto 0);
        LCD_ON          : out    vl_logic;
        LCD_BLON        : out    vl_logic
    );
end textlcd;
