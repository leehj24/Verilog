module clock_timer(clk,clk2,rst,hour1,hour2,min1,min2,sec1,sec2,point1);
	input  clk,rst;
	output [3:0] sec1,min1,hour1,point1;
	output [2:0] sec2,min2;
	output [1:0] hour2;
	output [17:0] clk2;
	reg    [3:0] sec1, min1, hour1, point1;
	reg    [2:0] sec2, min2;
	reg    [1:0] hour2;
	reg    [17:0] clk2;
	wire clk, rst;
 
	always @(posedge clk or posedge rst)
		begin
			if (!rst) begin
				point1<=4'd0; 
				end
			else
			if(clk2 == 17'd99999) begin
				if(point1==4'd9) begin
					point1<=4'd0;
					end
			else begin
				point1<=point1+1'b1;
				end
			end
        
			else begin
				point1<=point1;
				end
			end
  
	always@(posedge clk or negedge rst)
		begin
			if (!rst) begin
				clk2 <= 4'd0;    
			end       
			else 
				if (clk2 == 17'd99999) begin
				clk2 <= 17'd0;
				end
			else begin
				clk2 <= clk2 + 1;
				end
			end
		always @(posedge clk or posedge rst)
			begin
    if (!rst) begin
        sec1<=4'd0; 
        sec2<=3'd0; 
        end
    else
        if(clk2 == 17'd99999 & point1==4'd9) begin
            if(sec1==4'd9) begin
                sec1<=4'd0;
                if(sec2==3'd5)
                    sec2<=3'd0;
                else
                    sec2<=sec2+1'b1;
                end
            else
                sec1<=sec1+1'b1;
            end
	    else begin
            sec1<=sec1;
            sec2<=sec2;
            end
        end  
	always @(posedge clk or posedge rst)
	 begin
		if(!rst) begin
        min1<=4'd0; 
        min2<=3'd0;
        end
		else
        if((clk2 == 17'd99999 & point1==4'd9 & sec1==4'd9 & sec2==3'd5)) begin
            if(min1==4'd9) begin
                min1<=4'd0;
                if(min2==3'd5)
                    min2<=3'd0;
                else 
                    min2<=min2 + 1'b1;
                end
            else
                min1<=min1 + 1'b1;
            end
        else begin
            min1<=min1;
            min2<=min2;
            end
        end
	always @(posedge clk or posedge rst)
		begin
			if(!rst) begin
				hour1<=4'd0; 
				hour2<=2'd0;
				end
			else
				if((clk2 == 17'd99999 & point1==4'd9 & sec1==4'd9 & sec2==3'd5 & min1==4'd9 & min2==3'd5)) begin
						if(hour1==4'd9) begin
							hour1<=4'd0; 
							hour2<=hour2 + 1'b1;
							end
						else if(hour1==3'd3 & hour2==2'd2) begin
							hour1<=4'd0; 
							hour2<=2'd0;
							end
				else
					hour1<=hour1+1'b1;
            end
        else begin
            hour1<=hour1; 
            hour2<=hour2;
            end
        end   
endmodule
