module OuterDoor(clk, rst, outerDoorCtrl, pressurized, outerDoor);
	input clk, rst;
	input outerDoorCtrl;
	input pressurized;
	output reg outerDoor;
	
	always @(posedge outerDoorCtrl) begin
		if(outerDoor)
			outerDoor <= 0;
		else if(pressurized)
			outerDoor <= 1;
		else
			outerDoor = 0;
	end
		
	always @(negedge rst or posedge clk) begin
		if(rst) begin
			outerDoor <= 0;
		end
	end
endmodule