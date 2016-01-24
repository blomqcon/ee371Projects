module Pressurize(clk, rst, pressurizeCtrl, pressurized, evacuated);
	input clk, rst;
	input pressurizeCtrl;
	output reg pressurized;
	output reg evacuated;
	
	wire rstPressurizeDelay;
	reg pressurizing;

	Timer t(clk, pressurizeCtrl, 'b110, done);
	
	/*always @(*) begin
		rstPressurizeDelay = evacuated & pressurizeCtrl;
	end*/
	
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
	end
endmodule 