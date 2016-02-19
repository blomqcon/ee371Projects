module shiftBufferTransmit(load, dataBus, SRclock, dataOut);
	input load, SRclock;
	input [7:0] dataBus;
	output dataOut;// = 1'b0;
	
	reg [7:0] temp = 8'b00000000;
	reg [2:0] curBit = 3'b000;
	
	always@(posedge SRclock or posedge load) begin
		if(load) begin
			temp <= dataBus;
			curBit <= 3'b000;
		end else begin
			temp = temp >> 1;
			curBit <= curBit + 3'b001;
			//dataOut <= temp[0];
		end
	end
	assign dataOut = temp[0];
endmodule