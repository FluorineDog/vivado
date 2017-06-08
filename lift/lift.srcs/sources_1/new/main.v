`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/06/2017 10:54:19 AM
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
  input RST,
  input clk1Hz, 
  input [7:0] up,
  input [7:0] down,
  output [7:0] up_enabled,
  output [7:0] down_enabled,
  input [7:0] inner_button,
  output [7:0] inner_button_enabled,
  output [3:0] elevator_statue,
  output [2:0] current_floor,
  input force_open,
  input force_close,
  output reg [3:0] timer

  );
  localparam STOP_STATE      = 3'h0,
             OPENING_STATE   = 3'h1,
             OPENED_STATE    = 3'h2,
             CLOSING_STATE   = 3'h3,
             ACC_STATE       = 3'h4,
             ONGOING_STATE   = 3'h5,
             DEC_STATE       = 3'h6;

  parameter  OPEN_TIME         = 3,
             OPENED_DELAY      = 6,
             CLOSE_TIME        = 3,
             ACC_TIME          = 3,
             DEC_TIME          = 3,
             CHECKFLOOR_TIME   = 3,
             TRANSFLOOR_TIME   = 3,
             STOP_DELAY        = 0;
  reg [2:0] newState;
  reg [2:0] state;
  reg [31:0] delay;
  reg [31:0] duetime;
  reg [1:0] direction;
  wire [1:0] nextDirection;
  wire accCond;
  assign elevator_statue = {direction, state[2:0]};
  assign isStopping = state <= CLOSING_STATE;
  assign isDirectionChangable = (state == CLOSING_STATE) || (state == STOP_STATE);
  additionalStateHelper(clk250Hz, up, down, inner_button, 
                        current_floor, next_floor, isStopping,
                        up_enabled, down_enabled, inner_button_enabled, 
                        direction, nextDirection, );
  initial begin
    state = STOP_STATE;
  end

  reg [2:0] updateFloor;
  always @ (*) begin
    updateFloor = current_floor;
    case (state)
      STOP_STATE    : begin
          if(openCond) begin 
            newState = OPENING_STATE;
            delay = OPEN_TIME;
          end
          else if(accCond) begin
            newState = ACC_STATE;
            delay = ACC_TIME;
          end
        end
      OPENING_STATE : begin
          newState = OPENED_STATE;
          delay = OPEN_DELAY;
        end
      OPENED_STATE  : begin
          newState = CLOSING_STATE;
          delay = CLOSE_TIME;
        end
      CLOSING_STATE : begin
          if(openCond) begin
            newState = OPENING_STATE;
            delay = unixTime + OPEN_TIME - duetime;
          end
          else begin
            newState = STOP_STATE;
            delay = STOP_DELAY;
          end
        end
      ACC_STATE     : begin
          newState = ONGOING_STATE;
          delay = CHECKFLOOR_TIME;
        end
      ONGOING_STATE : begin
          if(decCond) begin
            updateFloor = next_floor;
            newState = DEC_STATE;
            delay = DEC_TIME;
          end
          else begin
            newState = ONGOING_STATE;
            delay = TRANSFLOOR_TIME;
          end
        end
      DEC_STATE     : begin
          updateFloor = next_floor;
          newState = STOP_STATE;
          delay = STOP_DELAY;
       end
      default       : begin
          newState = STOP_STATE;
        end
    endcase
  end
  always @ (posedge clk1Hz, negedge RST) begin 
    unixTime <= unixTime + 1;
    if(timeoutCond || openCond) begin
      state <= newState;
      current_floor <= updateFloor;
    end
  end
endmodule
