`include "gunSelect.v"

module testBench;
	// connect the two modules
	wire [9:0] 	switches;
	wire [1:0] 	keys; 			//Alien Row (0-2)
	wire [1:0] 	gun;			//Alien Column (0-7)
	
	// declare an instance of the alienSelect module
	gunSelect gSel1(gun, switches, keys);

	// declare an instance of the Tester module
	Tester tester1 (switches, keys, gun);

	// file specifications for gtkwave
	initial
	begin
		// dump file is for dumping all the variables in a simulation
		$dumpfile("gunSelect.vcd");
		// dumps all the variables in module myDesign and below
		// but not modules instantiated in myDesign into the dumpfile.
		$dumpvars(1, gSel1);
	end
endmodule

module Tester (switches, keys, gun); 	
	output reg [9:0]	switches;
	output reg [1:0]	keys;
	input [1:0]			gun;
	
	parameter stimDelay = 20;
	integer i, j;

	initial // Response
	begin
	$display("\t  switches \tkeys \tgun \t  Time ");
	$monitor("\t %b \t %b \t %b ", switches, keys, gun, $time );
	end
	
	initial // Stimulus
	begin 
	#stimDelay;
	for (i = 0; i < 1025; i = i + 1) begin
		#stimDelay switches = i;

		for (j = 0; j < 4; j = j + 1) begin
			#stimDelay keys = j;
		end 
	end

	#(60*stimDelay); // needed to see END of simulation
	$finish; // finish simulation
	end
endmodule