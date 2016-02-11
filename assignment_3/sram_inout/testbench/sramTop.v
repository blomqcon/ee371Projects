`include "sram.v"

module testBench;
	// connect the two modules
	wire [7:0] data;
	wire readWrite, enable;
	wire [10:0]	address;
	
	sram sram1(data, readWrite, enable, address);
	Tester tester1 (readWrite, enable, address, data);

	initial
	begin
		$dumpfile("sram.vcd");
		$dumpvars(1, sram1);
	end
endmodule

module Tester (readWrite, enable, address, data); 
	
	output readWrite, enable;
	output [10:0]	address; 
	inout [7:0]	data;
	
	reg readWrite, enable;
	reg [10:0]	address;
	reg [7:0]	data1;
	wire [7:0]	data;

	parameter stimDelay = 20;
	integer i;

	assign data = enable? data1 : 8'bzzzzzzzz;
	initial // Response
	begin
		enable = 1'b0;
		address = 8'b0;
		data1 = 11'b0;
		readWrite = 1'b0;
	end
	
	initial // Stimulus
	begin 
	enable = 1'b1; readWrite = 1'b0;
	#stimDelay;
	
	for(i = 0; i < 128; i = i + 1) begin
		#stimDelay; data1 = i; address = i;#stimDelay;
	end
	
	#stimDelay; enable = 1'b1; readWrite = 1'b1;#stimDelay;
	
	for(i = 0; i < 128; i = i + 1) begin
		#stimDelay; address = i;#stimDelay;
	end
	
	$finish; // finish simulation
	end
endmodule