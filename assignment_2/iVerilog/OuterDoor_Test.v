// counter.v
`include "OuterDoor.v"

module testBench;
	wire clk, rst;
	wire outerDoorCtrl, pressurized;
	wire outerDoor;

	OuterDoor oDoor(clk, rst, outerDoorCtrl, pressurized, outerDoor);
	Tester aTester(clk, rst, outerDoorCtrl, pressurized, outerDoor);

	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("outerDoor.vcd");
		$dumpvars(1, oDoor);
	end
endmodule

module Tester (clk, rst, outerDoorCtrl, pressurized, outerDoor);//q, clk, rst);
 input outerDoor;
 output clk, rst;
 output outerDoorCtrl, pressurized;
 
 reg clk, rst;
 reg outerDoorCtrl, pressurized;
 parameter stimDelay = 20;

 initial // Response
 begin
 $display("\t\t clk rst \t outerDoor \t Time ");
 $monitor("\t\t %b\t %b \t %b", clk, rst, outerDoor, $time );
 end

 initial // Stimulus
 begin
 clk = 0; rst = 0; outerDoorCtrl = 0; pressurized = 0;
 rst = 1;
 clk = 0; #stimDelay clk = 1; #stimDelay
 rst = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 outerDoorCtrl = 1; 
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 outerDoorCtrl = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 pressurized = 1; outerDoorCtrl = 1;
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 outerDoorCtrl = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 outerDoorCtrl = 1;
 clk = 0; #stimDelay clk = 1; #stimDelay
 outerDoorCtrl = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay

 #(2*stimDelay); // needed to see END of simulation
 $finish; // finish simulation
 end
endmodule 