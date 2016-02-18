module SerialOutput(serialOut, charSent, data, transmitEnable, clock);
	input [7:0] data;
	input clock;
	input transmitEnable;
	output serialOut;
	output charSent;
	
	wire writingChar;
	wire [3:0] identifer;
	wire srClock, bicClock;
	wire [3:0] counter4;
	
	//StartBitDetect startDetect(writingChar, data, (charRecieved) && (counter4 == 4'b1111), clock);
	
	BitSampleCount bsc(srClock, bicClock, (~writingChar) | charRecieved, clock);
	shiftBufferReceive sbr(data, srClock, parallelOut);
	BitIdentifierCount bic(charRecieved, identifer, ~writingChar, bicClock);
	
	Counter4 c4(counter4, clock, ~charRecieved);
	
endmodule 