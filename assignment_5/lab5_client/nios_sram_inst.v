	nios_sram u0 (
		.address_export                             (<connected-to-address_export>),                             //                             address.export
		.char_received_external_connection_export   (<connected-to-char_received_external_connection_export>),   //   char_received_external_connection.export
		.char_sent_external_connection_export       (<connected-to-char_sent_external_connection_export>),       //       char_sent_external_connection.export
		.clk_clk                                    (<connected-to-clk_clk>),                                    //                                 clk.clk
		.data_export                                (<connected-to-data_export>),                                //                                data.export
		.lights_export                              (<connected-to-lights_export>),                              //                              lights.export
		.load_external_connection_export            (<connected-to-load_external_connection_export>),            //            load_external_connection.export
		.oe_n_export                                (<connected-to-oe_n_export>),                                //                                oe_n.export
		.parallel_in_external_connection_export     (<connected-to-parallel_in_external_connection_export>),     //     parallel_in_external_connection.export
		.parallel_out_external_connection_export    (<connected-to-parallel_out_external_connection_export>),    //    parallel_out_external_connection.export
		.switches_export                            (<connected-to-switches_export>),                            //                            switches.export
		.transmit_enable_external_connection_export (<connected-to-transmit_enable_external_connection_export>), // transmit_enable_external_connection.export
		.we_n_export                                (<connected-to-we_n_export>),                                //                                we_n.export
		.reset_reset_n                              (<connected-to-reset_reset_n>)                               //                               reset.reset_n
	);

