`include "Timer.v"
`include "Pressurize.v"
`include "Evacuate.v"
`include "Chamber.v"

module testBench;
	wire clk, rst;
	wire pressurizeCtrl, evacuateCtrl;
	wire pressurized, evacuated;

	Chamber c(clk, rst, pressurizeCtrl, evacuateCtrl, pressurized, evacuated);
	Tester aTester(clk, rst, pressurizeCtrl, evacuateCtrl, pressurized, evacuated);

	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("chamber.vcd");
		$dumpvars(1, c);
	end
endmodule

module Tester (clk, rst, pressurizeCtrl, evacuateCtrl, pressurized, evacuated);
 input pressurized, evacuated;
 output clk, rst;
 output pressurizeCtrl, evacuateCtrl;
 
 reg clk, rst;
 reg pressurizeCtrl, evacuateCtrl;
 parameter stimDelay = 20;

 initial // Response
 begin
 $display("\t\t clk rst \t pressurized \t Time ");
 $monitor("\t\t %b\t %b \t %b", clk, rst, pressurized, $time );
 end

 initial // Stimulus
 begin
 clk = 0; rst = 0; pressurizeCtrl = 0; evacuateCtrl = 0;
 
 rst = 1;
 clk = 0; #stimDelay clk = 1; #stimDelay
 
 rst = 0;
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
 clk = 0; #stimDelay clk = 1; #stimDelay

 #(2*stimDelay); // needed to see END of simulation
 $finish; // finish simulation
 end
endmodule 