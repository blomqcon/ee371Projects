/*
Bryan Bednarski
EE 371 Prof. Peckel Winter 2016
Project 3: Extending a Mircoprocessor

startBitTop.v
This is a top-level verilog testing modules for startBit.v
*/

`include "startBit.v"

module testBench;
	// Connect the two modules
	wire	enable;
	wire	clk, reset, bitStream;
	wire	[3:0] BIC, BSC;
	
	// declare an instance of the startBit module
	startBit	sb(enable, clk, reset, bitStream, BIC, BSC);
	
	// declare an instance of the Tester Module
	Tester myTester(enable, clk, reset, bitStream, BIC, BSC);
	
	// file specifications for gtkwave
	initial
	begin
		// dump file is for dumping all the variables in a simulation
		$dumpfile("startBitFile.vcd");
		// dumps all the variables in module myDesign and below
		// but not modules instantiated in myDesign into the dumpfile.
		$dumpvars(1, testBench);
	end
endmodule

module Tester (enable, clk, reset, bitStream, BIC, BSC);
	input		enable;
	output 		clk, reset, bitStream;
	output  	[3:0]  BIC, BSC;
	reg			clk, reset, bitStream;
	reg 		[3:0]  BIC, BSC;

	parameter stimDelay = 20;
	
	initial
	begin
	$display("\t\t enable \t clk reset bitStream BIC BSC \t Time ");
	$monitor("\t\t %b \t %b \t %b \t %b \t %b", enable, clk, reset, bitStream, BIC, BSC, $time );
	end

	always
		#stimDelay clk = ~clk;
	
	initial // Stimulus
	begin 
	#stimDelay clk = 1'b1; bitStream = 1;
	#stimDelay reset = 0; BIC = 4'b0000; BSC = 4'b0000;
	#stimDelay reset = 1;
	#stimDelay reset = 0;
	#(stimDelay * 5);
	#stimDelay bitStream = 0;
	#(stimDelay * 5);
	#stimDelay bitStream = 1;
	#(stimDelay * 5);
	#stimDelay BIC = 4'b1001; BSC = 4'b1111;
	#stimDelay;
	#stimDelay;
	#stimDelay BIC = 4'b0000;
	
	#(60*stimDelay); // needed to see END of simulation
	$finish; // finish simulation
	end
endmodule