/*	Joanna Mazer
	EE 371 Peckol Winter 2016
	Project 3: Extending a Microprocessor
	receiving_testbench.v
	
	These modules function as the testbench to the receiving.v file.
	A truth table will be generated, as well as a gtkwave output
	waveform.
*/

`include "receiving.v"

module receiving_testbench;
	// connect the two modules
	wire 		clk, reset, data_in;
	wire [9:0] 	data_out;
	wire 	 	charReceived;
	
	// declare an instance of the module
	receiving receiving_test(clk, reset, data_in, data_out, charReceived);

	// declare an instance of the Tester module
	Tester test1(clk, reset, data_in, data_out, charReceived);
	
	// file specifications for gtkwave
	initial
		begin
		// dump file is for dumping all the variables in a simulation
		$dumpfile("receiving.vcd");
		
		// dumps all the variables in module myDesign and below
		// but not modules instantiated in myDesign into the dump file.
		$dumpvars(1, receiving_test);
		end

endmodule

module Tester (clk, reset, data_in, data_out, charReceived);

	input [9:0] data_out;
	input 		charReceived;
	output reg 	clk, reset, data_in;
	
	parameter stimDelay = 10;
	
	initial begin 
		$display("\t\t clk reset data_in \t data_out \t charReceived \t Time");
		$monitor("\t %b \t %b \t %b \t %b \t %b", clk, reset, data_in, data_out, charReceived, $time);
	end
	
	always #stimDelay clk = ~clk;
	
	initial begin // Stimulus 
		#(2*stimDelay) clk = 1'b0; reset = 1'b0; data_in = 1'b1; // (no data)
		#(2*stimDelay) reset = 1'b1;	// (reset)
		#(2*stimDelay) reset = 1'b0; data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b0;	// (start bit) INPUT SIGNAL: (msb) 0110100101 (lsb)
		#(32*stimDelay) data_in = 1'b1;	// (start of data #1)
		#(32*stimDelay) data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b0;
		#(32*stimDelay) data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b0;
		#(32*stimDelay) data_in = 1'b0;
		#(32*stimDelay) data_in = 1'b1;	// (end of data)
		#(32*stimDelay) data_in = 1'b0;	// (parity bit)
		#(32*stimDelay) data_in = 1'b1;	// (end bit)
		#(32*stimDelay) data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b0; // (start of data #2)
		#(32*stimDelay) data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b0;
		#(32*stimDelay) data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b0;
		#(32*stimDelay) data_in = 1'b0;
		#(32*stimDelay) data_in = 1'b0;	// (end of data)
		#(32*stimDelay) data_in = 1'b1; // (parity bit)
		#(32*stimDelay) data_in = 1'b1; // (end bit)
		#(32*stimDelay) data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b1;
		#(32*stimDelay) data_in = 1'b1;

		$finish; 						// finish simulation
	end

endmodule