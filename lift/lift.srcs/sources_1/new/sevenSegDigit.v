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
      4'h0: seg_data = 8'b0000001;
      4'h1: seg_data = 8'b1001111;
      4'h2: seg_data = 8'b0010010;
      4'h3: seg_data = 8'b0000110;
      4'h4: seg_data = 8'b1001100;
      4'h5: seg_data = 8'b0100100;
      4'h6: seg_data = 8'b0100000;
      4'h7: seg_data = 8'b0001111;
      4'h8: seg_data = 8'b0000000; 
      4'h9: seg_data = 8'b0000100;
      4'hA: seg_data = 8'b0001000;
      4'hb: seg_data = 8'b1100000;
      4'hC: seg_data = 8'b0110001;
      4'hd: seg_data = 8'b1000010;
      4'hE: seg data = 8'b0110000;
      4'hF: seg data = 8'b0111000;
   default: 
            seg_data = 8'b0000001;
  endcase
endmodule
