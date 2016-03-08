module PISO (SRclk, reset, load, PISO_in, PISO_out); 
	input 		SRclk, load, reset;
	input [7:0] PISO_in;
	output 		PISO_out;
	
	reg [9:0] data;
	
	assign PISO_out = data[9];
	
	always @(posedge SRclk or negedge reset) 
		begin
			if (1'b0 == reset)
				data <= 10'b1111111111;
			else if (load)
				data <= {1'b0, PISO_in, 1'b1};
			else
				data = {data[8:0], 1'b1};
		end
		
endmodule
