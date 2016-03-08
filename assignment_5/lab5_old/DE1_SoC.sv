module DE1_SoC (LEDR, SW, KEY, PLD_CLOCKINPUT, SERIAL_IN, SERIAL_OUT, HEX0, HEX1, HEX4, HEX5);
	output [9:0] LEDR;
	input PLD_CLOCKINPUT; // 50MHz clock.
	input [9:0] SW;
	input [3:0] KEY;
	output [6:0] HEX0;
	output [6:0] HEX1;
	output [6:0] HEX4;
	output [6:0] HEX5;
	
	input SERIAL_IN;
	output SERIAL_OUT;
	
	//Wires for connecting communications
	wire transmitEnable, load;
	wire [7:0] receivingDataBus, transmittingDataBus;
	
	//Wires for connecting SRAM
	wire [10:0] sram_address;
	wire [7:0] sram_data;
	wire sramReadWrite, sramEnable;
	
	// define wires
	wire [31:0] gameTimer;
	wire [15:0] randomOut;
	
	wire [2:0] alienX;
	wire [1:0] alienY;
	
	
	wire [7:0] ledOutput;
	
	lab5CPU cpu(
		.clk_clk(PLD_CLOCKINPUT),
		.reset_reset_n(1),
		
		.character_sent_input_external_connection_export(characterSent),
		.load_output_external_connection_export(load),
		.parallel_output_external_connection_export(transmittingDataBus),
		.transmit_enable_output_external_connection_export(transmitEnable),
		
		.parallel_input_external_connection_export(receivingDataBus),
		.character_recieved_input_external_connection_export(characterReceived),
		.led_output_external_connection_export(ledOutput),

		
		.sram_address_external_connection_export(sram_address),
		.sram_data_external_connection_export(sram_data),
		.sram_enable_read_external_connection_export(sramReadWrite),
		.sram_enable_write_external_connection_export(sramEnable),
		
		.alien_shoot_external_connection_export(0),
		.alien_x_external_connection_export(alienX),
		.alien_y_external_connection_export(alienY),
		
		.gun_left_external_connection_export(~KEY[1]),
		.gun_right_external_connection_export(~KEY[0]),
		.gun_shoot_external_connection_export(~KEY[2]),
		
		.game_time_external_connection_export(gameTimer),
		.random_number_external_connection_export(randomOut)
	);
	
	// Instantiation: Generate clk off of CLOCK_50, 11.9 Hz ~~ 88ms
	// Pass to game clk
	wire [31:0] clk;
	parameter whichClock22 = 22;//Maybe 21
	parameter whichClock8 = 8;
	clock_divider2 cdiv (PLD_CLOCKINPUT, clk);
	
	// instantiate hardware modules
	//gameClock gc1(clk[whichClock22], 0, gameTimer);
	
	gameClock gc1(clk[whichClock22], 0, gameTimer);
	LFSR_16bit lfsr1(PLD_CLOCKINPUT, 0, randomOut);
	
	//sram sram1(sram_data, sramReadWrite, sramEnable, sram_address);
	
	alienSelect as1(alienX, alienY, SW);
	b2h display(alienX, alienY, HEX0, HEX1, HEX4, HEX5);
	
	TopLevel asyncCom (clk[7], SERIAL_IN, load, 1, transmitEnable, receivingDataBus, SERIAL_OUT, characterReceived, characterSent, transmittingDataBus);
	
	//receiving r1(clk[whichClock8], reset, dataIn, receivingDataBus, characterReceived);
	//transmitting t1(clk[whichClock8], reset, transmitEnable, transmittingDataBus, dataOut, characterSent, transmitLoad);
	
	
	//assign LEDR[9:2] = 7'b1111111;
	assign LEDR[7:0] = ledOutput;
	assign LEDR[8] = ~KEY[1];
	assign LEDR[9] = ~KEY[0];
endmodule 

// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ...
module clock_divider2 (clock, divided_clocks);
	input clock;
	output [31:0] divided_clocks;
	reg [31:0] divided_clocks;

	initial divided_clocks = 0;

	always @(posedge clock)

		divided_clocks = divided_clocks + 1;

endmodule 