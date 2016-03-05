// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// File name: 
//	alienSelectTop.v
//
// Description:
//	Tests alienSelect module in the alienSelect.v file
//
// Author:
//	Nick Lopez
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

 `include "alienSelect.v"

module testBench;
	// connect the two modules
	wire [9:0] 	switches;
	wire [1:0] 	y; 			//Alien Row (0-2)
	wire [2:0] 	x;			//Alien Column (0-7)
	
	// declare an instance of the alienSelect module
	alienSelect aSel1(x, y, switches);

	// declare an instance of the Tester module
	Tester tester1 (switches, x, y);

	// file specifications for gtkwave
	initial
	begin
		// dump file is for dumping all the variables in a simulation
		$dumpfile("alienSelect.vcd");
		// dumps all the variables in module myDesign and below
		// but not modules instantiated in myDesign into the dumpfile.
		$dumpvars(1, aSel1);
	end
endmodule

module Tester (switches, x, y); 	
	output reg [9:0]	switches;
	input [1:0]			y;
	input [2:0]			x;
	
	parameter stimDelay = 20;
	integer i;

	initial // Response
	begin
	$display("\t  switches \t  x \t\t y \t\t  Time ");
	$monitor("\t %b \t %b \t %b ", switches, x, y, $time );
	end
	
	initial // Stimulus
	begin 
	#stimDelay;
	for(i = 0; i < 1025; i = i + 1) begin
		#stimDelay switches = i; 
	end

	#(60*stimDelay); // needed to see END of simulation
	$finish; // finish simulation
	end
endmodule