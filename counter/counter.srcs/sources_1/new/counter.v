`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2017 01:58:25 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input clear,
    input M,
    input [3:0] base,
    input LD, 
    output [3:0] Q, 
    output Qcc
  );
  reg [4:0] QS;
  assign Q[3:0] = QS[3:0];
  assign Qcc = QS[4]

  initial begin
    QS[4:0] <= 5'b10000;
  end
  
  always @ (posedge clk or negedge clk or negedge clear or negedge LD) begin
    if(clear==0)
      QS[3:0] <= 4'b0;
    else if (LD==0)
      QS[3:0] <= base[3:0];
    else if (clk == 0)
      QS[4] <= 1;
    else begin
      if(M==0)
        QS <= QS + 1;
      else 
        QS <= QS - 1;
    end
  end
endmodule
