module DE1_SoC (LEDR, SW, PLD_CLOCKINPUT);
	output [9:0] LEDR;
	input PLD_CLOCKINPUT; // 50MHz clock.
	input [9:0] SW;
	
	wire sram_ReadWrite, sram_Enable;
	wire [10:0] sram_address;
	wire [7:0] sram_data;
	
	sram mem (sram_data, sram_ReadWrite, sram_Enable, sram_address);
	
	test myFile(
		.clk_clk(PLD_CLOCKINPUT),
		.reset_reset_n(1),
		.led_pio_external_connection_export(LEDR[7:0]),
		.switches_pio_external_connection_export(SW[7:0]),
		.sram_enable_external_connection_export(sram_Enable),
		.sram_readwrite_external_connection_export(sram_ReadWrite),
		.sram_address_external_connection_export(sram_address),
		.sram_data_external_connection_in_port(sram_data),
		.sram_data_external_connection_out_port(sram_data)
	);
	
	assign LEDR[8] = 0;
	assign LEDR[9] = 0;
endmodule 
