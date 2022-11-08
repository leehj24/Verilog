module counter(clk, reset, enable, qout, tc);
	input clk, reset, enable;
	output reg [3:0] qout;
	
	always @(posedge clk or negedge reset) begin
		if (~reset) qout <= 0;
		else if (enable) begin
			qout[0] <= ~qout[0];
			if (qout[0]==1'b1) qout[1] <= ~qout[1];
			if (qout[0]==2'b11) qout[2] <= ~qout[2];
			if (qout[0]==3'b111) qout[3] <= ~qout[3];
		end
	end
endmodule
