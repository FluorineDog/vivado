`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2017 03:23:57 AM
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
  reg in;
  reg clk;
  integer k;
  wire q1, q2, sig_syn;
  pipe3b pipe3b1(in, clk, q1, q2, sig_syn);
  initial
  begin
    k = 1;
    in = 0;
  end
  
initial 
  begin
  forever begin
    #5120 clk <= 0;
    #5120 clk <= 1;
    end
  end
  
  always @ (*)
  begin
    #2000000000 k <= (355 * k) %1027;
    in <= (k>>5) & 1;
  end
  
endmodule
