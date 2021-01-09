`include "comp16b.v"
module comp32b(
	gt,
	lt,
	eq,
	a,
	b
);
//input
input wire [31:0] a;
input wire [31:0] b;
//output wire
output wire gt;
output wire lt;
output wire eq;
//first level intermediates
wire [1:0] gtcomp;
wire [1:0] eqcomp;
//second level intermediates (where n is odd num)
//eq =  (a == b)[n] & (a == b)[n-1]
//gt = (a > b)[n] & (above)
wire andeqgt; // (a > b)[n-1] & (a == b)[n]

//first level
comp16b comp0(.a(a[15:0]),.b(b[15:0]),.gt(gtcomp[0]),.eq(eqcomp[0]));
comp16b comp1(.a(a[31:16]),.b(b[31:16]),.gt(gtcomp[1]),.eq(eqcomp[1]));


// second level
and(eq,eqcomp[1],eqcomp[0]);
and(andeqgt,eqcomp[1],gtcomp[0]);
or(gt,gtcomp[1],andeqgt);

not(lt,gt);


endmodule
