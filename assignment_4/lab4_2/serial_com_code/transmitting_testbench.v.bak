/*	Joanna Mazer
	EE 371 Peckol Winter 2016
	Project 3: Extending a Microprocessor
	transmitting_testbench.v
	
	These modules function as the testbench to the receiving.v file.
	A truth table will be generated, as well as a gtkwave output
	waveform.
*/

`include "transmitting.v"

module transmitting_testbench;
	// connect the two modules
	wire 		clk, reset, t_enable, load_n;
	wire [9:0] 	data_in;
	wire 	 	charSent, data_out;
	
	// declare an instance of the module
	transmitting transmitting_test(clk, reset, t_enable, data_in, data_out, charSent, load_n);

	// declare an instance of the Tester module
	Tester test1(clk, reset, t_enable, data_in, data_out, charSent, load_n);
	
	// file specifications for gtkwave
	initial
		begin
		// dump file is for dumping all the variables in a simulation
		$dumpfile("transmitting.vcd");
		
		// dumps all the variables in module myDesign and below
		// but not modules instantiated in myDesign into the dump file.
		$dumpvars(1, transmitting_test);
		end

endmodule

module Tester (clk, reset, t_enable, data_in, data_out, charSent, load_n);

	input 				charSent, data_out;
	output reg 			clk, reset, t_enable, load_n;
	output reg [9:0] 	data_in;
	
	parameter stimDelay = 10;
	
	initial begin 
		$display("clk reset t_enable \t data_in load_n \t data_out \t charSent Time");
		$monitor("\t %b \t %b \t %b \t %b \t %b \t %b \t %b", clk, reset, t_enable, data_in, 
					load_n, data_out, charSent, $time);
	end
	
	always #stimDelay clk = ~clk;
	
	initial begin // Stimulus 
		#(2*stimDelay) clk = 1'b0; reset = 1'b0;  	// (no data)
		#(2*stimDelay) reset = 1'b1; // (reset)
		#(2*stimDelay) reset = 1'b0;
		#(2*stimDelay); t_enable = 1'b0;
		#(32*stimDelay); data_in = 10'b0110100101; t_enable = 1'b1; load_n = 1'b1; // (input data value)
		#(32*stimDelay); load_n = 1'b0; 
		#(32*stimDelay);
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay); t_enable = 1'b0; 
		#(32*stimDelay); data_in = 10'b0101100101; t_enable = 1'b1; load_n = 1'b1;
		#(32*stimDelay); load_n = 1'b0;
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay); t_enable = 1'b0;
		#(32*stimDelay); data_in = 10'b0100101011; t_enable = 1'b1; load_n = 1'b1;
		#(32*stimDelay); load_n = 1'b0;
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	
		#(32*stimDelay);	


		$finish; 						// finish simulation
	end

endmodule