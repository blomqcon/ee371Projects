module BSC (clk, enable, count);
	input 	clk, enable;
	output 	count;
	
	reg [3:0] counter;
	
	always @(posedge clk) 
		begin
			if (1'b0 == enable) 
				counter <= 4'b0000;
			else 
				counter <= counter + 4'b0001;
		end
	
	assign count = counter[3];
		
endmodule 

