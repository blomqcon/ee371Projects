module DE1_SoC (LEDR, SW, KEY, PLD_CLOCKINPUT);
	output [9:0] LEDR;
	input PLD_CLOCKINPUT; // 50MHz clock.
	input [9:0] SW;
	input [3:0] KEY;
	
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
		.sram_data_external_connection_export(sram_data),
		.sram_enable_read_external_connection_export(sram_enable_read),
		.sram_enable_write_external_connection_export(sram_enable_write),
		.gun_left_external_connection_export(KEY[1]),
		.gun_right_external_connection_export(KEY[0]),
		.gun_shoot_external_connection_export(KEY[2])
	);
	
	wire [31:0] slow_clocks;
	clock_divider cd(PLD_CLOCKINPUT, slow_clocks);
	
	/*Transmit transmit(
		.serialOut(serialData),
		.charSent(charSent),
		.parallelOut(parallelOut),
		.transmitEnable(transmitEnable),
		.load(load),
		.reset(1),
		.clock(slow_clocks[7])
	);
	
	Receive receive(
		.parallelIn(parallelIn),
		.charReceived(charReceived),
		.serialInput(serialData),
		.reset(1),
		.clock(slow_clocks[7])
	);
	
	SRAM sram(
		.data(sram_data),
		.address(sram_address),
		.OE_n(sram_enable_read),
		.WE_n(sram_enable_write)
	);*/
	
	
	
	
	
	assign LEDR[7:0] = ledOutput; 
	//assign LEDR[8] = transmitEnable;
	//assign LEDR[9] = charRecieved;
endmodule 