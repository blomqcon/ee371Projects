	test u0 (
		.clk_clk                                   (<connected-to-clk_clk>),                                   //                                clk.clk
		.led_pio_external_connection_export        (<connected-to-led_pio_external_connection_export>),        //        led_pio_external_connection.export
		.reset_reset_n                             (<connected-to-reset_reset_n>),                             //                              reset.reset_n
		.sram_address_external_connection_export   (<connected-to-sram_address_external_connection_export>),   //   sram_address_external_connection.export
		.sram_datain_external_connection_export    (<connected-to-sram_datain_external_connection_export>),    //    sram_datain_external_connection.export
		.sram_enable_external_connection_export    (<connected-to-sram_enable_external_connection_export>),    //    sram_enable_external_connection.export
		.sram_readwrite_external_connection_export (<connected-to-sram_readwrite_external_connection_export>), // sram_readwrite_external_connection.export
		.switches_pio_external_connection_export   (<connected-to-switches_pio_external_connection_export>),   //   switches_pio_external_connection.export
		.sram_dataout_external_connection_export   (<connected-to-sram_dataout_external_connection_export>)    //   sram_dataout_external_connection.export
	);

