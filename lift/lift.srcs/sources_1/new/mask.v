`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2017 10:54:19 AM
// Design Name: 
// Module Name: mask
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


module mask(
  input RST,
  input clk100MHz, 
  input [2:0] floor_switch,
  input up_trigger,
  input down_trigger,
  output reg up_enabled_LED,
  output reg down_enabled_LED,
  input [7:0] inner_button,
  output [7:0] inner_button_enabled,
  input force_open,
  input force_close,
  output up_direction_LED,
  output down_direction_LED,
  output [7:0] AN,
  output [7:0] seg_data,
  output [5:0] gate_led
  );
  wire clk500Hz;
  clockWrapper clkwp0(clk100MHz, clk500Hz);
  parameter  D_UP   = 1'b0,
             D_DOWN = 1'b1;
  wire [1:0] direction;
  assign up_direction_LED = direction[D_UP];
  assign down_direction_LED = direction[D_DOWN];
  wire [2:0] state;
  wire [2:0] current_floor;
  reg [7:0] up, down;
  wire [7:0] up_enabled, down_enabled;
  wire [3:0] remaining_time;
  gate gt0(state, remaining_time, gate_led);
  sevenSeg sg0(current_floor, floor_switch, remaining_time, state, direction, 
              clk500Hz, AN, seg_data);
  main main0(RST, clk500Hz, up, down, up_enabled, down_enabled, inner_button,
             inner_button_enabled,
             direction, state, current_floor, force_open, force_close, 
             remaining_time);
  integer i;
  always @(*) begin
    for(i=0;i<8;i=i+1)begin
      up[i] = (floor_switch==i) && up_trigger && i!=7;
      down[i] = (floor_switch==i) && down_trigger && i!=0;
      up_enabled_LED = up_enabled[floor_switch];
      down_enabled_LED = down_enabled[floor_switch];
    end
  end

endmodule
