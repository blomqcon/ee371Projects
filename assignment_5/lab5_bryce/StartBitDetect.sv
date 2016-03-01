
	module StartBitDetect(SClk, reset, data_in, char_received, in_enable);
		input SClk, reset, data_in, char_received;
		output reg in_enable;
		
		// Transmission States : Low for quiet state, High for transmission state
		parameter quiescent = 1'b1, recieving = 1'b0;
		reg ps, ns; 
		

		// Determine the State 
		// changed to @ (*) from always @(data_in)
		always @(*) begin 
			case (ps)
				quiescent : if (~data_in) ns = recieving;
							else ns = ps;
				recieving : if (char_received) ns = quiescent;
							else ns = ps;
			endcase 
			in_enable = (ps == recieving);
		end 
		
		always @(posedge SClk) begin 
			if (~reset) ps <= quiescent;
			else ps <= ns;
		end
	endmodule 
			
		
		
				