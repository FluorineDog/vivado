`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/09/2017 04:34:33 PM
// Design Name: 
// Module Name: sevenSegFloor
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


module sevenSegFloor(
  input [2:0] floor, 
  output reg [7:0] seg_data
  );
  always @(*) begin 
    case (floor)
      4'h0: seg_data = 8'b00000011;
      4'h1: seg_data = 8'b10011111;
      4'h2: seg_data = 8'b00100101;
      4'h3: seg_data = 8'b00001101;
      4'h4: seg_data = 8'b10011001;
      4'h5: seg_data = 8'b01001001;
      4'h6: seg_data = 8'b01000001;
      4'h7: seg_data = 8'b00011111;
 
//      // 4'h0: seg_data = 8'b00000011;
//      4'h0: seg_data = 8'b10011111;
//      4'h1: seg_data = 8'b00100101;
//      4'h2: seg_data = 8'b00001101;
//      4'h3: seg_data = 8'b10011001;
//      4'h4: seg_data = 8'b01001001;
//      4'h5: seg_data = 8'b01000001;
//      4'h6: seg_data = 8'b00011111;
//      4'h7: seg_data = 8'b00000001; 
      default: 
            seg_data = 8'b11111101;
    endcase
  end

endmodule
