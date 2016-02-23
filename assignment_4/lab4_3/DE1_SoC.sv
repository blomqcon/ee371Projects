module DE1_SoC (LEDR, SW, PLD_CLOCKINPUT);
	output [9:0] LEDR;
	input PLD_CLOCKINPUT; // 50MHz clock.
	input [9:0] SW;
	
	
	wire S_data_out, char_sent, char_received;
	wire [7:0] P_data_out;
	wire clk, reset;
	wire transmit_enable, load, S_data_in;
	wire [7:0] P_data_in;
	
	assign S_data_out = S_data_in;
	
	lab4CPU cpu(
		.clk_clk(PLD_CLOCKINPUT),
		.reset_reset_n(1),
		.character_recieved_input_external_connection_export(char_received),
		.character_sent_input_external_connection_export(char_sent),
		.led_output_external_connection_export(ledOutput),
		.load_output_external_connection_export(load),
		.parallel_input_external_connection_export(P_data_out),
		.parallel_output_external_connection_export(P_data_in),
		.transmit_enable_output_external_connection_export(transmit_enable)
	);
	
	
	wire slow_clock;
	clock_divider19 cd(PLD_CLOCKINPUT, slow_clock);
	
	
	com_mod cm (S_data_out, P_data_out, char_sent, char_received, 1, slow_clock, transmit_enable, P_data_in, load, S_data_in);
	
	
	assign LEDR[7:0] = ledOutput; 
	assign LEDR[8] = S_data_out;
	assign LEDR[9] = slow_clock;
endmodule 