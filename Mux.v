`timescale 1ns / 1ps
//mux 4*1
module Mux(
  input [3:0] data,
  input [1:0] select,
  input rst,
  input clk,
  output reg out
);

always @ (negedge clk) begin
  if (rst)
    out = 0;
  else begin
    case (select)
      2'b00: out = data[0];
      2'b01: out = data[1];
      2'b10: out = data[2];
      2'b11: out = data[3];
      default: out = 0;
    endcase
  end
end
endmodule
