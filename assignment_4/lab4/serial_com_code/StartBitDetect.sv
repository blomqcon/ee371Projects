module StartBitDetect(writingChar, data, reset, clock);
	input data, reset, clock;
	output reg writingChar = 1'b0;
	
	always @(posedge clock) begin
		if(reset) begin
			writingChar <= 1'b0;
		end else if((~writingChar) & data) begin
			writingChar <= 1'b1;
		end
	end
 
endmodule 