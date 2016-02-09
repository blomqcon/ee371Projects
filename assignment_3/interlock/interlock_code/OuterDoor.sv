module OuterDoor(clk, rst, outerDoorCtrl, arriving, departing, pressurized, outerDoor);
	input clk, rst;
	input outerDoorCtrl;
	input pressurized;
	input arriving, departing;
	output reg outerDoor = 0;
	
	reg preArriving, preDeparting;
	
	always @(posedge clk) begin
		preArriving <= arriving;
		preDeparting <= departing;
		if(rst)
			outerDoor <= 0;
		else if(~preDeparting & departing)
			outerDoor <= 0;
		else if(~preArriving & arriving)
			outerDoor <= 0;
		else if(outerDoorCtrl & pressurized)
			outerDoor <= 1;
		else
			outerDoor <= 0;
	end
endmodule 