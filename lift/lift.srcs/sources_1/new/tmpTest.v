`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2017 03:51:33 PM
// Design Name: 
// Module Name: tmpTest
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


module tmpTest(
  input [2:0] lift_floor, 
  input [3:0] timer,     
  input clk100MHz,      // require : 1ms-4ms period
  output [7:0] AN,
  output [7:0] seg_data
  );
  wire clk;
  clockWrapper cw0(clk100MHz, clk);
  sevenSeg ss0(lift_floor, timer, clk, AN, seg_data);
endmodule
