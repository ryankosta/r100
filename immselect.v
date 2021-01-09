//Immediate select
//immsel.v
//Author: Ryan Kosta
module immselect(
instrn,
immsel, //0 = i type, 1 = s type
out,
);
//input
input wire [31:0] instrn;
input wire immsel;
//output
output wire [31:0] out;
//intermediate wire
wire [31:0] itype;
wire [31:0] btype;
wire [31:0] stype;

wire [11:0] stypeshrt; //s-type pre signex

signex12 isignex(
	.in(instrn[31:20]),
	.out(itype)
);
signex12 ssignex(
	.in(stypeshrt),
	.out(stype)
);

buf(stypeshrt[0],instrn[7]);
buf(stypeshrt[1],instrn[8]);
buf(stypeshrt[2],instrn[9]);
buf(stypeshrt[3],instrn[10]);
buf(stypeshrt[4],instrn[11]);

buf(stypeshrt[5],instrn[25]);
buf(stypeshrt[6],instrn[26]);
buf(stypeshrt[7],instrn[27]);
buf(stypeshrt[8],instrn[28]);
buf(stypeshrt[9],instrn[29]);
buf(stypeshrt[10],instrn[30]);
buf(stypeshrt[11],instrn[31]);


mux2w32 mux(
	.a(itype),
	.b(btype),
	.sel(immsel)
);


//Intermediate
endmodule
