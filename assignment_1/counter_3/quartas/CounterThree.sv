module CounterThree(q, clk, rst);
	input clk, rst;
	output [0:3] q;
	
	reg [0:3] ps;
	reg [0:3] ns;

	always @(*)
	begin
		ns[0] <= ps[1];
		ns[1] <= ps[2];
		ns[2] <= ps[3];
		ns[3] <= ~ps[0];
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

