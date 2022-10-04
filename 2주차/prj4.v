module comparator2(eq, lt, gt, a, b);
		
  input [1:0] a, b;

  output gt, lt, eq;
  	
  wire w1, w0, gt1, lt1, eq1, gt0, lt0, eq0;

	

  comparator1 u1 (eq1, lt1, gt1, a[1], b[1]);
	
  comparator1 u2 (eq0, lt0, gt0, a[0], b[0]);
	
  combine u3 (eq, lt, gt, eq0, lt0, gt0, eq1, lt1, gt1);

endmodule

