module Timer(clk, rst, stopVal, done);
	input clk, rst;
	input [0:2] stopVal;
	output reg done;
	
	reg [0:2] q = 3'b000;
	
	
	wire slow_clk;
	clock_divider15 clk_div (clk, slow_clk);
	
	always @(*) begin
		done <= (q == stopVal);
	end
	
	always @(posedge slow_clk or posedge rst) begin
		if(rst)
			q <= 3'b000;
		else begin
			if(q != stopVal)
				q <= q + 1;
			else
				q <= q;
		end
	end
endmodule 