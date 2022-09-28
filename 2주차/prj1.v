module mux2(y, data1, data0, select);
    
  output [3:0] y;
    
  input [3:0] data1, data0;
    
  input select;

    
  assign y = select ? data1 : data0;
endmodule

