`include "comp1b.v"
`timescale 1 ns/ 10 ps

module comp1b_tb;
	wire signed gtu;
	wire signed lts;
	reg unsigned au;
	reg unsigned bu;

	localparam period = 20000;
	comp1b comp(.gt(gtu),
		.eq(eq),
		.a(au),
		.b(bu));
	initial
	begin
		au=0;
		bu=0;
		#period;
		$display("a: %d b: %d gtu: %b eq: %b",au,bu,gtu,eq);

		au=1;
		bu=0;
		#period;
		$display("a: %d b: %d gtu: %b eq: %b",au,bu,gtu,eq);

		au=0;
		bu=1;
		#period;
		$display("a: %d b: %d gtu: %b eq: %b",au,bu,gtu,eq);

		au=1;
		bu=1;
		#period;
		$display("a: %d b: %d gtu: %b eq: %b",au,bu,gtu,eq);

	end
endmodule
