// counter.v
`include "Pressurize.v"

module testBench;
	wire clk, rst;
	wire pressurizeCtrl;
	wire pressurized, evacuated;

	Pressurize p(clk, rst, pressurizeCtrl, pressurized, evacuated);
	Tester aTester(clk, rst, pressurizeCtrl, pressurized, evacuated);

	// file for gtkwave
	initial begin
		// these two files support gtkwave and are required
		$dumpfile("pressurize.vcd");
		$dumpvars(1, p);
	end
endmodule

module Tester (clk, rst, pressurizeCtrl, pressurized, evacuated);
 input pressurized, evacuated;
 output clk, rst;
 output pressurizeCtrl;
 
 reg clk, rst;
 reg pressurizeCtrl;
 parameter stimDelay = 20;

 initial // Response
 begin
 $display("\t\t clk rst \t pressurized \t Time ");
 $monitor("\t\t %b\t %b \t %b", clk, rst, pressurized, $time );
 end

 initial // Stimulus
 begin
 clk = 0; rst = 0; pressurizeCtrl = 0;// pressurized = 0;
 
 clk = 0; #stimDelay clk = 1; rst = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; pressurizeCtrl = 1; #stimDelay
 
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay
 clk = 0; #stimDelay clk = 1; #stimDelay

 #(2*stimDelay); // needed to see END of simulation
 $finish; // finish simulation
 end
endmodule 