module P2S_SR (S_data_out, reset, ic_clk_ctrl, P_data_in, load, end_pass);
	output S_data_out;
	input reset, ic_clk_ctrl, load, end_pass;
	input [7:0] P_data_in;
	reg if_load;
	reg [9:0] p_buffer, n_buffer, trans_buffer;
	always@(*)
	if(1'b1 == load & 1'b0 == end_pass & 1'b0 == if_load) begin
	n_buffer = {P_data_in, 1'b1, 1'b0};
	if_load = 1'b1;
	end
	else if(1'b0 == load & 1'b0 == end_pass & 1'b1 == if_load) begin
	n_buffer = n_buffer;
	if_load = 1'b0;
	end
	else if(1'b0 == load & 1'b0 == end_pass & 1'b0 == if_load) begin
	n_buffer = p_buffer;
	if_load = 1'b0;
	end
	else if (1'b1 == end_pass) begin
	n_buffer = 10'b000000000;
	if_load = 1'b0;
	end
	
	always@(posedge ic_clk_ctrl)
	if(reset)
	p_buffer <= n_buffer >> 1;
	else
	p_buffer <= 10'b000000000;
	
	assign S_data_out = p_buffer[0];
endmodule
