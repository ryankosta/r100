//Branch Target Generation
//branchtarggen.v
//Author: Ryan Kosta
module branchtarggen(
instrn11_7,
instrn31_25,
pc,
br
);
//input
input wire [4:0] instrn11_7;
input wire [6:0] instrn31_25;
input wire [31:0] pc; 
//output
output wire [31:0] br;
//intermediate wire
wire [31:0] btype;

wire [12:0] btypeshrt; //b-type pre signex

signex13 signex(
	.in(btypeshrt),
	.out(btype)
);
adder32 adder32(
	.result(br),
	.a(btype),
	.b(pc),
	.cin(1'b0)
);

//btypeshrt[0] = 0 always
buf(btypeshrt[0],0);

//btypeshrt[4:1] = instrn[11:8] 
buf(btypeshrt[1],instrn11_7[1]);
buf(btypeshrt[2],instrn11_7[2]);
buf(btypeshrt[3],instrn11_7[3]);
buf(btypeshrt[4],instrn11_7[4]);

//btypeshrt[10:5] = instrn [30:25]
buf(btypeshrt[5],instrn31_25[0]);
buf(btypeshrt[6],instrn31_25[1]);
buf(btypeshrt[7],instrn31_25[2]);
buf(btypeshrt[8],instrn31_25[3]);
buf(btypeshrt[9],instrn31_25[4]);
buf(btypeshrt[10],instrn31_25[5]);

//btypeshrt[11] = instrn [7]
//btypeshrt[12] = instrn [31]
buf(btypeshrt[11],instrn11_7[0]);
buf(btypeshrt[12],instrn31_25[6]);




endmodule
