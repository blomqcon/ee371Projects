module sram(clock, dataIn, dataOut, readWrite, enable, address);
	input clock;
	input [7:0] dataIn;
	output [7:0] dataOut;

	input readWrite, enable;
	input [10:0] address;
	
	reg [2047:0] sramReg [7:0];
	

	integer i;
	initial begin
		for(i = 0; i < 130; i = i + 1)
			sramReg[i] = 8'b0;
	end
	
	
	assign dataOut = (readWrite & enable)? sramReg[address] : 8'bzzzzzzzz;
	
	always @(posedge clock) begin
		if (~readWrite & enable) begin	
			sramReg[address] <= dataIn;
		end
	end
endmodule
