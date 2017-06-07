`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2017 10:31:55 AM
// Design Name: 
// Module Name: addtionalStateHelper
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


module addtionalStateHelper(
  input clk250Hz,
  input [7:0] up,
  input [7:0] down,
  input [7:0] inner_button,
  input [3:0] current_floor,
  input [2:0] st,
  output reg [7:0] up_enabled,
  output reg [7:0] down_enabled,
  output reg [7:0] inner_button_enabled,
  output reg direction 
  );
  wire up_request;
  wire down_request;
  parameter DIRECT_UP   = 1'b0,
            DIRECT_DOWN = 1'b1;
  wire [7:0] floor_mask = (isStoping) ? (1<<current_floor) : 8'b0;
  initial begin
    up_enabled = 0;
    down_enabled = 0;
    direction = DIRECT_UP;
  end
  assign up_request = 
    ((up_enabled | down_enabled | inner_button_enabled) 
      >> (current_floor + 0)) != 8'b0;
  assign down_request = 
    ((up_enabled | down_enabled | inner_button_enabled) 
      >> (7 - current_floor)) != 8'b0;
  
  always @ (posedge clk250Hz) begin 
    up_enabled <= (up | up_enabled) & ~((direction == DIRECT_UP)? floor_mask : 8'b0);
    down_enabled <= (down | down_enabled) & ~((direction == DIRECT_DOWN)? floor_mask : 8'b0);
    inner_button_enabled <= (inner_button | inner_button_enabled) & ~floor_mask; 
    if(direction == DIRECT_UP) begin
      if(!up_request)
        direction <= (down_request) ? DIRECT_DOWN : DIRECT_UP;
      else 
        direction <= DIRECT_UP;
    end
    else begin 
      if(!down_request)
        direction <= (up_request)   ? DIRECT_UP : DIRECT_DOWN;
      else 
        direction <= DIRECT_DOWN;
    end
  end
endmodule
