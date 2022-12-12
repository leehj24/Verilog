`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/08 18:49:57
// Design Name: 
// Module Name: digit_decoder
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


module digit_decoder(
    input           i_rst_n,
    input     [2:0] i_pos,
    input     [7:0] i_config_digit,
    output reg[7:0] digit
    );
    
    always@( i_rst_n,i_pos ) begin
        if( !i_rst_n ) begin
            digit <= 8'b00000000;
        end else
        case( i_pos )
            3'b111: digit <= 8'b10000000 & i_config_digit;
            3'b110: digit <= 8'b01000000 & i_config_digit;
            3'b101: digit <= 8'b00100000 & i_config_digit;
            3'b100: digit <= 8'b00010000 & i_config_digit;
            3'b011: digit <= 8'b00001000 & i_config_digit;
            3'b010: digit <= 8'b00000100 & i_config_digit;
            3'b001: digit <= 8'b00000010 & i_config_digit;
            3'b000: digit <= 8'b00000001 & i_config_digit;
            default : digit <= 8'b00000000;
        endcase
    end
endmodule
