`timescale 1ns / 1ps
module ShiftRegister_TB;
	reg [7:0] data;
	reg clk;
	reg rst;
	reg [1:0] select;
	reg e;
	wire [7:0] out;
	ShiftRegister uut (
		.data(data), 
		.clk(clk), 
		.rst(rst),
		.select(select),
		.e(e),
		.out(out)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
   initial begin
	   rst = 1;
		#5;
		rst = 0;
		e = 1;
		#10;
		data = 8'b00010111;
		select = 2'b11;
		#5;
		select = 2'b01;
		#100;
		data = 8'b10010111;
		select = 2'b11;
		#10;
		select = 2'b10;
		#100;
		$stop;
	end
endmodule

