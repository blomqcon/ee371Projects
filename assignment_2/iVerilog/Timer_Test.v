// timer.v
`include "timer.v"

module testBench;
 wire done;
 wire clk, rst;
 wire [0:2] stopVal;
 
 Timer t(clk, rst, stopVal, done);
 Tester aTester(clk, rst, stopVal, done);
 
 // file for gtkwave
 initial
 begin
 // these two files support gtkwave and are required
 $dumpfile("timer.vcd");
 $dumpvars(1, t);
 end
endmodule

module Tester (clk, rst, stopVal, done);

 input done;
 output clk, rst;
 output [0:2] stopVal;
 
 reg clk, rst;
 reg stopVal;
 parameter stimDelay = 20;
 
 integer i;

 initial // Response
 begin
 $display("\t\t clk rst \t done \t Time ");
 $monitor("\t\t %b\t %b \t %b", clk, rst, done, $time );
 end

 initial // Stimulus
 begin
 clk = 0; rst = 0; stopVal = 3'b100;
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