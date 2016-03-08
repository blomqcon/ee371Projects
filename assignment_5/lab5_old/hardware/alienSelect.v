module alienSelect(x, y, switches);
	input [9:0] 		switches;
	output reg	[1:0] 	y; 		//Alien Row (0-2)
	output reg	[2:0] 	x;		//Alien Column (0-7)

	always @(switches) begin
		case (switches[9:7])
			1: y = 2'b1;
			2: y = 2'b10;
			4: y = 2'b11;
			default : y = 2'b0;
		endcase
		case (switches[6:0])
			1: x = 3'b1;		// sw 0
			2: x = 3'b10;		// sw 1
			4: x = 3'b11;		// sw 2
			8: x = 3'b100;		// sw 3
			16: x = 3'b101;		// sw 4
			32: x = 3'b110;		// sw 5
			64: x = 3'b111;		// sw 6
			default: x = 3'b0;	// sw 7	
		endcase
	end

endmodule