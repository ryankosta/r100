module signex13(
in,
out
);
input [12:0] in;
output [31:0] out;
//copy
buf(out[0],in[0]);
buf(out[1],in[1]);
buf(out[2],in[2]);
buf(out[3],in[3]);
buf(out[4],in[4]);
buf(out[5],in[5]);
buf(out[6],in[6]);
buf(out[7],in[7]);
buf(out[8],in[8]);
buf(out[9],in[9]);
buf(out[10],in[10]);
buf(out[11],in[11]);

//sign extend
buf(out[12],in[12]);
buf(out[13],in[12]);
buf(out[14],in[12]);
buf(out[15],in[12]);
buf(out[16],in[12]);
buf(out[17],in[12]);
buf(out[18],in[12]);
buf(out[19],in[12]);
buf(out[20],in[12]);
buf(out[21],in[12]);
buf(out[22],in[12]);
buf(out[23],in[12]);
buf(out[24],in[12]);
buf(out[25],in[12]);
buf(out[26],in[12]);
buf(out[27],in[12]);
buf(out[28],in[12]);
buf(out[29],in[12]);
buf(out[30],in[12]);
buf(out[31],in[12]);
endmodule
