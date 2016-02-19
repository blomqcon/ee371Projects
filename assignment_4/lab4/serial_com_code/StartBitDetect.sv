module StartBitDetect(readingChar, data, reset, clock);
	input data, reset, clock;
	output reg readingChar = 1'b0;
	
	reg detectStartBit = 1'b0;
	
	wire [3:0] counter4;
	Counter4 c4(counter4, clock, ~detectStartBit);
	
	
	always @(posedge clock) begin
		if(reset) begin
			readingChar <= 1'b0;
			detectStartBit <= 1'b0;
		end else if((~readingChar) & data) begin
			detectStartBit <= 1'b1;
		end
		
		if(counter4 == 4'b1111) begin
			readingChar <= 1'b1;
			detectStartBit <= 1'b0;
		end
	end

endmodule 