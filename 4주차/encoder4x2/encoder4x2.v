module encoder4x2(data, code, valid);
	input [3:0]  data;
	output reg [1:0]  code;
	output valid;
	
	always  @(*) begin
		casex (data)
		 4'bxxx1 : code = 0;
		 4'bxx10 : code = 1;
		 4'bx100 : code = 2;
		 4'b1000 : code = 3;
		 default : code = 2'bx;
		endcase
	end
	assign valid = (data != 0);
	// assign valid = | data;
endmodule
