`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2017 06:42:32 PM
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
  reg clk;
  wire [3:0] Q;
  wire Qcc;
  main main0(clk, Q, Qcc);
  integer i;
  initial begin
    clk = 0;
    for(i = 0; i < 40; i=i+1) begin
      #30 clk = 1;
      #50 clk = 0;
      #20 ;
    end
  end
endmodule
