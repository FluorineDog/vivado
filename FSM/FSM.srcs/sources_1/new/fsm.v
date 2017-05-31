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
  input wire A,
  input wire B,
  // Outputs
  output wire Output1,
  output wire Output2,
  output reg [2:0] Status
  );
 
  // State Encoding
  localparam STATE_Initial = 3'd0,
             STATE_1 = 3'd1,
             STATE_2 = 3'd2,
             STATE_3 = 3'd3,
             STATE_4 = 3'd4,
             STATE_5_PlaceHolder = 3'd5,
             STATE_6_PlaceHolder = 3'd6,
             STATE_7_PlaceHolder = 3'd7;
  // State reg Declarations
  reg [2:0] CurrentState;
  reg [2:0] NextState;

  // Outputs
  // 1 -bit outputs
  assign Output1 = ( CurrentState == STATE_1 ) | ( CurrentState == STATE_2 );
  assign Output2 = ( CurrentState == STATE_2 );
 
  // multi-bit outputs
  always@ ( * ) begin
    Status = 3’b000;
    case ( CurrentState )
      STATE_2: begin
        Status = 3’b010;
      end
      STATE_3: begin
        Status = 3’b011;
      end
    endcase
  end 
  // Synchronous State - Transition always@ ( posedge Clock ) block
  always@ ( posedge Clock ) begin
    if ( Reset ) CurrentState <= STATE_Initial;
    else CurrentState <= NextState;
  end
  // Conditional State - Transition always@ ( * ) block
  always@ ( * ) begin
    NextState = CurrentState;
    case(CurrentState)
      STATE_Initial: begin
        NextState = STATE_1;
      end
      STATE_1: begin
        if ( A & B ) NextState = STATE_2;
      end
      STATE_2: begin
        if ( A ) NextState = STATE_3;
      end
      STATE_3: begin
        if (! A & B ) NextState = STATE_Initial;
        else if ( A & ! B ) NextState = STATE_4;
      end
      STATE_4: begin
      end
      STATE_5_PlaceHolder: begin
        NextState = STATE_Initial;
      end
      STATE_6_PlaceHolder: begin
        NextState = STATE_Initial;
      end
      STATE_7_PlaceHolder: begin
        NextState = STATE_Initial;
      end
    endcase
  end
endmodule