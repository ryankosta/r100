//Immediate select
//immsel.v
//Author: Ryan Kosta
module isignex(
instrn31_20,
itype
);
//input
input wire [11:0] instrn31_20;
//output
output wire [31:0] itype;
//intermediate wire

signex12 isignex(
	.in(instrn31_20),
	.out(itype)
);

endmodule
