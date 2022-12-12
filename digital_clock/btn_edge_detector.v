`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/08 17:09:17
// Design Name: 
// Module Name: btn_edge_detector
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


module btn_edge_detector(
    input      i_clk,
    input      i_rst_n,
    input      i_BTN_U,
    input      i_BTN_L,
    input      i_BTN_M,
    input      i_BTN_R,
    input      i_BTN_D,
    output reg o_BTN_U,
    output reg o_BTN_L,
    output reg o_BTN_M,
    output reg o_BTN_R,
    output reg o_BTN_D
    );
    
    reg pre_val_U;
    reg pre_val_L;
    reg pre_val_M;
    reg pre_val_R;
    reg pre_val_D;
    
    always@( negedge i_rst_n or posedge i_clk ) begin
        if( !i_rst_n ) begin
            o_BTN_U <= 1'b0;
            o_BTN_L <= 1'b0;
            o_BTN_M <= 1'b0;
            o_BTN_R <= 1'b0;
            o_BTN_D <= 1'b0;
            pre_val_U <= 1'b0;
            pre_val_L <= 1'b0; 
            pre_val_M <= 1'b0; 
            pre_val_R <= 1'b0; 
            pre_val_D <= 1'b0;   
        end else begin
            pre_val_U <= i_BTN_U;
            pre_val_L <= i_BTN_L;
            pre_val_M <= i_BTN_M;
            pre_val_R <= i_BTN_R;
            pre_val_D <= i_BTN_D;
            
            if( pre_val_U == 1'b0 && i_BTN_U == 1'b1 ) begin
                o_BTN_U <= 1'b1;
            end else begin
                o_BTN_U <= 1'b0;
            end
            if( pre_val_L == 1'b0 && i_BTN_L == 1'b1 ) begin
                o_BTN_L <= 1'b1;
            end else begin
                o_BTN_L <= 1'b0;
            end
            if( pre_val_M == 1'b0 && i_BTN_M == 1'b1 ) begin
                o_BTN_M <= 1'b1;
            end else begin
                o_BTN_M <= 1'b0;
            end
            if( pre_val_R == 1'b0 && i_BTN_R == 1'b1 ) begin
                o_BTN_R <= 1'b1;
            end else begin
                o_BTN_R <= 1'b0;
            end
            if( pre_val_D == 1'b0 && i_BTN_D == 1'b1 ) begin
                o_BTN_D <= 1'b1;
            end else begin
                o_BTN_D <= 1'b0;
            end    
        end
    end
endmodule
