`include "comp4b.v"
`timescale 1 ns/ 10 ps

module comp4b_tb;
	wire signed gts;
	wire signed gtu;
	wire signed lts;
	reg unsigned [3:0] au;
	reg unsigned [3:0] bu;

	localparam period = 20000;
	comp4b comp(.gt(gts),
		.lt(lts),
		.eq(eq),
		.a(au),
		.b(bu));
	initial
	begin
	au=4'sd0;
	while(au < 8) begin
		bu=4'sd4;
		#period;
		$display("a: %d b: %d gts: %b eq: %b",au,bu,gts,eq);
		au= au + 1;
	end
	end
endmodule
