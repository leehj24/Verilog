module combination_watch_stopwatch (clk,clk2,clk3,rst,clear,start_stop,hour2,hour1,min2,min1,sec2,sec1,point1,hour2_q,hour1_q,min2_q,min1_q,sec2_q,sec1_q,point1_q);

input clk, rst, clear, start_stop;
output [3:0] sec1,min1,hour1,point1;
output [2:0] sec2,min2;
output [1:0] hour2;
output [3:0] sec1_q, min1_q, hour1_q, point1_q;
output [2:0] sec2_q, min2_q;
output [1:0] hour2_q;
output [17:0] clk2,clk3;
wire clk, rst, clear, start_stop;
wire   [3:0] sec1, min1, hour1, point1;
wire   [2:0] sec2, min2;
wire   [1:0] hour2;
wire   [3:0] sec1_q, min1_q, hour1_q, point1_q;
wire   [2:0] sec2_q, min2_q;
wire   [1:0] hour2_q;
wire   [17:0] clk2,clk3;

clock_timer timer_a(.clk(clk),.rst(rst),.clk2(clk2),.point1(point1),.sec1(sec1),    .sec2(sec2),.min1(min1),.min2(min2),.hour1(hour1),.hour2(hour2));

stopwatch stop_a(.clk(clk),.rst(rst),.clk3(clk3),.clear(clear),            .start_stop(start_stop),.point1_q(point1_q),.sec1_q(sec1_q),             .sec2_q(sec2_q),.min1_q(min1_q),.min2_q(min2_q),.hour1_q(hour1_q),                .hour2_q(hour2_q));

endmodule
