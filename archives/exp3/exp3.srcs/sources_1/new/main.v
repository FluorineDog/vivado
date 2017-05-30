`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2017 01:48:11 AM
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
  input in,
  output z,
  output q1, 
  output q2,
  output q3,
  output q4
  );
 
  wire nq1, nq2, nq3, nq4;
  wire j_tri4;
  jkff jkff1(1'b1,   1'b1, in, q1, nq1);
  jkff jkff2(nq4,    1'b1, q1, q2, nq2);
  jkff jkff3(1'b1,   1'b1, q2, q3, nq3);
  jkff jkff4(j_tri4, 1'b1, q1, q4, nq4);
  and and1(j_tri4, q3, q2);
  assign z = in & q1 & q4;
endmodule