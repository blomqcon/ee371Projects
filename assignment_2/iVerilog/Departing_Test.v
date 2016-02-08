// counter.v
`include "Timer.v"
`include "Departing.v"

module testBench;
	wire clk, rst;
	wire departCtrl;
	wire departing;
	wire arriving, innerDoor, outerDoor, pressurized, evacuated;
	wire [0:2] debugState;

	Departing p(clk, rst, departCtrl, arriving, departing, innerDoor, outerDoor, pressurized, evacuated, debugState);
	Tester aTester(clk, rst, departCtrl, arriving, departing, innerDoor, outerDoor, pressurized, evacuated, debugState);

	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("departing.vcd");
		$dumpvars(1, p);
	end
endmodule

module Tester (clk, rst, departCtrl, arriving, departing, innerDoor, outerDoor, pressurized, evacuated, debugState);
 input departing;
 input [0:2] debugState;
 output clk, rst;
 output departCtrl, arriving, innerDoor, outerDoor, pressurized, evacuated;
 
 reg clk, rst;
 reg departCtrl, arriving, innerDoor, outerDoor, pressurized, evacuated;
 parameter stimDelay = 20;

 initial // Response
 begin
 $display("\t\t clk rst \t arriving \t Time ");
 $monitor("\t\t %b\t %b \t %b", clk, rst, departing, $time );
 end

 initial // Stimulus
 begin
 clk = 0; rst = 0; departCtrl = 0; arriving = 0; innerDoor = 0; outerDoor = 0; pressurized = 0; evacuated = 0;
 
 clk = 0; #stimDelay clk = 1; rst = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; rst = 0; #stimDelay
 clk = 0; #stimDelay clk = 1; departCtrl = 1; #stimDelay
 
 clk = 0; #stimDelay clk = 1; departCtrl = 0; #stimDelay
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
 clk = 0; #stimDelay clk = 1; rst = 1; departCtrl = 0; arriving = 0; innerDoor = 0; outerDoor = 0; pressurized = 0; evacuated = 0; #stimDelay
 clk = 0; #stimDelay clk = 1; rst = 0; #stimDelay
 clk = 0; #stimDelay clk = 1; departCtrl = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; departCtrl = 0; #stimDelay
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
 clk = 0; #stimDelay clk = 1; departCtrl = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; departCtrl = 0; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; departCtrl = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; departCtrl = 0; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 

 #(2*stimDelay); // needed to see END of simulation
 $finish; // finish simulation
 end
endmodule 