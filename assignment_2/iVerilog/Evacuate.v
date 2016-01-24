module Evacuate(clk, rst, evacuateCtrl, pressurized, evacuated);
	input clk, rst;
	input evacuateCtrl;
	output reg pressurized;
	output reg evacuated;
	
	wire rstEvacuteDelay;
	reg evacuating;

	Timer t(clk, evacuateCtrl, 'b110, done);
	
	/*always @(*) begin
		rstEvacuteDelay = pressurized & evacuateCtrl;
	end*/
	
	always @(posedge clk) begin
		if(pressurized & evacuateCtrl) begin
			pressurized <= 0;
			evacuating <= 1;
		end
		
		if(evacuating & done) begin
			evacuated <= 1;
			evacuating <= 0;
		end
	end
	
	always @(posedge rst) begin
		evacuating <= 0;
	end
endmodule 