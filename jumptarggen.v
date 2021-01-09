`include "cpu.vh"
module jumptarggen(
jumptarg,
rs1,
pc,
instrn
);
//input
input wire [31:0] pc;
input wire [31:0] rs1;
input wire [31:0] instrn; 
//output
output wire [31:0] jumptarg;
//muxed intermediates
wire [31:0] jalrimm;
wire [31:0] jalimm;
//added intermediates
wire [31:0] immediate;
wire [31:0] addtoimm;

//jal imm [0] = 0 always
buf(jalimm[0],0);
//jal imm [10:1] = instrn [21:30] 
buf(jalimm[1],instrn[21]);
buf(jalimm[2],instrn[22]);
buf(jalimm[3],instrn[23]);
buf(jalimm[4],instrn[24]);
buf(jalimm[5],instrn[25]);
buf(jalimm[6],instrn[26]);
buf(jalimm[7],instrn[27]);
buf(jalimm[8],instrn[28]);
buf(jalimm[9],instrn[29]);
buf(jalimm[10],instrn[30]);

//jal imm [11] = instrn [20] 
buf(jalimm[11],instrn[20]);

//jal imm [19:12] = instrn [19:12] 
buf(jalimm[12],instrn[12]);
buf(jalimm[13],instrn[13]);
buf(jalimm[14],instrn[14]);
buf(jalimm[15],instrn[15]);
buf(jalimm[16],instrn[16]);
buf(jalimm[17],instrn[17]);
buf(jalimm[18],instrn[18]);
buf(jalimm[19],instrn[19]);

//jal imm [20] = instrn [31] 
buf(jalimm[20],instrn[31]);

//sign extend
buf(jalimm[21],instrn[31]);
buf(jalimm[22],instrn[31]);
buf(jalimm[23],instrn[31]);
buf(jalimm[24],instrn[31]);
buf(jalimm[25],instrn[31]);
buf(jalimm[26],instrn[31]);
buf(jalimm[27],instrn[31]);
buf(jalimm[28],instrn[31]);
buf(jalimm[29],instrn[31]);
buf(jalimm[30],instrn[31]);
buf(jalimm[31],instrn[31]);

mux2w32 mux_rs1_pc(
	.a(rs1),
	.b(pc),
	.out(addtoimm),
	.sel(instrn[3])
);
mux2w32 mux_imms(
	.a(jalrimm),
	.b(jalimm),
	.out(immediate),
	.sel(instrn[3])
);
signex12 jalrex(
	.in(instrn[31:20]),
	.out(jalrimm)
);
adder32 adder(
	.result(jumptarg),
	.cin(1'b0),
	.a(addtoimm),
	.b(immediate)
);
endmodule
