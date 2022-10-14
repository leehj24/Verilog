module shift4(clk, E, D, C, B, A);
  input clk;
  input E;
  output D, C, B, A;
  reg D, C, B, A;	// output in always

  always @(posedge clk) begin 
    {D, C, B, A} <= {E, D, C, B}; //결합연산자
  end
endmodule 

