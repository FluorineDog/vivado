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
  input clk500Hz, 
  input [7:0] up,
  input [7:0] down,
  output [7:0] up_enabled,
  output [7:0] down_enabled,
  input [7:0] inner_button,
  output [7:0] inner_button_enabled,

  output reg [1:0] direction,
  output reg [2:0] state,
  output reg [2:0] current_floor,
  input force_open,
  input force_close,
//  output accCond, decCond, closeCond, openCond, timeoutCond,
  output [3:0] remaining_time
  );
  localparam OPENING_STATE   = 3'h0,
             OPENED_STATE    = 3'h1,
             CLOSING_STATE   = 3'h2,
             STOP_STATE      = 3'h3,
             ACC_STATE       = 3'h4,
             ONGOING_STATE   = 3'h5,
             DEC_STATE       = 3'h6;

  parameter  OPEN_TIME         = 2,
             OPENED_DELAY      = 6,
             CLOSE_TIME        = 2,
             ACC_TIME          = 2,
             DEC_TIME          = 2,
             CHECKFLOOR_TIME   = 4,
             TRANSFLOOR_TIME   = 5,
             STOP_DELAY        = 1;
  reg [2:0] newState;
  reg RST_status;
//  reg [2:0] state;
  reg [31:0] duetime;
//  reg [1:0] direction;
  wire [1:0] nextDirection;
  wire isStopping;
  wire accCond, decCond, closeCond, openCond, timeoutCond;
  wire [2:0] next_floor;
  wire [31:0] unix_timestamp;
  assign isStopping = state <= STOP_STATE;
  addtionalStateHelper ash0(RST_status, clk500Hz, up, down, inner_button, 
                        current_floor, next_floor, isStopping,
                        up_enabled, down_enabled, inner_button_enabled, 
                        direction, nextDirection, accCond);
  openCondition opc0(RST_status, state, current_floor, up, down, direction, force_open, force_close, 
                     openCond, closeCond);
  decCondition decC0(next_floor, direction, up_enabled, down_enabled, inner_button, decCond);
  unix ux0(clk500Hz, unix_timestamp);
  assign timeoutCond = unix_timestamp >= duetime;
  assign remaining_time = (timeoutCond)? 0:(duetime - unix_timestamp);

  initial begin
    RST_status = 0;
    state = STOP_STATE;
    direction = 0;
    duetime = 0;
    current_floor = 0;
    delay = 0;
  end
  reg [2:0] updateFloor;

  always @ (posedge clk500Hz) begin
    if(timeoutCond) begin 
      case (state)
        STOP_STATE    : begin
            if(accCond) begin
              newState <= ACC_STATE;
              duetime <= unix_timestamp + ACC_TIME;
            end
          end
        OPENING_STATE : begin
            newState <= OPENED_STATE;
            duetime <= unix_timestamp + OPENED_DELAY;
          end
        OPENED_STATE  : begin
            newState <= CLOSING_STATE;
            duetime <= unix_timestamp + CLOSE_TIME;
          end
        CLOSING_STATE : begin
            newState <= STOP_STATE;
            duetime <= unix_timestamp + STOP_DELAY;
          end
        ACC_STATE     : begin
            newState <= ONGOING_STATE;
            duetime <= unix_timestamp + CHECKFLOOR_TIME;
          end
        ONGOING_STATE : begin
            if(decCond) begin
              newState <= DEC_STATE;
              duetime <= unix_timestamp + DEC_TIME;
            end
            else begin
              updateFloor <= next_floor;
              newState <= ONGOING_STATE;
              duetime <= unix_timestamp + TRANSFLOOR_TIME;
            end
          end
        DEC_STATE     : begin
            updateFloor <= next_floor;
            newState <= OPENING_STATE;
            duetime <= unix_timestamp + OPEN_TIME;
         end
        default       : begin
            newState <= STOP_STATE;
          end
      endcase
    end
    else if(openCond) begin 
      case(state)
        STOP_STATE: begin
          newState <= OPENING_STATE;
          duetime <= unix_timestamp + OPEN_TIME;
        end  
        OPENED_STATE  : begin
          newState <= OPENED_STATE;
          duetime <= unix_timestamp + OPENED_DELAY;
        end
        CLOSING_STATE : begin
          newState <= OPENING_STATE;
          duetime <= unix_timestamp + unix_timestamp + OPEN_TIME - duetime + 1;
        end
      endcase 
    end
    else if (closeCond) begin
      if(state == OPENED_STATE) begin 
        newState <= CLOSING_STATE;
        duetime <= unix_timestamp + CLOSE_TIME;
      end
    end
  end

  always @ (posedge clk500Hz or negedge RST) begin
    if(!RST) begin 
      RST_status <= 1;
    end
    else begin 
      RST_status <= RST_status && !(state == STOP_STATE);
    end
  end
//  always @ (posedge clk500Hz) begin
//    if(isStopping) begin
//      direction <= nextDirection;
//    end
//    else begin
//      direction <= direction;
//      end
//    if(timeoutCond || openCond || closeCond) begin
//      state <= newState;
//      current_floor <= updateFloor;
//      duetime <= unix_timestamp + delay;
//    end
//    else begin 
//      state <= state;
//      current_floor <= current_floor;
//      duetime <= duetime;
//    end
//  end
endmodule
