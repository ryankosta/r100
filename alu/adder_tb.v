// adder_tb.v

`include "adder.v"

module adder_tb;
	reg a, b, cin;
	wire sum, cout;

	//duration for each bit = 20 * timescale = 20 * 1ns = 20ns
	localparam period = 100;	

	adder testadd(.a(a), .b(b), .cin(cin), .out(sum), .cout(cout));
	initial // initial block executes only once
		begin
			a = 3;
			b = -1;
			cin = 0;
			#period;
				$display("%b%b %b: sum %b cout %b",a,b,cin,sum,cout);
			end

			a = 0;
			b = 1;
			cin = 0;
			#period;
			if(sum == 0 || cout == 1) begin
				$display("%b%b %b: sum %b cout %b",a,b,cin,sum,cout);
			end


			a = 1;
			b = 0;
			cin = 0;
			#period;
			if(sum == 0 || cout == 1) begin
				$display("%b%b %b: sum %b cout %b",a,b,cin,sum,cout);
			end

			a = 1;
			b = 1;
			cin = 0;
			#period;
			if(sum == 1 || cout == 0) begin
				$display("%b%b %b: sum %b cout %b",a,b,cin,sum,cout);
			end


			a = 0;
			b = 0;
			cin = 1;
			#period;
			if(sum == 0 || cout == 1) begin
				$display("%b%b %b: sum %b cout %b",a,b,cin,sum,cout);
			end


			a = 1;
			b = 0;
			cin = 1;
			#period;
			if(sum == 1 || cout == 0) begin
				$display("%b%b %b: sum %b cout %b",a,b,cin,sum,cout);
			end


			a = 1;
			b = 1;
			cin = 1;
			#period;
			if(sum == 0 || cout == 0) begin
				$display("%b%b %b: sum %b cout %b",a,b,cin,sum,cout);
			end

		end
endmodule

