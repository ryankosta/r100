module mshifter32(
out,
in,
shiftdir,
shiftby, //0-31 unsigned
shifta //arethmetic shift
);
//input
input wire [31:0] in;
input wire shiftdir;
input wire [4:0] shiftby;
input wire shifta;
//output
output wire [31:0] out;
//intermediate shift wires
wire [31:0] shift1;
wire [31:0] shift2;
wire [31:0] shift4;
wire [31:0] shift8;

shifter32b1 shifter1(
	.out(shift1),
	.in(in),
	.shiftdir(shiftdir),
	.shift(shiftby[0]),
	.shifta(shifta)
);

shifter32b2 shifter2(
	.out(shift2),
	.in(shift1),
	.shiftdir(shiftdir),
	.shift(shiftby[1]),
	.shifta(shifta)
);

shifter32b4 shifter4(
	.out(shift4),
	.in(shift2),
	.shiftdir(shiftdir),
	.shift(shiftby[2]),
	.shifta(shifta)
);

shifter32b8 shifter8(
	.out(shift8),
	.in(shift4),
	.shiftdir(shiftdir),
	.shift(shiftby[3]),
	.shifta(shifta)
);

shifter32b16 shifter16(
	.out(out),
	.in(shift8),
	.shiftdir(shiftdir),
	.shift(shiftby[4]),
	.shifta(shifta)
);

endmodule
