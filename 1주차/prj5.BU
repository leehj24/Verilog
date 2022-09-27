module fulladder_tb;
  wire sum, cout;
  reg a, b, cin;
  fulladder f1 (sum, cout, a, b, cin);
  initial begin
    $monitor("%d: %b %b : %b %b : %b %b", $time, cin, a, b, cout, sum);
    #180 $finish;
  end
  initial begin
    #20 cin=0; a=0; b=0;  
    #20 cin=0; a=0; b=1;     
    #20 cin=0; a=1; b=1;    
    #20 cin=0; a=1; b=0; 
    #20 cin=1 ;a=1; b=0; 
    #20 cin=1; a=1; b=1; 
    #20 cin=1; a=0; b=1;
    #20 cin=1; a=0; b=0; 
  end
endmodule
