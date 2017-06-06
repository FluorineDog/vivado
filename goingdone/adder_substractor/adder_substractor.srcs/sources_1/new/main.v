`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2017 01:55:04 PM
// Design Name: 
// Module Name: maining
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
  input LD,
  output [3:0] Q,
  output reg Qcc
  );
  wire trigger;
  wire fakeQcc;
  always @ (posedge clk)
    Qcc <= !(Q == 7);
  assign trigger = !Q[3];
  counter counter0(clk, trigger, 0, 2, LD, Q, fakeQcc);
endmodule
