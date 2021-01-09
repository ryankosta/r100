`include "adder.v"
`include "adder32.v"
`timescale 1 ns/10 ps

module adder32_tb;
	wire signed [31:0] result; 
	wire cout;
	reg cin;
	reg signed [31:0] a;
	reg signed [31:0] b;
	wire oflow;

	localparam period = 2000;

	adder32 testadder (result,cout,cin,a,b,oflow);

	initial
		begin
			cin=0;
			a=32'sd3;
			b=-32'sd1;
			#period;
			$display("a: %d b: %d res: %d",a,b,result);

			cin=1;
			a=32'sd2;
			b=~(32'sd44);
			#period;
			$display("a: %d b: %d res: %d",a,b,result);

	end
endmodule
