/*	Joanna Mazer
	EE 371 Peckol Winter 2016
	Project 3: Extending a Microprocessor
	transmitting.v
	
	This module combines the sub-modules PISO.v, startBit.v, 
	characterBitCount.v and serial_buffer.v to simplify the
	inputs and outputs of the system.
*/


module transmitting (clk, reset, t_enable, data_in, data_out, charSent, load_n);

	input 		clk, reset, t_enable, load_n;
	input [9:0] data_in;
	output 		data_out, charSent;

	wire 		buffer_in, SRclk, characterSent, buffer_out, bitStream;
	wire		enable;
	wire [3:0] 	bitID, bitSample;
	wire [9:0]	Qout;

	Tserial_buffer 		output_buffer		(clk, reset, buffer_in, buffer_out);
	PISO 				PISOshift_register 	(SRclk, reset, data_in, load_n, buffer_in, Qout);
	TstartBit			transmit_enable		(enable, clk, reset, t_enable, bitID, bitSample); 
	TcharacterBitCount	cBitCountTransmit 	(characterSent, SRclk, bitID, bitSample, clk, reset, enable, load_n);

	assign charSent = characterSent;
	assign data_out = buffer_in;

endmodule
