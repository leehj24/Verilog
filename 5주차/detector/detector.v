module detector(clk, reset, in, out);
	input clk, reset, in;
	output out;
	reg [2:0] state, ns;		// state: present state, ns: next state
	localparam A=0, B=1, C=2, D=3, E=4;
	
	always @(posedge clk, negedge reset) begin
		if (~reset) state <= 0;
		else state <= ns;
	end
	
	always @(*) begin
		case (state)
		 A : if (in) ns = B; else ns = A;
		 B : if (in) ns = C; else ns = A;
		 C : if (in) ns = D; else ns = A;
		 D : if (in) ns = E; else ns = A;
		 E : if (in) ns = E; else ns = A;
		 default : ns = 3'bx;
		endcase 
	end
	
	assign out = (state==E);
endmodule
