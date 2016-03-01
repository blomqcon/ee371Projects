`include "../shiftBufferTransmit.sv"

module testBench; 
 wire load, SRclock, dataOut;
 wire [7:0] dataBus;
 
 shiftBufferTransmit t(load, dataBus, SRclock, dataOut);
 Tester aTester(load, dataBus, SRclock, dataOut);
 
 // file for gtkwave
 initial
 begin
 // these two files support gtkwave and are required
 $dumpfile("vvp/shiftTransmit.vcd");
 $dumpvars(1, t);
 end
endmodule

module Tester (load, dataBus, SRclock, dataOut); 
 output load, SRclock;
 output [7:0] dataBus;
 input dataOut;
 
 reg load, SRclock;
 reg [7:0] dataBus;
 parameter stimDelay = 20;
 
 integer i;

 initial // Response
 begin
 $display("\t\t load SRclock \t dataBus \t dataOut \t Time ");
 $monitor("\t\t %b\t %b \t %b \t %b", load, SRclock, dataBus, dataOut, $time );
 end

 initial // Stimulus
 begin
 SRclock = 0; dataBus = 8'b10011001;
 #stimDelay SRclock = 1; load = 1;
 #stimDelay SRclock = 0; load = 0;
 #stimDelay SRclock = 1; 

 for (i = 0; i < 16; i = i + 1) begin
	#stimDelay SRclock = 0; 
	#stimDelay SRclock = 1; 
	#stimDelay SRclock = 0; 
	#stimDelay SRclock = 1; 
 end

 #(2*stimDelay); // needed to see END of simulation
 $finish; // finish simulation
 end
endmodule 