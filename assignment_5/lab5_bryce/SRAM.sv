//======================================================================
//  FILE: SRAM.sv
//  Author: Christian Gobrecht, Andres Munoz
//  
//  Description: SRAM module with 2 KB address space, 8-bit word size. 
//      Bidirectional data port with active-low output/write enable.
//======================================================================
module SRAM(data, address, OE_n, WE_n);

	inout [7:0] data; 
	input [10:0] address;
	input OE_n, WE_n;

	reg [7:0] memory [0:2047];
	
	assign data = (~OE_n & WE_n) ? memory[address] : 8'bZ;
	
	always @(posedge WE_n) begin 
		if (OE_n) memory[address] <= data;
	end 
endmodule
