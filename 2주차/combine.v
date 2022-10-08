module combine(eq, lt, gt, eq0, lt0, gt0, eq1, lt1, gt1);
	
  input eq0, lt0, gt0, eq1, lt1, gt1;
	
  output eq, lt, gt;

	
  assign eq = eq1 & eq0;
	
  assign lt = lt1 | eq1 & lt0;
	
  assign gt = gt1 | eq1 & gt0;

endmodule

