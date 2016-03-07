module DFlipFlop(q, D, clk, rst);
	input D, clk, rst;
	output q;
	reg q;

	initial begin 
		q = 1;
	end 

	always@ (posedge clk) begin
		if(rst)
			q = 1;
		else
			q = D;
	end 

endmodule 