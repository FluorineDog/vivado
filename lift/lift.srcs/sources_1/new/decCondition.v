`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2017 10:54:19 AM
// Design Name: 
// Module Name: decCondition
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


module decCondition(
  input [2:0] next_floor, 
  input [1:0] direction,
  input [7:0] up_enabled,
  input [7:0] down_enabled, 
  input [7:0] inner_button_enabled,
  output reg decCond
  );
  parameter D_UP   = 1'b0,
            D_DOWN = 1'b1;
  always @(*) begin
    if(direction[D_UP]) begin
      decCond = (up_enabled[next_floor]|inner_button_enabled[next_floor]) 
        || !(up_enabled|inner_button_enabled|down_enabled)>>(1+next_floor);
    end 
    else if(direction[D_DOWN]) begin
      decCond = (down_enabled[next_floor] |inner_button_enabled[next_floor])
        || !(up_enabled|inner_button_enabled|down_enabled)>>(8-next_floor);
    end
    else 
      decCond = 0;
  end
endmodule
