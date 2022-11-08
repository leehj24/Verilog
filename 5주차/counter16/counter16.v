module counter16(clk, reset, enable, qout, tc);
	input clk, reset, enable;
	output [15:0] qout;
	output tc;		// terminal count
	wire en1, en2, en3;
	
	counter4 u1 (clk, reset, enable, qout[3:0], en1);
	counter4 u2 (clk, reset, en1, qout[7:4], en2);
	counter4 u3 (clk, reset, en2, qout[11:8], en3);
	counter4 u4 (clk, reset, en3, qout[15:12], tc);
endmodule
