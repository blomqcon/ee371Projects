module transmitting (clk, reset, load, t_enable, serial_out, char_sent, p_out);
	input 		clk, reset, load, t_enable;
	input [7:0] p_out;
	output 		serial_out, char_sent;
	wire			t_count;
	
	BSC 		BSC_transmitting 	(.clk(clk), .enable(t_enable), .count(t_count));	
	BIC 		BIC_transmitting 	(.SRclk(t_count), .enable(t_enable), .char_status(char_sent));
	PISO 		PISO_transmitting (.SRclk(t_count), .reset(reset), .load(load), .PISO_in(p_out), .PISO_out(serial_out));
	
endmodule 