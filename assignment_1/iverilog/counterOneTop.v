// counter.v
`include "DFlipFlop.v"
`include "counterOne.v"

module testBench;
 wire [0:3] q;
 wire clk, rst;
 
 CounterOne counter(q, clk, rst);
 Tester aTester(q, clk, rst);
 
 // file for gtkwave
 initial
 begin
 // these two files support gtkwave and are required
 $dumpfile("counterOne0.vcd");
 $dumpvars(1, counter);
 end
endmodule

module Tester (q, clk, rst);

 input [3:0] q;
 output clk, rst;
 reg clk, rst;
 parameter stimDelay = 20;

 initial // Response
 begin
 $display("\t\t clk rst \t q \t Time ");
 $monitor("\t\t %b\t %b \t %b", clk, rst, q, $time );
 end

 initial // Stimulus
 begin
 clk = 0; rst = 0;
 #stimDelay clk = 1; rst = 1;
 #stimDelay clk = 0;
 #stimDelay clk = 1;
 #stimDelay clk = 0;
 #stimDelay clk = 1;
 #stimDelay clk = 0;
 #stimDelay clk = 1;
 #stimDelay clk = 0;
 #stimDelay clk = 1;
 #stimDelay clk = 0;
 #stimDelay clk = 1;
 #stimDelay clk = 0;
 #stimDelay clk = 1;
 #stimDelay clk = 0;
 #stimDelay clk = 1;

 #(2*stimDelay); // needed to see END of simulation
 $finish; // finish simulation
 end
endmodule 