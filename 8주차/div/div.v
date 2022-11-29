module div(clk, reset, start, word1, word2, quotient, remainder, ready);
	input clk, reset, start;
	input [7:0] word1;
	input [3:0] word2;
	output [3:0] quotient, remainder;
	output ready;
	
	wire  load, shift, subshift, lt;
	
	datapath u1 (clk, reset, load, shift, subshift, word1, word2, quotient, remainder, lt); 
	controller u2 (clk, reset, start, lt, load, shift, subshift, ready);
endmodule

module datapath (clk, reset, load, shift, subshift, word1, word2, quotient, remainder, lt); 
	input clk, reset, load, shift, subshift;
	input [7:0] word1;
	input [3:0] word2;
	output [3:0] quotient, remainder;
	output lt;
	
	reg [7:0] dividend;		// 8-bit
	reg [3:0] divisor;		// 4-bit
	wire[4:0] diff;			// 4-bit
	wire lt;				// less than (borrow)
	
	assign diff = dividend[7:3] - divisor;	// subtract after shift left
	assign lt = diff[4];	// borrow
	
	assign quotient = dividend[3:0];
	assign remainder = dividend[7:4];
	
  	always @ (posedge clk or posedge reset) begin
		if (reset) begin dividend <= 0; divisor <= 0; end
    	else if (load) begin 
			dividend <= word1;	
			divisor <= word2; 
		end 
		else if (shift) 	// shift-left
			dividend <= {dividend[6:0], 1'b0};		// quotient=0
		else if (subshift) 	// sub & shift-left
			dividend <= {diff[3:0], dividend[2:0], 1'b1};	// quotient=1
	end

endmodule

module controller (clk, reset, start, lt, load, shift, subshift, ready);
	input clk, reset, start, lt;
	output load, shift, subshift, ready;
	
	reg overflow;
	reg state;
	reg [1:0] count;
	localparam S0 = 0, S1 = 1;

	always @ (posedge clk or posedge reset)  	// State transitions
		if (reset) begin state <= S0; count <= 0; end
		else 
			case (state)
			 S0: if (start) begin state <= S1; count <= 3; end
			 S1: if (count==0) state <= S0;
				 else count <= count - 1;
			endcase
		
 // control output logic
	assign load = (state==S0) && start; 
	assign shift = (state==S1) && lt;
	assign subshift = (state==S1) && ~lt;
	assign ready = (state==S0) && ~reset;
endmodule
