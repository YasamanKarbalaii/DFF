`timescale 1ns / 1ps
module ShiftRegister(
  input [7:0] data,
  input clk,
  input rst,
  input [1:0] select,
  input e,
  output wire [7:0] out
);
reg [3:0] dmux1;
reg [3:0] dmux2;
reg [3:0] dmux3;
reg [3:0] dmux4;
reg [3:0] dmux5;
reg [3:0] dmux6;
reg [3:0] dmux7;
reg [3:0] dmux8;
wire outmux1;
wire outmux2;
wire outmux3;
wire outmux4;
wire outmux5;
wire outmux6;
wire outmux7;
wire outmux8;
wire [7:0] qdff;
wire [7:0] qnot;
DFF dff1(
   .D(outmux1),
	.clk(clk),
	.e(e),
	.rst(rst),
	.Q(qdff[0]),
	.QNOT(qnot[0])
);
DFF dff2(
   .D(outmux2),
	.clk(clk),
	.e(e),
	.rst(rst),
	.Q(qdff[1]),
	.QNOT(qnot[1])
);
DFF dff3(
   .D(outmux3),
	.clk(clk),
	.e(e),
	.rst(rst),
	.Q(qdff[2]),
	.QNOT(qnot[2])
);
DFF dff4(
   .D(outmux4),
	.clk(clk),
	.e(e),
	.rst(rst),
	.Q(qdff[3]),
	.QNOT(qnot[3])
);
DFF dff5(
   .D(outmux5),
	.clk(clk),
	.e(e),
	.rst(rst),
	.Q(qdff[4]),
	.QNOT(qnot[4])
);
DFF dff6(
   .D(outmux6),
	.clk(clk),
	.e(e),
	.rst(rst),
	.Q(qdff[5]),
	.QNOT(qnot[5])
);
DFF dff7(
   .D(outmux7),
	.clk(clk),
	.e(e),
	.rst(rst),
	.Q(qdff[6]),
	.QNOT(qnot[6])
);
DFF dff8(
   .D(outmux8),
	.clk(clk),
	.e(e),
	.rst(rst),
	.Q(qdff[7]),
	.QNOT(qnot[7])
);

Mux Multipelexer1(
   .data(dmux1),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(outmux1)
);
Mux Multipelexer2(
   .data(dmux2),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(outmux2)
);
Mux Multipelexer3(
   .data(dmux3),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(outmux3)
);
Mux Multipelexer4(
   .data(dmux4),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(outmux4)
);
Mux Multipelexer5(
   .data(dmux5),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(outmux5)
);
Mux Multipelexer6(
   .data(dmux6),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(outmux6)
);
Mux Multipelexer7(
   .data(dmux7),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(outmux7)
);
Mux Multipelexer8(
   .data(dmux8),
	.select(select),
	.rst(rst),
	.clk(clk),
	.out(outmux8)
);
always @(negedge clk) begin
   if(rst) begin
	  dmux1=0;
	  dmux2=0;
	  dmux3=0;
	  dmux4=0;
	  dmux5=0;
	  dmux6=0;
	  dmux7=0;
	  dmux8=0;
	end
	else begin
      case (select)
		  2'b01: begin
				 dmux1[1] = data[7];
				 dmux2[1] = data[0];
				 dmux3[1] = data[1];
				 dmux4[1] = data[2];
				 dmux5[1] = data[3];
				 dmux6[1] = data[4];
				 dmux7[1] = data[5];
				 dmux8[1] = data[6];
		  end
		  2'b10: begin
		       dmux1[2] = data[1];
				 dmux2[2] = data[2];
				 dmux3[2] = data[3];
				 dmux4[2] = data[4];
				 dmux5[2] = data[5];
				 dmux6[2] = data[6];
				 dmux7[2] = data[7];
				 dmux8[2] = data[0];
		  end
		  2'b11: begin
		       dmux1[3] = data[0];
				 dmux2[3] = data[1];
				 dmux3[3] = data[2];
				 dmux4[3] = data[3];
				 dmux5[3] = data[4];
				 dmux6[3] = data[5];
				 dmux7[3] = data[6];
				 dmux8[3] = data[7];
		  end
		endcase
	end
end
assign out=qdff;
endmodule
