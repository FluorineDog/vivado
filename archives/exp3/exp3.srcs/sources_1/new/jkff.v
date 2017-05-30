`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2017 01:49:53 AM
// Design Name: 
// Module Name: jkff
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


module jkff(
  input j_tri,
  input k_tri,
  input clk,
  output reg q,
  output nq
  );
  not(nq, q);
  initial 
    q = 0;
  always @ (negedge clk)
  begin
    q <= (j_tri & !q) | (!k_tri & q);
  end
endmodule
