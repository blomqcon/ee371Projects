module SRAM (data_O, data_I, clk, addr, wr, enable);
	output reg [7:0] data_O;
	input [7:0] data_I;
	input [10:0] addr;
	input wr, enable, clk; // wr: 1 for write, 0 for read
	
	reg [7:0] m[2047:0];

	
	always@(posedge clk)
	if(enable) begin
	if(wr)
	m[addr] <= data_I; // write
	else
	data_O <= m[addr]; // read
	end
endmodule
