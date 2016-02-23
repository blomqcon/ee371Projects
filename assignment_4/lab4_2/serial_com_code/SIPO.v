/*	Joanna Mazer
	EE 371 Peckol Winter 2016
	Project 3: Extending a Microprocessor
	SIPO.v
	
	This verilog module functions as a serial in, parallel out
	shift register. As individual data bits are entered into 
	the system, the 10 bit output will shift once to the left
	accordingly.
*/


module SIPO(data_out, clk, reset, data_in); // Serial In -> Parallel Out (10 bits)

	input 			clk, reset;
	input 			data_in;
	output [9:0] 	data_out;

	reg [9:0] 		Q;
	
	always @(posedge clk or posedge reset) begin
		if (reset) 
			begin
				Q <= 10'b0000000000;
			end
		else 
			begin
				Q[0] <= data_in;
				Q[1] <= Q[0];
				Q[2] <= Q[1];
				Q[3] <= Q[2];
				Q[4] <= Q[3];
				Q[5] <= Q[4];
				Q[6] <= Q[5];
				Q[7] <= Q[6];
				Q[8] <= Q[7];
				Q[9] <= Q[8];
			end
	end

	assign data_out = Q; 


endmodule 
	
/* 	always @(posedge clk or posedge reset) begin
		if (reset) 
			begin
				Q <= 10'b0000000000;
				count <= 3'b000;
			end
		else 
			begin
				if (count == 3'b111)
					begin   	// 8 bits from data_in
						load <= 1'b1;				// load enabled
						count <= 3'b000;			
					end
				else 
					begin 
						load <= 1'b0;
						count <= count + 1; 	   	// counting 8 bits from data_in
						Q[0] <= data_in;
						Q[1] <= Q[0];
						Q[2] <= Q[1];
						Q[3] <= Q[2];
						Q[4] <= Q[3];
						Q[5] <= Q[4];
						Q[6] <= Q[5];
						Q[7] <= Q[6];
						Q[8] <= Q[7];
						Q[9] <= Q[8];
					end
			end
	end
	
	assign data_out = Q; 

endmodule 

 */

 