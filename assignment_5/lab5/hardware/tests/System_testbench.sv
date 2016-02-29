
// Test bech for the Asynchronous send/recieve system


`include "TopLevel.sv"
`include "StartBitDetect.sv"
`include "S2P_ShiftRegister.sv"
`include "P2S_ShiftRegister.sv"
`include "BSC.sv"
`include "BIC.sv"

module System_testbench();
 // connect the two modules

 
 reg clk, serial_in, load, reset, transmit_enable;
 wire [7:0] input_bus;
 reg [7:0] output_bus;
 wire serial_out;
 wire char_received;
 wire char_sent;
 
 TopLevel top (clk, serial_in, load, reset, transmit_enable, input_bus, serial_out, char_received, char_sent, output_bus);

// file for gtkwave
 initial
 begin
// these two files support gtkwave and are required
 $dumpfile("TopLevel.vcd");
 $dumpvars(1, top);
 end
 
 initial // Response
 begin
 $display("\tinput_bus \tserial_out \tchar_received \tchar_sent \t serial_in \tload reset \ttransmit_enable \toutput_bus, \tTime ");
 $monitor("\t%b \t%b \t%b \t%b \t%b \t%b \t%b \t%b \t%b", input_bus, serial_out, char_received, char_sent, serial_in, load, reset, transmit_enable, output_bus, $time );
 end
 
parameter CLOCK_PERIOD = 100;
initial clk = 0;
always #(CLOCK_PERIOD/2) clk = ~clk;
	
 initial // Stimulus
 begin
  @(posedge clk);
  @(posedge clk);
 serial_in <= 1'b1;
 @(posedge clk);
 reset <= 1'b0;
  @(posedge clk);
 reset <= 1'b1;
  @(posedge clk);
 transmit_enable <= 1'b0;
 load <= 1'b0;
 // start bit
 repeat(8)  @(posedge clk);
 serial_in <= 1'b0;
 repeat(8)  @(posedge clk);
 // data0 
 repeat(8)  @(posedge clk);
 serial_in <= 1'b1;
 repeat(8)  @(posedge clk);
 //data1
 repeat(8)  @(posedge clk);
 serial_in <= 1'b0;
  repeat(8)  @(posedge clk);
  // data2
 repeat(8)  @(posedge clk);
 serial_in <= 1'b1;
 repeat(8)  @(posedge clk);
 // data3
 repeat(8)  @(posedge clk);
 serial_in <= 1'b0;
 repeat(8)  @(posedge clk);
 // data4
 repeat(8)  @(posedge clk);
 serial_in <= 1'b1;
 repeat(8)  @(posedge clk);
 //data5
 repeat(8)  @(posedge clk);
 serial_in <= 1'b0;
  repeat(8)  @(posedge clk);
  //data6
 repeat(8)  @(posedge clk);
 serial_in <= 1'b1;
 repeat(8)  @(posedge clk);
 // data7
 repeat(8)  @(posedge clk);
 serial_in <= 1'b0;
  repeat(8)  @(posedge clk);
  // data8
 repeat(8)  @(posedge clk);
 serial_in <= 1'b1;
 repeat(8)  @(posedge clk);
 // stop bit
 repeat(8)  @(posedge clk);
 serial_in <= 1'b0;
 repeat(8)  @(posedge clk);
 repeat(8)  @(posedge clk);
 $finish; // finish simulation
 end
endmodule
