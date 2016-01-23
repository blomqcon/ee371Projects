`include "Timer.v"

module Arriving(clk, rst, arriveCtrl, arriving, departing, innerDoor, outerDoor, pressurized, evacuated);
	input clk, rst;
	input arriveCtrl, departing, innerDoor, outerDoor, pressurized, evacuated;
	output reg arriving;
	
	reg [3:0] ps;
	reg [3:0] ns;
	
	parameter reset = 3'b000;
	parameter min5 = 3'b001;
	parameter pres = 3'b010;
	parameter openOut = 3'b011;
	parameter evac = 3'b100;
	parameter openIn = 3'b101;
	
	Timer t(clk, arriveCtrl & !done, 3'b101, done);
	
	always @(*) 
		case(ps)
			reset: if(arriveCtrl) begin 
				ns = min5;
				arriving = 1; end
			else begin 
				ns = reset;
				arriving = 0; end
			
			min5: if(done) ns = pres;
			else ns = min5;
			
			pres: if(pressurized) ns = openOut;
			else ns = pres;
			
			openOut: if(outerDoor) ns = evac;
			else ns = openOut;
			
			evac: if(evacuated) ns = openIn;
			else ns = evac;
			
			openIn: if(innerDoor) ns = reset;
			else ns = openIn;
			
			default ns = ps;
	endcase
	
	always@(posedge clk) begin
		if(rst) begin
			ps <= reset;
		end begin
			ps <= ns;
		end
	end
endmodule