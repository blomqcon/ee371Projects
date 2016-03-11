module mux2_1(out, i0, i1, sel);
		output reg out;
		input i0, i1, sel;

		// initial begin 
		// 	out = 1'b1;
		// end

		// always@(*) begin 
		// 	out = (i1 * sel) | (i0 * ~sel);
		// end 

		//assign out = (i1 * sel) | (i0 * ~sel);

		always@(sel or i0 or i1)
		 begin: MUX
		 	if (sel == 1'b0) begin
		 		out = i0;
		 	end else begin
		 		out = i1;
		 	end
		 end

endmodule

// module mux2_1_testbench();
// 		reg i0, i1, sel;
// 		wire out;

// 		mux2_1 dut (out, i0, i1, sel);

// 		initial begin
// 				sel=0; i0=0; i1=0; #10;
// 				sel=0; i0=0; i1=1; #10;
// 				sel=0; i0=1; i1=0; #10;
// 				sel=0; i0=1; i1=1; #10;
// 				 sel=1; i0=0; i1=0; #10;
// 				 sel=1; i0=0; i1=1; #10;
// 				 sel=1; i0=1; i1=0; #10;
// 				 sel=1; i0=1; i1=1; #10;
// 		end
// endmodule 