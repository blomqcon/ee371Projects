module BinToHexDisplay(binary, HEX);
	input [0:3] binary;
	output [0:6] HEX;

	always@(*) begin
		case(binary)
			'b0000: HEX = 'b1000000;
			'b0001: HEX = 'b1111001;
			'b0010: HEX = 'b0100100;
			'b0011: HEX = 'b0110000;
			'b0100: HEX = 'b0011001;
			'b0101: HEX = 'b0010010;
			'b0110: HEX = 'b0000010;
			'b0111: HEX = 'b1111000;
			'b1000: HEX = 'b0000000;
			'b1001: HEX = 'b0011000;
			default: HEX = 'b1111111;
		endcase
	end
endmodule 