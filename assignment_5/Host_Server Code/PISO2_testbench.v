///*	Joanna Mazer
//	EE 371 Peckol Winter 2016
//	Project 3: Extending a Microprocessor
//	PISO_testbench.v
//	
//	These modules function as the testbench to the PISO.v file.
//	A truth table will be generated, as well as a gtkwave output
//	waveform.
//*/
//
////`include "PISO2.v"
//
//module PISO2_testbench;
//	// connect the two modules
//	wire 		clk, reset, data_out, load_n;
//	wire [9:0] 	data_in;
//	
//	// declare an instance of the module
//	PISO2 PISO_test(clk, reset, data_in, load_n, data_out);
//
//	// declare an instance of the Tester module
//	Tester test1(clk, reset, data_in, load_n, data_out);
//	
//	// file specifications for gtkwave
//	initial
//		begin
//		// dump file is for dumping all the variables in a simulation
//		$dumpfile("PISO2.vcd");
//		
//		// dumps all the variables in module myDesign and below
//		// but not modules instantiated in myDesign into the dump file.
//		$dumpvars(1, PISO_test);
//		end
//
//endmodule
//
//module Tester (clk, reset, data_in, load_n, data_out);
//	input 		data_out;
//	output 		clk, reset, load_n;
//	output 		[9:0] data_in;
//
//	reg 		clk, reset, load_n;
//	reg 		[9:0] data_in;
//	
//	parameter stimDelay = 10;
//	
//	initial begin 
//		$display("\t\t clk reset data_in load_n data_out \t Time");
//		$monitor("\t\t %b \t %b \t %b \t %b \t %b", clk, reset, data_in, load_n, data_out, $time);
//	end
//	
//	always #stimDelay clk = ~clk;
//	
//	initial begin // Stimulus 
//		#(2*stimDelay) clk = 1'b0; reset = 1'b0; load_n = 1'b0; data_in = 10'b1111111111; //t_enable = 1'b0;	// (no data)
//		#(2*stimDelay) reset = 1'b1; // (reset)
//		#(2*stimDelay) reset = 1'b0;
//		#(2*stimDelay);
//		#(2*stimDelay);
//		#(2*stimDelay); 
//		#(32*stimDelay); 
//		#(32*stimDelay);
//		#(32*stimDelay);
//		#(32*stimDelay) data_in = 10'b0101100101; /*t_enable = 1'b0;*/ load_n = 1'b1;
//		#(32*stimDelay); load_n = 1'b0; //t_enable = 1'b1;
//		#(32*stimDelay);	
//		#(32*stimDelay);	
//		#(32*stimDelay);	
//		#(32*stimDelay);	
//		#(32*stimDelay);	
//		#(32*stimDelay);	
//		#(32*stimDelay);	
//		#(32*stimDelay);	
//		#(32*stimDelay); 	
//		#(32*stimDelay); /*t_enable = 1'b0;*/ data_in = 10'b1111111111;	
//		
//		// #(3*stimDelay) clk = 1'b0; reset = 1'b0; data_in = 10'b1111111111; load_n = 1'b0;
//		// #(3*stimDelay) reset = 1'b1;	// reset the system
//		// #(3*stimDelay) reset = 1'b0;
//		// #(2*stimDelay)
//		// #(2*stimDelay) data_in = 10'b0100101111; load_n = 1'b1;
//		// #(3*stimDelay) load_n = 1'b0;
//
//		#(50*stimDelay); 				// needed to see END of simulation
//		$finish; 						// finish simulation
//	end
//
//endmodule