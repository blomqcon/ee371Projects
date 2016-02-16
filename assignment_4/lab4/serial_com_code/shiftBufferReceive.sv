module shiftBufferReceive(dataIn, SRclock, dataBus);
	input dataIn, SRclock;
	output [7:0] dataBus;
	
	reg [7:0] temp = 0;
	
	always@(posedge SRclock) begin
		temp = temp << 1;
		temp[0] = dataIn;
	end
	assign dataBus = temp;
endmodule