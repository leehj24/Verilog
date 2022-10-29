module majority(data, y);
	parameter N = 5;	// bit size
	parameter Majority = 3;	// majority
	input [N-1:0] data;
	output y;
	reg y;
	integer count, k;
	
	always @(*) begin
		count_one(count,data);
		y = (count >= Majority);
	end
	
	task count_one;
		output[7:0] count;
		input [N-1:0] data;
		integer count, k;
		begin
			count = 0;
			for (k=0; k < N; k = k+1) 
				if (data[k]) count = count + 1;
		end
	endtask
endmodule

