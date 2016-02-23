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

module PISO(clk, reset, data_in, load_n, data_out); // Parallel in -> Serial Out (10 bits)
	
	// clk is the s/r clk control from characterBitCount
	input 		clk, reset, load_n;
	input [9:0] data_in;
	output 		data_out;

	reg [9:0] 	Q_out;
	reg 		bitStream;

	initial Q_out = 10'b1111111111;
	
	assign data_out = bitStream;
	
	// Always block conducts parallel load 
	always @(posedge clk) 
		begin
			if (reset) 
				Q_out[9:0] <= 10'b1111111111;
			else if (load_n) begin // export serially
				Q_out = data_in; end 
				bitStream = Q_out[9];
				Q_out[9] = Q_out[8];
				Q_out[8] = Q_out[7];
				Q_out[7] = Q_out[6];
				Q_out[6] = Q_out[5];
				Q_out[5] = Q_out[4];
				Q_out[4] = Q_out[3];
				Q_out[3] = Q_out[2];
				Q_out[2] = Q_out[1];
				Q_out[1] = Q_out[0];
				Q_out[0] = 1'b1; 
		end
endmodule