`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2017 01:55:04 PM
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
  input clk,
  output [3:0] Q,
  output Qcc
  );
  wire trigger;
  wire fakeQcc;
  assign Qcc = (Q == 7);
  assign trigger = !Q[3];
  counter counter0(clk, trigger, 0, 0, 1, Q, fakeQcc);
endmodule
