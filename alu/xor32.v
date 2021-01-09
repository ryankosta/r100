module xor32(
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


	xor(out[0],a[0],b[0]);
	xor(out[1],a[1],b[1]);
	xor(out[2],a[2],b[2]);
	xor(out[3],a[3],b[3]);
	xor(out[4],a[4],b[4]);
	xor(out[5],a[5],b[5]);
	xor(out[6],a[6],b[6]);
	xor(out[7],a[7],b[7]);
	xor(out[8],a[8],b[8]);
	xor(out[9],a[9],b[9]);
	xor(out[10],a[10],b[10]);
	xor(out[11],a[11],b[11]);
	xor(out[12],a[12],b[12]);
	xor(out[13],a[13],b[13]);
	xor(out[14],a[14],b[14]);
	xor(out[15],a[15],b[15]);
	xor(out[16],a[16],b[16]);
	xor(out[17],a[17],b[17]);
	xor(out[18],a[18],b[18]);
	xor(out[19],a[19],b[19]);
	xor(out[20],a[20],b[20]);
	xor(out[21],a[21],b[21]);
	xor(out[22],a[22],b[22]);
	xor(out[23],a[23],b[23]);
	xor(out[24],a[24],b[24]);
	xor(out[25],a[25],b[25]);
	xor(out[26],a[26],b[26]);
	xor(out[27],a[27],b[27]);
	xor(out[28],a[28],b[28]);
	xor(out[29],a[29],b[29]);
	xor(out[30],a[30],b[30]);
	xor(out[31],a[31],b[31]);

endmodule
