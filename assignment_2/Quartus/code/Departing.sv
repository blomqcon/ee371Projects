//`include "Timer.v"

module Departing(clk, rst, departCtrl, arriving, departing, innerDoor, outerDoor, pressurized, evacuated, garageFull, debugState);
	input clk, rst;
	input departCtrl, arriving, innerDoor, outerDoor, pressurized, evacuated;
	input [0:2] garageFull;
	output reg departing;
	output reg [0:2] debugState;
	
	parameter garageSize = 2'b11;
	parameter departingWaitTime = 3'b100;
	
	parameter reset = 3'b000;
	parameter min5 = 3'b001;
	parameter pres = 3'b010;
	parameter openOut = 3'b011;
	parameter evac = 3'b100;
	
	reg [3:0] ps = reset;
	reg [3:0] ns = reset;
	
	Timer dTimer(clk, departCtrl, departingWaitTime, done);
	
	always @(*) 
		case(ps)
			reset: if(departCtrl && (garageFull > garageSize) && (!arriving)) begin 
					ns = min5;
				end
			else begin 
					ns = reset;
				end
			
			min5: begin
				if(done) ns = pres;
				else if(rst) ns = reset;
				else ns = min5;
			end
			
			pres: if(pressurized) ns = openOut;
			else if(rst) ns = reset;
			else ns = pres;
			
			openOut: if(outerDoor) ns = evac;
			else if(rst) ns = reset;
			else ns = openOut;
			
			evac: if(evacuated) ns = reset;
			else if(rst) ns = reset;
			else ns = evac;
			
			default ns = ps;
	endcase
	
	always@(posedge clk) begin
		if(rst) begin
			ps <= reset;
		end begin
			ps <= ns;
		end
		
		departing <= (ps != reset);
		debugState <= ps;
	end
endmodule