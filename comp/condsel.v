//branch conditional selector 
module condsel(
	eq,
	ne,
	lt,
	ge,
	ltu,
	geu,
	sel,
	out
);
//input
input wire [2:0] sel;
input wire eq;
input wire ne;
input wire lt;
input wire ge;
input wire ltu;
input wire geu;

//out
output reg out;

always @* begin
	case(sel)
		3'b000: //beq
			begin
			out = eq;
			end
		3'b001: //bne
			begin
			out = ne;	
			end
		3'b100: //blt
			begin
			out = lt; 
			end
		3'b101: //bge
			begin
			out = ge;
			end
		3'b110: //bltu
			begin
			out = ltu;
			end	
		3'b111: //bgeu
			begin
			out = geu;
			end
	endcase
end
endmodule
