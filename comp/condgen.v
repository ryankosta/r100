//branch conditional generator
module condgen(
	a,
	b,
	eq,
	ne,
	lt,
	ge,
	ltu,
	geu,
);
//input
input wire [31:0] a;
input wire [31:0] b;
//output
output wire eq;
output wire ne;
output wire lt;
output wire ge;
output wire ltu;
output wire geu;
//intermediate
wire gtu;
wire gts;

comp32bs comp(
.gts(gts),
.eq(eq),
.gtu(gtu),
.a(a),
.b(b)
);
not(ne,eq);
or(ge,eq,gts);
or(geu,eq,gtu);
not(lt,ge);
not(ltu,geu);

endmodule
