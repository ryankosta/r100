module Mux(
out,
a,
b,
sel
);
//Inputs
input a;
input b;
input sel;
//outputs
output out;
//wires
wire a;
wire b;
wire sel;
wire out;

//intermediate
wire notb;
not(notb, b);
and(out, sel, notb);
and(out, sel, a); 
endmodule

