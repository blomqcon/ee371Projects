module DE1_SoC (LEDR, PLD_CLOCKINPUT);
	output [9:0] LEDR;
	input PLD_CLOCKINPUT; // 50MHz clock.
	
	test myFile(
		.clk_clk(PLD_CLOCKINPUT),
		.reset_reset_n(1),
		.led_pio_external_connection_export(LEDR[7:0])
	);
	
	assign LEDR[8] = 1;
endmodule 
