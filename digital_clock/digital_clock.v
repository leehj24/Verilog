`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/08 17:09:17
// Design Name: 
// Module Name: digital_clock
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

module digital_clock(
    input            SYSTEM_CLK_100M,
    input            SYSTEM_RST_n,
    input   [15:0]   DIP_SW,
    input            BTN_U,
    input            BTN_L,
    input            BTN_M,
    input		     BTN_R,
    input		     BTN_D,
//    output  [15:0]   LED,
    output  [6:0]    SEG,
    output		     SEG_DP,
    output  [7:0]    DIGIT
    );
    
    wire clk_1Hz,clk_100Hz,clk_400Hz;
    wire up,left,mid,right,down;
    wire [2:0]   reg_pos;
    wire [3:0]   num7,num6,num5,num4,num3,num2,num1,num0;
    wire [3:0]   cur_num;
    wire [7:0]   config_digit;
	
    assign SEG_DP = 1'b0;  
    //assign LED[15:11] = {up,left,mid,right,down};  //checking push button operating
            
    clk_divider_1Hz u0(
        .i_clk              (SYSTEM_CLK_100M),
        .i_rst_n            (SYSTEM_RST_n),
        .o_clk              (clk_1Hz)
        );
        
    clk_divider_100Hz u1(
        .i_clk              (SYSTEM_CLK_100M),
        .i_rst_n            (SYSTEM_RST_n),
        .o_clk              (clk_100Hz)
        );
        
    clk_divider_400Hz u2(
        .i_clk              (SYSTEM_CLK_100M),
        .i_rst_n            (SYSTEM_RST_n),
        .o_clk              (clk_400Hz)
        );      
    
    btn_edge_detector u3(
        .i_clk              (clk_400Hz),
        .i_rst_n            (SYSTEM_RST_n),
        .i_BTN_U            (BTN_U),
        .i_BTN_L            (BTN_L),
        .i_BTN_M            (BTN_M),
        .i_BTN_R            (BTN_R),
        .i_BTN_D            (BTN_D),
        .o_BTN_U            (up),
        .o_BTN_L            (left),
        .o_BTN_M            (mid),
        .o_BTN_R            (right),
        .o_BTN_D            (down)
        );
  
    pos_shifter u4(
        .i_clk              (clk_400Hz),
        .i_rst_n            (SYSTEM_RST_n),
        .o_pos              (reg_pos)
        );
        
    num_mux u5(
        .i_rst_n            (SYSTEM_RST_n),
        .i_pos              (reg_pos),
        .i_num7             (num7),
        .i_num6             (num6),
        .i_num5             (num5),
        .i_num4             (num4),
        .i_num3             (num3),
        .i_num2             (num2),
        .i_num1             (num1),
        .i_num0             (num0),   
        .o_num              (cur_num)
        );
    
    digit_decoder u6(
        .i_rst_n            (SYSTEM_RST_n),
        .i_pos              (reg_pos),
        .i_config_digit     (config_digit),
        .digit              (DIGIT)
        );
        
    segment_decoder u7(
        .i_rst_n            (SYSTEM_RST_n),
        .i_d_num            (cur_num),
        .o_b_seg            (SEG)
        );
        
    controller u8(
        .i_clk_1            (clk_1Hz),
        .i_clk_100          (clk_100Hz),
        .i_clk_400          (clk_400Hz),
        .i_rst_n            (SYSTEM_RST_n),
        .i_btn_u            (up),
        .i_btn_l            (left),
        .i_btn_m            (mid),
        .i_btn_r            (right),
        .i_btn_d            (down),
        .i_config_mode      (DIP_SW[15]),
        .o_config_digit     (config_digit),
        .o_num7             (num7),
        .o_num6             (num6),
        .o_num5             (num5),
        .o_num4             (num4),
        .o_num3             (num3),
        .o_num2             (num2),
        .o_num1             (num1),
        .o_num0             (num0)
        );
endmodule
