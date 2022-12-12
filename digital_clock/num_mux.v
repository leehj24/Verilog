`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/08 19:07:41
// Design Name: 
// Module Name: num_mux
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


module num_mux(
    input i_rst_n,
    input [2:0] i_pos,
    input [3:0] i_num7,
    input [3:0] i_num6,
    input [3:0] i_num5,
    input [3:0] i_num4,
    input [3:0] i_num3,
    input [3:0] i_num2,
    input [3:0] i_num1,
    input [3:0] i_num0,   
    output reg[3:0] o_num
    );
    
    always@( i_rst_n,i_pos ) begin
        if( !i_rst_n ) begin
            o_num = 4'b0000;
        end else begin
            case( i_pos )
                3'b111: o_num = i_num7;
                3'b110: o_num = i_num6;
                3'b101: o_num = i_num5;
                3'b100: o_num = i_num4;
                3'b011: o_num = i_num3;
                3'b010: o_num = i_num2;
                3'b001: o_num = i_num1;
                3'b000: o_num = i_num0;
            endcase
        end
    end
endmodule

















