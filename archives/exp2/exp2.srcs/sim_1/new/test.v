`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2017 12:53:04 AM
// Design Name: 
// Module Name: test
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


module test(
    
);
  reg x;
  integer i;
  wire y;
  reg clk;
  main main1(x, clk, y);
  initial begin 
    x = 1;
    for(i = 0; i < 32; i=i+1) begin 
      #5 clk = 0;
      #5 clk = 1;
    end
    x = 0;
    forever begin 
      #5 clk = 0;
      #5 clk = 1;
    end
  end
endmodule
