module Receive(clock, reset, serialInput, charReceived, parallelIn);
	input clock, reset;
	input serialInput;
	output charReceived;
	output [7:0] parallelIn;

	wire [3:0] BSC_in_Count;
	wire in_enable;
	
	// start bit detector
	StartBitDetect SBD (
		.SClk(clock),
		.reset(reset),
		.data_in(serialInput),
		.char_received(charReceived),
		.in_enable(in_enable)
	);
	
	// Bit Sample Count
	BSC BSC_in (
		.SClk(clock),
		.enable(in_enable),
		.Count(BSC_in_Count)
	);
	
	// BIC 
	BIC BIC_in (
		.BSC_clk(BSC_in_Count[3]),
		.enable(in_enable), 
		.char_received(charReceived)
	);
	
	// Serial to Parallel 
	S2P_ShiftRegister S2P (
		.SR_Clk(BSC_in_Count[3]),
		.serial_data(serialInput),
		.data_bus(parallelIn)
	);

endmodule 