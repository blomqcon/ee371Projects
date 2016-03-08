`include "../Counter4.sv"
`include "../BitSampleCount.sv"
`include "../shiftBufferReceive.sv"

module testBench;
	wire srcc, bic;
	wire clk, rstBSC;
	wire dataIn;
	wire [7:0] dataBus;

	BitSampleCount bsc(srcc, bic, rstBSC, clk);
	shiftBufferReceive sr(dataIn, srcc, dataBus);
	
	
	Tester aTester(srcc, bic, rstBSC, clk, dataIn, dataBus);

	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("vvp/sr_sample.vcd");
		$dumpvars(1, bsc);
		$dumpvars(1, sr);
	end
endmodule

module Tester (srcc, bic, rstBSC, clk, dataIn, dataBus);
	input srcc, bic;
	input [7:0] dataBus;
	output clk, rstBSC, dataIn;
	reg clk, rst, dataIn;
	parameter stimDelay = 20;

	integer i;

	initial begin // Response
		$display("\t\t clk rst \t srcc \t bic \t Time ");
		$monitor("\t\t %b\t %b \t %b \t %b", clk, rst, srcc, bic, $time );
	end

	initial begin // Stimulus 
		clk = 0; rst = 0; dataIn = 0;
		#stimDelay clk = 1; rst = 1;
		#stimDelay clk = 1; rst = 0;

		for (i = 0; i < 1024; i = i +1) begin
			dataIn = $random;
			#stimDelay clk = 0;
			#stimDelay clk = 1;
	end

	#(2*stimDelay); // needed to see END of simulation
	$finish; // finish simulation
	end
endmodule 