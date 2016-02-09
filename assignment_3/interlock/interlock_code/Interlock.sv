
module Interlock(arriveCtrl, departCtrl, innerDoorCtrl, outerDoorCtrl, pressurizeCtrl, 
				evacuateCtrl, clk, rst, arrivingLED, departingLED, innerLED, outerLED,
				pressurizeLED, evacuateLED, gFull,
				debugStateArriving, debugStateDeparting);
	input arriveCtrl, departCtrl;
	input innerDoorCtrl, outerDoorCtrl;
	input pressurizeCtrl, evacuateCtrl;
	input clk, rst;
	output [0:1] gFull;
	output [0:2] debugStateArriving;
	output [0:2] debugStateDeparting;
	output arrivingLED, departingLED;
	output innerLED, outerLED;
	output pressurizeLED, evacuateLED;
	
	wire arriving, departing;
	wire innerDoor, outerDoor;
	wire pressurized, evacuated;
	reg [0:1] garageFull = 'b00;
	reg preArriving = 0;
	reg preDeparting = 0;
	
	InnerDoor iDoor(clk, rst, innerDoorCtrl, arriving, departing, evacuated, innerDoor);
	OuterDoor oDoor(clk, rst, outerDoorCtrl, arriving, departing, pressurized, outerDoor);
	Chamber c(clk, rst, pressurizeCtrl, evacuateCtrl, pressurized, evacuated);
	Arriving a(clk, rst, arriveCtrl, arriving, departing, innerDoor, outerDoor, pressurized, evacuated, garageFull, debugStateArriving);
	Departing d(clk, rst, departCtrl, arriving, departing, innerDoor, outerDoor, pressurized, evacuated, garageFull, debugStateDeparting);

	always@(*) begin
		arrivingLED = arriving;
		departingLED = departing;
		innerLED = innerDoor;
		outerLED = outerDoor;
		pressurizeLED = pressurized;
		evacuateLED = evacuated;
		gFull = garageFull;
	end
	
	
	always@(negedge clk) begin
		preArriving <= arriving;
		preDeparting <= departing;
		
		if(rst)
			garageFull <= 'b00;
		else if(preArriving & ~arriving)
			garageFull <= garageFull + 'b1;
		else if(preDeparting & ~departing)
			garageFull <= garageFull - 'b1;
		else
			garageFull <= garageFull;
	end
endmodule 