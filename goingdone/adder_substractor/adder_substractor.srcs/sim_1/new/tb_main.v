`timescale 1ns / 100ps
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
  reg LD;
  wire [3:0] Q;
  wire Qcc;
  main main0(clk, LD, Q, Qcc);
  integer i;
  initial begin
    clk = 0;
    LD = 1;
    for(i = 0; i < 5; i=i+1) begin
      #30 clk = 1;
      #50 clk = 0;
      #20 ;
    end
    LD = 0;
    for(i = 0; i < 5; i=i+1) begin
      #30 clk = 1;
      #50 clk = 0;
      #20 ;
    end
    LD = 1;
    for(i = 0; i < 100; i=i+1) begin
      #30 clk = 1;
      #50 clk = 0;
      #20 ;
    end
  end
endmodule