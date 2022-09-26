module halfadder(sum, cout, a, b);
  output cout, sum;
  input a, b;
  xor #3 (sum,a,b);
  and #2 (cout,a,b);
endmodule

