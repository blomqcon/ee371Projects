// Top-level module that defines the I/Os for the DE-1 SoC board

module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW, CLOCK_50);
 output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
 output [9:0] LEDR;
 input [3:0] KEY;
 input [9:0] SW;
 input CLOCK_50; // 50MHz clock.

 wire [0:2] debugStateArriving, debugStateDeparting;
 wire [0:1] gFull;
 
 Interlock i(.arriveCtrl(SW[0]), .departCtrl(SW[1]),
		.innerDoorCtrl(SW[3]), .outerDoorCtrl(SW[2]),
		.pressurizeCtrl(~KEY[1]), .evacuateCtrl(~KEY[2]),
		.clk(CLOCK_50), .rst(~KEY[0]), 
		.arrivingLED(LEDR[0]), .departingLED(LEDR[1]),
		.innerLED(LEDR[3]), .outerLED(LEDR[2]),
		.pressurizeLED(LEDR[4]), .evacuateLED(LEDR[5]), .gFull(gFull),
		.debugStateArriving(debugStateArriving), .debugStateDeparting(debugStateDeparting));
		
assign HEX5 = 7'b0001100;
BinToHexDisplay(gFull, HEX4);
assign HEX3 = 7'b0100001;
BinToHexDisplay(debugStateDeparting, HEX2);
assign HEX1 = 7'b0001000;
BinToHexDisplay(debugStateArriving, HEX0);

wire slow_clk;
clock_divider15 clk_div (CLOCK_50, slow_clk);

assign LEDR[9] = slow_clk;
 
endmodule 
