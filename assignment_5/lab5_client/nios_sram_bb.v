
module nios_sram (
	address_export,
	char_received_external_connection_export,
	char_sent_external_connection_export,
	clk_clk,
	data_export,
	lights_export,
	load_external_connection_export,
	oe_n_export,
	parallel_in_external_connection_export,
	parallel_out_external_connection_export,
	switches_export,
	transmit_enable_external_connection_export,
	we_n_export,
	reset_reset_n);	

	output	[10:0]	address_export;
	input		char_received_external_connection_export;
	input		char_sent_external_connection_export;
	input		clk_clk;
	inout	[7:0]	data_export;
	output	[7:0]	lights_export;
	output		load_external_connection_export;
	output		oe_n_export;
	input	[7:0]	parallel_in_external_connection_export;
	output	[7:0]	parallel_out_external_connection_export;
	input	[7:0]	switches_export;
	output		transmit_enable_external_connection_export;
	output		we_n_export;
	input		reset_reset_n;
endmodule
