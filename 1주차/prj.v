module	halfadder_tb;
  wire	sum, cout;
  reg	a, b;
  halfadder u1 (sum, cout, a, b);
  initial begin
    $monitor("%d: %b %b : %b %b", $time, a, b, cout, sum);
    #100 $finish;
  end
  initial begin
    #20 a=0; b=0;	
    #20 b=1;	 
    #20 a=1;	 
    #20 b=0;	
  end
endmodule
