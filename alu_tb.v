`include "cpu.vh"
`timescale 1 ns/10 ps

module alu_tb;
	wire signed [31:0] result; 
	reg [2:0] op;
	reg cont;
	reg signed [31:0] a;
	reg signed [31:0] b;


	localparam period = 2000;

	alu testalu (
		.a(a),
		.b(b),
		.operation(op),
		.control(cont),
		.result(result)
	);

	initial
		begin
			cont=0;
			op=3'b000;
			a=32'h00000003;
			b=32'hffffffff;
			#period;
			$display("a: %d b: %d res: %d",a,b,result);


	end
endmodule
