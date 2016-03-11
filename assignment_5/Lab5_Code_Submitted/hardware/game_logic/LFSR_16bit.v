module LFSR_16bit(clk, reset, Q);
	input clk, reset;
	output [15:0] Q;
	
	wire xnor_out;
	xnor feedback(xnor_out, Q[15], Q[14], Q[12], Q[3]);
	
	D_F_F bus_0 (clk, reset, xnor_out, Q[0]); 
	D_F_F bus_1 (clk, reset, Q[0], Q[1]);
	D_F_F bus_2 (clk, reset, Q[1], Q[2]);
	D_F_F bus_3 (clk, reset, Q[2], Q[3]);
	D_F_F bus_4 (clk, reset, Q[3], Q[4]);
	D_F_F bus_5 (clk, reset, Q[4], Q[5]);
	D_F_F bus_6 (clk, reset, Q[5], Q[6]);
	D_F_F bus_7 (clk, reset, Q[6], Q[7]);
	D_F_F bus_8 (clk, reset, Q[7], Q[8]);
	D_F_F bus_9 (clk, reset, Q[8], Q[9]);
	D_F_F bus_10 (clk, reset, Q[9], Q[10]);
	D_F_F bus_11 (clk, reset, Q[10], Q[11]);
	D_F_F bus_12 (clk, reset, Q[11], Q[12]);
	D_F_F bus_13 (clk, reset, Q[12], Q[13]);
	D_F_F bus_14 (clk, reset, Q[13], Q[14]);
	D_F_F bus_15 (clk, reset, Q[14], Q[15]);
	
endmodule

