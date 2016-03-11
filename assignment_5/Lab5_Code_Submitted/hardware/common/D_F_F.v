module D_F_F(clk, reset, D, Q);
	input clk, reset, D;
	output reg Q;
	
	always@(posedge clk)
		if (reset)
			Q <= 0;
		else // D == 0
			Q <= D;
endmodule