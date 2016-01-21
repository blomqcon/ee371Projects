module OuterDoor(clk, rst, outerDoorCtrl, pressurized, outerDoor);
	input clk, rst;
	input outerDoorCtrl;
	input pressurized;
	output reg outerDoor;
	
	reg ns;
	
	always @(*) begin
		ns <= (outerDoorCtrl & pressurized);
	end
		
	always @(negedge rst or posedge clk) begin
		if(!rst) begin
			outerDoor <= 0;
		end
		else begin
			outerDoor <= ns;
		end
	end
endmodule