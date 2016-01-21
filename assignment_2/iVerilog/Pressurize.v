`include "Timer.v"

module Pressurize(clk, rst, pressurizeCtrl, pressurized, evacuated);
	input clk, rst;
	input pressurizeCtrl;
	output reg pressurized;
	output reg evacuated;
	
	reg rstPressurizeDelay;
	reg pressurizing;

	Timer t(clk, evacuated & pressurizeCtrl, 'b110, done);
	
	always @(*) begin
		/*if(evacuated & pressurizeCtrl)
			rstPressurizeDelay = 1;
		else
			rstPressurizeDelay = 0;*/
	end
	
	always @(posedge clk) begin
		if(evacuated & pressurizeCtrl) begin
			evacuated <= 0;
			pressurizing <= 1;
		end
		
		if(pressurizing & done) begin
			pressurized <= 1;
			pressurizing <= 0;
		end
	end
	
	always @(posedge rst) begin
		pressurizing <= 0;
		pressurized <= 0;
		evacuated <= 1;
	end
endmodule 