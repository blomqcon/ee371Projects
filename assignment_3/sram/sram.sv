module sram(dataIn, dataOut, readWrite, enable, address);
	input [7:0] dataIn;
	output [7:0] dataOut;

	input readWrite, enable;
	input [10:0] address;
	
	reg [2047:0] sramReg [7:0];
	
	
	assign dataOut = (readWrite & enable)? sramReg[address] : 8'bzzzzzzzz;
	
	always @(address, enable, readWrite) begin
		if (~readWrite & enable) begin	
			sramReg[address] <= dataIn;
		end
	end
endmodule 