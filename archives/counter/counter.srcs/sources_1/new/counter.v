`timescale 1ns / 100ps
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
    output reg [3:0] Q, 
    output reg Qcc
  );
  initial begin
    Q[3:0] = 0;
    Qcc = 0;
  end
  always @ (posedge clk) begin
    Qcc <= (M==0)? Q==4'b1111 : Q==0;
  end
  always @ (posedge clk or negedge clear or negedge LD) begin
    if(clear==0)
      Q[3:0] <= 4'b0000;
    else if (LD==0) begin 
      Q[3:0] <= base[3:0];
    end
    else begin
      if(M==0)
        Q[3:0] <= Q[3:0] + 1;
      else 
        Q[3:0] <= Q[3:0] - 1;
    end
  end
endmodule
