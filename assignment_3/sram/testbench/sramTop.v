
`include "sram.sv"

module testBench;
	// connect the two modules
	wire [7:0] dataIn, dataOut;
	wire 		readWrite, enable;
	wire [10:0]	address;
	wire clock;
	
	sram sram1(clock, dataIn, dataOut, readWrite, enable, address);
	Tester tester1 (clock, readWrite, enable, address, dataIn, dataOut);

	initial
	begin
		$dumpfile("sram.vcd");
		$dumpvars(1, sram1);
	end
endmodule

module Tester (clock, readWrite, enable, address, dataIn, dataOut); 
	output clock;
	output readWrite, enable;
	output [10:0]	address; 
	input [7:0]	dataOut;
	output [7:0] dataIn;
	
	reg readWrite, enable;
	reg [10:0]	address;
	reg [7:0]	dataIn;
	reg clock;

	parameter stimDelay = 20;
	integer i;
	initial // Response
	begin
		enable = 1'b1;
		address = 10'b0;
		dataIn = 8'b0;
		readWrite = 1'b0;
	end
	
	initial // Stimulus
	begin 
	enable = 1'b1; readWrite = 1'b0; clock = 1'b0;
	#stimDelay;
	
	for(i = 0; i < 128; i = i + 1) begin
		clock = 1;
		#stimDelay; dataIn = i; address = i;#stimDelay;
		clock = 0;
	end
	
	#stimDelay; enable = 1'b1; readWrite = 1'b1;#stimDelay;
	
	for(i = 0; i < 128; i = i + 1) begin
		#stimDelay; address = i;#stimDelay;
	end
	

	$finish; // finish simulation
	end
endmodule