`timescale 1ns / 1ps
module DFF (
  input D,
  input clk,
  input e,
  input rst,
  output reg Q,
  output QNOT
);
assign QNOT = ~Q;
always @(negedge clk) begin
    if(rst)
      Q = 0;
	 else if (e)
		Q = D;
end
endmodule
