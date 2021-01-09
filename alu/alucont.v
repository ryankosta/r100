//alucont.v
module alucont(
	instrn30,
	instrn5,
	control
);
input wire instrn30, instrn5;
output wire control;
and(control,instrn30,instrn5); //activate secondary (subtraction, arethmetic shift) if instrn30 set and not immediate 
endmodule
