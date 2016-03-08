/*module P2S_ShiftRegister(SR_Clk, reset, load, data_bus, serial_data); 
	input SR_Clk, load,reset;
	input [7:0] data_bus;
	output serial_data;
	
	reg [9:0] data;
	reg load_reg;
	
	assign serial_data = data[9];
	
	always @(posedge SR_Clk or negedge reset) begin
		if (~reset) begin
			data <= 10'b1111111111;
			load_reg = 0;
		end
		else if (load & ~load_reg) 
			data <= { 1'b0, data_bus, 1'b1 };
		else 
			data = { data[8:0], 1'b1 };

		load_reg <= load;
	end
endmodule*/




module P2S_ShiftRegister(SR_Clk, reset, load, data_bus, serial_data); 
	input SR_Clk, load, reset;
	input [7:0] data_bus;
	output serial_data;
	
	reg [9:0] data;
	
	assign serial_data = data[9];
	
	always @(posedge SR_Clk or negedge reset) begin
		if (~reset)
			data = 10'b1111111111;
		else if (load)
			data <= { 1'b0, data_bus, 1'b1 };
		else
			data = { data[8:0], 1'b1 };
	end
endmodule
