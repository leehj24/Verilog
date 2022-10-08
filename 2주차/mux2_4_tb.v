module mux2_4_tb;
  wire [3:0] t1, t2;
  reg [3:0] data1_1, data0_1, data1_2, data0_2;
  reg select;
  mux2_4 #(4) m1(y1, data1_1, data0_1, select);
  mux2_4 #(4) m2(y2, data1_2, data0_2, select);

  initial begin
  select = 0;
  data1_1 = 4'b0000; data0_1 = 4'b1111;
  data1_2 = 4'b1111; data0_2 = 4'b0000;
  #20
  data1_1 = 4'b0001; data0_1 = 4'b1110;
  data1_2 = 4'b1110; data0_2 = 4'b0001;
  #20
  data1_1 = 4'b0010; data0_1 = 4'b1101;
  data1_2 = 4'b1101; data0_2 = 4'b0010;
  #20
  data1_1 = 4'b0011; data0_1 = 4'b1100;
  data1_2 = 4'b1100; data0_2 = 4'b0011;
  select =1;
  #20
  data1_1 = 4'b0100; data0_1 = 4'b1001;
  data1_2 = 4'b1001; data0_2 = 4'b0100;
  #20
  data1_1 = 4'b0101; data0_1 = 4'b1000;
  data1_2 = 4'b1000; data0_2 = 4'b0101;
  #20
  data1_1 = 4'b0111; data0_1 = 4'b0111;
  data1_2 = 4'b0111; data0_2 = 4'b0111;
  #20
  data1_1 = 4'b1000; data0_1 = 4'b0010;
  data1_2 = 4'b0010; data0_2 = 4'b1000;
  #20
  data1_1 = 4'b1001; data0_1 = 4'b0001;
  data1_2 = 4'b0001; data0_2 = 4'b1001;
  end
endmodule

