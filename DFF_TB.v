`timescale 1ns / 1ps

module DFF_TB;
	reg D;
	reg clk;
	reg e;
	reg rst;
	wire Q;
	wire QNOT;
	DFF uut (
		.D(D), 
		.clk(clk), 
		.e(e), 
		.rst(rst),
		.Q(Q),
		.QNOT(QNOT)
	);
	initial begin
	   clk = 0;
	   forever #5 clk = ~clk;
	end	

	initial begin
	   #5;
		D = 0;
		e = 0;
		rst = 1;
		#5
		rst = 0;
		#100;
		D = 1;
		e = 1;
		#150;
		e = 0;
		D = 0;
	end
      
endmodule

