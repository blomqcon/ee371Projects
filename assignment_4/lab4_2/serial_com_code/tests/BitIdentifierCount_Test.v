`include "../Counter4.sv"
`include "../BitIdentifierCount.sv"

module testBench;
	wire done;
	wire [2:0] identifer;
	wire reset, bscClock;

	BitIdentifierCount bic(done, identifer, reset, bscClock);
	Tester aTester(done, identifer, reset, bscClock);

	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("vvp/bitidentifiercount.vcd");
		$dumpvars(1, bic);
	end
endmodule

module Tester (done, identifer, reset, bscClock);
	input done;
	input [2:0] identifer;
	output reset, bscClock;
	reg reset, bscClock;
	parameter stimDelay = 20;

	integer i;

	initial begin // Response
		$display("\t\t clk reset \t identifer \t \t doneTime ");
		$monitor("\t\t %b\t %b \t %b \t %b \t %b", bscClock, reset, identifer, done, $time );
	end

	initial begin // Stimulus 
		bscClock = 0; reset = 0;
		#stimDelay bscClock = 1; reset = 1;
		#stimDelay bscClock = 1; reset = 0;

		for (i = 0; i < 16; i = i +1) begin
			#stimDelay bscClock = 0;
			#stimDelay bscClock = 1;
	end

	#(2*stimDelay); // needed to see END of simulation
	$finish; // finish simulation
	end
endmodule 