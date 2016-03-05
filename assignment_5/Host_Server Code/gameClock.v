/*
Bryan Bednarski
EE 371 Prof. Peckol Winter 2016
Project 5: Final Project Game

gameClock.v
This module controls the clock that our C code will base its decision making timeline from.
*/

module gameClock(clk, reset, gameTime); // input 50MhZ clk divided 22 times to 11.9Hz ~~ 83ms
	input clk, reset;
	output reg [31:0] gameTime;
	
	initial begin
		gameTime = 32'b0;
	end
		
	always@(posedge clk) begin
		if (reset)
			gameTime <= 32'b0;
		else
			gameTime <= gameTime + 32'b1;
	end
	
endmodule
	
	
/* // divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ...
module clock_divider (clock, divided_clocks);
	input clock;
	output [31:0] divided_clocks;
	reg [31:0] divided_clocks;
	initial divided_clocks = 0;
	always @(posedge clock)
		divided_clocks = divided_clocks + 1;
endmodule 

// Generate clk off of CLOCK_50, whichClock picks rate.
wire [31:0] clk;
parameter whichClock = 8;
clock_divider cdiv (CLOCK_50, clk); */
