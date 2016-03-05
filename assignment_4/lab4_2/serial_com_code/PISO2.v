/*	Joanna Mazer
	EE 371 Peckol Winter 2016
	Project 3: Extending a Microprocessor
	PISO.v
	
	This verilog module functions as a parallel in, serial out
	shift register. The 10 bit data will be loaded into the shift
	register, then when the load signal is not enabled, the data
	will be fed to the output one bit at a time on the posedge 
	of the clock signal.
*/

module PISO2(SRclk, reset, data_in, load_n, data_out); // Parallel in -> Serial Out (10 bits)
	
	// SRclk is the s/r SRclk control from characterBitCount
	input 		SRclk, reset, load_n;
	input [9:0] data_in;
	output 		data_out;
	
	reg [9:0] hold;
	reg shift;
	
	assign data_out = shift;

	always@(posedge SRclk or posedge load_n or posedge reset) begin
		if (reset) begin 
			shift <= 1'b1;
		end
		if (1'b1 == load_n) begin 
			hold <= data_in;
			shift <= 1'b1;
		end
		else if (SRclk == 1'b1) begin  
			hold[0] <= 1'b1;
			hold[1] <= hold[0];
			hold[2] <= hold[1];
			hold[3] <= hold[2];
			hold[4] <= hold[3];
			hold[5] <= hold[4];
			hold[6] <= hold[5];
			hold[7] <= hold[6];
			hold[8] <= hold[7];
			hold[9] <= hold[8];
			shift <= hold[9];
		end	
	end

endmodule
