/*	Bryan Bednarski
	EE 371 Peckol Winter 2016
	Project 5: Space Invaders
	DE1_HOST.v
	
	This top-level DE1 module connects hardware modules with NIOSII processor and software
	for the host DE1 board.

*/

module DE1_HOST(CLOCK_50, SW, KEY, dataIn, dataOut);
	input CLOCK_50, dataIn;
	input [9:0] SW;
	input [3:0] KEY; 
	output dataOut;
	
	// instantiate microprocessor
	
	
	// instantiate hardware modules
	
	
	// Instantiation: Generate clk off of CLOCK_50, 11.9 Hz ~~ 88ms
	// Pass to game clk
	wire [31:0] clk;
	parameter whichClock = 22;
	clock_divider cdiv (CLOCK_50, clk);