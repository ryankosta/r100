module or32(
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


	or(out[0],a[0],b[0]);
	or(out[1],a[1],b[1]);
	or(out[2],a[2],b[2]);
	or(out[3],a[3],b[3]);
	or(out[4],a[4],b[4]);
	or(out[5],a[5],b[5]);
	or(out[6],a[6],b[6]);
	or(out[7],a[7],b[7]);
	or(out[8],a[8],b[8]);
	or(out[9],a[9],b[9]);
	or(out[10],a[10],b[10]);
	or(out[11],a[11],b[11]);
	or(out[12],a[12],b[12]);
	or(out[13],a[13],b[13]);
	or(out[14],a[14],b[14]);
	or(out[15],a[15],b[15]);
	or(out[16],a[16],b[16]);
	or(out[17],a[17],b[17]);
	or(out[18],a[18],b[18]);
	or(out[19],a[19],b[19]);
	or(out[20],a[20],b[20]);
	or(out[21],a[21],b[21]);
	or(out[22],a[22],b[22]);
	or(out[23],a[23],b[23]);
	or(out[24],a[24],b[24]);
	or(out[25],a[25],b[25]);
	or(out[26],a[26],b[26]);
	or(out[27],a[27],b[27]);
	or(out[28],a[28],b[28]);
	or(out[29],a[29],b[29]);
	or(out[30],a[30],b[30]);
	or(out[31],a[31],b[31]);

endmodule
