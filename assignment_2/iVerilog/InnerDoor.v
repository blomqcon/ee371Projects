module InnerDoor(clk, rst, innerDoorCtrl, evacuated, innerDoor);
	input clk, rst;
	input innerDoorCtrl;
	input evacuated;
	output reg innerDoor;
	
	always @(posedge innerDoorCtrl) begin
		if(innerDoor)
			innerDoor <= 0;
		else if(evacuated)
			innerDoor <= 1;
		else
			innerDoor = 0;
	end
		
	always @(negedge rst or posedge clk) begin
		if(rst) begin
			innerDoor <= 0;
		end
	end
endmodule