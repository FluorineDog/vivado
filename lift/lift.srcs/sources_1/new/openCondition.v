`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2017 10:54:19 AM
// Design Name: 
// Module Name: openCondition
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


module openCondition(
  input RST_status,
  input [2:0] state,
  input [2:0] current_floor,
  input [7:0] up, 
  input [7:0] down,
  input [1:0] direction,
  input force_open,
  input force_close, 
  output openCond, 
  output closeCond
  );
  localparam OPENING_STATE   = 3'h0,
             OPENED_STATE    = 3'h1,
             CLOSING_STATE   = 3'h2,
             STOP_STATE      = 3'h3,
             ACC_STATE       = 3'h4,
             ONGOING_STATE   = 3'h5,
             DEC_STATE       = 3'h6;
  parameter D_UP   = 1'b0,
            D_DOWN = 1'b1;
  assign openCond = !RST_status && (state==OPENED_STATE || state==STOP_STATE || state==CLOSING_STATE)  
                    && (force_open || (up[current_floor] && !direction[D_DOWN])
                                   || (down[current_floor] && !direction[D_UP])) ;

  assign closeCond = !RST_status && (state==OPENED_STATE) && force_close;
endmodule
