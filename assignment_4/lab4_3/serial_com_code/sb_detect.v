module sb_detect (enable, reset, clk, data_in);
	output reg enable;
	input reset, clk;
	input data_in;
	
	always@(*)
	if(1'b0 == enable) begin
		if(1'b1 == data_in)
			enable = 1'b1;
		else 
			enable = 1'b0;
	end
	else enable = 1'b1;


endmodule
