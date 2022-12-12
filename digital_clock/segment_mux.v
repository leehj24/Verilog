`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/08 17:09:17
// Design Name: 
// Module Name: segment_mux
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


module segment_mux(
    input i_clk,
    input i_rst_n,
    input [2:0] i_pos,
    output reg[7:0] digit
    );
    
    always@( i_rst_n or posedge i_clk ) begin
        if( !i_rst_n ) begin
            digit <= 8'b00000000;
        end else
        case( i_pos )
            3'b000: digit <= 8'b10000000;
            3'b001: digit <= 8'b01000000;
            3'b010: digit <= 8'b00100000;
            3'b011: digit <= 8'b00010000;
            3'b100: digit <= 8'b00001000;
            3'b101: digit <= 8'b00000100;
            3'b110: digit <= 8'b00000010;
            3'b111: digit <= 8'b00000001;
        endcase
    end
endmodule
