`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2017 08:49:22 AM
// Design Name: 
// Module Name: comparer
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


module comparer(
  input A, 
  input B, 
  output F1,
  output F2,
  output F3
  );
  assign F1 = A>B;
  assign F2 = A==B;
  assign F3 = A<B;
endmodule
