/*	Joanna Mazer
	EE 371 Peckol Winter 2016
	Project 3: Extending a Microprocessor
	serial_buffer.v
	
	This verilog module functions as a simple buffer
	to provide additional signal integrity to the serial 
	input and to the serial output of the system.
*/

module Tserial_buffer (clk, reset, data_in, data_out);
	input 	clk, reset, data_in;
	output 	data_out; 

	reg Q;
	
	assign data_out = Q; 

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			Q <= 1'b1;			
		end
		else begin
			Q <= data_in;
		end
	end

endmodule 