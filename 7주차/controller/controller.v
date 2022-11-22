module controller (clk, reset, start, m0, load, shift, add, ready);
	input clk, reset, start, m0;
	output load, shift, add, ready;
	
	reg [3:0] state;
	localparam S0=0, S1=8, S2=9, S3=10, S4=11, S5=12, S6=13, S7=14, S8=15;
	
	always @ (posedge clk or posedge reset)  	// State transitions (with register)
		if (reset) state <= S0; 
		else 
			case (state)
			 S0: if (start) begin state <= S1; end
			 S1: if (m0) state <= S2; else state <= S3;
			 S2: state <= S3;
			 S3: if (m0) state <= S4; else state <= S5;
			 S4: state <= S5;
			 S5: if (m0) state <= S6; else state <= S7;
			 S6: state <= S7;
			 S7: if (m0) state <= S8; else state <= S0;
			 S8: state <= S0;
			endcase
		
 // control output logic
	assign load = (state==S0) & start; 
	assign shift = (state==S1||state==S3||state==S5||state==S7) & ~m0 | (state==S2||state==S4||state==S6||state==S8);
	assign add = (state==S1||state==S3||state==S5||state==S7) & m0;
	assign ready = (state==S0) & ~reset;
endmodule
