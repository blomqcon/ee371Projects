module DE1_SoC (LEDR, SW, PLD_CLOCKINPUT, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	output [9:0] LEDR;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	input PLD_CLOCKINPUT; // 50MHz clock.
	input [9:0] SW;
	
	//Controlled by NIOS PIO's (outputs)
	wire [7:0] nios_outputs;
	wire arriveCtrl, departCtrl;
	wire innerDoorCtrl, outerDoorCtrl;
	wire pressurizeCtrl, evacuateCtrl;
	
	assign arriveCtrl = nios_outputs[0];
	assign departCtrl = nios_outputs[1];
	assign innerDoorCtrl = nios_outputs[2];
	assign outerDoorCtrl = nios_outputs[3];
	assign pressurizeCtrl = nios_outputs[4];
	assign evacuateCtrl = nios_outputs[5];
	
	//NIOS 2 inputs
	wire [7:0] nios_inputs;
	wire arrivingLED, departingLED;
	wire innerLED, outerLED;
	wire pressurizedLED, evacuatedLED;
	
	assign nios_inputs[0] = arrivingLED; 
	assign nios_inputs[1] = departingLED;
	assign nios_inputs[2] = innerLED;
	assign nios_inputs[3] = outerLED;
	assign nios_inputs[4] = pressurizedLED;
	assign nios_inputs[5] = evacuatedLED;
	
	wire [0:2] debugStateArriving, debugStateDeparting;
	wire [0:1] gFull;
	
	//assign nios_inputs = 8'b11111111;
	
	test myFile(
		.clk_clk(PLD_CLOCKINPUT),
		.reset_reset_n(~SW[1]),
		.led_pio_external_connection_export(nios_outputs),
		.switches_pio_external_connection_export(nios_inputs)
	);
	
	Interlock interlock(arriveCtrl, departCtrl, innerDoorCtrl, outerDoorCtrl, pressurizeCtrl, evacuateCtrl,
								PLD_CLOCKINPUT, SW[0],
								arrivingLED, departingLED, innerLED, outerLED, pressurizedLED, evacuatedLED,
								gFull, debugStateArriving, debugStateDeparting);
	
	
	assign LEDR[0] = arrivingLED;
	assign LEDR[1] = departingLED;
	assign LEDR[2] = innerLED;
	assign LEDR[3] = outerLED;
	assign LEDR[4] = pressurizedLED;
	assign LEDR[5] = evacuatedLED;
	
	
	assign HEX5 = 7'b0001100;
	BinToHexDisplay(gFull, HEX4);
	assign HEX3 = 7'b0100001;
	BinToHexDisplay(debugStateDeparting, HEX2);
	assign HEX1 = 7'b0001000;
	BinToHexDisplay(debugStateArriving, HEX0);

	wire slow_clk;
	clock_divider15 clk_div (CLOCK_50, slow_clk);

	assign LEDR[9] = slow_clk;
	
endmodule 
