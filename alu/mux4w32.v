module mux4w32(
out,
a,
b,
c,
d,
sel);

//input
input wire [31:0] a;
input wire [31:0] b;
input wire [31:0] c;
input wire [31:0] d;
input wire [1:0] sel;
//output
output wire [31:0] out;
//intermediate
wire [31:0] a2;
wire [31:0] b2;

mux2w32 mux0_0(a2,a,b,sel[0]);
mux2w32 mux0_1(b2,c,d,sel[0]);
mux2w32 mux1_0(out,a2,b2,sel[1]);
endmodule

