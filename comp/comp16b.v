module comp16b(
	gt,
	lt,
	eq,
	a,
	b
);
//input
input wire [15:0] a;
input wire [15:0] b;
//output wire
output wire gt;
output wire lt;
output wire eq;
//first level intermediates
wire [3:0] gtcomp;
wire [3:0] eqcomp;
//second level intermediates (where n is odd num)
wire [1:0] eqcomp2; // (a == b)[n] & (a == b)[n-1]
wire [1:0] andeqgt2; // (a > b)[n-1] & (a == b)[n]
wire [1:0] gtcomp2; // (a > b)[n] & (above)
//third level intermediates (where n is odd num)
wire andeqgt3; // (a > b)[n-1] & (a == b)[n]

//first level
comp4b comp0(.a(a[3:0]),.b(b[3:0]),.gt(gtcomp[0]),.eq(eqcomp[0]));
comp4b comp1(.a(a[7:4]),.b(b[7:4]),.gt(gtcomp[1]),.eq(eqcomp[1]));
comp4b comp2(.a(a[11:8]),.b(b[15:12]),.gt(gtcomp[2]),.eq(eqcomp[2]));
comp4b comp3(.a(a[15:12]),.b(b[15:12]),.gt(gtcomp[3]),.eq(eqcomp[3]));

//second level
and(eqcomp2[1],eqcomp[3],eqcomp[2]);
and(andeqgt2[1],eqcomp[3],gtcomp[2]);
or(gtcomp2[1],gtcomp[3],andeqgt2[1]);

and(eqcomp2[0],eqcomp[1],eqcomp[0]);
and(andeqgt2[0],eqcomp[1],gtcomp[0]);
or(gtcomp2[0],gtcomp[1],andeqgt2[0]);

//third level
and(eq,eqcomp2[1],eqcomp2[0]);
and(andeqgt3,eqcomp2[1],gtcomp2[0]);
or(gt,gtcomp2[1],andeqgt3);

not(lt,gt);


endmodule
