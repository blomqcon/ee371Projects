module CounterThree(q, clk, rst);
	input clk, rst;
	output [0:3] q;

	wire [3:0] qBar;
	wire [3:0] d;

	//Gates for d[0];
	buf(d[0], q[1]);

	//Gates for d[1];
	buf(d[1], q[2]);

	//Gates for d[2];
	buf(d[2], q[3]);

	//Gates for d[3];
	buf(d[3], qBar[0]);

	DFlipFlop c0 (q[0], qBar[0], d[0], clk, rst);
	DFlipFlop c1 (q[1], qBar[1], d[1], clk, rst);
	DFlipFlop c2 (q[2], qBar[2], d[2], clk, rst);
	DFlipFlop c3 (q[3], qBar[3], d[3], clk, rst);
endmodule