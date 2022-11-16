module addsub2(sub, a, b, cin, s, cout);
	input sub;
	input [3:0] a,b;
	input cin;
	output[3:0] s;
	output cout;
	
	assign {cout, s} = sub ? (a - b - cin) : (a + b + cin);
endmodule
	