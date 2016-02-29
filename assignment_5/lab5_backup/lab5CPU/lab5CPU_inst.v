	lab5CPU u0 (
		.character_recieved_input_external_connection_export (<connected-to-character_recieved_input_external_connection_export>), // character_recieved_input_external_connection.export
		.character_sent_input_external_connection_export     (<connected-to-character_sent_input_external_connection_export>),     //     character_sent_input_external_connection.export
		.clk_clk                                             (<connected-to-clk_clk>),                                             //                                          clk.clk
		.led_output_external_connection_export               (<connected-to-led_output_external_connection_export>),               //               led_output_external_connection.export
		.load_output_external_connection_export              (<connected-to-load_output_external_connection_export>),              //              load_output_external_connection.export
		.parallel_input_external_connection_export           (<connected-to-parallel_input_external_connection_export>),           //           parallel_input_external_connection.export
		.parallel_output_external_connection_export          (<connected-to-parallel_output_external_connection_export>),          //          parallel_output_external_connection.export
		.reset_reset_n                                       (<connected-to-reset_reset_n>),                                       //                                        reset.reset_n
		.transmit_enable_output_external_connection_export   (<connected-to-transmit_enable_output_external_connection_export>),   //   transmit_enable_output_external_connection.export
		.sram_data_external_connection_in_port               (<connected-to-sram_data_external_connection_in_port>),               //                sram_data_external_connection.in_port
		.sram_data_external_connection_out_port              (<connected-to-sram_data_external_connection_out_port>),              //                                             .out_port
		.sram_enable_write_external_connection_export        (<connected-to-sram_enable_write_external_connection_export>),        //        sram_enable_write_external_connection.export
		.sram_enable_read_external_connection_export         (<connected-to-sram_enable_read_external_connection_export>),         //         sram_enable_read_external_connection.export
		.sram_address_external_connection_export             (<connected-to-sram_address_external_connection_export>)              //             sram_address_external_connection.export
	);

