module comp32bs(
	gts,
	eq,
	gtu,
	a,
	b
);
//input
input wire [31:0] a;
input wire [31:0] b;
//output wire
output wire gts;
output wire gtu;
output wire eq;
//first level intermediates
wire [2:0] gtcomp;
wire [2:0] eqcomp;
//second level intermediates (where n is odd num)
//eq =  (a == b)[n] & (a == b)[n-1]
//gt = (a > b)[n] & (above)
wire andeqgt2; // (a > b)[n-1] & (a == b)[n]
wire eq2; // (a > b)[n-1] & (a == b)[n]
wire gt2; // (a > b)[n-1] & (a == b)[n]
//third level intermediates
wire andeqgt3; // (a > b)[n-1] & (a == b)[n]
wire eq3;
wire notgt2;
wire a30gteb30; //a[30:0] >= b[30:0]
wire gtcond1;
wire gtcond2;




//first level
comp16b comp0(.a(a[15:0]),.b(b[15:0]),.gt(gtcomp[0]),.eq(eqcomp[0]));
comp16b comp1(.a(a[30:15]),.b(b[30:15]),.gt(gtcomp[1]),.eq(eqcomp[1]));

comp1b comp2(.a(a[31]),.b(b[31]),.gt(gtcomp[2]),.eq(eqcomp[2]));


// second level
and(eq2,eqcomp[1],eqcomp[0]);
and(andeqgt2,eqcomp[1],gtcomp[0]);
or(gt2,gtcomp[1],andeqgt2);
// third level
and(eq,eq2,eqcomp[2]);
or(a30gteb30,gtcomp[2],eqcomp[2]); //a[30:0] >= b[30:0]
not(gtcond1,a30gteb30); //if a31 < b31 (not gte) then a > b signed
and(gtcond2,gt2,eq2); // if a[30:0] > b[30:0] and a[31] == b[31] then a > b signed
or(gts,gtcond1,gtcond2);

and(andeqgt3,eqcomp[2],gt2);
or(gtu,gtcomp[2],andeqgt3);





endmodule
