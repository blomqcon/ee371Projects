module BIC (SRclk, enable, char_status);
	input 		SRclk, enable;
	output 		char_status;
	
	reg [3:0] 	counter;
	reg 			status;
	
	assign char_status = status;
	
	always@(*) 
		begin 
			if (counter < 4'b1001)
				status = 1'b0;
			else 
				status = 1'b1;
		end 
	
	always@(negedge SRclk or negedge enable) 
		begin 
			if (1'b0 == enable)
				counter <= 4'b0000;
			else  
				counter <= counter + 4'b0001;
		end
		
endmodule