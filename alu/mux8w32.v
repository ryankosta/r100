module mux8w32(
out,
a, //000
b, //001
c, //010
d, //011
e, //100
f, //101
g, //110
h, //111
sel);

//input
input wire [31:0] a;
input wire [31:0] b;
input wire [31:0] c;
input wire [31:0] d;

input wire [31:0] e;
input wire [31:0] f;
input wire [31:0] g;
input wire [31:0] h;

input wire [2:0] sel;
//output
output wire [31:0] out;
//intermediate
wire [31:0] a2;
wire [31:0] b2;

mux4w32 mux0_0(a2,a,b,c,d,sel[1:0]);
mux4w32 mux0_1(b2,e,f,g,h,sel[1:0]);
mux2w32 mux1_0(out,a2,b2,sel[2]);
endmodule

