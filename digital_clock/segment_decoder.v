`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/08 17:09:17
// Design Name: 
// Module Name: segment_decoder
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


module segment_decoder(
    input i_rst_n,
    input [3:0] i_d_num,
    output reg[6:0] o_b_seg
    );
    
    always@( i_rst_n,i_d_num ) begin
        if( !i_rst_n ) begin
            o_b_seg <= 7'b0000000;  //In fact, don't care
        end else begin
        case( i_d_num )
            4'b0000 : o_b_seg <= 7'b1111110; // display number of 0 on 7-segment
            4'b0001 : o_b_seg <= 7'b0110000; // display number of 1 on 7-segment
            4'b0010 : o_b_seg <= 7'b1101101; // display number of 2 on 7-segment
            4'b0011 : o_b_seg <= 7'b1111001; // display number of 3 on 7-segment
            4'b0100 : o_b_seg <= 7'b0110011; // display number of 4 on 7-segment
            4'b0101 : o_b_seg <= 7'b1011011; // display number of 5 on 7-segment
            4'b0110 : o_b_seg <= 7'b1011111; // display number of 6 on 7-segment
            4'b0111 : o_b_seg <= 7'b1110010; // display number of 7 on 7-segment
            4'b1000 : o_b_seg <= 7'b1111111; // display number of 8 on 7-segment
            4'b1001 : o_b_seg <= 7'b1111011; // display number of 9 on 7-segment
            default: o_b_seg <= 7'b0000001;  // display '-' for error detecting    
        endcase
        end
    end
endmodule

