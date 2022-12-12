`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/09 16:41:16
// Design Name: 
// Module Name: controller
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


module controller(
    input            i_clk_1,
    input            i_clk_100,
    input            i_clk_400,
    input            i_rst_n,
    input            i_btn_u,
    input            i_btn_l,
    input            i_btn_m,
    input            i_btn_r,
    input            i_btn_d,
    input            i_config_mode,
    output reg[7:0]  o_config_digit,
    output reg[3:0]  o_num7,
    output reg[3:0]  o_num6,
    output reg[3:0]  o_num5,
    output reg[3:0]  o_num4,
    output reg[3:0]  o_num3,
    output reg[3:0]  o_num2,
    output reg[3:0]  o_num1,
    output reg[3:0]  o_num0
    );
    
    reg[2:0]  r_sel_pos;
    reg       pre_clk_1Hz;
    reg       pre_clk_100Hz;
    
    always@( negedge i_rst_n or negedge i_clk_400 ) begin
        if ( !i_rst_n ) begin   //system reset => initializing values.
            r_sel_pos <= 3'b111;
            o_num7 <= 4'b0000;
            o_num6 <= 4'b0000;
            o_num5 <= 4'b0000;
            o_num4 <= 4'b0000;
            o_num3 <= 4'b0000;
            o_num2 <= 4'b0000;
            o_num1 <= 4'b0000;
            o_num0 <= 4'b0000;     
        end else begin
            pre_clk_1Hz <= i_clk_1;
            pre_clk_100Hz <= i_clk_100;
            if( !i_config_mode ) begin  //DIP switch down => clock mode
                o_config_digit <= 8'b11111111;  //In clock, mode digit must be all ON.(after &&)
                if( pre_clk_100Hz == 1 && i_clk_100 == 0 ) begin  //Clock mode, 0.01sec period
                    if( o_num0 < 4'b1001 ) begin
                        o_num0 <= o_num0 + 1;
                    end else begin
                        o_num0 <= 4'b0000;
                        if( o_num1 < 4'b1001 ) begin
                            o_num1 <= o_num1 + 1;
                        end else begin
                            o_num1 <= 4'b0000;
                            if( o_num2 < 4'b1001 ) begin
                                o_num2 <= o_num2 + 1;
                            end else begin
                                o_num2 <= 4'b0000;
                                if( o_num3 < 4'b0101 ) begin
                                    o_num3 <= o_num3 + 1;
                                end else begin
                                    o_num3 <= 4'b0000;
                                    if( o_num4 < 4'b1001 ) begin
                                        o_num4 <= o_num4 + 1;
                                    end else begin
                                        o_num4 <= 4'b0000;
                                        if( o_num5 < 4'b0101 ) begin
                                            o_num5 <= o_num5 + 1;
                                        end else begin
                                            o_num5 <= 4'b0000;
                                            if( o_num6 < 4'b0100 ) begin
                                                if( o_num7 == 4'b0010 && o_num6 == 4'b0011 ) begin
                                                    o_num6 <= 4'b0000; //23:59 => 00:00
                                                    o_num7 <= 4'b0000;
                                                end else begin
                                                    o_num6 <= o_num6 + 1;
                                                end
                                            end else begin
                                                o_num6 <= 4'b0000;
                                                if( o_num7 < 4'b0010 ) begin
                                                    o_num7 <= o_num1 + 1;
                                                end else begin
                                                    o_num7 <= 4'b0000;
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end else begin  //Config mode
                if( pre_clk_1Hz == 1 && i_clk_1 == 0 ) begin  //In config mode, 1Hz falling
                    //Export current position of config mode every 1sec.
                    case( r_sel_pos )
                        3'b111: o_config_digit <= 8'b01111111;
                        3'b110: o_config_digit <= 8'b10111111;
                        3'b101: o_config_digit <= 8'b11011111;
                        3'b100: o_config_digit <= 8'b11101111;
                        3'b011: o_config_digit <= 8'b11110111;
                        3'b010: o_config_digit <= 8'b11111011;
                        3'b001: o_config_digit <= 8'b11111101;
                        3'b000: o_config_digit <= 8'b11111110;
                    endcase
                end else if( pre_clk_1Hz == 0 && i_clk_1 == 1 ) begin //In config mode, 1Hz rising
                    o_config_digit <= 8'b11111111;
                end else begin  //In config mode, operating in 400Hz
                    r_sel_pos <= r_sel_pos + {2'b00,i_btn_l} - {2'b00,i_btn_r};         
                    if( i_btn_u ) begin                                      
                        if( r_sel_pos == 3'b111 ) begin
                            if( o_num7 < 4'b0010 ) begin
                                o_num7 <= o_num7 + 1;
                            end else begin
                                o_num7 <= 4'b0000;
                            end
                        end else if( r_sel_pos == 3'b110 ) begin
                            if( o_num7 == 4'b0010 ) begin   //If time is 2X:XX
                                if( o_num6 < 4'b0011 ) begin
                                    o_num6 <= o_num6 + 1;
                                end else begin
                                    o_num6 <= 4'b0000;
                                end
                            end else begin  //If time is 1X:XX or 0X:XX
                                if( o_num6 < 4'b1001 ) begin
                                    o_num6 <= o_num6 + 1;
                                end else begin
                                    o_num6 <= 4'b0000;
                                end
                            end
                        end else if( r_sel_pos == 3'b101 ) begin
                            if( o_num5 < 4'b0101 ) begin
                                o_num5 <= o_num5 + 1;
                            end else begin
                                o_num5 <= 4'b0000;
                            end
                        end else if( r_sel_pos == 3'b100 ) begin
                            if( o_num4 < 4'b1001 ) begin
                                o_num4 <= o_num4 + 1;
                            end else begin
                                o_num4 <= 4'b0000;
                            end
                        end else if( r_sel_pos == 3'b011 ) begin
                            if( o_num3 < 4'b0101 ) begin
                                o_num3 <= o_num3 + 1;
                            end else begin
                                o_num3 <= 4'b0000;
                            end
                        end else if( r_sel_pos == 3'b010 ) begin
                            if( o_num2 < 4'b1001 ) begin
                                o_num2 <= o_num2 + 1;
                            end else begin
                                o_num2 <= 4'b0000;
                            end
                        end else if( r_sel_pos == 3'b001 ) begin
                            if( o_num1 < 4'b1001 ) begin
                                o_num1 <= o_num1 + 1;
                            end else begin
                                o_num1 <= 4'b0000;
                            end
                        end else begin
                            if( o_num0 < 4'b1001 ) begin
                                o_num0 <= o_num0 + 1;
                            end else begin
                                o_num0 <= 4'b0000;
                            end
                        end
                    end else if( i_btn_d ) begin
                        if( r_sel_pos == 3'b111 ) begin
                            if( o_num7 > 4'b0000 ) begin
                                o_num7 <= o_num7 - 1;
                            end else begin
                                o_num7 <= 4'b0010;
                            end
                        end else if( r_sel_pos == 3'b110 ) begin
                            if( o_num7 == 4'b0010 ) begin   //If time is 2X:XX
                                if( o_num6 > 4'b0000 ) begin
                                    o_num6 <= o_num6 - 1;
                                end else begin
                                    o_num6 <= 4'b0011;
                                end
                            end else begin  //If time is 1X:XX or 0X:XX
                                if( o_num6 > 4'b0000 ) begin
                                    o_num6 <= o_num6 - 1;
                                end else begin
                                    o_num6 <= 4'b1001;
                                end
                            end
                        end else if( r_sel_pos == 3'b101 ) begin
                            if( o_num5 > 4'b0000 ) begin
                                o_num5 <= o_num5 - 1;
                            end else begin
                                o_num5 <= 4'b0101;
                            end
                        end else if( r_sel_pos == 3'b100 ) begin
                            if( o_num4 > 4'b0000 ) begin
                                o_num4 <= o_num4 - 1;
                            end else begin
                                o_num4 <= 4'b1001;
                            end
                        end else if( r_sel_pos == 3'b011 ) begin
                            if( o_num3 > 4'b0000 ) begin
                                o_num3 <= o_num3 - 1;
                            end else begin
                                o_num3 <= 4'b0101;
                            end
                        end else if( r_sel_pos == 3'b010 ) begin
                            if( o_num2 > 4'b0000 ) begin
                                o_num2 <= o_num2 - 1;
                            end else begin
                                o_num2 <= 4'b1001;
                            end
                        end else if( r_sel_pos == 3'b001 ) begin
                            if( o_num1 > 4'b0000 ) begin
                                o_num1 <= o_num1 - 1;
                            end else begin
                                o_num1 <= 4'b1001;
                            end
                        end else begin
                            if( o_num0 > 4'b0000 ) begin
                                o_num0 <= o_num0 - 1;
                            end else begin
                                o_num0 <= 4'b1001;
                            end
                        end
                    end
                end
            end
        end
    end
endmodule
