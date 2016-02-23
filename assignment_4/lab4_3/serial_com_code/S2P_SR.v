module S2P_SR (P_data_out, reset, ic_clk_ctrl, S_data_in, read);
	output reg [7:0] P_data_out;
	input reset, ic_clk_ctrl, S_data_in, read;
	
	reg [8:0] buffer, dum;

	always@(*)
	if(read)
	P_data_out <= buffer[7:0];
	else
	P_data_out <= 8'b00000000;
	
	always@(posedge ic_clk_ctrl)
	if(reset) begin
	buffer = buffer << 1;
	buffer[0] = S_data_in;
	end
	else
	buffer <= 9'b000000000;
endmodule
