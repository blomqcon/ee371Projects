/*	Joanna Mazer
	EE 371 Peckol Winter 2016
	Project 3: Extending a Microprocessor
	transmitting.v
	
	This module combines the sub-modules PISO.v, startBit.v, 
	characterBitCount.v and serial_buffer.v to simplify the
	inputs and outputs of the system.
*/

`include "Tserial_buffer.v"
`include "TstartBit.v"
`include "TcharacterBitCount.v"
//`include "mux2_1.v"
//`include "DFlipFlop.v"
`include "PISO2.v"

module transmitting (clk, reset, t_enable, data_in, data_out, charSent, load_n);

	input 		clk, reset, t_enable, load_n;
	input [9:0] data_in;
	output 		data_out, charSent;

	wire 		buffer_in, SRclk, characterSent, buffer_out;
	wire		enable;
	wire [3:0] 	bitID, bitSample;

	Tserial_buffer 		output_buffer		(clk, reset, buffer_in, buffer_out);
	PISO2 				PISOshift_register 	(SRclk, reset, data_in, load_n, buffer_in);	

	wire [9:0] mux_out, Qout;

//	DFlipFlop 	DFF0 	(Qout[0],  mux_out[0], SRclk, reset);
//	DFlipFlop 	DFF1 	(Qout[1],  mux_out[1], SRclk, reset);
//	DFlipFlop 	DFF2 	(Qout[2],  mux_out[2], SRclk, reset);
//	DFlipFlop 	DFF3 	(Qout[3],  mux_out[3], SRclk, reset);
//	DFlipFlop 	DFF4 	(Qout[4],  mux_out[4], SRclk, reset);
//	DFlipFlop 	DFF5 	(Qout[5],  mux_out[5], SRclk, reset);
//	DFlipFlop 	DFF6 	(Qout[6],  mux_out[6], SRclk, reset);
//	DFlipFlop 	DFF7 	(Qout[7],  mux_out[7], SRclk, reset);
//	DFlipFlop 	DFF8 	(Qout[8],  mux_out[8], SRclk, reset);
//	DFlipFlop 	DFF9 	(Qout[9],  mux_out[9], SRclk, reset);
//
//	mux2_1 		MUX20 	(mux_out[0], 1'b1, data_in[0], load_n);
//	mux2_1 		MUX21 	(mux_out[1], Qout[0], data_in[1], load_n);
//	mux2_1 		MUX22 	(mux_out[2], Qout[1], data_in[2], load_n);
//	mux2_1 		MUX23 	(mux_out[3], Qout[2], data_in[3], load_n);
//	mux2_1 		MUX24 	(mux_out[4], Qout[3], data_in[4], load_n);
//	mux2_1 		MUX25 	(mux_out[5], Qout[4], data_in[5], load_n);
//	mux2_1 		MUX26 	(mux_out[6], Qout[5], data_in[6], load_n);
//	mux2_1 		MUX27 	(mux_out[7], Qout[6], data_in[7], load_n);
//	mux2_1 		MUX28 	(mux_out[8], Qout[7], data_in[8], load_n);
//	mux2_1 		MUX29 	(mux_out[9], Qout[8], data_in[9], load_n);

	TstartBit			transmit_enable		(enable, clk, reset, t_enable, bitID, bitSample); 
	TcharacterBitCount	cBitCountTransmit 	(characterSent, SRclk, bitID, bitSample, clk, reset, enable, load_n);

	assign charSent = characterSent;
	assign data_out = buffer_out;

endmodule
