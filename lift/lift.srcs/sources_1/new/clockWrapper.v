`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2017 03:43:49 PM
// Design Name: 
// Module Name: clockWrapper
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


module clockWrapper(
  input clk100MHz,  
  output clk250Hz
  );
  reg [31:0] counter;
  initial begin
    counter = 1;
  end
  always@ (posedge clk100MHz) begin
    counter <= (counter >= 400_000) ? 0:(counter+1);
  end
  assign clk250Hz = (counter<20000);
endmodule
