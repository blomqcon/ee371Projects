module InnerDoor(clk, rst, innerDoorCtrl, evacuated, innerDoor);
	input clk, rst;
	input innerDoorCtrl;
	input evacuated;
	output reg innerDoor;
	
	reg ns;
	
	always @(*) begin
		ns <= (innerDoorCtrl & evacuated);
	end
		
	always @(negedge rst or posedge clk) begin
		if(!rst) begin
			innerDoor <= 0;
		end
		else begin
			innerDoor <= ns;
		end
	end
endmodule