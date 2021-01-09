// mux8w32_tb.v

`include "mux.vh"

module adder_tb;
	reg [31:0] a;
	reg [31:0] b;
	reg [31:0] c;
	reg [31:0] d;
	reg [31:0] e;
	reg [31:0] f;
	reg [31:0] g;
	reg [31:0] h;
	reg [2:0] sel;
	wire [31:0] out;

	//duration for each bit = 20 * timescale = 20 * 1ns = 20ns
	localparam period = 100;	

	mux8w32  mux(
		.a(a),
	       	.b(b),
	       	.c(c),
	       	.d(d),
	       	.e(e),
	       	.f(f),
	       	.g(g),
	       	.h(h),
	       	.sel(sel),
	       	.out(out));
	initial // initial block executes only once
		begin
			a = 32'hA;
			b = 32'hB;
			c = 32'hC;
			d = 32'hD;
			e = 32'hE;
			f = 32'hF;
			g = 32'h10;
			h = 32'h11;
			sel = 0;
			while(sel != 32'b111) begin
				#period;
				$display("pos: %3b expected: %h actual: %h",sel,sel+10,out);
				sel += 1;
			end
			#period;
			$display("pos: %3b expected: %h actual: %h",sel,sel+10,out);

		end
endmodule

