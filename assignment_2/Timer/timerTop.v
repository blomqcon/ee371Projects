// timer.v
`include "timer.v"

module testBench;
 wire [0:2] q;
 wire clk, rst;
 
 timer theTime(q, clk, rst);
 Tester aTester(q, clk, rst);
 
 // file for gtkwave
 initial
 begin
 // these two files support gtkwave and are required
 $dumpfile("timer0.vcd");
 $dumpvars(1, theTime);
 end
endmodule

module Tester (q, clk, rst);

 input [0:2] q;
 output clk, rst;
 reg clk, rst;
 parameter stimDelay = 20;
 
 integer i;

 initial // Response
 begin
 $display("\t\t clk rst \t q \t Time ");
 $monitor("\t\t %b\t %b \t %b", clk, rst, q, $time );
 end

 initial // Stimulus
 begin
 clk = 0; rst = 0;
 #stimDelay clk = 1; rst = 1;
 #stimDelay clk = 0; rst = 0;
 #stimDelay clk = 1;

 for (i = 0; i < 16; i = i + 1) begin
	#stimDelay clk = 0;
	#stimDelay clk = 1;
 end

 #(2*stimDelay); // needed to see END of simulation
 $finish; // finish simulation
 end
endmodule 