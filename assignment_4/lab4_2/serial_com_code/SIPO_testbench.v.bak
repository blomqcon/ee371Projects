/*	Joanna Mazer
	EE 371 Peckol Winter 2016
	Project 3: Extending a Microprocessor
	SIPO_testbench.v
	
	These modules function as the testbench to the SIPO.v file.
	A truth table will be generated, as well as a gtkwave output
	waveform.
*/

`include "SIPO.v"

module SIPO_testbench;
	// connect the two modules
	wire 		clk, reset, data_in;
	wire [9:0] 	data_out;
	
	// declare an instance of the module
	SIPO SIPO_test(data_out, clk, reset, data_in);

	// declare an instance of the Tester module
	Tester test1(data_out, clk, reset, data_in);
	
	// file specifications for gtkwave
	initial
		begin
		// dump file is for dumping all the variables in a simulation
		$dumpfile("SIPO.vcd");
		
		// dumps all the variables in module myDesign and below
		// but not modules instantiated in myDesign into the dump file.
		$dumpvars(1, SIPO_test);
		end

endmodule

module Tester (data_out, clk, reset, data_in);
	input 	[9:0] data_out;
	output 	clk, reset, data_in;
	reg 	clk, reset, data_in;
	
	parameter stimDelay = 10;
	
	initial begin 
		$display("\t\t clk reset data_in data_out \t Time");
		$monitor("\t\t %b \t %b \t %b \t %b", clk, reset, data_in, data_out, $time);
	end
	
	always #stimDelay clk = ~clk;
	
	initial begin // Stimulus 
		#(2*stimDelay) clk = 1'b0; reset = 1'b0; data_in = 1'b1;
		#(2*stimDelay) reset = 1'b1;	// reset the system
		#(2*stimDelay) reset = 1'b0;
		#(2*stimDelay) data_in = 1'b1;
		#(2*stimDelay) data_in = 1'b0;
		#(2*stimDelay) data_in = 1'b1;
		#(2*stimDelay) data_in = 1'b1;
		#(2*stimDelay) data_in = 1'b1;
		#(2*stimDelay) data_in = 1'b0;
		#(2*stimDelay) data_in = 1'b1;
		#(2*stimDelay) data_in = 1'b0;
		#(2*stimDelay) data_in = 1'b0;
		#(2*stimDelay) data_in = 1'b1;
		#(2*stimDelay) data_in = 1'b0;
		#(2*stimDelay) data_in = 1'b1;

		//#(5*stimDelay); 				// needed to see END of simulation
		$finish; 						// finish simulation
	end

endmodule