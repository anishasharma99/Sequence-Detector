`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2022 02:39:25
// Design Name: 
// Module Name: sd_testbench
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


module sd_testbench ; 
reg clk , rst , x;
wire z ; 
sequence_detector uut (.x(x), .clk(clk), .rst(rst), .z(z));
 initial begin
 clk = 0;
 forever #5 clk = ~clk;
 end 
 initial begin
  x = 0;
  rst = 1;
  #30;
      rst = 0;
  #40;
  x = 1;
  #10;
  x = 0;
  #10;
  x = 1; 
  #20;
  x = 0; 
  #20;
  x = 1; 
  #20;
  x = 0;  

 end
      
endmodule
