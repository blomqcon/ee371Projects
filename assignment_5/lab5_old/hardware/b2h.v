module b2h (data_x, data_y, HEX0, HEX1, HEX4, HEX5);
	input [2:0] data_x;
	input [1:0] data_y;
	output [6:0] HEX0, HEX1, HEX4, HEX5;
	
	reg [6:0] x, y;
	
	assign HEX5 = 7'b1000111;
	assign HEX1 = 7'b1000110;
	assign HEX4 = x;
	assign HEX0 = y;
	
	always@(*) begin 
		case(data_x)  
			3'b000: y = 7'b1000000;			
			3'b001: y = 7'b1111001;
			3'b010: y = 7'b0100100;
			3'b011: y = 7'b0110000;
			3'b100: y = 7'b0011001;
			3'b101: y = 7'b0010010;
			3'b110: y = 7'b0000010;
			3'b111: y = 7'b1111000;
			default: y = 7'b1111111;
		endcase
		
		case(data_y) 
			2'b00: x = 7'b1111001;
			2'b01: x = 7'b0100100;
			2'b10: x = 7'b0110000;
			2'b11: x = 7'b0011001;
			default: x = 7'b1111111;
		endcase
	end

endmodule 