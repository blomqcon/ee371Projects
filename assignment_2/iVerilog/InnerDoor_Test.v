// counter.v
`include "InnerDoor.v"

module testBench;
	wire clk, rst;
	wire innerDoorCtrl, evacuated;
	wire innerDoor;

	InnerDoor iDoor(clk, rst, innerDoorCtrl, evacuated, innerDoor);
	Tester aTester(clk, rst, innerDoorCtrl, evacuated, innerDoor);

	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("innerDoor.vcd");
		$dumpvars(1, iDoor);
	end
endmodule

module Tester (clk, rst, innerDoorCtrl, evacuated, innerDoor);//q, clk, rst);
 input innerDoor;
 output clk, rst;
 output innerDoorCtrl, evacuated;
 
 reg clk, rst;
 reg innerDoorCtrl, evacuated;
 parameter stimDelay = 20;

 initial // Response
 begin
 $display("\t\t clk rst \t innerDoor \t Time ");
 $monitor("\t\t %b\t %b \t %b", clk, rst, innerDoor, $time );
 end

 initial // Stimulus
 begin
 clk = 0; rst = 0; innerDoorCtrl = 0; evacuated = 0;
 rst = 1;
 clk = 0; #stimDelay clk = 1; #stimDelay
 rst = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 innerDoorCtrl = 1; 
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 innerDoorCtrl = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 evacuated = 1; innerDoorCtrl = 1;
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 innerDoorCtrl = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 innerDoorCtrl = 1;
 clk = 0; #stimDelay clk = 1; #stimDelay
 innerDoorCtrl = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay

 #(2*stimDelay); // needed to see END of simulation
 $finish; // finish simulation
 end
endmodule 