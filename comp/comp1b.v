module comp1b(
gt,
lt,
eq,
a,
b
);
//inputs
input wire a;
input wire b;
output wire gt;
//outputs
output wire lt;
output wire eq;
//intermediates
wire xab;
wire ge; //greater than or equal to

xor(xab,a,b);
not(eq,xab);
and(gt,xab,a);
or(ge,gt,eq);
not(lt,ge);
endmodule


