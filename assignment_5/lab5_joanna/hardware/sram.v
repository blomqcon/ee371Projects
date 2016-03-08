// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// File name: 
//	sram.sv
//
// Description:
//	Tests sram module in the sram.sv file
//
// Author:
//	Nick Lopez
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

module sram(data, readWrite, enable, address);
	inout [7:0] data;

	input readWrite, enable;
	
	input [10:0] address;
	
	reg [7:0] sramReg [2047:0];
	reg [7:0] data1;

	 // readWrite = 1'b1 read, readWrite = 1'b0 write
	assign data = (~enable & readWrite) ? data1 : 8'bz;

	always @(*) begin
		if (~readWrite) begin	
			sramReg[address] = data;
		end
		else if (readWrite & ~enable) begin
			data1 = sramReg[address];
		end
	end
	
endmodule
