/*
Bryan Bednarski
EE 371 Prof. Peckol Winter 2016
Project 3: Extending a Microprocessor

characterBitCount.v
This verilog module combines the functionality of the Bit Identification Count, 
Bit Sample Count and S/R Clock Control top-level modules
*/

module characterBitCount(charReceived, SRclk, BIC, BSC, clk, reset, enable);
	output reg charReceived, SRclk;
	output reg [3:0] BIC, BSC;
	input clk, reset, enable;
	
	reg [7:0] combinedCounter;
	
	initial
		begin
			BIC = 4'b0;
			BSC = 4'b0;
			combinedCounter = 8'b0;
			charReceived = 1'b0;
			SRclk = 1'b0;
		end
	
	//BIC[3:0] = combinedCounter[7:4];
	//BSC[3:0] = combinedCounter[3:0];
	
	// assign BIC = 4'b0;
	// assign BSC = 4'b0;
	
	
	always@(posedge clk)
		begin
			BIC[3:0] = combinedCounter[7:4];
			BSC[3:0] = combinedCounter[3:0];
			if (reset)
				begin
					charReceived = 1'b0;
					SRclk = 1'b0;
					combinedCounter = 8'b0;
				end
			else if (combinedCounter[7:4] == 4'b1011)
				combinedCounter <= 8'b00000000;
			else if (enable)
				begin
					charReceived = 1'b0;
					if (combinedCounter[3:0] == 4'b0111) // BSC Middle of the bit
						SRclk = 1'b1; 
					else // (4'b0111 != BSC)
						SRclk = 1'b0;
					if((combinedCounter[7:4] == 4'b1001) & (combinedCounter[3:0] == 4'b1000))
						begin
						charReceived = 1'b1;
						combinedCounter = combinedCounter + 8'b1;
						end
				end
			else // !enable
				begin
					SRclk = 1'b0;
					charReceived = 1'b0;
					combinedCounter = 8'b0;		
				end
			//default: combinedCounter = 8'bx;
		end
		
endmodule 
