module adder32(
result,
cout,
cin,
a,
b,
oflow
);
//inputs
input cin;
input [31:0] a;
input [31:0] b;
//outputs
output [31:0] result;
output cout;
output oflow;
//wires
wire cin;
wire cout;
wire [31:0] a;
wire [31:0] b;
wire [31:0] result;

//intermediate
wire [30:0] cbit;
wire nota31;
wire notb31;
wire notr31;
wire signmm1; //sign mismatch 1
wire signmm2; //sign mismatch 2
//adder(out,cout,cin,a,b)
adder add0(result[0],cbit[0],cin,a[0],b[0]);
adder add1(result[1],cbit[1],cbit[0],a[1],b[1]);
adder add2(result[2],cbit[2],cbit[1],a[2],b[2]);
adder add3(result[3],cbit[3],cbit[2],a[3],b[3]);
adder add4(result[4],cbit[4],cbit[3],a[4],b[4]);
adder add5(result[5],cbit[5],cbit[4],a[5],b[5]);
adder add6(result[6],cbit[6],cbit[5],a[6],b[6]);
adder add7(result[7],cbit[7],cbit[6],a[7],b[7]);
adder add8(result[8],cbit[8],cbit[7],a[8],b[8]);
adder add9(result[9],cbit[9],cbit[8],a[9],b[9]);
adder add10(result[10],cbit[10],cbit[9],a[10],b[10]);
adder add11(result[11],cbit[11],cbit[10],a[11],b[11]);
adder add12(result[12],cbit[12],cbit[11],a[12],b[12]);
adder add13(result[13],cbit[13],cbit[12],a[13],b[13]);
adder add14(result[14],cbit[14],cbit[13],a[14],b[14]);
adder add15(result[15],cbit[15],cbit[14],a[15],b[15]);
adder add16(result[16],cbit[16],cbit[15],a[16],b[16]);
adder add17(result[17],cbit[17],cbit[16],a[17],b[17]);
adder add18(result[18],cbit[18],cbit[17],a[18],b[18]);
adder add19(result[19],cbit[19],cbit[18],a[19],b[19]);
adder add20(result[20],cbit[20],cbit[19],a[20],b[20]);
adder add21(result[21],cbit[21],cbit[20],a[21],b[21]);
adder add22(result[22],cbit[22],cbit[21],a[22],b[22]);
adder add23(result[23],cbit[23],cbit[22],a[23],b[23]);
adder add24(result[24],cbit[24],cbit[23],a[24],b[24]);
adder add25(result[25],cbit[25],cbit[24],a[25],b[25]);
adder add26(result[26],cbit[26],cbit[25],a[26],b[26]);
adder add27(result[27],cbit[27],cbit[26],a[27],b[27]);
adder add28(result[28],cbit[28],cbit[27],a[28],b[28]);
adder add29(result[29],cbit[29],cbit[28],a[29],b[29]);
adder add30(result[30],cbit[30],cbit[29],a[30],b[30]);
adder add31(result[31],cout,cbit[30],a[31],b[31]);

not(nota31,a[31]);
not(notb31,b[31]);
not(notr31,result[31]);
and(signmm1, a[31], b[31], notr31); //31st a, b = 1 r = 0
and(signmm2, nota31, notb31, result[31]); //31st a, b = 0 r = 1
or(oflow,signmm1,signmm2); //overflow if sign mismatch

endmodule


