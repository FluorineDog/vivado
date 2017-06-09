`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2017 03:14:49 PM
// Design Name: 
// Module Name: sevenSegGravity
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


module sevenSegGravity(
  input [2:0] state,
  input [1:0] direction,
  output reg [7:0] seg_data
  );
  parameter  OPENING_STATE   = 3'h0,
             OPENED_STATE    = 3'h1,
             CLOSING_STATE   = 3'h2,
             STOP_STATE      = 3'h3,
             ACC_STATE       = 3'h4,
             ONGOING_STATE   = 3'h5,
             DEC_STATE       = 3'h6;
  parameter  D_UP   = 1'b0,
             D_DOWN = 1'b1;


  always @(*) begin 
    case(state)
      OPENING_STATE,
      OPENED_STATE, 
      CLOSING_STATE, 
      STOP_STATE: seg_data = 8'b1111_1101;
      ONGOING_STATE: 
          seg_data = (direction[D_UP]) ? 8'b0111_1111:8'b1110_1111;
      ACC_STATE: 
          seg_data = (direction[D_UP]) ? 8'b0011_1011:8'b1100_0111;
      DEC_STATE: 
          seg_data = (direction[D_UP]) ? 8'b1011_1001:8'b1101_0101;
      default:
          seg_data = 8'b1111_1110;
    endcase 
  end
endmodule
