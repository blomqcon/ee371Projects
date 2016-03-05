	nios_system u0 (
		.reset_reset_n                                               (<connected-to-reset_reset_n>),                                               //                                                reset.reset_n
		.receive_parallel_to_processor_external_connection_export    (<connected-to-receive_parallel_to_processor_external_connection_export>),    //    receive_parallel_to_processor_external_connection.export
		.clk_clk                                                     (<connected-to-clk_clk>),                                                     //                                                  clk.clk
		.transmit_parallel_from_processor_external_connection_export (<connected-to-transmit_parallel_from_processor_external_connection_export>), // transmit_parallel_from_processor_external_connection.export
		.transmit_enable_external_connection_export                  (<connected-to-transmit_enable_external_connection_export>),                  //                  transmit_enable_external_connection.export
		.transmit_character_sent_external_connection_export          (<connected-to-transmit_character_sent_external_connection_export>),          //          transmit_character_sent_external_connection.export
		.transmit_load_external_connection_export                    (<connected-to-transmit_load_external_connection_export>),                    //                    transmit_load_external_connection.export
		.received_character_received_external_connection_export      (<connected-to-received_character_received_external_connection_export>),      //      received_character_received_external_connection.export
		.sram_address_external_connection_export                     (<connected-to-sram_address_external_connection_export>),                     //                     sram_address_external_connection.export
		.sram_data_external_connection_export                        (<connected-to-sram_data_external_connection_export>),                        //                        sram_data_external_connection.export
		.sram_enable_external_connection_export                      (<connected-to-sram_enable_external_connection_export>),                      //                      sram_enable_external_connection.export
		.sram_read_write_external_connection_export                  (<connected-to-sram_read_write_external_connection_export>),                  //                  sram_read_write_external_connection.export
		.gunner_left_external_connection_export                      (<connected-to-gunner_left_external_connection_export>),                      //                      gunner_left_external_connection.export
		.gunner_right_external_connection_export                     (<connected-to-gunner_right_external_connection_export>),                     //                     gunner_right_external_connection.export
		.gunner_shoot_external_connection_export                     (<connected-to-gunner_shoot_external_connection_export>),                     //                     gunner_shoot_external_connection.export
		.alien_shoot_external_connection_export                      (<connected-to-alien_shoot_external_connection_export>),                      //                      alien_shoot_external_connection.export
		.alien_x_position_external_connection_export                 (<connected-to-alien_x_position_external_connection_export>),                 //                 alien_x_position_external_connection.export
		.alien_y_position_external_connection_export                 (<connected-to-alien_y_position_external_connection_export>),                 //                 alien_y_position_external_connection.export
		.game_timer_external_connection_export                       (<connected-to-game_timer_external_connection_export>),                       //                       game_timer_external_connection.export
		.random_number_lfsr_output_external_connection_export        (<connected-to-random_number_lfsr_output_external_connection_export>)         //        random_number_lfsr_output_external_connection.export
	);

