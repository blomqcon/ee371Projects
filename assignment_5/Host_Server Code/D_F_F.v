/*	Bryan Bednarski
	EE 371 Peckol Winter 2016
	Project 5: Space Invaders
	D_F_F.v
	
	This is a DFlipFlop. If you dont know what this is, just go play the game.
*/

module D_F_F(clk, reset, D, Q);
	input clk, reset, D;
	output reg Q;
	
	always@(posedge clk)
		if (reset)
			Q <= 0;
		else // D == 0
			Q <= D;
endmodule