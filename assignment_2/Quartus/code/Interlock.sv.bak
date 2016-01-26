`include "Timer.v"
`include "Chamber.v"
`include "Arriving.v"
`include "Departing.v"
`include "InnerDoor.v"
`include "OuterDoor.v"

module Interlock(arriveCtrl, departCtrl, innerDoorCtrl, outerDoorCtrl, pressurizeCtrl, 
				evacuateCtrl, clk, rst, debugStateArriving, debugStateDeparting);
	input arriveCtrl, departCtrl;
	input innerDoorCtrl, outerDoorCtrl;
	input pressurizeCtrl, evacuateCtrl;
	input clk, rst;
	output [0:2] debugStateArriving;
	output [0:2] debugStateDeparting;
	//output arrivingLED, departingLED;
	//output innerLED, outerLED;
	
	wire arriving, departing;
	wire innerDoor, outerDoor;
	wire pressurized, evacuated;
	reg garageFull = 0;
	
	InnerDoor iDoor(clk, rst, innerDoorCtrl, evacuated, innerDoor);
	OuterDoor oDoor(clk, rst, outerDoorCtrl, pressurized, outerDoor);
	Chamber c(clk, rst, pressurizeCtrl, evacuateCtrl, pressurized, evacuated);
	Arriving a(clk, rst, arriveCtrl, arriving, departing, innerDoor, outerDoor, pressurized, evacuated, debugStateArriving);
	Departing d(clk, rst, departCtrl, arriving, departing, innerDoor, outerDoor, pressurized, evacuated, debugStateDeparting);

	always@(negedge arriving) begin
		garageFull <= 1;
	end
	
	always@(negedge departing) begin
		garageFull = 0;
	end
	
	always@(posedge rst) begin
		garageFull = 0;
	end
endmodule 