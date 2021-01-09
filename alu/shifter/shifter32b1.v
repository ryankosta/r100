module shifter32b1(
out,
in,
shiftdir, //0 shift right 1 shift left 
shift, //0 outputs input 1 shifts 
shifta
);
//input
input [31:0] in;
input shift;
input shiftdir;
input shifta;
//output
output [31:0] out;
//intermediate
wire notshiftdir;
wire notshift;
wire outleft [31:0];
wire outright [31:0];
wire outnoshift [31:0];
wire msb;
not(notshiftdir,shiftdir);
not(notshift,shift);
and(msb,notshiftdir,shifta,shift,in[31]);


and(outnoshift[0],in[0],notshift);
and(outnoshift[1],in[1],notshift);
and(outnoshift[2],in[2],notshift);
and(outnoshift[3],in[3],notshift);
and(outnoshift[4],in[4],notshift);
and(outnoshift[5],in[5],notshift);
and(outnoshift[6],in[6],notshift);
and(outnoshift[7],in[7],notshift);
and(outnoshift[8],in[8],notshift);
and(outnoshift[9],in[9],notshift);
and(outnoshift[10],in[10],notshift);
and(outnoshift[11],in[11],notshift);
and(outnoshift[12],in[12],notshift);
and(outnoshift[13],in[13],notshift);
and(outnoshift[14],in[14],notshift);
and(outnoshift[15],in[15],notshift);
and(outnoshift[16],in[16],notshift);
and(outnoshift[17],in[17],notshift);
and(outnoshift[18],in[18],notshift);
and(outnoshift[19],in[19],notshift);
and(outnoshift[20],in[20],notshift);
and(outnoshift[21],in[21],notshift);
and(outnoshift[22],in[22],notshift);
and(outnoshift[23],in[23],notshift);
and(outnoshift[24],in[24],notshift);
and(outnoshift[25],in[25],notshift);
and(outnoshift[26],in[26],notshift);
and(outnoshift[27],in[27],notshift);
and(outnoshift[28],in[28],notshift);
and(outnoshift[29],in[29],notshift);
and(outnoshift[30],in[30],notshift);
and(outnoshift[31],in[31],notshift);


buf(outleft[0],0);
and(outleft[1],in[0],shiftdir,shift);
and(outleft[2],in[1],shiftdir,shift);
and(outleft[3],in[2],shiftdir,shift);
and(outleft[4],in[3],shiftdir,shift);
and(outleft[5],in[4],shiftdir,shift);
and(outleft[6],in[5],shiftdir,shift);
and(outleft[7],in[6],shiftdir,shift);
and(outleft[8],in[7],shiftdir,shift);
and(outleft[9],in[8],shiftdir,shift);
and(outleft[10],in[9],shiftdir,shift);
and(outleft[11],in[10],shiftdir,shift);
and(outleft[12],in[11],shiftdir,shift);
and(outleft[13],in[12],shiftdir,shift);
and(outleft[14],in[13],shiftdir,shift);
and(outleft[15],in[14],shiftdir,shift);
and(outleft[16],in[15],shiftdir,shift);
and(outleft[17],in[16],shiftdir,shift);
and(outleft[18],in[17],shiftdir,shift);
and(outleft[19],in[18],shiftdir,shift);
and(outleft[20],in[19],shiftdir,shift);
and(outleft[21],in[20],shiftdir,shift);
and(outleft[22],in[21],shiftdir,shift);
and(outleft[23],in[22],shiftdir,shift);
and(outleft[24],in[23],shiftdir,shift);
and(outleft[25],in[24],shiftdir,shift);
and(outleft[26],in[25],shiftdir,shift);
and(outleft[27],in[26],shiftdir,shift);
and(outleft[28],in[27],shiftdir,shift);
and(outleft[29],in[28],shiftdir,shift);
and(outleft[30],in[29],shiftdir,shift);
and(outleft[31],in[30],shiftdir,shift);

and(outright[0],in[1],notshiftdir,shift);
and(outright[1],in[2],notshiftdir,shift);
and(outright[2],in[3],notshiftdir,shift);
and(outright[3],in[4],notshiftdir,shift);
and(outright[4],in[5],notshiftdir,shift);
and(outright[5],in[6],notshiftdir,shift);
and(outright[6],in[7],notshiftdir,shift);
and(outright[7],in[8],notshiftdir,shift);
and(outright[8],in[9],notshiftdir,shift);
and(outright[9],in[10],notshiftdir,shift);
and(outright[10],in[11],notshiftdir,shift);
and(outright[11],in[12],notshiftdir,shift);
and(outright[12],in[13],notshiftdir,shift);
and(outright[13],in[14],notshiftdir,shift);
and(outright[14],in[15],notshiftdir,shift);
and(outright[15],in[16],notshiftdir,shift);
and(outright[16],in[17],notshiftdir,shift);
and(outright[17],in[18],notshiftdir,shift);
and(outright[18],in[19],notshiftdir,shift);
and(outright[19],in[20],notshiftdir,shift);
and(outright[20],in[21],notshiftdir,shift);
and(outright[21],in[22],notshiftdir,shift);
and(outright[22],in[23],notshiftdir,shift);
and(outright[23],in[24],notshiftdir,shift);
and(outright[24],in[25],notshiftdir,shift);
and(outright[25],in[26],notshiftdir,shift);
and(outright[26],in[27],notshiftdir,shift);
and(outright[27],in[28],notshiftdir,shift);
and(outright[28],in[29],notshiftdir,shift);
and(outright[29],in[30],notshiftdir,shift);
and(outright[30],in[31],notshiftdir,shift);
buf(outright[31],msb);

or(out[0],outnoshift[0],outright[0],outleft[0]);
or(out[1],outnoshift[1],outright[1],outleft[1]);
or(out[2],outnoshift[2],outright[2],outleft[2]);
or(out[3],outnoshift[3],outright[3],outleft[3]);
or(out[4],outnoshift[4],outright[4],outleft[4]);
or(out[5],outnoshift[5],outright[5],outleft[5]);
or(out[6],outnoshift[6],outright[6],outleft[6]);
or(out[7],outnoshift[7],outright[7],outleft[7]);
or(out[8],outnoshift[8],outright[8],outleft[8]);
or(out[9],outnoshift[9],outright[9],outleft[9]);
or(out[10],outnoshift[10],outright[10],outleft[10]);
or(out[11],outnoshift[11],outright[11],outleft[11]);
or(out[12],outnoshift[12],outright[12],outleft[12]);
or(out[13],outnoshift[13],outright[13],outleft[13]);
or(out[14],outnoshift[14],outright[14],outleft[14]);
or(out[15],outnoshift[15],outright[15],outleft[15]);
or(out[16],outnoshift[16],outright[16],outleft[16]);
or(out[17],outnoshift[17],outright[17],outleft[17]);
or(out[18],outnoshift[18],outright[18],outleft[18]);
or(out[19],outnoshift[19],outright[19],outleft[19]);
or(out[20],outnoshift[20],outright[20],outleft[20]);
or(out[21],outnoshift[21],outright[21],outleft[21]);
or(out[22],outnoshift[22],outright[22],outleft[22]);
or(out[23],outnoshift[23],outright[23],outleft[23]);
or(out[24],outnoshift[24],outright[24],outleft[24]);
or(out[25],outnoshift[25],outright[25],outleft[25]);
or(out[26],outnoshift[26],outright[26],outleft[26]);
or(out[27],outnoshift[27],outright[27],outleft[27]);
or(out[28],outnoshift[28],outright[28],outleft[28]);
or(out[29],outnoshift[29],outright[29],outleft[29]);
or(out[30],outnoshift[30],outright[30],outleft[30]);
or(out[31],outnoshift[31],outright[31],outleft[31]);




endmodule
