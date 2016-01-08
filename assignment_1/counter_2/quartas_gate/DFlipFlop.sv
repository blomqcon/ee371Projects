module DFlipFlop(q, qBar, D, clk, rst);
	input D, clk, rst;
	output q, qBar;
	reg q;
	not n1 (qBar, q);
		always@ (negedge rst or posedge clk) begin
			if(!rst)
				q = 0;
			else
				q = D;
end endmodule 