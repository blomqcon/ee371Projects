/*	Joanna Mazer
	EE 371 Peckol Winter 2016
	Project 3: Extending a Microprocessor
	receiving.v
	
	This module combines the sub-modules SIPO.v, startBit.v, 
	characterBitCount.v and serial_buffer.v to simplify the
	inputs and outputs of the system.
*/

`include "Rserial_buffer.v"
`include "SIPO.v"
`include "startBit.v"
`include "characterBitCount.v"

module receiving (clk, reset, data_in, data_out, charReceived);

	input 			clk, reset, data_in;
	output [9:0] 	data_out;
	output  		charReceived;

	wire 		buffer_out, enable, characterReceived;
	wire [9:0] 	SR_out;
	wire [3:0] 	bitID, bitSample;

	Rserial_buffer 		input_buffer	(clk, reset, data_in, buffer_out);
	SIPO 				shift_register 	(SR_out, SRclk, reset, buffer_out);
	startBit			start_bit		(enable, clk, reset, buffer_out, bitID, bitSample); 
	characterBitCount	cBitCount 		(characterReceived, SRclk, bitID, bitSample, clk, reset, enable);

	assign data_out = SR_out;
	assign charReceived = characterReceived;

endmodule
