module timer(q, clk, rst);
	input clk, rst;
	output reg [0:2] q;
	
	always @(posedge clk)
	begin
		if(!rst)
			if(q != 3'b111)
				begin
					q <= q + 1;
				end
			else 
				begin
					q <= q;
				end
		else
			begin
				q <= 3'b000;
			end
	end

endmodule