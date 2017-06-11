`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2017 04:27:10 PM
// Design Name: 
// Module Name: unix
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


module unix(
  input clk500Hz, 
  output reg [31:0] timestamp
  );
  reg [31:0] counter;
  initial begin
    timestamp = 0;
    counter = 12;
  end
  always @ (posedge clk500Hz)  begin
    if(counter[9]) begin
      counter <= 12;
      timestamp <= timestamp + 1;
    end
    else begin
      counter <= counter + 1;
    end 
      
  end
endmodule
