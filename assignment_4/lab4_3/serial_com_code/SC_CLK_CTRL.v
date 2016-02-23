module SC_CLK_CTRL (sc_clk_ctrl, bc, reset, clk);
	output sc_clk_ctrl;
	input clk, reset;
	input [3:0] bc;
	
	reg ps, ns;
	
	always@(*)
	if(1'b1 == bc[3])
	ns <= ~ps;
	else
	ns <= 1'b0;
	
	
	always@(posedge clk)
	if(!reset)
	ps <= ns;
	else
	ps <= 1'b0;
	
	assign sc_clk_ctrl = ps;
endmodule
