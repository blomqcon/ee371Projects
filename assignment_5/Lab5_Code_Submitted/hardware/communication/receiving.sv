module receiving (clk, reset, serial_in, p_in, char_received);
	input 			clk, reset, serial_in;
	output [7:0] 	p_in;
	output 			char_received;
	wire 				r_enable, r_count;

	SBD 		SBD_receiving 		(.clk(clk), .reset(reset), .receiving_in(serial_in), .charRec(char_received), .r_enable(r_enable));	
	BSC 		BSC_receiving 		(.clk(clk), .enable(r_enable), .count(r_count));	
	BIC 		BIC_receiving 		(.SRclk(r_count), .enable(r_enable), .char_status(char_received));	
	SIPO 		SIPO_receiving		(.SRclk(r_count), .SIPO_in(serial_in), .SIPO_out(p_in));

endmodule 
