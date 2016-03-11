module gameClock(clk, reset, gameTime); // input 50MhZ clk divided 22 times to 11.9Hz ~~ 83ms
	input clk, reset;
	output reg [31:0] gameTime = 32'b00000000000000000000000000000000;
	
	initial begin
		gameTime = 32'b00000000000000000000000000000000;
	end
		
	always@(posedge clk) begin
		if (reset)
			gameTime <= 32'b0;
		else
			gameTime <= gameTime + 1'b1;
	end
	
endmodule 