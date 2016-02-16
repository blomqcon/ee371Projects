module shiftBufferTransmit(load, dataBus, SRclock, dataOut);
	input load, SRclock;
	input [7:0] dataBus;
	output dataOut;
	
	reg [7:0] temp = 0;
	
	always@(posedge SRclock) begin
		if(load) begin
			temp = dataBus;
		end else begin
			temp = temp >> 1;
		end
	end
	assign dataOut = temp[0];
endmodule