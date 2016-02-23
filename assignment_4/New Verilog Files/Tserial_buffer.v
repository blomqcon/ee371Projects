

module Tserial_buffer (clk, reset, data_in, data_out);
	input 	clk, reset, data_in;
	output 	data_out; 

	reg Q;
	
	assign data_out = Q; 

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			Q <= 1'b1;			
		end
		else begin
			Q <= data_in;
		end
	end

endmodule 