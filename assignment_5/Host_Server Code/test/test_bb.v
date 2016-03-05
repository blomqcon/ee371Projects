
module test (
	address_external_connection_export,
	clk_clk,
	data_external_connection_export,
	enable_external_connection_export,
	led_pio_external_connection_export,
	readwrite_external_connection_export,
	reset_reset_n);	

	output	[10:0]	address_external_connection_export;
	input		clk_clk;
	inout	[7:0]	data_external_connection_export;
	output		enable_external_connection_export;
	output	[7:0]	led_pio_external_connection_export;
	output		readwrite_external_connection_export;
	input		reset_reset_n;
endmodule
