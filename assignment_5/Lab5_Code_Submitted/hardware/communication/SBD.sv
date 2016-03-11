module SBD (clk, reset, receiving_in, charRec, r_enable);
	input 		clk, reset, receiving_in, charRec;
	output reg 	r_enable;
	
	parameter 	DISABLED = 1'b0, ENABLED = 1'b1;
	reg 			ps, ns; 

	assign r_enable = ps;
	
	always@(posedge clk) 
		begin 
			if (1'b0 == reset) 
				ps <= DISABLED;
			else 
				ps <= ns;
		end

	always@(*) 
		begin 
			case (ps)
				DISABLED: if (receiving_in == 1'b0) 
									ns = ENABLED;
								else 
									ns = ps;
				ENABLED: if (charRec)
									ns = DISABLED;
								else 
									ns = ps;
			endcase			
		end 

endmodule 
			
		
		
				