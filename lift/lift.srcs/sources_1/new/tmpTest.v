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
  input clk,      // require : 1ms-4ms period
  output reg [7:0] AN,
  output reg [7:0] seg_data
  );
endmodule