`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/10 09:41:11
// Design Name: 
// Module Name: clk_divider_100Hz
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_divider_100Hz(
    input i_clk,
    input i_rst_n,
    output reg o_clk
    );
    
    parameter FREQ = 100;
    parameter SOURCE_CLOCK = 100000000;
    parameter SOURCE_CLOCK_HALF = 50000000;
    integer max_cnt  = SOURCE_CLOCK / FREQ;
    integer half_cnt = SOURCE_CLOCK_HALF / FREQ;
    integer cnt;
    
    always@( negedge i_rst_n or posedge i_clk ) begin	//clock divider for visual clock
        if( !i_rst_n ) begin
            cnt <= 0;
            o_clk <= 1'b0;  
        end else begin
            if( cnt < max_cnt ) begin
                cnt <= cnt+1;
            end else begin
                cnt <= 0;
            end
            
            if( cnt < half_cnt ) begin
                o_clk <= 1'b0;
            end else begin
                o_clk <= 1'b1;
            end
        end
    end
endmodule
