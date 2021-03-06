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
  input RST_status,
  input clk500Hz,
  input [7:0] up,
  input [7:0] down,
  input [7:0] inner_button,
  input [2:0] current_floor,
  output [2:0] next_floor,
  input isStopping,
  output reg [7:0] up_enabled,
  output reg [7:0] down_enabled,
  output reg [7:0] inner_button_enabled,
  input [1:0] direction,
  output [1:0] nextDirection,
  output accCond
  );
  wire up_request;
  wire down_request;
  assign accCond = up_request || down_request;
  parameter D_UP   = 1'b0,
            D_DOWN = 1'b1;
  wire [7:0] floor_mask = isStopping?1<<current_floor:0;
  initial begin
    up_enabled = 0;
    down_enabled = 0;
    inner_button_enabled = 0;
  end
  assign up_request = 
    up_enabled[isStopping ? current_floor : next_floor] 
    || ((up_enabled | down_enabled | inner_button_enabled) 
      >> (current_floor + 1)) != 8'b0;
  assign down_request = 
    down_enabled[isStopping ? current_floor : next_floor] 
    || ((up_enabled | down_enabled | inner_button_enabled) 
      << (8 - current_floor)) != 8'b0;

  assign next_floor = (direction[D_DOWN])? current_floor - 1:
                      (direction[D_UP])  ? current_floor + 1: current_floor;
  assign nextDirection[D_UP]   = (!direction[D_DOWN]||!down_request) && up_request; //prefer up 
  assign nextDirection[D_DOWN] = (direction[D_DOWN]||!up_request) && down_request; 

  always @ (posedge clk500Hz) begin 
    if(RST_status) begin 
      up_enabled <= 0;
      down_enabled <= 0;
      inner_button_enabled <= 0;
    end
    else begin 
      up_enabled <= (up | up_enabled) & ~((!direction[D_DOWN])? floor_mask : 8'b0);
      down_enabled <= (down | down_enabled) & ~((!direction[D_UP])? floor_mask : 8'b0);
      inner_button_enabled <= (inner_button | inner_button_enabled) & ~floor_mask; 
    end
  end
endmodule
