`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2017 11:30:09 AM
// Design Name: 
// Module Name: sevenSegDigit
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


module sevenSegDigit(
  input [3:0] digit, 
  output [7:0] seg_data
  );
  always @(digit)
  case (digit)
      4'h0: seg_data = 8'b00000011;
      4'h1: seg_data = 8'b10011111;
      4'h2: seg_data = 8'b00100101;
      4'h3: seg_data = 8'b00001101;
      4'h4: seg_data = 8'b10011001;
      4'h5: seg_data = 8'b01001001;
      4'h6: seg_data = 8'b01000001;
      4'h7: seg_data = 8'b00011111;
      4'h8: seg_data = 8'b00000001; 
      4'h9: seg_data = 8'b00001001;
      4'hA: seg_data = 8'b00010001;
      4'hb: seg_data = 8'b11000001;
      4'hC: seg_data = 8'b01100011;
      4'hd: seg_data = 8'b10000101;
      4'hE: seg data = 8'b01100001;
      4'hF: seg data = 8'b01110001;
   default: 
            seg_data = 8'b11111101;
  endcase
endmodule
