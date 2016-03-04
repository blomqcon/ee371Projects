
module lab5CPU (
	character_recieved_input_external_connection_export,
	character_sent_input_external_connection_export,
	clk_clk,
	led_output_external_connection_export,
	load_output_external_connection_export,
	parallel_input_external_connection_export,
	parallel_output_external_connection_export,
	reset_reset_n,
	sram_address_external_connection_export,
	sram_data_external_connection_export,
	sram_enable_read_external_connection_export,
	sram_enable_write_external_connection_export,
	transmit_enable_output_external_connection_export,
	gun_right_external_connection_export,
	gun_shoot_external_connection_export,
	gun_left_external_connection_export);	

	input		character_recieved_input_external_connection_export;
	input		character_sent_input_external_connection_export;
	input		clk_clk;
	output	[7:0]	led_output_external_connection_export;
	output		load_output_external_connection_export;
	input	[7:0]	parallel_input_external_connection_export;
	output	[7:0]	parallel_output_external_connection_export;
	input		reset_reset_n;
	output	[10:0]	sram_address_external_connection_export;
	inout	[7:0]	sram_data_external_connection_export;
	output		sram_enable_read_external_connection_export;
	output		sram_enable_write_external_connection_export;
	output		transmit_enable_output_external_connection_export;
	input		gun_right_external_connection_export;
	input	[1:0]	gun_shoot_external_connection_export;
	input		gun_left_external_connection_export;
endmodule
