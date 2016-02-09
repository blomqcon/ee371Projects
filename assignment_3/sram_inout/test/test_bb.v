
module test (
	clk_clk,
	led_pio_external_connection_export,
	reset_reset_n,
	sram_address_external_connection_export,
	sram_data_external_connection_in_port,
	sram_data_external_connection_out_port,
	sram_enable_external_connection_export,
	sram_readwrite_external_connection_export,
	switches_pio_external_connection_export);	

	input		clk_clk;
	output	[7:0]	led_pio_external_connection_export;
	input		reset_reset_n;
	input	[10:0]	sram_address_external_connection_export;
	input	[7:0]	sram_data_external_connection_in_port;
	output	[7:0]	sram_data_external_connection_out_port;
	input		sram_enable_external_connection_export;
	input		sram_readwrite_external_connection_export;
	input	[7:0]	switches_pio_external_connection_export;
endmodule
