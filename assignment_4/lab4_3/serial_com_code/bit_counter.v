module bit_counter (char_sent, bit_count, reset, clk, transmit_enable, load);
	output [7:0]bit_count;
	output char_sent;
	input reset, clk, transmit_enable, load;
	
	reg [7:0] ps, ns;
	
	always@(*)
	if(transmit_enable & !load & ps[7:4] != 4'b1010) ns <= ps + 8'b00000001;
	else if(transmit_enable & !load & ps[7:4] == 4'b1010) ns <= 8'b00000000;
	else ns <= 8'b00000000;
	
	always@(posedge clk)
	if(reset)
	ps <= ns;
	else 
	ps <= 8'b00000000;

	assign bit_count = ps;
	assign char_sent = (4'b1010 == ps[7:4]);
endmodule
