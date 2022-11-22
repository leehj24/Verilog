library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        load            : in     vl_logic;
        shift           : in     vl_logic;
        subshift        : in     vl_logic;
        word1           : in     vl_logic_vector(7 downto 0);
        word2           : in     vl_logic_vector(3 downto 0);
        quotient        : out    vl_logic_vector(3 downto 0);
        remainder       : out    vl_logic_vector(3 downto 0);
        lt              : out    vl_logic
    );
end datapath;
