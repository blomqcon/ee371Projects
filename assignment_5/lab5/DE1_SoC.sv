module DE1_SoC (LEDR, SW, PLD_CLOCKINPUT);
	output [9:0] LEDR;
	input PLD_CLOCKINPUT; // 50MHz clock.
	input [9:0] SW;
	
	//Wires for connecting communications
	wire [7:0] parallelOutput;
	wire [7:0] parallelInput;
	wire charSent, charRecieved;
	wire transmitEnable, load;
	wire serialData;
	
	//Wires for connecting SRAM
	wire [10:0] sram_address;
	wire [7:0] sram_data;
	wire sram_enable_write, sram_enable_read;
	
	
	wire [7:0] ledOutput;
	
	lab5CPU cpu(
		.clk_clk(PLD_CLOCKINPUT),
		.reset_reset_n(1),
		.character_recieved_input_external_connection_export(charRecieved),
		.character_sent_input_external_connection_export(charSent),
		.led_output_external_connection_export(ledOutput),
		.load_output_external_connection_export(load),
		.parallel_input_external_connection_export(parallelInput),
		.parallel_output_external_connection_export(parallelOutput),
		.transmit_enable_output_external_connection_export(transmitEnable),
		.sram_address_external_connection_export(sram_address),
		.sram_data_external_connection_in_port(sram_data),
		.sram_data_external_connection_out_port(sram_data),
		.sram_enable_read_external_connection_export(sram_enable_read),
		.sram_enable_write_external_connection_export(sram_enable_write),
	);
	
	wire [31:0] slow_clocks;
	clock_divider cd(PLD_CLOCKINPUT, slow_clocks);

	
	TopLevel com (
		.SClk(slow_clocks[7]),
		.serial_in(serialData),
		.load(load),
		.reset(1),
		.transmit_enable(transmitEnable),
		.parallel_in(parallelInput),
		.serial_out(serialData),
		.char_received(charRecieved),
		.char_sent(charSent),
		.parallel_out(parallelOutput)
	);
	
	SRAM sram(
		.data(sram_data),
		.address(sram_address),
		.OE_n(sram_enable_read),
		.WE_n(sram_enable_write)
	);
	
	
	
	/*SerialOutput so(
		.serialOut(serialData), 
		.charSent(charSent), 
		.data(parallelOutput), 
		.transmitEnable(transmitEnable), 
		.load(load), 
		.clock(slow_clock)
	);
	
	SerialInput si(
		.parallelOut(parallelInput),
		.charRecieved(charRecieved),
		.data(serialData),
		.clock(slow_clock)
	);*/
	
	assign LEDR[7:0] = ledOutput; 
	//assign LEDR[8] = transmitEnable;
	//assign LEDR[9] = charRecieved;
endmodule 