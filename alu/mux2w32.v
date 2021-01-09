module mux2w32(
out,
a,
b,
sel);

//input
input wire [31:0] a;
input wire [31:0] b;
input wire sel;
//output
output wire [31:0] out;
//intermediate
wire notsel;
wire [31:0] asel;
wire [31:0] bsel;
not(notsel,sel);
and(asel[0],a[0],notsel);
and(asel[1],a[1],notsel);
and(asel[2],a[2],notsel);
and(asel[3],a[3],notsel);
and(asel[4],a[4],notsel);
and(asel[5],a[5],notsel);
and(asel[6],a[6],notsel);
and(asel[7],a[7],notsel);
and(asel[8],a[8],notsel);
and(asel[9],a[9],notsel);
and(asel[10],a[10],notsel);
and(asel[11],a[11],notsel);
and(asel[12],a[12],notsel);
and(asel[13],a[13],notsel);
and(asel[14],a[14],notsel);
and(asel[15],a[15],notsel);
and(asel[16],a[16],notsel);
and(asel[17],a[17],notsel);
and(asel[18],a[18],notsel);
and(asel[19],a[19],notsel);
and(asel[20],a[20],notsel);
and(asel[21],a[21],notsel);
and(asel[22],a[22],notsel);
and(asel[23],a[23],notsel);
and(asel[24],a[24],notsel);
and(asel[25],a[25],notsel);
and(asel[26],a[26],notsel);
and(asel[27],a[27],notsel);
and(asel[28],a[28],notsel);
and(asel[29],a[29],notsel);
and(asel[30],a[30],notsel);
and(asel[31],a[31],notsel);

and(bsel[0],b[0],sel);
and(bsel[1],b[1],sel);
and(bsel[2],b[2],sel);
and(bsel[3],b[3],sel);
and(bsel[4],b[4],sel);
and(bsel[5],b[5],sel);
and(bsel[6],b[6],sel);
and(bsel[7],b[7],sel);
and(bsel[8],b[8],sel);
and(bsel[9],b[9],sel);
and(bsel[10],b[10],sel);
and(bsel[11],b[11],sel);
and(bsel[12],b[12],sel);
and(bsel[13],b[13],sel);
and(bsel[14],b[14],sel);
and(bsel[15],b[15],sel);
and(bsel[16],b[16],sel);
and(bsel[17],b[17],sel);
and(bsel[18],b[18],sel);
and(bsel[19],b[19],sel);
and(bsel[20],b[20],sel);
and(bsel[21],b[21],sel);
and(bsel[22],b[22],sel);
and(bsel[23],b[23],sel);
and(bsel[24],b[24],sel);
and(bsel[25],b[25],sel);
and(bsel[26],b[26],sel);
and(bsel[27],b[27],sel);
and(bsel[28],b[28],sel);
and(bsel[29],b[29],sel);
and(bsel[30],b[30],sel);
and(bsel[31],b[31],sel);

or(out[0],asel[0],bsel[0]);
or(out[1],asel[1],bsel[1]);
or(out[2],asel[2],bsel[2]);
or(out[3],asel[3],bsel[3]);
or(out[4],asel[4],bsel[4]);
or(out[5],asel[5],bsel[5]);
or(out[6],asel[6],bsel[6]);
or(out[7],asel[7],bsel[7]);
or(out[8],asel[8],bsel[8]);
or(out[9],asel[9],bsel[9]);
or(out[10],asel[10],bsel[10]);
or(out[11],asel[11],bsel[11]);
or(out[12],asel[12],bsel[12]);
or(out[13],asel[13],bsel[13]);
or(out[14],asel[14],bsel[14]);
or(out[15],asel[15],bsel[15]);
or(out[16],asel[16],bsel[16]);
or(out[17],asel[17],bsel[17]);
or(out[18],asel[18],bsel[18]);
or(out[19],asel[19],bsel[19]);
or(out[20],asel[20],bsel[20]);
or(out[21],asel[21],bsel[21]);
or(out[22],asel[22],bsel[22]);
or(out[23],asel[23],bsel[23]);
or(out[24],asel[24],bsel[24]);
or(out[25],asel[25],bsel[25]);
or(out[26],asel[26],bsel[26]);
or(out[27],asel[27],bsel[27]);
or(out[28],asel[28],bsel[28]);
or(out[29],asel[29],bsel[29]);
or(out[30],asel[30],bsel[30]);
or(out[31],asel[31],bsel[31]);
endmodule
