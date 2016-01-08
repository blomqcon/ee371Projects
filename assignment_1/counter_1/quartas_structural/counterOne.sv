module CounterOne(q, clk, rst);
	input clk, rst;
	output [0:3] q;
	
	wire [0:3] qBar;
	
	DFlipFlop c0 (q[0], qBar[0], qBar[0], clk, rst);
	DFlipFlop c1 (q[1], qBar[1], qBar[1], q[0], rst);
	DFlipFlop c2 (q[2], qBar[2], qBar[2], q[1], rst);
	DFlipFlop c3 (q[3], qBar[3], qBar[3], q[2], rst);
endmodule 