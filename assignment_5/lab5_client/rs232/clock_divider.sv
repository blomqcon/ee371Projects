
module clock_divider (clock, divided_clocks);
	input clock;
	output [31:0] divided_clocks;
	reg [31:0] divided_clocks;

	initial
	divided_clocks = 0;

	always @(posedge clock)
	divided_clocks = divided_clocks + 1;
endmodule 
