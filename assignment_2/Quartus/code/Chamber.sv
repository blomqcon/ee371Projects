module Chamber(clk, rst, pressurizeCtrl, evacuateCtrl, pressurized, evacuated);
	input clk, rst;
	input pressurizeCtrl, evacuateCtrl;
	output reg pressurized = 0;
	output reg evacuated = 1;
	
	wire pDone, eDone;
	reg pressurizing = 0;
	reg evacuating = 0;
	
	Timer tP(clk, pressurizeCtrl, 'b110, pDone);
	Timer tE(clk, evacuateCtrl, 'b110, eDone);
	
	always @(posedge clk) begin
		if(rst) begin
			pressurized <= 0;
			evacuated <= 1;
			pressurizing <= 0;
			evacuating <= 0;
		end else begin
			if(evacuated & pressurizeCtrl) begin
				evacuated <= 0;
				pressurizing <= 1;
			end
			
			if(pressurizing & pDone) begin
				pressurized <= 1;
				pressurizing <= 0;
			end
			
			if(pressurized & evacuateCtrl) begin
				pressurized <= 0;
				evacuating <= 1;
			end
			
			if(evacuating & eDone) begin
				evacuated <= 1;
				evacuating <= 0;
			end
		end
	end
endmodule 