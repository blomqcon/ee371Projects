/*	Joanna Mazer
	EE 371 Peckol Winter 2016
	Project 3: Extending a Microprocessor
	PISO.v
	
	This verilog module functions as a parallel in, serial out
	shift register. The 10 bit data will be loaded into the shift
	register, then when the load signal is not enabled, the data
	will be fed to the output one bit at a time on the posedge 
	of the clock signal.
*/

//`include "DFlipFlop.v"
//`include "mux2_1.v"

module PISO2(SRclk, reset, data_in, load_n, data_out); // Parallel in -> Serial Out (10 bits)
	
	// SRclk is the s/r SRclk control from characterBitCount
	input 		SRclk, reset, load_n;
	input [9:0] data_in;
	output 		data_out;
	
	reg [9:0] hold;
	reg shift;
	
	assign data_out = shift;

	always@(posedge SRclk or posedge load_n or posedge reset) begin
		if (reset) begin 
			shift <= 1'b1;
		end
		if (1'b1 == load_n) begin 
			hold <= data_in;
			shift <= 1'b1;
		end
		else if (SRclk == 1'b1) begin  
			hold[0] <= 1'b1;
			hold[1] <= hold[0];
			hold[2] <= hold[1];
			hold[3] <= hold[2];
			hold[4] <= hold[3];
			hold[5] <= hold[4];
			hold[6] <= hold[5];
			hold[7] <= hold[6];
			hold[8] <= hold[7];
			hold[9] <= hold[8];
			shift <= hold[9];
		end	
	end

endmodule
//module PISO2(clk, reset, data_in, load_n, data_out); // Parallel in -> Serial Out (10 bits)
//	
//	// clk is the s/r clk control from characterBitCount
//	input 		clk, reset, load_n;
//	input [9:0] data_in;
//	output 		data_out;
//	
//	wire [9:0] mux_out, q_Bar, Qout;
//	
//	assign data_out = Qout[9];
//
//	DFlipFlop 	DFF0 	(Qout[0], q_Bar[0], mux_out[0], clk, reset);
//	DFlipFlop 	DFF1 	(Qout[1], q_Bar[1], mux_out[1], clk, reset);
//	DFlipFlop 	DFF2 	(Qout[2], q_Bar[2], mux_out[2], clk, reset);
//	DFlipFlop 	DFF3 	(Qout[3], q_Bar[3], mux_out[3], clk, reset);
//	DFlipFlop 	DFF4 	(Qout[4], q_Bar[4], mux_out[4], clk, reset);
//	DFlipFlop 	DFF5 	(Qout[5], q_Bar[5], mux_out[5], clk, reset);
//	DFlipFlop 	DFF6 	(Qout[6], q_Bar[6], mux_out[6], clk, reset);
//	DFlipFlop 	DFF7 	(Qout[7], q_Bar[7], mux_out[7], clk, reset);
//	DFlipFlop 	DFF8 	(Qout[8], q_Bar[8], mux_out[8], clk, reset);
//	DFlipFlop 	DFF9 	(Qout[9], q_Bar[9], mux_out[9], clk, reset);
//
//	mux2_1 		MUX20 	(mux_out[0], 1'b1,    data_in[0], load_n);
//	mux2_1 		MUX21 	(mux_out[1], Qout[0], data_in[1], load_n);
//	mux2_1 		MUX22 	(mux_out[2], Qout[1], data_in[2], load_n);
//	mux2_1 		MUX23 	(mux_out[3], Qout[2], data_in[3], load_n);
//	mux2_1 		MUX24 	(mux_out[4], Qout[3], data_in[4], load_n);
//	mux2_1 		MUX25 	(mux_out[5], Qout[4], data_in[5], load_n);
//	mux2_1 		MUX26 	(mux_out[6], Qout[5], data_in[6], load_n);
//	mux2_1 		MUX27 	(mux_out[7], Qout[6], data_in[7], load_n);
//	mux2_1 		MUX28 	(mux_out[8], Qout[7], data_in[8], load_n);
//	mux2_1 		MUX29 	(mux_out[9], Qout[8], data_in[9], load_n);
//
//	
//endmodule
//
//	// initial begin 
//	// 	Q_out = 10'b1111111111;
//	// 	bitStream = 1'b1; 
//	// end
//	
//	// assign data_out = bitStream;
//	// assign Qout = Q_out;
//
//	// always@(posedge clk or posedge load_n or posedge reset) begin
//	// 	if (reset) begin
//	// 		Q_out[9:0] <= 10'b1111111111;
//	// 	end
//	// 	if (load_n) 
//	// 		begin // export serially
//	// 			Q_out = data_in; 
//	// 	end else begin 
//	// 	bitStream = Q_out[9];
//	// 	Q_out[9] <= Q_out[8];
//	// 	Q_out[8] <= Q_out[7];
//	// 	Q_out[7] <= Q_out[6];
//	// 	Q_out[6] <= Q_out[5];
//	// 	Q_out[5] <= Q_out[4];
//	// 	Q_out[4] <= Q_out[3];
//	// 	Q_out[3] <= Q_out[2];
//	// 	Q_out[2] <= Q_out[1];
//	// 	Q_out[1] <= Q_out[0];
//	// 	Q_out[0] <= 1'b1; end 
//	// end
//	
//// endmodule
//
///*	Joanna Mazer
//	EE 371 Peckol Winter 2016
//	Project 3: Extending a Microprocessor
//	PISO.v
//	
//	This verilog module functions as a parallel in, serial out
//	shift register. The 10 bit data will be loaded into the shift
//	register, then when the load signal is not enabled, the data
//	will be fed to the output one bit at a time on the posedge 
//	of the clock signal.
//
//
//module PISO(clk, reset, data_in, load_n, data_out, Qout); // Parallel in -> Serial Out (10 bits)
//	
//	// clk is the s/r clk control from characterBitCount
//	input 		clk, reset, load_n;
//	input [9:0] data_in;
//	output 		data_out;
//	output [9:0] Qout;
//
//	reg [9:0] 	Q_out;
//	reg 		bitStream;
//
//	initial begin 
//		Q_out = 10'b1111111111;
//		//bitStream = 1'b1; 
//	end
//	
//	assign data_out = bitStream;
//	assign Qout = Q_out;
//
//	always@(posedge clk or posedge load_n or posedge reset) begin
//		if (reset) begin
//			Q_out[9:0] <= 10'b1111111111;
//		end
//		if (load_n) begin // export serially
//			Q_out <= data_in; 
//			// bitStream = Q_out[9];
//		end else begin
//			bitStream = Q_out[9];
//			Q_out[9] <= Q_out[8];
//			Q_out[8] <= Q_out[7];
//			Q_out[7] <= Q_out[6];
//			Q_out[6] <= Q_out[5];
//			Q_out[5] <= Q_out[4];
//			Q_out[4] <= Q_out[3];
//			Q_out[3] <= Q_out[2];
//			Q_out[2] <= Q_out[1];
//			Q_out[1] <= Q_out[0];
//			Q_out[0] <= 1'b1; 
//		end
//	end
//endmodule 
//*/
