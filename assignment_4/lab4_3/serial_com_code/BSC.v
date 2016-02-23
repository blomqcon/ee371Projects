module BSC (bsc, sr_clk_ctrl, reset, clk, transmit_enable);
	output bsc, sr_clk_ctrl;
	input clk, reset, transmit_enable;
	
	reg [3:0] ps, ns;
	
	always@(*)
	if(transmit_enable & 4'b0111 != ps)
	ns <= ps + 4'b0001;
	else if(transmit_enable & (4'b0111 == ps | 4'b1111 == ps))
	ns <= 4'b1111;
	else 
	ns <= 4'b0000;
	
	always@(posedge clk)
	if(!reset)
	ps <= ns;
	else
	ps <= 4'b0000;
	
		
	assign bsc = ps;
	assign sr_clk_ctrl = ps[3];
endmodule 
