`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2017 08:50:33 AM
// Design Name: 
// Module Name: main
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


module main(
  input A[2:0],
  input B[2:0],
  output F1,
  output F2,
  output F3
  );
  wire midF1[2:0];
  wire midF2[2:0];
  wire midF3[2:0];
  comparer comp0(A[0], B[0], midF1[0], midF2[0], midF3[0]);
  comparer comp0(A[1], B[1], midF1[1], midF2[1], midF3[1]);
  

endmodule