`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2017 10:46:13 PM
// Design Name: 
// Module Name: tb_fsm
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


module tb_fsm(
  );
  reg clk;
  reg x;
  wire out1;
  wire [2:0] state;
  wire bit;
  fsm fsm0(clk, 0, x, out1, state, bit);
  initial begin
    x = 0;
    clk = 0; #5
    clk = 1; #5 
    clk = 0; #5
    clk = 1; #5 
    clk = 0; #5
    clk = 1; #5 
    clk = 0; #5
    clk = 1; #5 
    clk = 0; #5

    clk = 1; #5
    clk = 0; #2
    
    x = 1;   #3
    clk = 1; #5
    clk = 0; #2

    x = 1;   #3
    clk = 1; #5
    clk = 0; #2

    x = 1;   #3
    clk = 1; #5
    clk = 0; #2

    x = 0;   #3
    clk = 1; #5
    clk = 0; #2

    x = 1;   #3
    clk = 1; #5
    clk = 0; #2

    x = 1;   #3
    clk = 1; #5
    clk = 0; #2

    x = 0;   #3
    clk = 1; #5
    clk = 0; #2

    x = 1;   #3
    clk = 1; #5
    clk = 0; #2

    x = 1;   #3
    clk = 1; #5
    clk = 0; #2

    x = 0;   #3
    clk = 1; #5
    clk = 0; #2

    x = 1;   #3
    clk = 1; #5
    clk = 0; #2

    x = 1;   #3
    clk = 1; #5
    clk = 0; #2

    x = 0;   #3
    clk = 1; #5
    clk = 0; #2
    
    x = 0;   #3
    clk = 1; #5
    clk = 0; #2

    x = 0;   #3
    clk = 1; #5
    clk = 0; #5 ;
  end
endmodule
