//utype immediate handling
//utypeimm.v
//Author: Ryan Kosta
module utypeimm(
instrn31_12,
imm
);
input wire [19:0] instrn31_12;
output wire [31:0] imm;
buf(imm[0],1'b0);
buf(imm[1],1'b0);
buf(imm[2],1'b0);
buf(imm[3],1'b0);
buf(imm[4],1'b0);
buf(imm[5],1'b0);
buf(imm[6],1'b0);
buf(imm[7],1'b0);
buf(imm[8],1'b0);
buf(imm[9],1'b0);
buf(imm[10],1'b0);
buf(imm[11],1'b0);
buf(imm[12],instrn31_12[0]);
buf(imm[13],instrn31_12[1]);
buf(imm[14],instrn31_12[2]);
buf(imm[15],instrn31_12[3]);
buf(imm[16],instrn31_12[4]);
buf(imm[17],instrn31_12[5]);
buf(imm[18],instrn31_12[6]);
buf(imm[19],instrn31_12[7]);
buf(imm[20],instrn31_12[8]);
buf(imm[21],instrn31_12[9]);
buf(imm[22],instrn31_12[10]);
buf(imm[23],instrn31_12[11]);
buf(imm[24],instrn31_12[12]);
buf(imm[25],instrn31_12[13]);
buf(imm[26],instrn31_12[14]);
buf(imm[27],instrn31_12[15]);
buf(imm[28],instrn31_12[16]);
buf(imm[29],instrn31_12[17]);
buf(imm[30],instrn31_12[18]);
buf(imm[31],instrn31_12[19]);
endmodule
