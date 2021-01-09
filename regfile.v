module regfile(
rs1addr,
rs2addr,
rdaddr,
win,
rs1o,
rs2o,
clk,
regwr
);
//input
input [4:0] rs1addr;
input [4:0] rs2addr;
input [4:0] rdaddr;
input [31:0] win;
input clk;
input regwr;
//output
output reg [31:0] rs1o;
output reg [31:0] rs2o;
//registers
reg [31:0] Register [31:0];
initial begin
	Register[0] <= 0;
end
always @(*)begin
	rs1o <= Register[rs1addr];
	rs2o <= Register[rs2addr];
end
always @(posedge clk) begin
	if(regwr && rdaddr != 5'h0)
		Register[rdaddr] <= win;
end
endmodule
