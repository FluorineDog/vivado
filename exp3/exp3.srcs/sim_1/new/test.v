`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2017 02:30:16 AM
// Design Name: 
// Module Name: test
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


module test(
  );
  integer i;
  reg tx;
  wire tz, q1, q2, q3, q4;
  main main1(tx, tz, q1, q2, q3, q4);
  initial 
  begin
    tx = 0;
    for(i=0;i<128;i=i+1)
    begin
      #20 tx=1'b1;
      #5  tx=1'b0;
    end
  end 
endmodule
