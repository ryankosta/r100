`include "Mux4w.v"
module Mux4way32(
	out,
	in1,
	in2,
	in3,
	in4,
	sel
);
//output
output [31:0] out;
//input
input [31:0] in1;
input [31:0] in2;
input [31:0] in3;
input [31:0] in4;
input [1:0] sel; 
Mux4w mux0(out[0],in1[0],in2[0],in3[0],in4[0],sel);
Mux4w mux1(out[1],in1[1],in2[1],in3[1],in4[1],sel);
Mux4w mux2(out[2],in1[2],in2[2],in3[2],in4[2],sel);
Mux4w mux3(out[3],in1[3],in2[3],in3[3],in4[3],sel);
Mux4w mux4(out[4],in1[4],in2[4],in3[4],in4[4],sel);
Mux4w mux5(out[5],in1[5],in2[5],in3[5],in4[5],sel);
Mux4w mux6(out[6],in1[6],in2[6],in3[6],in4[6],sel);
Mux4w mux7(out[7],in1[7],in2[7],in3[7],in4[7],sel);
Mux4w mux8(out[8],in1[8],in2[8],in3[8],in4[8],sel);
Mux4w mux9(out[9],in1[9],in2[9],in3[9],in4[9],sel);
Mux4w mux10(out[10],in1[10],in2[10],in3[10],in4[10],sel);
Mux4w mux11(out[11],in1[11],in2[11],in3[11],in4[11],sel);
Mux4w mux12(out[12],in1[12],in2[12],in3[12],in4[12],sel);
Mux4w mux13(out[13],in1[13],in2[13],in3[13],in4[13],sel);
Mux4w mux14(out[14],in1[14],in2[14],in3[14],in4[14],sel);
Mux4w mux15(out[15],in1[15],in2[15],in3[15],in4[15],sel);
Mux4w mux16(out[16],in1[16],in2[16],in3[16],in4[16],sel);
Mux4w mux17(out[17],in1[17],in2[17],in3[17],in4[17],sel);
Mux4w mux18(out[18],in1[18],in2[18],in3[18],in4[18],sel);
Mux4w mux19(out[19],in1[19],in2[19],in3[19],in4[19],sel);
Mux4w mux20(out[20],in1[20],in2[20],in3[20],in4[20],sel);
Mux4w mux21(out[21],in1[21],in2[21],in3[21],in4[21],sel);
Mux4w mux22(out[22],in1[22],in2[22],in3[22],in4[22],sel);
Mux4w mux23(out[23],in1[23],in2[23],in3[23],in4[23],sel);
Mux4w mux24(out[24],in1[24],in2[24],in3[24],in4[24],sel);
Mux4w mux25(out[25],in1[25],in2[25],in3[25],in4[25],sel);
Mux4w mux26(out[26],in1[26],in2[26],in3[26],in4[26],sel);
Mux4w mux27(out[27],in1[27],in2[27],in3[27],in4[27],sel);
Mux4w mux28(out[28],in1[28],in2[28],in3[28],in4[28],sel);
Mux4w mux29(out[29],in1[29],in2[29],in3[29],in4[29],sel);
Mux4w mux30(out[30],in1[30],in2[30],in3[30],in4[30],sel);
Mux4w mux31(out[31],in1[31],in2[31],in3[31],in4[31],sel);
endmodule
