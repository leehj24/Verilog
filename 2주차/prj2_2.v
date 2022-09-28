module mux2(y, data1, data0, sel);
    
  output [7:0] y;
    
  input [7:0] data1, data0;
    
  input sel;
    wire [7:0] s;		

    
  assign s = { 8 {sel} };	// 8-bit duplication of sel 
    
  assign y = ~s & data0 | s & data1;

endmodule

