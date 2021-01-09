`include "shifter.vh"
`timescale 1 ns/ 10 ps
module mshifter32_tb;
	reg [31:0] in; 
	wire [31:0] out; 
	reg shiftdir;
	reg shifta;
	reg [4:0] shift;

	localparam period = 200000;
	mshifter32 shiftertest(
		.out(out),
		.in(in),
		.shiftdir(shiftdir),
	       	.shiftby(shift),
		.shifta(shifta)
	);

initial begin
	in = 32'h98000009;
	shiftdir = 1; //shift left
	shift = 4; //shift
	shifta = 0; //dont arethmetic shift
	#period;
	$display("Shift left by %d",shift);
	$display("in:  %b",in);
	$display("out: %b",out);

	in = 32'h90000009;
	shiftdir = 0; //shift right 
	shifta = 0; //dont arethmetic shift
	shift = 3; //shift 
	#period;
	$display("Shift right by %d arithmetic = %b", shift,shifta);
	$display("in:  %b",in);
	$display("out: %b",out);


	in = 32'h90000009;
	shiftdir = 0; //shift right 
	shifta = 1; //arethmetic shift
	shift = 3; //shift 
	#period;
	$display("Shift right by %d arithmetic = %b", shift,shifta);
	$display("in:  %b",in);
	$display("out: %b",out);
	in = 32'h10000009;
	shifta = 1; //arethmetic shift
	shift = 3; //shift 
	shift = 3; //shift 
	#period;
	$display("Shift right by %d arithmetic = %b", shift,shifta);
	$display("in:  %b",in);
	$display("out: %b",out);

	shiftdir = 0; //shift right 
	shifta = 0; //dont arethmetic shift
	shift = 0; //shift 
	#period;
	$display("dont shift");
	$display("in:  %b",in);
	$display("out: %b",out);
end

endmodule
