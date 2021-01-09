`include "cpu.vh"
module r100(
	clk
);
input wire clk;

//pc wires
wire [31:0] pc_addrin;
wire [31:0] pc_addrout;
wire [31:0] pcp4;
wire [31:0] pc_brtarg;
wire [31:0] pc_jumptarg;
reg pc_rst; // TODO: leave as reg or not?
//instruction memory wires
wire [31:0] instrn; // current instruction
//decoder wires
wire immsel;
wire op1sel;
wire [1:0] op2sel;
wire funcsel;
wire memwr;
wire regwr;
wire wasel;
wire [1:0] wbsel;
wire [1:0] pcsel;
wire rs2addrsel;

wire [31:0] op1;
wire [31:0] op2;
//comparitor wires
wire comp_eq;
wire comp_ne;
wire comp_lt;
wire comp_ge;
wire comp_ltu;
wire comp_geu;
//branch selector wires
wire branchif;
//alu wires
wire [31:0] alu_res;
wire alu_0;
wire alu_neg;
wire alu_cont;
//Register file wires
wire [31:0] rs1o; //rs1 out
wire [31:0] rs2o; //rs2 out
wire [4:0] rs2addr; //rs2 addr 
wire [4:0] rdaddr; //rs2 addr 
wire [31:0] reg_win; //write in
//data memory wires
wire [31:0] dmem_out;
//immediate wires
wire [31:0] imm_stype;
wire [31:0] imm_itype;
wire [31:0] imm_utype;


pc pcinst( //program counter
	.clk(clk),
	.ain(pc_addrin),
	.aout(pc_addrout),
	.rst(pc_rst)
);
adder32 pcp4add( //pc+4 adder
	.a(pc_addrout),
	.b(32'h4),
	.cin(1'b0),
	.result(pcp4)
);
mem instrnmem( //instruction memory
	.out(instrn),
	.raddr(pc_addrout),
	.memwr(1'b0),
	.clk(clk)
);
condgen comparitor(
	.a(op1),
	.b(op2),
	.eq(comp_eq),
	.ne(comp_ne),
	.lt(comp_lt),
	.ge(comp_ge),
	.ltu(comp_ltu),
	.geu(comp_geu)
);
condsel branchsel( //branch conditional selector
	.eq(comp_eq),
	.ne(comp_ne),
	.lt(comp_lt),
	.ge(comp_ge),
	.ltu(comp_ltu),
	.geu(comp_geu),
	.sel(instrn[14:12]), //func3
	.out(branchif)
);
decoder decoderinst(
	.opcode(instrn[6:0]),
	.equal(branchif), //branch if 1 (and is branch instrn)
	.ra2sel(rs2addrsel),
	.op1sel(op1sel),
	.op2sel(op2sel),
	.funcsel(funcsel),
	.memwr(memwr),
	.regwr(regwr),
	.wasel(wasel),
	.wbsel(wbsel),
	.pcsel(pcsel)
);	
alucont alucontroller(
	.instrn30(instrn[30]),
	.instrn5(instrn[5]),
	.control(alu_cont)
);
alu aluinst(
	.a(op1),
	.b(op2),
	.operation(instrn[14:12]), //func3
	.control(alu_cont),
	.result(alu_res),
	.lt(comp_lt),
	.ltu(comp_ltu),
	.zero(alu_0),
	.neg(alu_neg)
);
regfile gpr(
	.rs1addr(instrn[19:15]), //rs1 address
	.rs2addr(instrn[24:20]), //rs2 address
	.rdaddr(rdaddr), //rd address
	.rs1o(rs1o),
	.rs2o(rs2o),
	.win(reg_win),
	.clk(clk),
	.regwr(regwr)
);
dmemnclk datamem(
	.out(dmem_out),
	.raddr(alu_res),
	.waddr(alu_res),
	.in(rs2o),
	.memwr(memwr),
	.clk(clk)
);
mux4w32 wbselector( //select which data written into register
	.a(alu_res),
	.b(dmem_out),
	.c(pcp4),
	.sel(wbsel),
	.out(reg_win)
);
isignex isignextender(
	.instrn31_20(instrn[31:20]),
	.itype(imm_itype)
);

ssignex ssignextender(
	.instrn11_7(instrn[11:7]),
	.instrn31_25(instrn[31:25]),
	.stypeimm(imm_stype)
);
branchtarggen brtarggenerator(
	.instrn11_7(instrn[11:7]),
	.instrn31_25(instrn[31:25]),
	.pc(pc_addrout),
	.br(pc_brtarg)
);
jumptarggen jumptarggenerator(
	.jumptarg(pc_jumptarg),
	.rs1(rs1o),
	.pc(pc_addrout),
	.instrn(instrn)
);
utypeimm utypeimmhandle(
	.instrn31_12(instrn[31:12]),
	.imm(imm_utype)
);
mux2w32 op1selector(
	.a(rs1o),
	.b(imm_utype),
	.sel(op1sel),
	.out(op1)
);
mux4w32 op2selector(
	.a(rs2o),
	.b(imm_itype),
	.c(imm_stype),
	.d(pcp4),
	.sel(op2sel),
	.out(op2)
);
mux4w32 pcselector(
	.a(pcp4),
	.b(pc_brtarg),
	.c(pc_jumptarg),
	.out(pc_addrin),
	.sel(pcsel)
);
mux2w5 waselector( //reg addr to write to
	.a(instrn[11:7]), //rd address
	.b(5'h1), //x1 00001
	.sel(wasel),
	.out(rdaddr)
);
mux2w5 rs2addrselector(
	.a(instrn[24:20]), //rs2 address
	.b(instrn[11:7]), //rd address
	.out(rs2addr),
	.sel(rs2addrsel)
);

endmodule
