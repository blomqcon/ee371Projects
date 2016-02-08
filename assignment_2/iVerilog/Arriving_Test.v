// counter.v
`include "Timer.v"
`include "Arriving.v"

module testBench;
	wire clk, rst;
	wire arriveCtrl;
	wire arriving;
	wire departing, innerDoor, outerDoor, pressurized, evacuated;
	wire [0:2] debugState;
	
	Arriving p(clk, rst, arriveCtrl, arriving, departing, innerDoor, outerDoor, pressurized, evacuated, debugState);
	Tester aTester(clk, rst, arriveCtrl, arriving, departing, innerDoor, outerDoor, pressurized, evacuated, debugState);

	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("arriving.vcd");
		$dumpvars(1, p);
	end
endmodule

module Tester (clk, rst, arriveCtrl, arriving, departing, innerDoor, outerDoor, pressurized, evacuated, debugState);
 input arriving;
 input [0:2] debugState;
 output clk, rst;
 output arriveCtrl, departing, innerDoor, outerDoor, pressurized, evacuated;
 
 reg clk, rst;
 reg arriveCtrl, departing, innerDoor, outerDoor, pressurized, evacuated;
 parameter stimDelay = 20;

 initial // Response
 begin
 $display("\t\t clk rst \t arriving \t Time ");
 $monitor("\t\t %b\t %b \t %b", clk, rst, arriving, $time );
 end

 initial // Stimulus
 begin
 clk = 0; rst = 0; arriveCtrl = 0; departing = 0; innerDoor = 0; outerDoor = 0; pressurized = 0; evacuated = 0;
 
 clk = 0; #stimDelay clk = 1; rst = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; rst = 0; #stimDelay
 clk = 0; #stimDelay clk = 1; arriveCtrl = 1; #stimDelay
 
 clk = 0; #stimDelay clk = 1; arriveCtrl = 0; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; pressurized = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; outerDoor = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; evacuated = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; innerDoor = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; rst = 1; arriveCtrl = 0; departing = 0; innerDoor = 0; outerDoor = 0; pressurized = 0; evacuated = 0; #stimDelay
 clk = 0; #stimDelay clk = 1; rst = 0; #stimDelay
 clk = 0; #stimDelay clk = 1; arriveCtrl = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; arriveCtrl = 0; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; pressurized = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; rst = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; rst = 0; #stimDelay
 clk = 0; #stimDelay clk = 1; pressurized = 0; #stimDelay
 clk = 0; #stimDelay clk = 1; arriveCtrl = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; arriveCtrl = 0; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; arriveCtrl = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; arriveCtrl = 0; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 

 #(2*stimDelay); // needed to see END of simulation
 $finish; // finish simulation
 end
endmodule 