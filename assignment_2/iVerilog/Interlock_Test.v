`include "Interlock.v"

module testBench;
	wire arriveCtrl, departCtrl;
	wire innerDoorCtrl, outerDoorCtrl;
	wire pressurizeCtrl, evacuateCtrl;
	wire clk, rst;
	wire [0:2] debugStateArriving, debugStateDeparting;
	
	Interlock i(arriveCtrl, departCtrl, innerDoorCtrl, outerDoorCtrl, pressurizeCtrl, evacuateCtrl, clk, rst, debugStateArriving, debugStateDeparting);
	Tester aTester(arriveCtrl, departCtrl, innerDoorCtrl, outerDoorCtrl, pressurizeCtrl, evacuateCtrl, clk, rst, debugStateArriving, debugStateDeparting);

	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("interlock.vcd");
		$dumpvars(1, i);
	end
endmodule

module Tester (arriveCtrl, departCtrl, innerDoorCtrl, outerDoorCtrl, pressurizeCtrl, evacuateCtrl, clk, rst, debugStateArriving, debugStateDeparting);
 //input pressurized, evacuated;
 output clk, rst;
 output arriveCtrl, departCtrl;
 output innerDoorCtrl, outerDoorCtrl;
 output pressurizeCtrl, evacuateCtrl;
 input [0:2] debugStateArriving, debugStateDeparting;
 
 reg clk, rst;
 reg arriveCtrl, departCtrl;
 reg innerDoorCtrl, outerDoorCtrl;
 reg pressurizeCtrl, evacuateCtrl;
 parameter stimDelay = 20;

 initial // Response
 begin
 $display("\t\t clk rst \t arriveCtrl \t Time ");
 $monitor("\t\t %b\t %b \t %b", clk, rst, arriveCtrl, $time );
 end

 initial // Stimulus
 begin
 clk = 0; rst = 0; arriveCtrl = 0; departCtrl = 0; innerDoorCtrl = 0; outerDoorCtrl = 0; pressurizeCtrl = 0; evacuateCtrl = 0;
 
 clk = 0; #stimDelay clk = 1; #stimDelay
 rst = 1;
 clk = 0; #stimDelay clk = 1; #stimDelay
 rst = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 
 
 arriveCtrl = 1;
 clk = 0; #stimDelay clk = 1; #stimDelay
 arriveCtrl = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 
 pressurizeCtrl = 1;
 clk = 0; #stimDelay clk = 1; #stimDelay
 pressurizeCtrl = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 
 outerDoorCtrl = 1;
 clk = 0; #stimDelay clk = 1; #stimDelay
 outerDoorCtrl = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 
 outerDoorCtrl = 1;
 clk = 0; #stimDelay clk = 1; #stimDelay
 outerDoorCtrl = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 
 evacuateCtrl = 1;
 clk = 0; #stimDelay clk = 1; #stimDelay
 evacuateCtrl = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 
 innerDoorCtrl = 1;
 clk = 0; #stimDelay clk = 1; #stimDelay
 innerDoorCtrl = 0;
 clk = 0; #stimDelay clk = 1; #stimDelay
 
 
 
 #(2*stimDelay); // needed to see END of simulation
 $finish; // finish simulation
 end
endmodule 