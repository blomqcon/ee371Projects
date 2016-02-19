module SerialOutput(serialOut, charSent, data, transmitEnable, load, clock);
	input [7:0] data;
	input clock;
	input transmitEnable;
	input load;
	output serialOut;
	output charSent;
	
	reg transmitting = 1'b0;
	wire writingChar;
	wire [3:0] identifer;
	wire srClock, bicClock;
	
	reg waitedABit = 1'b0;
	wire [3:0] counter4StartBit;
	reg waitedABitStop = 1'b0;
	wire [3:0] counter4StopBit;
	
	//StartBitDetect startDetect(writingChar, data, (charRecieved) && (counter4 == 4'b1111), clock);
	
	BitSampleCount bsc(srClock, bicClock, (~transmitting | waitedABit) | charSent, clock);
	
	shiftBufferTransmit sbt(load, data, srClock, serialOut);
	BitIdentifierCount bic(charSent, identifer, (~transmitting), bicClock);
	
	Counter4 c4Start(counter4StartBit, clock, transmitEnable | ~waitedABit);
	Counter4 c4Stop(counter4StopBit, clock, ~charSent | ~waitedABitStop);

	
	always @(posedge clock) begin 
		if(transmitEnable) begin
			transmitting <= 1;
			waitedABit <= 1;
		end
		
		if(counter4StartBit == 4'b1111) begin
			waitedABit <= 0;
		end
		
		if(counter4StopBit == 4'b1111) begin
			waitedABitStop <= 0;
		end
		
		if(charSent) begin
			waitedABitStop <= 1;
		end
		
		if(counter4StopBit == 4'b1111) begin
			transmitting <= 0;
		end
		
	end
	
endmodule 

