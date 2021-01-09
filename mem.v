//mem.v instruction memory
module mem(
out,
in,
raddr,
waddr,
memwr,
clk
);
//input
input [31:0] in;
input [31:0] raddr; 
input [31:0] waddr; 
input memwr;
input clk;

//output
output reg [31:0] out;

//intermediate
reg [7:0] ram [1371:0];

always @(negedge clk) begin
	out[7:0] <= ram [raddr];
	out[15:8] <= ram [raddr+1];
	out[23:16] <= ram [raddr+2];
	out[31:24] <= ram [raddr+3];
	if(memwr) begin
		ram [waddr] <= in[7:0];
		ram [waddr+1] <= in[15:8];
		ram [waddr+2] <= in[23:16];
		ram [waddr+3] <= in[31:24];

	end
		

end
endmodule
