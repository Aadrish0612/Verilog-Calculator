// Code your design here


module alu(
  input [3:0] A,
  input [3:0] B,
  input [2:0] CTRL,
  
  output reg [7:0] result,
  output reg Z,
  output reg C,
  output reg N,
  output reg E);
  
  reg [8:0] temp;
  
  always @(*) begin
    result=0;
    Z=0;
    C=0;
	N=0;
    E=0;
    
    case(CTRL)
      
      3'b000: begin
        temp=A+B;
        result=temp[7:0];
        C=temp[4];
      end
      
      3'b001: begin
        if(A>B)
          result=A-B;
        else begin
          N=1;
          result=B-A;
        end
      end
        
      3'b010: begin
        temp=A*B;
        result=temp[7:0];
        
      end
        
       3'b011: begin
         if(B==0) begin
           E=1;
           result=8'hff;
         end
         else begin
           result=A/B;
         end
       end
        
       3'b100: begin
         result=A&B;
        
       end
        
       3'b101: begin
         result=A|B;
       end
        
       3'b110: begin
         result=A^B;
       end
  
       3'b111: begin
         result=~A;
       end
    endcase
      
      if(result==0) begin
        Z=1;
      end
      
         
    end
  endmodule
      
         
  
  