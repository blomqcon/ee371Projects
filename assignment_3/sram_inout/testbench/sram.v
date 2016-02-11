module sram(data, readWrite, enable, address);
	inout [7:0] data;

	input readWrite, enable;
	input [10:0] address;
	
	reg [2047:0] sramReg [7:0];
	
	// readWrite = 1'b1 read, readWrite = 1'b0 write
	assign data = enable? (readWrite? sramReg[address]: data) : 8'bzzzzzzzz;

	always @(address, enable, readWrite) begin
		if (~readWrite & enable) begin	
			sramReg[address] <= data;
		end
	end
endmodule