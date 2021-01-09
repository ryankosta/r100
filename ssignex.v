//s type sign extension
//ssignex.v
//Author: Ryan Kosta
module ssignex(
instrn11_7,
instrn31_25,
stypeimm
);
//input
input wire [4:0] instrn11_7;
input wire [6:0] instrn31_25;
//output
output wire [31:0] stypeimm;
//intermediate wire
wire [11:0] stypeshrt; //b-type pre signex

signex12 signex(
	.in(stypeshrt),
	.out(stypeimm)
);

buf(stypeshrt[0],instrn11_7[0]);
buf(stypeshrt[1],instrn11_7[1]);
buf(stypeshrt[2],instrn11_7[2]);
buf(stypeshrt[3],instrn11_7[3]);
buf(stypeshrt[4],instrn11_7[4]);

buf(stypeshrt[5],instrn31_25[0]);
buf(stypeshrt[6],instrn31_25[1]);
buf(stypeshrt[7],instrn31_25[2]);
buf(stypeshrt[8],instrn31_25[3]);
buf(stypeshrt[9],instrn31_25[4]);
buf(stypeshrt[10],instrn31_25[5]);
buf(stypeshrt[11],instrn31_25[6]);

endmodule
