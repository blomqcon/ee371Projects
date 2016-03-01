module BIC_Out(BSC_clk, enable, char_sent);
	input BSC_clk, enable;
	output reg char_sent;
	reg [3:0] BIC_Count;
	
	
	always @(*) begin 
		if (BIC_Count >= 4'b1010)
			char_sent = 1'b1;
		else char_sent = 1'b0;
	end 
	
	// BSC_Count[3] is the most significant bit
	always @(negedge BSC_clk or negedge enable) begin 
		if (~enable) BIC_Count <= 4'b0000;
		else BIC_Count <= BIC_Count + 4'b0001;
	end
endmodule
		