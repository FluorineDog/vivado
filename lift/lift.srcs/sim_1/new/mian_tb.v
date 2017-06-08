`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2017 05:35:39 PM
// Design Name: 
// Module Name: mian_tb
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


module mian_tb(
  );
  reg clk250Hz; 
  reg [7:0] up;
  reg [7:0] down;
  wire [7:0] up_enabled;
  wire [7:0] down_enabled;
  reg [7:0] inner_button;
  wire [7:0] inner_button_enabled;
  wire [3:0] elevator_statue;
  wire reg [2:0] current_floor;
  reg force_open;
  reg force_close;
  wire accCond, decCond, closeCond, openCond, timeoutCond;

 
endmodule
