	component nios_sram is
		port (
			address_export                             : out   std_logic_vector(10 downto 0);                    -- export
			char_received_external_connection_export   : in    std_logic                     := 'X';             -- export
			char_sent_external_connection_export       : in    std_logic                     := 'X';             -- export
			clk_clk                                    : in    std_logic                     := 'X';             -- clk
			data_export                                : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			lights_export                              : out   std_logic_vector(7 downto 0);                     -- export
			load_external_connection_export            : out   std_logic;                                        -- export
			oe_n_export                                : out   std_logic;                                        -- export
			parallel_in_external_connection_export     : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			parallel_out_external_connection_export    : out   std_logic_vector(7 downto 0);                     -- export
			switches_export                            : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			transmit_enable_external_connection_export : out   std_logic;                                        -- export
			we_n_export                                : out   std_logic;                                        -- export
			reset_reset_n                              : in    std_logic                     := 'X'              -- reset_n
		);
	end component nios_sram;

	u0 : component nios_sram
		port map (
			address_export                             => CONNECTED_TO_address_export,                             --                             address.export
			char_received_external_connection_export   => CONNECTED_TO_char_received_external_connection_export,   --   char_received_external_connection.export
			char_sent_external_connection_export       => CONNECTED_TO_char_sent_external_connection_export,       --       char_sent_external_connection.export
			clk_clk                                    => CONNECTED_TO_clk_clk,                                    --                                 clk.clk
			data_export                                => CONNECTED_TO_data_export,                                --                                data.export
			lights_export                              => CONNECTED_TO_lights_export,                              --                              lights.export
			load_external_connection_export            => CONNECTED_TO_load_external_connection_export,            --            load_external_connection.export
			oe_n_export                                => CONNECTED_TO_oe_n_export,                                --                                oe_n.export
			parallel_in_external_connection_export     => CONNECTED_TO_parallel_in_external_connection_export,     --     parallel_in_external_connection.export
			parallel_out_external_connection_export    => CONNECTED_TO_parallel_out_external_connection_export,    --    parallel_out_external_connection.export
			switches_export                            => CONNECTED_TO_switches_export,                            --                            switches.export
			transmit_enable_external_connection_export => CONNECTED_TO_transmit_enable_external_connection_export, -- transmit_enable_external_connection.export
			we_n_export                                => CONNECTED_TO_we_n_export,                                --                                we_n.export
			reset_reset_n                              => CONNECTED_TO_reset_reset_n                               --                               reset.reset_n
		);

