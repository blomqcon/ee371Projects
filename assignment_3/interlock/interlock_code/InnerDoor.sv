module InnerDoor(clk, rst, innerDoorCtrl, arriving, departing, evacuated, innerDoor);
	input clk, rst;
	input innerDoorCtrl;
	input evacuated;
	input arriving, departing;
	output reg innerDoor = 0;

	reg preArriving, preDeparting;
		
	always @(posedge clk) begin
		preArriving <= arriving;
		preDeparting <= departing;
	
		if(rst)
			innerDoor <= 0;
		else if(~preDeparting & departing)
			innerDoor <= 0;
		else if(~preArriving & arriving)
			innerDoor <= 0;
		else if(innerDoorCtrl & evacuated)
			innerDoor <= 1;
		else
			innerDoor <= 0;
	end
endmodule 