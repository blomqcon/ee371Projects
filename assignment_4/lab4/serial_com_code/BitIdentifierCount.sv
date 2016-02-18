module BitIdentifierCount(done, identifer, reset, bscClock);
	input reset, bscClock;
	output reg done = 1'b0;
	output reg [3:0] identifer = 4'b0000;
	
	always @(posedge bscClock or posedge reset) begin
		if(reset) begin
			identifer <= 4'b0000;
			done <= 1'b0;
		end else begin
			identifer <= identifer + 1;
			if(identifer == 4'b0111) begin
				done <= 1'b1;
			end else begin
				done <= 1'b0;
			end
		end
		
	end
endmodule 