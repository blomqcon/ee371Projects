module StartBitDetect(serialDataIn, enable, clk);
	input serialDataIn, clk;
	output enable;
	
	always @(posedge clk) begin
		enable <= serialDataIn;
	end
 
endmodule 