`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2017 01:55:04 PM
// Design Name: 
// Module Name: main
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


module main(
  input clk,
  input clear,
  input M,
  input base[3:0],
  input LD, 
  output Q[3:0], 
  );
  reg QS[4:0];
  assign Q[3:0] = QS[3:0];
  always @ (posedge clk or negedge clear or negedge LD) begin
    if(clear==0)
      QS[3:0] <= 4'b0;
    else if (LD==0)
      QS[3:0] <= base[3:0];
    else begin
      if(M==0)
        QS <= QS + 1;
      else 
        QS <= QS - 1;
    end
  always @ (posedge Q[4] or negedge clk) begin
    
  end
endmodule
