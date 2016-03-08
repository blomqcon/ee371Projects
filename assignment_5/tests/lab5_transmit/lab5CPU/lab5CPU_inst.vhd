	component lab5CPU is
		port (
			character_recieved_input_external_connection_export : in    std_logic                     := 'X';             -- export
			character_sent_input_external_connection_export     : in    std_logic                     := 'X';             -- export
			clk_clk                                             : in    std_logic                     := 'X';             -- clk
			led_output_external_connection_export               : out   std_logic_vector(7 downto 0);                     -- export
			load_output_external_connection_export              : out   std_logic;                                        -- export
			parallel_input_external_connection_export           : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			parallel_output_external_connection_export          : out   std_logic_vector(7 downto 0);                     -- export
			reset_reset_n                                       : in    std_logic                     := 'X';             -- reset_n
			sram_address_external_connection_export             : out   std_logic_vector(10 downto 0);                    -- export
			sram_data_external_connection_export                : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			sram_enable_read_external_connection_export         : out   std_logic;                                        -- export
			sram_enable_write_external_connection_export        : out   std_logic;                                        -- export
			transmit_enable_output_external_connection_export   : out   std_logic                                         -- export
		);
	end component lab5CPU;

	u0 : component lab5CPU
		port map (
			character_recieved_input_external_connection_export => CONNECTED_TO_character_recieved_input_external_connection_export, -- character_recieved_input_external_connection.export
			character_sent_input_external_connection_export     => CONNECTED_TO_character_sent_input_external_connection_export,     --     character_sent_input_external_connection.export
			clk_clk                                             => CONNECTED_TO_clk_clk,                                             --                                          clk.clk
			led_output_external_connection_export               => CONNECTED_TO_led_output_external_connection_export,               --               led_output_external_connection.export
			load_output_external_connection_export              => CONNECTED_TO_load_output_external_connection_export,              --              load_output_external_connection.export
			parallel_input_external_connection_export           => CONNECTED_TO_parallel_input_external_connection_export,           --           parallel_input_external_connection.export
			parallel_output_external_connection_export          => CONNECTED_TO_parallel_output_external_connection_export,          --          parallel_output_external_connection.export
			reset_reset_n                                       => CONNECTED_TO_reset_reset_n,                                       --                                        reset.reset_n
			sram_address_external_connection_export             => CONNECTED_TO_sram_address_external_connection_export,             --             sram_address_external_connection.export
			sram_data_external_connection_export                => CONNECTED_TO_sram_data_external_connection_export,                --                sram_data_external_connection.export
			sram_enable_read_external_connection_export         => CONNECTED_TO_sram_enable_read_external_connection_export,         --         sram_enable_read_external_connection.export
			sram_enable_write_external_connection_export        => CONNECTED_TO_sram_enable_write_external_connection_export,        --        sram_enable_write_external_connection.export
			transmit_enable_output_external_connection_export   => CONNECTED_TO_transmit_enable_output_external_connection_export    --   transmit_enable_output_external_connection.export
		);

