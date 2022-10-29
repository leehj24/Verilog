module shiftreg(clk, reset, sin, sout);
	input clk, reset;
	input sin;		// serial in
	output sout;		// serial out
	reg [3:0] qout;
	
	assign sout = qout[0];		// LSB

	always @(posedge clk, negedge reset) begin
		if (reset==0) qout <= 0;
		else qout <= {sin, qout[3:1]};	// shift right
	end
endmodule
