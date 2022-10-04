module comparator1(a, b, eq, lt, gt);
    
  input a, b;
    
  output eq, lt, gt;
    
    
  assign eq = ~a & ~b | a & b;    // 00, 11
   
  assign lt = ~a & b;             // 01
    
  assign gt = a & ~b;             // 10

endmodule

