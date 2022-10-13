module dff_a (q, qbar, data, set, reset, clk);
  output q, qbar;
  input data, set, reset, clk;
  reg q;

  assign qbar = ~q;
  always @ (negedge set or negedge reset or posedge clk) begin
    if (reset==0) q = 0; // async reset
    else if (set==0) q = 1; // async set
    else q = data; // synchronize with clk
  end
endmodule
