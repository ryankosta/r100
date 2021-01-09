`include "comp16b.v"
`timescale 1 ns/ 10 ps

module comp16b_tb;
	wire signed gts;
	wire signed gtu;
	wire signed lts;
	reg unsigned [15:0] au;
	reg unsigned [15:0] bu;

	localparam period = 20000;
	comp16b comp(gtu,ltu,eq,au,bu);
	initial
	begin
		au=16'sd15;
		bu=16'sd23;
		#period;
		$display("a: %d b: %d gt: %b eq: %b",au,bu,gtu,eq);
		au=16'sd23;
		bu=16'sd15;
		#period;
		$display("a: %d b: %d gt: %b eq: %b",au,bu,gtu,eq);
		au=16'sd23;
		bu=16'sd23;
		#period;
		$display("a: %d b: %d gt: %b eq: %b",au,bu,gtu,eq);
		au=16'sd15;
		bu=16'sd15;
		#period;
		$display("a: %d b: %d gt: %b eq: %b",au,bu,gtu,eq);
		au=16'sd1;
		bu=16'sd1;
		#period;
		$display("a: %d b: %d gt: %b eq: %b",au,bu,gtu,eq);
		au=16'sd0;
		bu=16'sd0;
		#period;
		$display("a: %d b: %d gt: %b eq: %b",au,bu,gtu,eq);
	end
endmodule
