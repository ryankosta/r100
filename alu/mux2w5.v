module mux2w5(
out,
a,
b,
sel);

//input
input wire [4:0] a;
input wire [4:0] b;
input wire sel;
//output
output wire [4:0] out;
//intermediate
wire notsel;
wire [4:0] asel;
wire [4:0] bsel;
not(notsel,sel);
and(asel[0],a[0],notsel);
and(asel[1],a[1],notsel);
and(asel[2],a[2],notsel);
and(asel[3],a[3],notsel);
and(asel[4],a[4],notsel);

and(bsel[0],b[0],sel);
and(bsel[1],b[1],sel);
and(bsel[2],b[2],sel);
and(bsel[3],b[3],sel);
and(bsel[4],b[4],sel);

or(out[0],asel[0],bsel[0]);
or(out[1],asel[1],bsel[1]);
or(out[2],asel[2],bsel[2]);
or(out[3],asel[3],bsel[3]);
or(out[4],asel[4],bsel[4]);

endmodule
