
// This module is not necessary
module S_R_ClockControl(BSC_Count, SR_Clk);
	input [3:0] BSC_Count;
	output SR_Clk;
	
		assign SR_Clk = BSC_Count[3];
endmodule 