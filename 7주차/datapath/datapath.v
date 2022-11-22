module datapath (clk, reset, load, shift, add, word1, word2, product, m0); 
	input clk, reset, load, shift, add;
	input [3:0] word1, word2;
	output [7:0] product;
	output m0;
	
	reg [7:0] product;	
	reg carry;
	reg [3:0] multiplicand;	
	wire[4:0] sum;			// 5-bit	
	
	assign m0 = product[0];
	assign sum = product[7:4] + multiplicand;

  	always @ (posedge clk or posedge reset) begin
		if (reset) begin multiplicand <= 0; product <= 0; end
    		else if (load) begin 
			multiplicand <= word1;	
			product <= {4'b0, word2}; 	// lower 4-bit = multiplier
		end 
		else if (shift) begin		// shift-right
			product <= {carry, product[7:1]}; carry <= 0; end
		else if (add) 	// add & shift right
			{carry, product[7:4]} <= sum;
		end
endmodule
