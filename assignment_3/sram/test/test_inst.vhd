	component test is
		port (
			clk_clk                                   : in  std_logic                     := 'X';             -- clk
			led_pio_external_connection_export        : out std_logic_vector(7 downto 0);                     -- export
			reset_reset_n                             : in  std_logic                     := 'X';             -- reset_n
			sram_address_external_connection_export   : in  std_logic_vector(10 downto 0) := (others => 'X'); -- export
			sram_datain_external_connection_export    : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			sram_enable_external_connection_export    : in  std_logic                     := 'X';             -- export
			sram_readwrite_external_connection_export : in  std_logic                     := 'X';             -- export
			switches_pio_external_connection_export   : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			sram_dataout_external_connection_export   : out std_logic_vector(7 downto 0)                      -- export
		);
	end component test;

	u0 : component test
		port map (
			clk_clk                                   => CONNECTED_TO_clk_clk,                                   --                                clk.clk
			led_pio_external_connection_export        => CONNECTED_TO_led_pio_external_connection_export,        --        led_pio_external_connection.export
			reset_reset_n                             => CONNECTED_TO_reset_reset_n,                             --                              reset.reset_n
			sram_address_external_connection_export   => CONNECTED_TO_sram_address_external_connection_export,   --   sram_address_external_connection.export
			sram_datain_external_connection_export    => CONNECTED_TO_sram_datain_external_connection_export,    --    sram_datain_external_connection.export
			sram_enable_external_connection_export    => CONNECTED_TO_sram_enable_external_connection_export,    --    sram_enable_external_connection.export
			sram_readwrite_external_connection_export => CONNECTED_TO_sram_readwrite_external_connection_export, -- sram_readwrite_external_connection.export
			switches_pio_external_connection_export   => CONNECTED_TO_switches_pio_external_connection_export,   --   switches_pio_external_connection.export
			sram_dataout_external_connection_export   => CONNECTED_TO_sram_dataout_external_connection_export    --   sram_dataout_external_connection.export
		);

