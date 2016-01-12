// Top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, CLOCK_50);
 output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
 output [9:0] LEDR;
 input [3:0] KEY;
 input [9:0] SW;
 input CLOCK_50; // 50MHz clock.

 // Default values, turns off the HEX displays
 assign HEX0 = 7'b1111111;
 assign HEX1 = 7'b1111111;
 assign HEX2 = 7'b1111111;
 assign HEX3 = 7'b1111111;
 assign HEX4 = 7'b1111111;
 assign HEX5 = 7'b1111111;

 wire clk;
 clock_divider15 clk_div (CLOCK_50, clk);
 
 wire [0:3] q;
 CounterOne counter(q, clk, ~KEY[0]);
 
 assign LEDR = {q, 4'b0000, clk, ~KEY[0]};
 
endmodule
