module counterN(clk, reset, enable, qout, tc);
	parameter N = 10;			// mod-N counterN
	parameter M = 4;			// M = bit size = log2(N)
	input clk, reset, enable;
	output reg [M-1:0] qout;
	output tc;				// terminal count
	
	always @(posedge clk or negedge reset) begin
		if (~reset) qout <= 0;
		else if (enable) begin
			if (qout == N-1) qout <= 0;
			else qout <= qout + 1;
		end
	end
	
	assign tc = enable && (qout == N-1);		

endmodule
