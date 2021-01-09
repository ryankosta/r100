`include "shifter32_tb.v"
`timescale 1 ns/ 10 ps
module shifter_tb;
	reg [31:0] in; 
	wire [31:0] out; 
	reg shiftdir;
	reg shift;

	localparam period = 200000;
	shifter shiftertest(out,in,shiftdir, shift);

initial begin
	in = 32'b00000000000000000000000000000010;
	shiftdir = 1; //shift left
	shift = 1; //shift
	#period;
	$display("Shift left (1) ");
	$display("in:  %b",in);
	$display("out: %b",out);

	in = 32'b00000000000000000000000000000010;
	shiftdir = 0; //shift right 
	shift = 1; //shift 
	#period;
	$display("Shift right (0)");
	$display("in:  %b",in);
	$display("out: %b",out);

	shiftdir = 0; //shift right 
	shift = 0; //shift 
	#period;
	$display("dont shift");
	$display("in:  %b",in);
	$display("out: %b",out);
end

endmodule
