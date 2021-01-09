module alu(
a,
b,
operation, //func3 
control, //instr b30; 0 = add, srl; 1 = sub, sra
result,
lt,
ltu,
zero,
neg
);
//input
input wire [31:0] a;
input wire [31:0] b;
input wire lt;
input wire ltu;
input wire control;
input wire [2:0] operation;
//output
output wire [31:0] result;
output wire zero;
output wire neg;
//intermediates
wire shiftdir;
wire [31:0] orab;
wire [31:0] notb;
wire [31:0] badd;
wire [31:0] addab;
wire [31:0] subab;
wire [31:0] andab;
wire [31:0] xorab;
wire [31:0] sltab;
wire [31:0] sltuab;
wire [31:0] ashiftbyb;

not(shiftdir,operation[2]); // op2 == 0 -> shdir = 1 -> shift left; op2 = 1 -> shdir = 0 ->shift right
//operations
or32 orop(orab,a,b);
and32 andop(andab,a,b);
not32 notbop(notb,b);
xor32 xorop(xorab,a,b);
mux2w32 baddselect(
	.a(b),
	.b(notb),
	.sel(control),
	.out(badd)
);
adder32 adder(
	.result(addab),
	.cin(control),
	.a(a),
	.b(b)
);

mshifter32 shifter(
	.out(ashiftbyb),
	.in(a),
	.shiftdir(shiftdir),
	.shiftby(b[4:0]),
	.shifta(control)
);

buf(sltab[0],lt);
buf(sltab[1],0);
buf(sltab[2],0);
buf(sltab[3],0);
buf(sltab[4],0);
buf(sltab[5],0);
buf(sltab[6],0);
buf(sltab[7],0);
buf(sltab[8],0);
buf(sltab[9],0);
buf(sltab[10],0);
buf(sltab[11],0);
buf(sltab[12],0);
buf(sltab[13],0);
buf(sltab[14],0);
buf(sltab[15],0);
buf(sltab[16],0);
buf(sltab[17],0);
buf(sltab[18],0);
buf(sltab[19],0);
buf(sltab[20],0);
buf(sltab[21],0);
buf(sltab[22],0);
buf(sltab[23],0);
buf(sltab[24],0);
buf(sltab[25],0);
buf(sltab[26],0);
buf(sltab[27],0);
buf(sltab[28],0);
buf(sltab[29],0);
buf(sltab[30],0);
buf(sltab[31],0);

buf(sltuab[0],ltu);
buf(sltuab[1],0);
buf(sltuab[2],0);
buf(sltuab[3],0);
buf(sltuab[4],0);
buf(sltuab[5],0);
buf(sltuab[6],0);
buf(sltuab[7],0);
buf(sltuab[8],0);
buf(sltuab[9],0);
buf(sltuab[10],0);
buf(sltuab[11],0);
buf(sltuab[12],0);
buf(sltuab[13],0);
buf(sltuab[14],0);
buf(sltuab[15],0);
buf(sltuab[16],0);
buf(sltuab[17],0);
buf(sltuab[18],0);
buf(sltuab[19],0);
buf(sltuab[20],0);
buf(sltuab[21],0);
buf(sltuab[22],0);
buf(sltuab[23],0);
buf(sltuab[24],0);
buf(sltuab[25],0);
buf(sltuab[26],0);
buf(sltuab[27],0);
buf(sltuab[28],0);
buf(sltuab[29],0);
buf(sltuab[30],0);
buf(sltuab[31],0);

mux8w32 mux(
	.a(addab),	//000 add/sub
	.b(ashiftbyb),	//001 shift left logical
	.c(sltab),	//010 set less than
	.d(sltuab),	//011 set less than unsigned
	.e(xorab),	//100 a ^ b
	.f(ashiftbyb),	//101 shift right logical/arethmetic
	.g(orab),	//110 a || b
	.h(andab),	//111 a && b

	
	.out(result),
	.sel(operation)
);


//checks
and32s zerochk(zero,a);
buf(neg,result[31]);
endmodule
