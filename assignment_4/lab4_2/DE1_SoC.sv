module DE1_SoC (LEDR, SW, PLD_CLOCKINPUT, GPIO_in, GPIO_out);
	output [9:0] LEDR;
	input PLD_CLOCKINPUT; // 50MHz clock.
	input [9:0] SW;
	input  GPIO_in;
	output GPIO_out;
	
	
	wire serialData;
	
	wire [9:0] parallelOutput;
	wire charSent;
	wire transmitEnable;
	wire load;
	
	wire [9:0] parallelInput;
	wire charRecieved;
	
	wire [7:0] ledOutput;
	
	lab4CPU cpu(
		.clk_clk(PLD_CLOCKINPUT),
		.reset_reset_n(1),
		.character_recieved_input_external_connection_export(charRecieved),
		.character_sent_input_external_connection_export(charSent),
		.led_output_external_connection_export(ledOutput),
		.load_output_external_connection_export(load),
		.parallel_input_external_connection_export(parallelInput),
		.parallel_output_external_connection_export(parallelOutput),
		.transmit_enable_output_external_connection_export(transmitEnable)
	);
	
	
	wire slow_clock;
	clock_divider19 cd(PLD_CLOCKINPUT, slow_clock);
	
	
	transmitting t(
		.clk(slow_clock), 
		.reset(SW[0]), 
		.t_enable(transmitEnable), 
		.data_in(parallelInput), 
		.data_out(GPIO_out), 
		.charSent(charSent),
		.load_n(load)
	);
	
	receiving r(
		.clk(slow_clock), 
		.reset(SW[0]),
		.data_in(GPIO_in), 
		.data_out(parallelOutput), 
		.charReceived(charRecieved)
	);
	
	
	/*SerialOutput so(
		.serialOut(serialData), 
		.charSent(charSent), 
		.data(parallelOutput), 
		.transmitEnable(transmitEnable), 
		.load(load), 
		.clock(slow_clock)
	);
	
	SerialInput si(
		.parallelOut(parallelInput),
		.charRecieved(charRecieved),
		.data(serialData),
		.clock(slow_clock)
	);*/
	
	assign LEDR[7:0] = ledOutput; 
	assign LEDR[8] = serialData;
	assign LEDR[9] = slow_clock;
endmodule 