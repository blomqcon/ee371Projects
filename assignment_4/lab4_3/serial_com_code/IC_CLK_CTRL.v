module IC_CLK_CTRL (ic_clk_ctrl, bc, reset, clk);
	output ic_clk_ctrl;
	input clk, reset;
	input [3:0] bc;
	
	reg ps, ns;
	
	always@(*)
	if(4'b1010 != bc)
	ns <= ~ps;
	else
	ns <= 1'b0;
	
	
	always@(posedge clk)
	if(!reset)
	ps <= ns;
	else
	ps <= 1'b0;
	
	assign ic_clk_ctrl = ps;
endmodule
