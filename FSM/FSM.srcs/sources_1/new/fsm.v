`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/31/2017 09:38:12 PM
// Design Name: 
// Module Name: fsm
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

module fsm(
  // Inputs
  input wire Clock,
  input wire Reset,
  input wire x,
  // Outputs
  output Output1,
  output [2:0] Status,
  output reg bit
  );
 
  // State Encoding
  localparam STATE_Initial = 3'd0,
             STATE_1 = 3'd1,
             STATE_2 = 3'd2,
             STATE_3 = 3'd3,
             STATE_4 = 3'd5,
             STATE_5 = 3'd4,
             STATE_6_PlaceHolder = 3'd6,
             STATE_7_PlaceHolder = 3'd7;
  // State reg Declarations
  reg [2:0] CurrentState;
  reg [2:0] NextState;

  // Outputs
  // 1 -bit outputs
  assign Output1 = (CurrentState==STATE_5);
  assign Status = CurrentState;
//  // multi-bit outputs
//  always@ (*) begin
//    Status = 3’b000;
//    case ( CurrentState )
//      STATE_2: begin
//        Status = 3’b010;
//      end
//      STATE_3: begin
//        Status = 3’b011;
//      end
//    endcase
//  end 
  // Synchronous State - Transition always@ ( posedge Clock ) block
  initial begin
    CurrentState = STATE_Initial;
    NextState = STATE_Initial;
  end
  always@(posedge Clock) begin
    bit <= x;
  end
  always@ ( posedge Clock ) begin
    if ( Reset ) CurrentState <= STATE_Initial;
    else CurrentState <= NextState;
  end
  // Conditional State - Transition always@ ( * ) block
  always@ (*) begin
    case(CurrentState)
      STATE_Initial: 
        NextState = (x)? STATE_1:STATE_Initial;
      STATE_1:
        NextState = (x)? STATE_1:STATE_2;
      STATE_2: 
        NextState = (x)? STATE_3:STATE_Initial;
      STATE_3: 
        NextState = (x)? STATE_4:STATE_2;
      STATE_4: 
        NextState = (x)? STATE_3:STATE_5;
      STATE_5: 
        NextState = (x)? STATE_1:STATE_Initial;
      STATE_6_PlaceHolder: 
        NextState = STATE_Initial;
      STATE_7_PlaceHolder: 
        NextState = STATE_Initial;
    endcase
  end
endmodule