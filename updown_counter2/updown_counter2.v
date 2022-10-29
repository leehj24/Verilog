module updown_counter2(clk, reset, load, enable, up, data, qout);
	input clk, reset, load, enable, up;
	input [3:0] data;
	output [3:0] qout;
	reg [3:0] qout;

	always @(posedge clk or posedge reset) begin
		if (reset) qout <= 0;			// active high async reset
		else if (load) qout <= data;	// load
		else if (enable) begin			// enable
			if (up) qout <= qout + 1;	// 	up counter
			else qout <= qout - 1;		// 	down counter
		end
	end
endmodule
