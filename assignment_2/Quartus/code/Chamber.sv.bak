module Chamber(clk, rst, pressurizeCtrl, evacuateCtrl, pressurized, evacuated);
	input clk, rst;
	input pressurizeCtrl, evacuateCtrl;
	output reg pressurized, evacuated;
	
	wire pDone, eDone;
	reg pressurizing, evacuating;
	
	Timer tP(clk, pressurizeCtrl, 'b110, pDone);
	Timer tE(clk, evacuateCtrl, 'b110, eDone);
	
	always @(posedge clk) begin
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
	
	always @(posedge rst) begin
		pressurizing <= 0;
		pressurized <= 0;
	end
	
	
	always @(posedge rst) begin
		pressurized <= 0;
		evacuated <= 1;
		pressurizing <= 0;
		evacuating <= 0;
	end
endmodule 