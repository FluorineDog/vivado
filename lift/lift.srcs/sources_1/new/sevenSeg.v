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
  input [3:0] timer,     
  input clk,      // require : 1ms-4ms period
  output reg [7:0] AN,
  output reg [7:0] seg_data
  );
  reg [2:0] choose;
  wire [7:0] lift_floor_seg;
  wire [7:0] timer_seg;
  integer i;  

  sevenSegDigit ssd0({1'b0, lift_floor[2:0]}, lift_floor_seg);
  sevenSegDigit ssd1(timer, timer_seg);

  initial begin
    choose = 0;
  end

  always @(*) begin
    for(i=0;i<8;i=i+1)begin
      AN[i]=(choose!=i);
    end
    case(choose)
      'h0:     seg_data = lift_floor_seg;
      'h7:     seg_data = timer_seg;
      default  seg_data = 8'b11111101;
    endcase
  end
  
  always @(posedge clk) begin
    choose <= choose + 1;
  end
endmodule
