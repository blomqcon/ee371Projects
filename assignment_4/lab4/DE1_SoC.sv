module DE1_SoC (LEDR, SW, PLD_CLOCKINPUT);
	output [9:0] LEDR;
	input PLD_CLOCKINPUT; // 50MHz clock.
	input [9:0] SW;
	
	lab4CPU cpu(
		.clk_clk(PLD_CLOCKINPUT),
		.reset_reset_n(1),
		.led_pio_external_connection_export(LEDR[7:0]),
		.switches_pio_external_connection_export(SW[7:0])
	);
	
	
	
	
	assign LEDR[8] = 1;
	assign LEDR[9] = 1;
endmodule 
