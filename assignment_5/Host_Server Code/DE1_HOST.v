/*	Bryan Bednarski
	EE 371 Peckol Winter 2016
	Project 5: Space Invaders
	DE1_HOST.v
	
	This top-level DE1 module connects hardware modules with NIOSII processor and software
	for the host DE1 board.

*/

// include all sub-modules
`include "gameClock.v"
`include "sram.v"
`include "LFSR_16bit.v"
`include "alienSelect.v"
`include "receiving.v"
`include "transmitting.v"


module DE1_HOST(CLOCK_50, SW, KEY, dataIn, dataOut);
	input CLOCK_50, dataIn;
	input [9:0] SW;
	input [3:0] KEY; 
	output dataOut;
	
	// define wires
	wire [16:0] gameTimer;
	wire reset, sramReadWrite, sramEnable, shoot, characterReceived, transmitEnable, characterSent, transmitLoad;
	wire [7:0] sramData;
	wire [10:0] sramAddress;
	wire [15:0] randomOut;
	wire [2:0] alienX;
	wire [1:0] alienY;
	wire [9:0] alienSwitchSel;
	wire hardSet;
	wire [9:0] receivingDataBus, transmittingDataBus;
	
	// wire gunnerLeft, gunnerRight;
	
	
	// define registers
	
	// assign statements
	assign reset = ~KEY[3];
	assign shoot = ~KEY[0];
	assign alienSwitchSel = SW;
	// assign gunnerLeft = ~KEY[2];
	// assign gunnerRight = ~KEY[1];
	
	
	// instantiate microprocessor
    nios_system u0 (
        .reset_reset_n                                               (reset),                                            								   //                                                reset.reset_n
        .receive_parallel_to_processor_external_connection_export    (receivingDataBus),    //    receive_parallel_to_processor_external_connection.export
        .clk_clk                                                     (CLOCK_50),                                                    					//                                                  clk.clk
        .transmit_parallel_from_processor_external_connection_export (transmittingDataBus), // transmit_parallel_from_processor_external_connection.export
        .transmit_enable_external_connection_export                  (transmitEnable),                  //                  transmit_enable_external_connection.export
        .transmit_character_sent_external_connection_export          (characterSent),          //          transmit_character_sent_external_connection.export
        .transmit_load_external_connection_export                    (transmitLoad),                    //                    transmit_load_external_connection.export
        .received_character_received_external_connection_export      (characterReceived),      //      received_character_received_external_connection.export
        .sram_address_external_connection_export                     (sramAddress),               															      //                     sram_address_external_connection.export
        .sram_data_external_connection_export                        (sramData),                													            //                        sram_data_external_connection.export
        .sram_enable_external_connection_export                      (sramEnable),           	  												      	   	//                      sram_enable_external_connection.export
        .sram_read_write_external_connection_export                  (sramReadWrite),              	    														//                  sram_read_write_external_connection.export
        .gunner_left_external_connection_export                      (0),                      																		//                      gunner_left_external_connection.export
        .gunner_right_external_connection_export                     (0),                       //                     gunner_right_external_connection.export
        .gunner_shoot_external_connection_export                     (0),                       //                     gunner_shoot_external_connection.export
        .alien_shoot_external_connection_export                      (shoot),                   //                      alien_shoot_external_connection.export
        .alien_x_position_external_connection_export                 (alienX),                  //                 alien_x_position_external_connection.export
        .alien_y_position_external_connection_export                 (alienY),                  //                 alien_y_position_external_connection.export
        .game_timer_external_connection_export                       (gameTimer),               //                       game_timer_external_connection.export
        .random_number_lfsr_output_external_connection_export        (randomOut)         			//        random_number_lfsr_output_external_connection.export
    );

	
	// instantiate hardware modules
	gameClock gc1(clk[whichClock22], reset, gameTimer);
	sram sram1(sramData, sramReadWrite, sramEnable, sramAddress);
	LFSR_16bit lfsr1(CLOCK_50, reset, randomOut);
	alienSelect as1(alienX, alienY, alienSwitchSel);
	
	receiving r1(clk[whichClock8], reset, dataIn, receivingDataBus, characterReceived);
	transmitting t1(clk[whichClock8], reset, transmitEnable, transmittingDataBus, dataOut, characterSent, transmitLoad);
	
	
	// Instantiation: Generate clk off of CLOCK_50, 11.9 Hz ~~ 88ms
	// Pass to game clk
	wire [31:0] clk;
	parameter whichClock22 = 22;
	parameter whichClock8 = 8;
	clock_divider cdiv (CLOCK_50, clk);
	
endmodule


// divided_clocks[0] = 25MHz, [1] = 12.5Mhz, ... [23] = 3Hz, [24] = 1.5Hz, [25] = 0.75Hz, ...
module clock_divider (clock, divided_clocks);
	input clock;
	output [31:0] divided_clocks;
	reg [31:0] divided_clocks;

	initial divided_clocks = 0;

	always @(posedge clock)

		divided_clocks = divided_clocks + 1;

endmodule 