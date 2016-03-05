/*	Bryan Bednarski
	EE 371 Peckol Winter 2016
	Project 5: Space Invaders
	LFSR_16bitTestbench.v
	
	This .v file represents a top-level testbench for our 16-bit LFSR which will be used
	to generate random positions for aliens in the space invader game.

	*/

`include "LFSR_16bit.v"

module LFSR_16bitTestbench;
	// connect the two modules
	wire 		    clk, reset;
	wire [15:0] 	Q;
	
	// declare an instance of the module
	LFSR_16bit lfsrTest(clk, reset, Q);

	// declare an instance of the Tester module
	Tester test1(clk, reset, Q);
	
	// file specifications for gtkwave
	initial
		begin
		// dump file is for dumping all the variables in a simulation
		$dumpfile("lfsrTest.vcd");
		
		// dumps all the variables in module myDesign and below
		// but not modules instantiated in myDesign into the dump file.
		$dumpvars(1, lfsrTest);
		end

endmodule

module Tester (clk, reset, Q);

	input 	[15:0]			Q;
	output	reg	 			clk, reset;
		
	parameter stimDelay = 10;
	
	initial begin 
		$display("clk reset \t Q \t Time");
		$monitor("\t %b \t %b \t %b \t", clk, reset, Q, $time);
	end
	
	always #stimDelay clk = ~clk;
	
	initial begin // Stimulus 
		#(stimDelay);  clk = 0; reset = 0;
		#(stimDelay);  reset = 1;
		#(stimDelay);  reset = 0;
		#(1000*stimDelay);
		$finish; 						// finish simulation
	end

endmodule
