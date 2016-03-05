	component test is
		port (
			address_external_connection_export   : out   std_logic_vector(10 downto 0);                    -- export
			clk_clk                              : in    std_logic                     := 'X';             -- clk
			data_external_connection_export      : inout std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			enable_external_connection_export    : out   std_logic;                                        -- export
			led_pio_external_connection_export   : out   std_logic_vector(7 downto 0);                     -- export
			readwrite_external_connection_export : out   std_logic;                                        -- export
			reset_reset_n                        : in    std_logic                     := 'X'              -- reset_n
		);
	end component test;

	u0 : component test
		port map (
			address_external_connection_export   => CONNECTED_TO_address_external_connection_export,   --   address_external_connection.export
			clk_clk                              => CONNECTED_TO_clk_clk,                              --                           clk.clk
			data_external_connection_export      => CONNECTED_TO_data_external_connection_export,      --      data_external_connection.export
			enable_external_connection_export    => CONNECTED_TO_enable_external_connection_export,    --    enable_external_connection.export
			led_pio_external_connection_export   => CONNECTED_TO_led_pio_external_connection_export,   --   led_pio_external_connection.export
			readwrite_external_connection_export => CONNECTED_TO_readwrite_external_connection_export, -- readwrite_external_connection.export
			reset_reset_n                        => CONNECTED_TO_reset_reset_n                         --                         reset.reset_n
		);

