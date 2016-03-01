
module BSC(SClk, enable, Count);
	input SClk, enable;
	output reg [3:0] Count;
	
	// The counter will always be running but it be changed to stop during the quiesent if 
	// necessary

	always @(posedge SClk) begin
		if (enable == 1'b0) Count <= 4'b0000;
		else Count <= Count + 4'b0001;
	end 
endmodule