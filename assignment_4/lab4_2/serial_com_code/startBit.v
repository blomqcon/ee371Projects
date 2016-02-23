/*
Bryan Bednarski
EE 371 Prof. Peckol Winter 2016
Project 3: Extending a Microprocessor

startBit.v
This verilog module determines when to enable the Bit Sample Counter and 
Bit Indentification Counters for the Serial In Parallel Out Modules
*/

module startBit(enable, clk, reset, bitStream, BIC, BSC);
	output	reg	enable;
	input  		clk, reset, bitStream;
	input [3:0]	BIC, BSC;
	reg 		ns, reset2;
	
	// State encoding
	parameter DISABLE = 1'b0, ENABLE = 1'b1;

	initial enable = DISABLE;
	initial reset2 = 1'b1;

	always@(posedge clk) begin
		if (reset) begin 
			enable <= DISABLE;
			reset2 <= 1'b1; end
		else
			enable <= ns;
	end
	
	always@(*) begin
		if (reset2) begin
			ns = DISABLE;
			reset2 = 1'b0;
		end

		case (enable)
			DISABLE: if ((BIC == 4'b0000) && (bitStream == 0)) // Start bit of character (start bit)
						ns = ENABLE;
					else
						ns = DISABLE;
			ENABLE: begin if ((BIC == 4'b1010) && (BSC == 4'b1111) && bitStream == 1) 
					// Will turn the enable off when at the end of the last bit in sequence
						ns = DISABLE;
					if (BIC == 4'b1010 && BSC == 4'b0100)
						ns = DISABLE;
					else 
						ns = ENABLE; end 
		endcase
	end
	
endmodule
