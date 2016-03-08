//======================================================================
//  FILE: nios_sram_driver.sv
//  Author: Christian Gobrecht
//  
//  Description: Maps SRAM and nios processor terminals to De1-SoC pins
//======================================================================
module nios_sram_driver (CLOCK_50, serial_in, SW, KEY, serial_out, LEDR);
	input CLOCK_50, serial_in;
	input [9:0] SW;
	output serial_out;
	output [9:0] LEDR;
	input [3:0] KEY;

	wire [7:0] data;
	wire [10:0] address;
	wire OE_n, WE_n;

	// Clock divider
	wire [31:0] clk;
	parameter whichClock = 7;
	
	clock_divider cdiv (CLOCK_50, clk);
	
	SRAM mem (data, address, OE_n, WE_n);
	
	// Async communication hardware
	wire char_received, char_sent, load, transmit_enable; 
	wire [7:0] parallel_in, parallel_out;
	//TopLevel(SClk, serial_in, load, reset, transmit_enable, input_bus, serial_out, char_received, char_sent, output_bus);
	TopLevel asyncCom (clk[whichClock], serial_in, load, KEY[0], transmit_enable, parallel_in, serial_out, char_received, char_sent, parallel_out);
	
	//nios_sram n2 (address, CLOCK_50, data, LEDR[7:0], OE_n, KEY[0], SW[7:0], WE_n);
	nios_sram cpu (address, char_received, char_sent, CLOCK_50, data, LEDR[7:0], load, OE_n,
					parallel_in, parallel_out, KEY[0], SW[7:0], transmit_enable, WE_n);
					
	assign LEDR[8] = 1;
	assign LEDR[9] = 1;

endmodule
