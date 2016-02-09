module sram(data, readWrite, enable, address);
	inout [15:0] data;

	input readWrite, enable;
	input [9:0] address;
	
	reg [1023:0] sramReg [15:0];
	
	// readWrite = 1'b1 read, readWrite = 1'b0 write
	assign data = enable? (readWrite? sramReg[address]: data) : 16'bzzzzzzzzzzzzzzzz;
	//assign data = enable? sramReg[address] : 16'bzzzzzzzzzzzzzzzz;
	
	
	//assign data = enable?(readWrite? sramReg[address] : data) : 16'bzzzzzzzzzzzzzzzz;

	always @(address, enable, readWrite) begin
		if (~readWrite & enable) begin	
			sramReg[address] <= data;
		end
	end
	
endmodule
