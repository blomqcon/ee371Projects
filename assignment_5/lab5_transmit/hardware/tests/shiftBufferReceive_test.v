`include "../shiftBufferReceive.sv"

module testBench; 
 wire dataIn, SRclock;
 wire [7:0] dataBus;
 
 shiftBufferReceive t(dataIn, SRclock, dataBus);
 Tester aTester(dataIn, SRclock, dataBus);
 
 // file for gtkwave
 initial
 begin
 // these two files support gtkwave and are required
 $dumpfile("vvp/shiftReceive.vcd");
 $dumpvars(1, t);
 end
endmodule

module Tester (dataIn, SRclock, dataBus); 
 output dataIn, SRclock;
 input [7:0] dataBus;
 
 reg dataIn, SRclock;
 parameter stimDelay = 20;
 
 integer i;

 initial // Response
 begin
 $display("\t\t clk rst \t done \t Time ");
 $monitor("\t\t %b\t %b \t %b", dataIn, SRclock, dataBus, $time );
 end

 initial // Stimulus
 begin
 SRclock = 0; dataIn = 0;
 #stimDelay SRclock = 1; dataIn = 1;
 #stimDelay SRclock = 0; dataIn = 1;
 #stimDelay SRclock = 1; dataIn = 0;

 for (i = 0; i < 16; i = i + 1) begin
	#stimDelay SRclock = 0; dataIn = 0;
	#stimDelay SRclock = 1; 
	#stimDelay SRclock = 0; dataIn = 1;
	#stimDelay SRclock = 1; 
 end

 #(2*stimDelay); // needed to see END of simulation
 $finish; // finish simulation
 end
endmodule 