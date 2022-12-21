module stopwatch(clk,clk3,rst,clear,start_stop,hour2_q,hour1_q,min2_q,min1_q,sec2_q,sec1_q,point1_q);

input  clk,rst,clear,start_stop;
output [3:0] sec1_q, min1_q, hour1_q, point1_q;
output [2:0] sec2_q, min2_q;
output [1:0] hour2_q;
output [17:0] clk3;
reg    [3:0] sec1_q, min1_q, hour1_q, point1_q;
reg    [2:0] sec2_q, min2_q;
reg    [1:0] hour2_q;
reg    [17:0] clk3;  

always @(posedge clk or posedge rst)
  begin
    if (!rst) begin
        point1_q<=4'd0; 
        end
    else if (clear) begin
        point1_q <=4'd0;
        end        
    else 
        if(start_stop & clk3 == 17'd99999) begin
            if(point1_q==4'd9) begin
                point1_q<=4'd0;
                end
            else
                point1_q<=point1_q+1'b1;
            end
	    else begin
            point1_q<=point1_q;
            end
        end
always@(posedge clk or negedge rst)
  begin
    if (!rst) begin
      clk3 <= 4'd0;    
    end       
    else if(start_stop) begin
      if (clk3 == 17'd99999) begin
        clk3 <= 17'd0;
      end
      else begin
        clk3 <= clk3 + 1;
      end
    end
  end
always @(posedge clk or posedge rst)
  begin
    if (!rst) begin
        sec1_q<=4'd0; 
        sec2_q<=3'd0; 
        end
     else if (clear) begin
        sec1_q<=4'd0; 
        sec2_q<=3'd0; 
        end
     else 
        if(start_stop & clk3 == 17'd99999 & point1_q==4'd9) begin
            if(sec1_q==4'd9) begin
                sec1_q<=4'd0;
                if(sec2_q==3'd5)
                    sec2_q<=3'd0;
                else
                    sec2_q<=sec2_q+1'b1;
                end
            else
                sec1_q<=sec1_q+1'b1;
            end
	    else begin
            sec1_q<=sec1_q;
            sec2_q<=sec2_q;
            end
        end  
always @(posedge clk or posedge rst)
  begin
    if(!rst) begin
        min1_q<=4'd0; 
        min2_q<=3'd0;
        end
    else if (clear) begin
        min1_q<=4'd0; 
        min2_q<=3'd0;
        end
    else 
        if((start_stop & point1_q==4'd9 & clk3 == 17'd99999 & sec1_q==4'd9 & sec2_q==3'd5)) begin
            if(min1_q==4'd9) begin
                min1_q<=4'd0;
                if(min2_q==3'd5)
                    min2_q<=3'd0;
                else 
                    min2_q<=min2_q + 1'b1;
                end
            else
                min1_q<=min1_q + 1'b1;
            end
        else begin
            min1_q<=min1_q;
            min2_q<=min2_q;
            end
        end  
always @(posedge clk or posedge rst)
  begin
    if(!rst) begin
        hour1_q<=4'd0; 
        hour2_q<=2'd0;
        end
    else if (clear) begin
        hour1_q<=4'd0; 
        hour2_q<=2'd0;
        end
    else 
        if((start_stop & point1_q==4'd9 & clk3 == 17'd99999 & sec1_q==4'd9 & sec2_q==3'd5 & min1_q==4'd9 & min2_q==3'd5)) begin
            if(hour1_q==4'd9) begin
                hour1_q<=4'd0; 
                hour2_q<=hour2_q + 1'b1;
                end
	        else if(hour1_q==3'd3 & hour2_q==2'd2) begin
                hour1_q<=4'd0; 
                hour2_q<=2'd0;
                end
            else
                hour1_q<=hour1_q+1'b1;
            end
        else begin
            hour1_q<=hour1_q; 
            hour2_q<=hour2_q;
            end
        end   
endmodule
