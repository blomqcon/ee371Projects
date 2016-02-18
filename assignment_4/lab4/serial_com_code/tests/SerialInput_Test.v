`include "../Counter4.sv"
`include "../StartBitDetect.sv"
`include "../BitIdentifierCount.sv"
`include "../BitSampleCount.sv"
`include "../ShiftBufferReceive.sv"
`include "../SerialInput.sv"

module testBench;
	wire [7:0] parallelOut;
	wire charRecieved;
	wire data, clock;

	SerialInput si(parallelOut, charRecieved, data, clock);
	Tester aTester(parallelOut, charRecieved, data, clock);

	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("vvp/serialinput.vcd");
		$dumpvars(1, si);
	end
endmodule

module Tester (parallelOut, charRecieved, data, clock);
	input [7:0] parallelOut;
	input charRecieved;
	output data, clock;
	reg data, clock;
	parameter stimDelay = 1;

	integer i, j;
	wire [0:7] testChar = 8'b11110000;

	initial begin // Response
		$display("\t\t clk \t data \t charRecieved \t \t parallelOut");
		$monitor("\t\t %b\t %b \t %b \t %b \t %b", clock, data, charRecieved, parallelOut, $time );
	end
	
	initial begin // Stimulus 
		clock = 0; data = 0;
		
		for(i = 0; i < 20; i = i + 1) begin
			#stimDelay clock = 0; #stimDelay clock = 1;
		end
		
		data = 1;
		#stimDelay clock = 0; #stimDelay clock = 1;

		for(j = 0; j < 8; j = j + 1) begin
			data = testChar[j];
			for(i = 0; i < 16; i = i + 1) begin
				#stimDelay clock = 0; #stimDelay clock = 1;
			end
		end
		
		data = 0;
		for(i = 0; i < 20; i = i + 1) begin
			#stimDelay clock = 0; #stimDelay clock = 1;
		end

	#(2*stimDelay); // needed to see END of simulation
	$finish; // finish simulation
	end
endmodule 