module counter25(clock,reset,clk1);
	output clk1;
	input clock,reset;
	reg [24:0] c;
	reg tc;
	reg clk1;
	always @(posedge clock or negedge reset) begin
		if (clk1==1'bx) clk1<=0;
		if(~reset) c=25'b00000_00000_00000_00000_00000;
		else if(tc==1) begin
			clk1<=~clk1;
			c<=25'b00000_00000_00000_00000_00000;
			tc<=0;
			end
		else begin
			c<=c+1;
			if(c==25'b10111_11010_11110_00001_11111) tc<=1;
		end
	end
endmodule
