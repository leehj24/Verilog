module majority(data, y);
	parameter N = 5;	// bit size
	parameter Majority = 3;	// majority
	input [N-1:0] data;
	output y;
	reg y;
	integer count;
	
	always @(*) begin
		count = count_one(data);
		y = (count >= Majority);
	end
	
	function [7:0] count_one;
		input [N-1:0] data;
		integer count, k;
		begin
			count = 0;
			for (k=0; k < N; k = k+1) 
				if (data[k]) count = count + 1;
			count_one = count;
		end
	endfunction
endmodule
