module majority(data, y);
	parameter N = 5;	// bit size
	parameter Majority = 3;	// majority
	input [N-1:0] data;
	output y;
	reg y;
	integer count, k;
	
	always @(*) begin
		// count 1's
		count = 0;
		for (k=0; k < N; k = k+1) begin
			if (data[k]==1'b1) count = count + 1;
		end
		// determine y
		y = (count >= Majority);
	end
endmodule
