`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2017 03:00:45 AM
// Design Name: 
// Module Name: pipe3b
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


module pipe3b( 
  input sig_nsyn, 
  input clk100MHz, 
  output reg q1, 
  output reg q2, 
  output reg sig_syn,
  output clk
  );
  mask mask1(clk100MHz, clk);
  always@(posedge clk) q2<=q1;
  always@(posedge clk) sig_syn<=q2; 
  always@(posedge clk) q1<=sig_nsyn;
endmodule
