`include "../Counter4.sv"
`include "../StartBitDetect.sv"

module testBench;
	wire data, reset, clk;
	wire writingChar;

	StartBitDetect start (writingChar, data, reset, clock);
	Tester aTester (writingChar, data, reset, clock);

	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("vvp/startbitdetect.vcd");
		$dumpvars(1, start);
	end
endmodule

module Tester (writingChar, data, reset, clock);
	input writingChar;
	output reset, clock, data;
	reg reset, clock, data;
	parameter stimDelay = 20;

	integer i;

	initial begin // Response
		$display("\t\t clock reset \t data \t \t writingChar ");
		$monitor("\t\t %b\t %b \t %b \t %b \t %b", clock, reset, data, writingChar, $time );
	end

	initial begin // Stimulus 
		clock = 0; reset = 0; data = 0;

		for (i = 0; i < 16; i = i +1) begin
			#stimDelay clock = 0; #stimDelay clock = 1;
		end
		data = 1;
		#stimDelay clock = 0; #stimDelay clock = 1;
		data = 0;
		for (i = 0; i < 16; i = i +1) begin
			#stimDelay clock = 0; #stimDelay clock = 1;
		end

	#(2*stimDelay); // needed to see END of simulation
	$finish; // finish simulation
	end
endmodule 