`include "Mux.v"
module Mux4w(
out,
in1,
in2,
in3,
in4,
sel
);
//output
output out;
//input
input [1:0] sel;
input in1;
input in2;
input in3;
input in4;
//wires
wire in1;
wire in2;
wire in3;
wire in4;
wire [1:0] sel;
wire out;
//intermediate
wire mux1v;
wire mux2v;
wire notsel0;
Mux mux1(
.out(mux1v),
.a(in1),
.b(in2),
.sel(sel[1])
);
Mux mux2(
.out(mux2v),
.a(in3),
.b(in4),
.sel(sel[1])
);
not(notsel0,sel[0]);
and(out,sel[0],mux1v);
and(out,notsel0,mux2v);
endmodule




