module d_latch(en, din, qout);
    
  input en, din;
  output qout;
  reg qout;
    
  
  always @(posedge din) begin
    assign qout = en ? din : qout;
  end

endmodule

