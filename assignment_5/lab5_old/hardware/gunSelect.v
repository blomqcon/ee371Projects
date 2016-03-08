module gunSelect(gun, switches, keys);
	input [9:0] 		switches;
	input [1:0] 		keys;
	output reg [1:0] 	gun;
	
	always @(switches or keys) begin
		if (10'b1010110101 == switches) begin
			gun = 2'b11;
		end
		else if (keys != 2'b11) begin
			gun = keys;
		end else begin
			gun = 2'b00;
		end
	end
endmodule 