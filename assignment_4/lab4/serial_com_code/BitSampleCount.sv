module BitSampleCount(srcc, bic, rstBSC, clk);
	input rstBSC, clk;
	output reg srcc, bic;
	
	
	wire [3:0] counterOut;
	Counter4 counter(counterOut, clk, rstBSC);
	
	always @(posedge clk) begin
		if (counterOut == 15) begin
			bic <= 1;
			srcc <= 0;
		end else if (counterOut == 7) begin
			bic <= 0;
			srcc <= 1;
		end else begin
			bic <= 0;
			srcc <= 0;
		end
	end
endmodule 