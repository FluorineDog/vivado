`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/01/2017 12:48:44 PM
// Design Name:  
// Module Name: tb_main
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


module tb_main(
  ); 
  reg [5:0] test;
  wire [3:1] F;
  main main0(test[5:3], test[2:0], F);
  integer i;
  initial begin
    test = 0;
    for(i=0; i<64; i=i+1) begin
      #10 test = test + 1;
    end
  end
endmodule
