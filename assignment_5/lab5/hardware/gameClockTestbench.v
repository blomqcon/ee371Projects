/*	Bryan Bednarski
	EE 371 Peckol Winter 2016
	Project 5: Space Invaders
	gameClockTestbecnh.v
	
	This .v file represents a top-level testbench for the gameClock.v file.
	This modules beings counting when the program is run so that our software program can track elapsed time.
*/

`include "gameClock.v"

module gameClockTestbench;
	// connect the two modules
	wire 		    clk, reset;
	wire [31:0] 	gameTime;
	
	// declare an instance of the module
	gameClock gcTest(clk, reset, gameTime);

	// declare an instance of the Tester module
	Tester test1(clk, reset, gameTime);
	
	// file specifications for gtkwave
	initial
		begin
		// dump file is for dumping all the variables in a simulation
		$dumpfile("gameClock.vcd");
		
		// dumps all the variables in module myDesign and below
		// but not modules instantiated in myDesign into the dump file.
		$dumpvars(1, gcTest);
		end

endmodule

module Tester (clk, reset, gameTime);

	input 	[31:0]			gameTime;
	output	reg	 			clk, reset;
		
	parameter stimDelay = 10;
	
	initial begin 
		$display("clk reset \t gameTime \t Time");
		$monitor("\t %b \t %b \t %b \t", clk, reset, gameTime, $time);
	end
	
	always #stimDelay clk = ~clk;
	
	initial begin // Stimulus 
		#(stimDelay);  clk = 0; reset = 0;
		#(stimDelay);  reset = 1;
		#(stimDelay);  reset = 0;
		#(100*stimDelay);
		
		$finish; 						// finish simulation
	end

endmodule