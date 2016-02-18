module BitSampleCount(srClock, bicClock, resetBSC, clock);
	input resetBSC, clock;
	output reg srClock = 1'b0;
	output reg bicClock = 1'b0;
	
	
	wire [3:0] counterOut;
	Counter4 counter(counterOut, clock, resetBSC);
	
	always @(posedge clock or posedge resetBSC) begin
		if(resetBSC) begin
			bicClock <= 0;
			srClock <= 0;
		end else begin
			if(counterOut == 4'b1111) begin
				bicClock <= 1;
				srClock <= 0;
			end else if(counterOut == 4'b0111) begin
				bicClock <= 0;
				srClock <= 1;
			end else begin
				bicClock <= 0;
				srClock <= 0;
			end
		end
	end
endmodule 