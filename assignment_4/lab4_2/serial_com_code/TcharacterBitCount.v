/*
Bryan Bednarski
EE 371 Prof. Peckol Winter 2016
Project 3: Extending a Microprocessor

characterBitCount.v
This verilog module combines the functionality of the Bit Identification Count, 
Bit Sample Count and S/R Clock Control top-level modules
*/

module TcharacterBitCount(charReceived, SRclk, BIC, BSC, clk, reset, enable, load_n);
	output reg charReceived, SRclk;
	output reg [3:0] BIC, BSC;
	input clk, reset, enable, load_n;
	
	reg [7:0] combinedCounter;
	
	initial
		begin
			BIC = 4'b0;
			BSC = 4'b0;
			combinedCounter = 8'b0;
			charReceived = 1'b0;
			SRclk = 1'b0;
		end
	
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
			if (load_n == 1'b0)	begin 
				 if (enable)
					begin
						charReceived = 1'b0;
						if (combinedCounter[3:0] == 4'b0111) 	// BSC Middle of the bit
							SRclk = 1'b1; 
						else 									// (4'b0111 != BSC)
							SRclk = 1'b0;
						if((combinedCounter[7:4] == 4'b1010) & (combinedCounter[3:0] == 4'b1000)) begin 
							charReceived = 1'b1;
						end
						combinedCounter = combinedCounter + 8'b1;
					end
				end
			else 		// !enable
				begin
					SRclk = 1'b0;
					charReceived = 1'b0;
					combinedCounter = 8'b0;		
				end
			//default: combinedCounter = 8'bx;
		end


endmodule
