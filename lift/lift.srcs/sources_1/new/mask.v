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
  output up_enabled_LED,
  output down_enabled_LED,
  input [7:0] inner_button,
  output [7:0] inner_button_enabled,
  input force_open,
  input force_close,
  output [15:10] door,
  output [7:0] AN,
  output [7:0] seg_data,
  );
  wire clk250Hz;
  clockWrapper clkwp0(clk100MHz, clk250Hz);

  wire [1:0] direction;
  wire [2:0] state;
  wire [2:0] current_floor;
  wire [7:0] up, down;
  wire [7:0] up_enabled, down_enabled;
  wire [3:0] remaining_time;
  main main0(RST, clk250Hz, up, down, up_enabled, down_enabled, inner_button,
             inner_button_enabled,
             direction, state, current_floor, force_open, force_close, 
             remaining_time)
  integer i;
  always @(*) begin
    for(i=0;i<8;i+i+1)begin
      up[i] = (floor_switch==i) && up_trigger;
      down[i] = (floor_switch==i) && down_trigger;
      up_enabled_LED = up_enabled[floor_switch];
      down_enabled_LED = down_enabled[floor_switch];
    end
  end

endmodule
