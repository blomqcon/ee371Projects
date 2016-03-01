

module TopLevel(SClk, serial_in, load, reset, transmit_enable, parallel_in, serial_out, char_received, char_sent, parallel_out);
	input SClk, reset, serial_in, load, transmit_enable;  // SClk clock divider bit 7 
	input [7:0] parallel_out; // output from the NIOS processor
	output [7:0] parallel_in; // parallel_in to the NIOS processor
	output serial_out, char_received, char_sent;
	
	



	wire in_enable, in_char_received, out_char_received;
	wire [3:0] BSC_in_Count, BSC_out_Count;
	// start bit detector
	StartBitDetect SBD (.SClk(SClk), .reset(reset), .data_in(serial_in), .char_received(char_received), .in_enable(in_enable));
	
	// Bit Sample Count
	BSC BSC_in (.SClk(SClk), .enable(in_enable), .Count(BSC_in_Count));
	
	// BIC 
	BIC BIC_in (.BSC_clk(BSC_in_Count[3]), .enable(in_enable), .char_received(char_received));
	
	// Serial to Parallel 
	S2P_ShiftRegister S2P (.SR_Clk(BSC_in_Count[3]), .serial_data(serial_in), .data_bus(parallel_in));
	
	// Bit Sample Count
	BSC BSC_out (.SClk(SClk), .enable(transmit_enable), .Count(BSC_out_Count));
	
	// BIC 
	BIC_Out BIC_out (.BSC_clk(BSC_out_Count[3]), .enable(transmit_enable), .char_sent(char_sent));
	
	// paralle to serial
	P2S_ShiftRegister P2S (.SR_Clk(BSC_out_Count[3]), .reset(reset), .load(load), .data_bus(parallel_out), .serial_data(serial_out));
	
endmodule

