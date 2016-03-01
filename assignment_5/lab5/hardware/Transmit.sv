module Transmit(clock, reset, load, transmitEnable, charSent, parallelOut, serialOut);
	input clock, reset;
	input load, transmitEnable;
	input [7:0] parallelOut;
	output charSent;
	output serialOut;
	
	wire [3:0] BSC_out_Count;
	
	// Bit Sample Count
	BSC bsc (
		.SClk(clock),
		.enable(transmitEnable),
		.Count(BSC_out_Count)
	);
	
	// Bit Identification Count 
	BIC_Out bic (
		.BSC_clk(BSC_out_Count[3]),
		.enable(transmitEnable),
		.char_sent(charSent)
	);
	
	// paralle to serial
	P2S_ShiftRegister p2s (
		.SR_Clk(BSC_out_Count[3]),
		.reset(reset),
		.load(load),
		.data_bus(parallelOut),
		.serial_data(serialOut)
	);

endmodule 