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
  input [2:0] A,
  input [2:0] B,
  output [3:1] F
  );
  wire [3:1] midFA;
  wire [3:1] midFB;
  wire [3:1] tmpFB;
  wire [3:1] tmpFC;
  
  comparer comp0(A[0], B[0], midFA);
  comparer comp1(A[1], B[1], tmpFB);
  assign midFB = (tmpFB[2]) ? midFA:tmpFB;
  comparer comp2(A[2], B[2], tmpFC);
  assign F = (tmpFC[2]) ? midFB:tmpFC;
endmodule
