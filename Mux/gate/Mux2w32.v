`include "Mux.v"
module Mux4way32(
	out,
	in1,
	in2,
	sel
);
//output
output [31:0] out;
//input
input [31:0] in1;
input [31:0] in2;
input sel; 
Mux mux0(out[0],in1[0],in2[0],sel);
Mux mux1(out[1],in1[1],in2[1],sel);
Mux mux2(out[2],in1[2],in2[2],sel);
Mux mux3(out[3],in1[3],in2[3],sel);
Mux mux4(out[4],in1[4],in2[4],sel);
Mux mux5(out[5],in1[5],in2[5],sel);
Mux mux6(out[6],in1[6],in2[6],sel);
Mux mux7(out[7],in1[7],in2[7],sel);
Mux mux8(out[8],in1[8],in2[8],sel);
Mux mux9(out[9],in1[9],in2[9],sel);
Mux mux10(out[10],in1[10],in2[10],sel);
Mux mux11(out[11],in1[11],in2[11],sel);
Mux mux12(out[12],in1[12],in2[12],sel);
Mux mux13(out[13],in1[13],in2[13],sel);
Mux mux14(out[14],in1[14],in2[14],sel);
Mux mux15(out[15],in1[15],in2[15],sel);
Mux mux16(out[16],in1[16],in2[16],sel);
Mux mux17(out[17],in1[17],in2[17],sel);
Mux mux18(out[18],in1[18],in2[18],sel);
Mux mux19(out[19],in1[19],in2[19],sel);
Mux mux20(out[20],in1[20],in2[20],sel);
Mux mux21(out[21],in1[21],in2[21],sel);
Mux mux22(out[22],in1[22],in2[22],sel);
Mux mux23(out[23],in1[23],in2[23],sel);
Mux mux24(out[24],in1[24],in2[24],sel);
Mux mux25(out[25],in1[25],in2[25],sel);
Mux mux26(out[26],in1[26],in2[26],sel);
Mux mux27(out[27],in1[27],in2[27],sel);
Mux mux28(out[28],in1[28],in2[28],sel);
Mux mux29(out[29],in1[29],in2[29],sel);
Mux mux30(out[30],in1[30],in2[30],sel);
Mux mux31(out[31],in1[31],in2[31],sel);
endmodule
