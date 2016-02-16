`include "../Counter4.sv"
`include "../BitSampleCount.sv"

module testBench;
	wire srcc, bic;
	wire clk, rstBSC;

	BitSampleCount bsc(srcc, bic, rstBSC, clk);
	Tester aTester(srcc, bic, rstBSC, clk);

	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("vvp/bitsamplecount.vcd");
		$dumpvars(1, bsc);
	end
endmodule

module Tester (srcc, bic, rstBSC, clk);
	input srcc, bic;
	output clk, rstBSC;
	reg clk, rst;
	parameter stimDelay = 20;

	integer i;

	initial begin // Response
		$display("\t\t clk rst \t srcc \t bic \t Time ");
		$monitor("\t\t %b\t %b \t %b \t %b", clk, rst, srcc, bic, $time );
	end

	initial begin // Stimulus 
		clk = 0; rst = 0;
		#stimDelay clk = 1; rst = 1;
		#stimDelay clk = 1; rst = 0;

		for (i = 0; i < 16; i = i +1) begin
			#stimDelay clk = 0;
			#stimDelay clk = 1;
	end

	#(2*stimDelay); // needed to see END of simulation
	$finish; // finish simulation
	end
endmodule 