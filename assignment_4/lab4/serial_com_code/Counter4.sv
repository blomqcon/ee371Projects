module Counter4(q, clk, rst);
	
	input clk, rst;
	output reg [3:0] q = 4'b0000;
	
	wire [3:0] qBar;
	
	//DFlipFlop c0 (q[0], qBar[0], qBar[0], clk, rst);
	//DFlipFlop c1 (q[1], qBar[1], (qBar[0] & qBar[1]) | (q[1] & q[0]), clk, rst);
	//DFlipFlop c2 (q[2], qBar[2], (qBar[0] & qBar[1] & qBar[2]) | (q[2] & q[0]) | (q[2] & q[1]), clk, rst);
	//DFlipFlop c3 (q[3], qBar[3], (qBar[0] & qBar[1] & qBar[2] & qBar[3]) | (q[3] & q[0]) | (q[3] & q[1]) | (q[3] & q[2]), clk, rst);
	
	always @(posedge clk or posedge rst) begin
		if(rst)
			q <= 4'b0000;
		else begin
			if(q != 4'b1111)
				q <= q + 1;
			else
				q <= 4'b0000;
		end
	end
	
endmodule 