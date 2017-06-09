`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2017 11:23:32 AM
// Design Name: 
// Module Name: sevenSeg
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


module sevenSeg(
  input [2:0] lift_floor, 
  input [2:0] switch_floor, 
  input [3:0] timer,     
  input [2:0] state,
  input [1:0] direction, 
  input clk,      // require : 1ms-4ms period
  output reg [7:0] AN,
  output reg [7:0] seg_data
  );
  reg [2:0] choose;
  wire [7:0] lift_floor_seg;
  wire [7:0] timer_seg;
  wire [7:0] gravity_seg;
  wire [7:0] switch_floor_seg;

  integer i;  

  sevenSegFloor ssd0(lift_floor, lift_floor_seg);
  sevenSegDigit ssd1(timer, timer_seg);
  sevenSegGravity ssg2(state, direction, gravity_seg);
  sevenSegFloor ssd3(switch_floor, switch_floor_seg);
  initial begin
    choose = 0;
  end

  always @(*) begin
    for(i=0;i<8;i=i+1)begin
      AN[i]=(choose!=i);
    end
    case(choose)
      'h7:      seg_data = switch_floor_seg;
      'h4:      seg_data = gravity_seg; 
      'h2:      seg_data = lift_floor_seg;
      'h0:      seg_data = timer_seg;
      default   seg_data = 8'b11111101;
    endcase
  end
  
  always @(posedge clk) begin
    choose <= choose + 1;
  end
endmodule
