module Interlock(arriveCtrl, departCtrl, innerDoorCtrl, outerDoorCtrl, pressurizeCtrl, 
				evacuateCtrl, clk, rst, arrivingLED, departingLED, innerLED, outerLED);
	input arriveCtrl, departCtrl;
	input innerDoorCtrl, outerDoorCtrl;
	input pressurizeCtrl, evacuateCtrl;
	input clk, rst;
	output arrivingLED, departingLED;
	output innerLED, outerLED;
	
	reg arriving, departing;
	reg innerDoor, outerDoor;
	reg pressurized, evacuated;

	InnerDoor iDoor(innerDoorCtrl, evacuated, innerDoor);
	OuterDoor oDoor(outerDoorCtrl, pressurized, outerDoor);
	
	Pressurize p(pressurized, evacuated, pressurized, innerDoor, outerDoor, )
	
	//Arriving a();
	//Departing d();
	//Chamber c();
endmodule 