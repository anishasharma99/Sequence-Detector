`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2022 02:38:32
// Design Name: 
// Module Name: sequence_detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sequence_detector( clk , rst ,x ,  z);
input  x, clk, rst ;
output reg  z ;

parameter [2:0] S0 = 3'b000 ;
parameter [2:0] S1 = 3'b001 ;
parameter [2:0] S2 = 3'b011 ;
parameter [2:0] S3 = 3'b010 ;
parameter [2:0] S4 = 3'b110 ;

reg[2:0] current_state;
reg[2:0] next_state;

always@(posedge clk , posedge rst)
    begin
        if(rst ==1)
            current_state <= S0;
        else
            current_state <= next_state;
    end
    
always@(x,current_state)
begin
case(current_state)
    S0 : begin
            if(x== 0)
                next_state <= S0 ;
            else
                next_state <= S1;
         end
     S1: begin
                    if(x== 0)
                        next_state <= S2;
                    else
                        next_state <= S1;
         end
      S2 : begin
                            if(x== 0)
                                next_state <= S0 ;
                            else
                                next_state <= S3;
                         end
        S3 : begin
                                    if(x== 0)
                                        next_state <= S2 ;
                                    else
                                        next_state <= S4;
            end
        S4: begin
        if(x== 0)
           next_state <= S2 ;
        else
           next_state <= S1;
       end
default : next_state <= S0;
       endcase
       end
       
       always@(current_state)
       begin
       case(current_state)
           S0 : z <=0;
           S1 : z <=0;
           S2 : z <=0;
           S3 : z <=0;
           S4 : z <=1;
          
           default : z<= 0;
       endcase
       end
endmodule
