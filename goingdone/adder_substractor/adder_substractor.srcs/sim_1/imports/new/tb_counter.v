`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2017 03:20:22 PM
// Design Name: 
// Module Name: tb_counter
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


module tb_counter(
  );
  reg clk;
  reg clear;
  reg M;
  reg [3:0] base;
  reg LD;
  wire [3:0] Q;
  wire Qcc;
  counter counter0(clk, clear, M, base, LD, Q, Qcc);
  integer i;
  initial begin
    clear = 1; 
    M = 0;
    base[3:0] = 4'b1011;
    LD = 1;
    for(i = 0; i < 40; i=i+1) begin
      #30 clk = 1;
      #50 clk = 0;
      #20 ;
    end
    clear = 0;
    for(i = 0; i < 2; i=i+1) begin
      #30 clk = 1;
      #50 clk = 0;
      #20 ;
    end
    clear = 1;
    for(i = 0; i < 6; i=i+1) begin
      #30 clk = 1;
      #50 clk = 0;
      #20 ;
    end
    LD = 0;
    for(i = 0; i < 2; i=i+1) begin
      #30 clk = 1;
      #50 clk = 0;
      #20 ;
    end
    LD = 1;
    for(i = 0; i < 2; i=i+1) begin
      #30 clk = 1;
      #50 clk = 0;
      #20 ;
    end
    M = 1;
    for(i = 0; i < 40; i=i+1) begin
      #30 clk = 1;
      #50 clk = 0;
      #20 ;
    end
  end
endmodule
