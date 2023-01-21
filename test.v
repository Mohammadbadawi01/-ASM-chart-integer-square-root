`timescale 1ns / 1ps


module Int_SQRT_Calculator_TES;
  	
  
  wire [7:0]sqrt;
  reg [7:0]X;
  reg CLK,S,RESET;
  integer i,k;
  
  Int_SQRT_Calculator UUT(.CLK(CLK),.RESET(RESET),.S(S),.X(X),.sqrt(sqrt));
  
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
            k=0;
 CLK = 0;
      
          RESET = 0;
 
         
       #10 RESET = 1;
 
      #20  S = 1;
      for(k=1;k<256;k=k+1)
        begin
            S = 1 ;
          #20;
 #10 X = k;
     #400;
         S =0 ;
          
          $display("X= %d, sqrt= %d",X,sqrt);

        end
      
  	end
  initial begin
    for(i=0;i<20000;i=i+1)
      #10 CLK <= ~CLK;
  end
 
  
endmodule











