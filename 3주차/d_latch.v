module d_latch(en, din, qout);
    
  input en, din;
  
  output qout;

    
  assign qout = en ? din : qout;

endmodule

