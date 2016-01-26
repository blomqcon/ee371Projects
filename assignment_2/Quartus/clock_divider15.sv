// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ...
module clock_divider15 (clock, divided_clock15);
	input clock;
	output divided_clock15;
	reg [31:0] divided_clocks;

	initial
	divided_clocks = 0;

	always @(posedge clock)
	divided_clocks = divided_clocks + 1;
	assign divided_clock15 = divided_clocks[23];
endmodule 