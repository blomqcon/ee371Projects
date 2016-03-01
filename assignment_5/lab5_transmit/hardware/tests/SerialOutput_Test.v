`include "../Counter4.sv"
`include "../StartBitDetect.sv"
`include "../BitIdentifierCount.sv"
`include "../BitSampleCount.sv"
`include "../shiftBufferTransmit.sv"
`include "../SerialOutput.sv"

module testBench;
	wire serialOut;
	wire charSent;
	wire [7:0] data;
	wire transmitEnable;
	wire load;
	wire clock;

	SerialOutput so(serialOut, charSent, data, transmitEnable, load, clock);
	Tester aTester(serialOut, charSent, data, transmitEnable, load, clock);

	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("vvp/serialoutput.vcd");
		$dumpvars(1, so);
	end
endmodule

module Tester (serialOut, charSent, data, transmitEnable, load, clock);
	input serialOut;
	input charSent;
	output [7:0] data;
	output clock;
	output load;
	output transmitEnable;
	
	reg [7:0] data;
	reg clock, transmitEnable, load;
	parameter stimDelay = 1;

	integer i, j;

	initial begin // Response
		$display("\t\t clock \t data \t enable \t charRecieved \t \t parallelOut");
		$monitor("\t\t %b\t %b \t %b \t %b \t %b \t %b", clock, data, transmitEnable, charSent, serialOut, $time );
	end
	
	initial begin // Stimulus 
		clock = 0; data = 8'b01001101; transmitEnable = 0; load = 0;
		
		for(i = 0; i < 20; i = i + 1) begin
			#stimDelay clock = 0; #stimDelay clock = 1;
		end
		
		load = 1;
		#stimDelay clock = 0; #stimDelay clock = 1;
		#stimDelay clock = 0; #stimDelay clock = 1;
		load = 0;
		
		transmitEnable = 1;
		#stimDelay clock = 0; #stimDelay clock = 1;
		#stimDelay clock = 0; #stimDelay clock = 1;
		transmitEnable = 0;
		
		for(i = 0; i < 16 * 11; i = i + 1) begin
			#stimDelay clock = 0; #stimDelay clock = 1;
		end
		

	#(5*stimDelay); // needed to see END of simulation
	$finish; // finish simulation
	end
endmodule 