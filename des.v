module Int_SQRT_Calculator (
 input CLK,
 input RESET,
 input S,
 input [7:0] X,
 output reg [7:0] sqrt
);
  
  
  reg [2:0]curent_state,next_state;
  parameter t0 = 3'b000,t1 = 3'b001,t2 = 3'b010,t3 = 3'b011,t4 = 3'b100;
  reg [8:0]a,d,q;
  always @(curent_state) // for chose next state
    begin
      case(curent_state)
        t0: next_state <= (S ? t1 : t0);
          
        t1: next_state <= t2;
        
        t2: next_state <= (q>a ? t3 : t1);
          
        t3: next_state <= t4;
        
        t4: next_state <= t0;
        default: next_state <= t0;
      endcase
    end
  
  always @(posedge CLK,negedge RESET) // run outout
    begin
      if(!RESET)
        curent_state <= t0;
      else
        curent_state <= next_state;
    end
  
  always @(posedge CLK) // ASM behavioral 
    begin
      case(curent_state)
        
          t0:
            begin
              a <= X;
              q<=1;
              d<=3;
        	end
        t1: q<= q + d;
        t2: d <= d + 2;
        t3: d <= d >> 1; 
        t4: sqrt <=d-1;
                
      endcase
    end
  
endmodule