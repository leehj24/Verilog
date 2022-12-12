`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/08 19:07:41
// Design Name: 
// Module Name: pos_shifter
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


module pos_shifter(
    input i_clk,
    input i_rst_n,
    output reg[2:0] o_pos = 3'b111
    );
    
    always@( negedge i_rst_n or posedge i_clk ) begin
        if( !i_rst_n ) begin
            o_pos <= 3'b111;
        end else begin
            if( o_pos > 3'b000 ) begin
                o_pos <= o_pos - 1;
            end else begin
                o_pos <= 3'b111;
            end
        end
    end
endmodule