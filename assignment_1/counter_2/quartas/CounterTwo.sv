module CounterTwo(q, clk, rst);
	input clk, rst;
	output [3:0] q;
	
	reg [3:0] ps;
	reg [3:0] ns;

	always @(*)
		begin
			ns[0] <= ~ps[0];
			ns[1] <= ps[0] ~^ ps[1];
			ns[2] <= (~ps[0] & ~ps[1] & ~ps[2]) | (ps[2] & ps[0]) | (ps[2] & ps[1]);
			ns[3] <= (ps[3] & ps[2]) | (ps[3] & ps[1]) | (ps[3] & ps[0]) | (~ps[0] & ~ps[1] & ~ps[2] & ~ps[3]);
		end
		
	assign q = ps;	
	always @(negedge rst or posedge clk)
		begin
			if(!rst)
				begin
					ps <= 0;
				end
			else
				begin
					ps <= ns;
				end
		end
endmodule 