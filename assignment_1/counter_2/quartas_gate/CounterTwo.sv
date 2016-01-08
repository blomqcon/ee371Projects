module CounterTwo(q, clk, rst);
	input clk, rst;
	output [3:0] q;
	
	wire [3:0] qBar;
	wire [3:0] d;
	
	//Gates for d[0];
	buf(d[0], qBar[0]);
	
	//Gates for d[1];
	xnor(d[1], q[0], q[1]);
	
	//Gates for d[2];
	wire q1OrLowerBits, q2AndLowerBitsOr, qBar2AndLowerBits;
	or(q1OrLowerBits, q[0], q[1]);
	and(q2AndLowerBitsOr, q[2], q1OrLowerBits);
	and(qBar2AndLowerBits, qBar[2], qBar[1], qBar[0]);
	or(d[2], qBar2AndLowerBits, q2AndLowerBitsOr);
	
	//Gates for d[3];
	wire q2OrLowerBits, q3AndLowerBitsOr, qBar3AndLowerBits;
	or(q2OrLowerBits, q[2], q[1], q[0]);
	and(q3AndLowerBitsOr, q[3], q2OrLowerBits);
	and(qBar3AndLowerBits, qBar[3], qBar[2], qBar[1], qBar[0]);
	or(d[3], qBar3AndLowerBits, q3AndLowerBitsOr);
	
	
	DFlipFlop c0 (q[0], qBar[0], d[0], clk, rst);
	DFlipFlop c1 (q[1], qBar[1], d[1], clk, rst);
	DFlipFlop c2 (q[2], qBar[2], d[2], clk, rst);
	DFlipFlop c3 (q[3], qBar[3], d[3], clk, rst);
endmodule 