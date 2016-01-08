module CounterOne(q, clk, rst);
	input clk, rst;
	output [3:0] q;
	
	reg ps[0:3]
	reg ns[0:3]

	always @(*)
		begin
			ns[0] <= ~ps[0];
			ns[1] <= ps[0] xor ps[1];
			ns[2] <= (ps[0] and ps[1] and ~ps[2]) or (ps[2] and ~ps[0]) or (ps[2] and ~ps[1]);
			ns[3] <= (ps[3] and ps[2]) or (ps[3] and ps[1]) or (ps[3] and ps[0]) or (ps[0] and ps[1] and ps[2] and ~ps[3]);
		end
		
	assign q = ps;	
	always @(negedge rst or posedge clk)
		begin
			if(!rst)
				begin
					q <= 0;
				end
			else
				begin
					ps <= ns;
				end
		end
	
	
endmodule 