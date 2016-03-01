
module S2P_ShiftRegister(SR_Clk, serial_data, data_bus);
	input SR_Clk, serial_data;
	output reg [7:0] data_bus;
	
	always @(posedge SR_Clk) begin 
		data_bus <= {data_bus[6:0], serial_data};
	end 
endmodule
