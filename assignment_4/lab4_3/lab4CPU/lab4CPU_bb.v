
module lab4CPU (
	character_recieved_input_external_connection_export,
	character_sent_input_external_connection_export,
	clk_clk,
	led_output_external_connection_export,
	load_output_external_connection_export,
	parallel_input_external_connection_export,
	parallel_output_external_connection_export,
	reset_reset_n,
	transmit_enable_output_external_connection_export);	

	input		character_recieved_input_external_connection_export;
	input		character_sent_input_external_connection_export;
	input		clk_clk;
	output	[7:0]	led_output_external_connection_export;
	output		load_output_external_connection_export;
	input	[7:0]	parallel_input_external_connection_export;
	output	[7:0]	parallel_output_external_connection_export;
	input		reset_reset_n;
	output		transmit_enable_output_external_connection_export;
endmodule
