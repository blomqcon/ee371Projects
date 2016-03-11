module SIPO (SRclk, SIPO_in, SIPO_out);
	input 			SRclk, SIPO_in;
	output [7:0] 	SIPO_out;
	reg	 [7:0] 	Q;
	
	always @(posedge SRclk) 
		begin 
			Q[0] <= SIPO_in;
			Q[1] <= Q[0];
			Q[2] <= Q[1];
			Q[3] <= Q[2];
			Q[4] <= Q[3];
			Q[5] <= Q[4];
			Q[6] <= Q[5];
			Q[7] <= Q[6];
		end
	
	assign SIPO_out = Q;
		
endmodule
