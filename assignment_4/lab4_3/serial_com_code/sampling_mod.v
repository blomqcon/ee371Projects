module sampling_mod (S_data_out, reset, sc_clk_ctrl, data, sample_phase);
	output S_data_out;
	input reset, sc_clk_ctrl, data, sample_phase;
	
	reg [2:0] p_count, n_count;
	reg [2:0] p_one, n_one, p_zero, n_zero;
	
	always@(*)
	if(3'b111 != p_count & 1'b1 == sample_phase) begin
		if(1'b1 == data) begin
			n_one = p_one + 3'b001;
			n_zero = p_zero;
		end
		else begin
			n_one = p_one;
			n_zero = p_zero + 3'b001;
		end
		n_count = p_count + 3'b001;
	end
	else begin
		n_one = 3'b000;
		n_zero = 3'b000;
		n_count = 3'b000;
	end
	
	always@(posedge sc_clk_ctrl)
	if(reset) begin
	p_one <= n_one;
	p_zero <= n_zero;
	p_count <= n_count;
	end
	else begin
	p_count <= 3'b000;
	p_one <= 3'b000;
	p_zero <= 3'b000;
	end
	
	assign S_data_out = (3'b111 == p_count & (p_one >= p_zero));

endmodule
