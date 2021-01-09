module and32(
out,
a,
b
);
//output
output [31:0] out;
//input
input [31:0] a;
input [31:0] b;

wire [31:0] out;
wire [31:0] a;
wire [31:0] b;
	and(out[0],a[0],b[0]);
	and(out[1],a[1],b[1]);
	and(out[2],a[2],b[2]);
	and(out[3],a[3],b[3]);
	and(out[4],a[4],b[4]);
	and(out[5],a[5],b[5]);
	and(out[6],a[6],b[6]);
	and(out[7],a[7],b[7]);
	and(out[8],a[8],b[8]);
	and(out[9],a[9],b[9]);
	and(out[10],a[10],b[10]);
	and(out[11],a[11],b[11]);
	and(out[12],a[12],b[12]);
	and(out[13],a[13],b[13]);
	and(out[14],a[14],b[14]);
	and(out[15],a[15],b[15]);
	and(out[16],a[16],b[16]);
	and(out[17],a[17],b[17]);
	and(out[18],a[18],b[18]);
	and(out[19],a[19],b[19]);
	and(out[20],a[20],b[20]);
	and(out[21],a[21],b[21]);
	and(out[22],a[22],b[22]);
	and(out[23],a[23],b[23]);
	and(out[24],a[24],b[24]);
	and(out[25],a[25],b[25]);
	and(out[26],a[26],b[26]);
	and(out[27],a[27],b[27]);
	and(out[28],a[28],b[28]);
	and(out[29],a[29],b[29]);
	and(out[30],a[30],b[30]);
	and(out[31],a[31],b[31]);

endmodule
