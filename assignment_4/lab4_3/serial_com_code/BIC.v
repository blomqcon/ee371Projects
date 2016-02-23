module BIC (char_sent, reset, clk, transmit_enable, bsc);
	output char_sent;
	input reset, clk;
	input transmit_enable, bsc;
	
	reg [3:0] ps, ns;
	
	always@(*)
	if(transmit_enable & 4'b1111 != bsc)
	ns <= 4'b0001;
	else if(transmit_enable & 4'b1111 == bsc)
	ns <= 4'b0000;
	else
	ns <= 4'b0000;
	
	always@(posedge clk)
	if(!reset)
	ps <= ns;
	else 
	ps <= 4'b0000;
	
	assign char_sent = (4'b0000 != ps);
endmodule
