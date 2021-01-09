`include "comp.vh"
`timescale 1 ns/ 10 ps

module comp32bs_tb;
	wire signed gts;
	wire signed gtu;
	wire signed lts;
	reg signed [31:0] a;
	reg signed [31:0] b;

	localparam period = 20000;
	comp32bs comp(gts,eq,gtu,a,b);
	initial
	begin
		//gts section
		a=-32'sd23;
		b=32'sd23;
		#period;
		$display("a: %d b: %d gts: %b eq: %b ",a,b,gts,eq);
		a=32'sd23;
		b=-32'sd23;
		#period;
		$display("a: %d b: %d gts: %b eq: %b ",a,b,gts,eq);
		a=-32'sd23;
		b=-32'sd23;
		#period;
		$display("a: %d b: %d gts: %b eq: %b ",a,b,gts,eq);
		//gtu section
		a=32'sd13;
		b=32'sd15;
		#period;
		$display("a: %d b: %d gtu: %b eq: %b ",a,b,gtu,eq);
		a=32'sd23;
		b=32'sd15;
		#period;
		$display("a: %d b: %d gtu: %b eq: %b ",a,b,gtu,eq);
		a=32'sd1;
		b=32'sd1;
		#period;
		$display("a: %d b: %d gtu: %b eq: %b ",a,b,gtu,eq);
		a=32'hFFFFFFFF;
		b=32'hFFFFFFFF;
		#period;
		$display("a: %h b: %h gtu: %b eq: %b ",a,b,gtu,eq);
		a=32'hFFFFFFFF;
		b=32'hFFFFFFFE;
		#period;
		$display("a: %h b: %h gtu: %b eq: %b ",a,b,gtu,eq);

	end
endmodule
