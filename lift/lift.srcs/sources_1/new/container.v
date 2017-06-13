`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2017 05:04:51 PM
// Design Name: 
// Module Name: container
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


module container(
  input RST,
  input clk100MHz, 
  input [2:0] floor_switch,
  input up_trigger,
  input down_trigger,
  input [7:0] inner_button,
  output [7:0] inner_button_enabled,
  input force_open,
  input force_close,
  output up_direction_LED,
  output down_direction_LED,
  output [7:0] AN,
  output [7:0] seg_data,
  output [5:0] gate_led, 
  input outside_switch
  );
  mask mask0(
  RST,
  clk100MHz, 
  floor_switch,
  up_trigger,
  down_trigger,
  inner_button,
  inner_button_enabled,
  force_open,
  force_close,
  up_direction_LED,
  down_direction_LED,
  AN,
  seg_data,
  gate_led, 
  outside_switch
  );
endmodule
