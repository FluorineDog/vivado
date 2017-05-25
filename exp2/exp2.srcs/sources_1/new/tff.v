`timescale 1ns / 100ps
//-----------------------------------------------------
// Design Name : tff_sync_reset
// File Name   : tff_sync_reset.v
// Function    : T flip-flop sync reset
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module tff (
input t  , // Data Input
input clk   , // Clock Input
input reset , // Reset input
output reg q, // Q output
output nq
);
//-----------Code Starts Here---------
not not1(nq, q);
initial 
    q <= 1'b0;
always @ ( posedge clk)
if (~reset) begin
  q <= 1'b0;
end else if (t) begin
  q <= !q;
end
endmodule //End Of Module tff