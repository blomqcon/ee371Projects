	component nios_system is
		port (
			reset_reset_n                                               : in    std_logic                     := 'X';             -- reset_n
			receive_parallel_to_processor_external_connection_export    : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			clk_clk                                                     : in    std_logic                     := 'X';             -- clk
			transmit_parallel_from_processor_external_connection_export : out   std_logic_vector(7 downto 0);                     -- export
			transmit_enable_external_connection_export                  : out   std_logic;                                        -- export
			transmit_character_sent_external_connection_export          : in    std_logic                     := 'X';             -- export
			transmit_load_external_connection_export                    : out   std_logic;                                        -- export
			received_character_received_external_connection_export      : in    std_logic                     := 'X';             -- export
			sram_address_external_connection_export                     : out   std_logic_vector(10 downto 0);                    -- export
			sram_data_external_connection_export                        : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			sram_enable_external_connection_export                      : out   std_logic;                                        -- export
			sram_read_write_external_connection_export                  : out   std_logic;                                        -- export
			gunner_left_external_connection_export                      : in    std_logic                     := 'X';             -- export
			gunner_right_external_connection_export                     : in    std_logic                     := 'X';             -- export
			gunner_shoot_external_connection_export                     : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			alien_shoot_external_connection_export                      : in    std_logic                     := 'X';             -- export
			alien_x_position_external_connection_export                 : in    std_logic_vector(2 downto 0)  := (others => 'X'); -- export
			alien_y_position_external_connection_export                 : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			game_timer_external_connection_export                       : in    std_logic_vector(31 downto 0) := (others => 'X'); -- export
			random_number_lfsr_output_external_connection_export        : in    std_logic_vector(15 downto 0) := (others => 'X')  -- export
		);
	end component nios_system;

	u0 : component nios_system
		port map (
			reset_reset_n                                               => CONNECTED_TO_reset_reset_n,                                               --                                                reset.reset_n
			receive_parallel_to_processor_external_connection_export    => CONNECTED_TO_receive_parallel_to_processor_external_connection_export,    --    receive_parallel_to_processor_external_connection.export
			clk_clk                                                     => CONNECTED_TO_clk_clk,                                                     --                                                  clk.clk
			transmit_parallel_from_processor_external_connection_export => CONNECTED_TO_transmit_parallel_from_processor_external_connection_export, -- transmit_parallel_from_processor_external_connection.export
			transmit_enable_external_connection_export                  => CONNECTED_TO_transmit_enable_external_connection_export,                  --                  transmit_enable_external_connection.export
			transmit_character_sent_external_connection_export          => CONNECTED_TO_transmit_character_sent_external_connection_export,          --          transmit_character_sent_external_connection.export
			transmit_load_external_connection_export                    => CONNECTED_TO_transmit_load_external_connection_export,                    --                    transmit_load_external_connection.export
			received_character_received_external_connection_export      => CONNECTED_TO_received_character_received_external_connection_export,      --      received_character_received_external_connection.export
			sram_address_external_connection_export                     => CONNECTED_TO_sram_address_external_connection_export,                     --                     sram_address_external_connection.export
			sram_data_external_connection_export                        => CONNECTED_TO_sram_data_external_connection_export,                        --                        sram_data_external_connection.export
			sram_enable_external_connection_export                      => CONNECTED_TO_sram_enable_external_connection_export,                      --                      sram_enable_external_connection.export
			sram_read_write_external_connection_export                  => CONNECTED_TO_sram_read_write_external_connection_export,                  --                  sram_read_write_external_connection.export
			gunner_left_external_connection_export                      => CONNECTED_TO_gunner_left_external_connection_export,                      --                      gunner_left_external_connection.export
			gunner_right_external_connection_export                     => CONNECTED_TO_gunner_right_external_connection_export,                     --                     gunner_right_external_connection.export
			gunner_shoot_external_connection_export                     => CONNECTED_TO_gunner_shoot_external_connection_export,                     --                     gunner_shoot_external_connection.export
			alien_shoot_external_connection_export                      => CONNECTED_TO_alien_shoot_external_connection_export,                      --                      alien_shoot_external_connection.export
			alien_x_position_external_connection_export                 => CONNECTED_TO_alien_x_position_external_connection_export,                 --                 alien_x_position_external_connection.export
			alien_y_position_external_connection_export                 => CONNECTED_TO_alien_y_position_external_connection_export,                 --                 alien_y_position_external_connection.export
			game_timer_external_connection_export                       => CONNECTED_TO_game_timer_external_connection_export,                       --                       game_timer_external_connection.export
			random_number_lfsr_output_external_connection_export        => CONNECTED_TO_random_number_lfsr_output_external_connection_export         --        random_number_lfsr_output_external_connection.export
		);

