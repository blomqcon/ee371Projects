//======================================================================
//  FILE: SRAM_testbench.sv
//  Author: Christian Gobrecht, Andres Munoz
//  
//  Description: Tests write to and read from a couple memory addresses
//======================================================================
`include "SRAM.sv"
module SRAM_testbench;
	wire [7:0] data;
	reg CS_n, OE_n, WE_n;
	reg [10:0] address;
	reg [7:0] data_in;
	
	parameter stimDelay = 10;
	
	initial // Response
	begin
		$display("\t\t data \t\t address \t OE_n \t WE_n \t\t Time ");
		$monitor("\t\t %b\t %b \t %b \t %b", data, address,
		OE_n, WE_n, $time );
	end 
	
	SRAM sram(data, address, OE_n, WE_n);
	
	assign data = ~OE_n ? 8'bZ : data_in;
	
	initial begin 		
		//initialize
		OE_n = 1; WE_n = 1; #stimDelay
		
		//write a value
		WE_n = 0; data_in = 8'd25; address = 11'd5; #stimDelay
		WE_n = 1; #stimDelay
		
		//write a value
		WE_n = 0; data_in = 8'd125; address = 11'd50; #stimDelay
		WE_n = 1; #stimDelay
		
		//read the first value
		WE_n = 1; address = 11'd5; OE_n = 0; #stimDelay
		
		//read the second value
		WE_n = 1; address = 11'd50; OE_n = 0; #stimDelay
		
		$finish;
	end 
endmodule 
		
	