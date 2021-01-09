module adder(
out,
cout,
cin,
a,
b
);
//inputs
input cin;
input a;
input b;
//outputs
output cout;
output out;
//wires
wire cin;
wire a;
wire b;
wire cout;
wire out;
//intermediates
wire xor_ab;
wire and_cxab;
wire and_ab;

//code
xor (xor_ab, a, b);
xor (out, xor_ab, cin);

and (andab, a, b);
and (and_cxab, cin, xor_ab);
or (cout, and_cxab , andab);
endmodule



