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

  parameter  OPEN_TIME         = 3,
             OPENED_DELAY      = 6,
             CLOSE_TIME        = 3,
             ACC_TIME          = 4,
             DEC_TIME          = 4,
             CHECKFLOOR_TIME   = 6,
             TRANSFLOOR_TIME   = 10,
             STOP_DELAY        = 2;
  reg RST_status;
  reg [31:0] duetime;
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
  decCondition decC0(next_floor, direction, up_enabled, down_enabled, inner_button_enabled, decCond);
  unix ux0(clk500Hz, unix_timestamp);
  assign timeoutCond = unix_timestamp >= duetime;
  assign remaining_time = (timeoutCond)? 0:(duetime - unix_timestamp);

  initial begin
    RST_status = 0;
    state = STOP_STATE;
    direction = 0;
    duetime = 0;
    current_floor = 0;
  end

  always @ (posedge clk500Hz) begin
    if(openCond) begin 
      case(state)
        STOP_STATE: begin
          direction <= nextDirection;
          state <= OPENING_STATE;
          duetime <= unix_timestamp + OPEN_TIME;
        end  
        OPENED_STATE  : begin
          state <= OPENED_STATE;
          duetime <= unix_timestamp + OPENED_DELAY;
        end
        CLOSING_STATE : begin
          state <= OPENING_STATE;
          duetime <= unix_timestamp + unix_timestamp + OPEN_TIME - duetime;
        end
      endcase 
    end
    else if (closeCond) begin
      state <= CLOSING_STATE;
      duetime <= unix_timestamp + CLOSE_TIME;
    end
    else if(timeoutCond) begin 
      case (state)
        STOP_STATE    : begin
            direction <= nextDirection;
            if(accCond) begin
              state <= ACC_STATE;
              duetime <= unix_timestamp + ACC_TIME;
            end
          end
        OPENING_STATE : begin
            state <= OPENED_STATE;
            duetime <= unix_timestamp + OPENED_DELAY;
          end
        OPENED_STATE  : begin
            direction <= nextDirection;
            state <= CLOSING_STATE;
            duetime <= unix_timestamp + CLOSE_TIME;
          end
        CLOSING_STATE : begin
            state <= STOP_STATE;
            duetime <= unix_timestamp + STOP_DELAY;
          end
        ACC_STATE     : begin
            state <= ONGOING_STATE;
            duetime <= unix_timestamp + CHECKFLOOR_TIME;
          end
        ONGOING_STATE : begin
            if(decCond) begin
              state <= DEC_STATE;
              duetime <= unix_timestamp + DEC_TIME;
            end
            else begin
              current_floor <= next_floor;
              state <= ONGOING_STATE;
              duetime <= unix_timestamp + TRANSFLOOR_TIME;
            end
          end
        DEC_STATE     : begin
            direction <= nextDirection;
            current_floor <= next_floor;
            if(!RST_status) begin
              state <= OPENING_STATE;
              duetime <= unix_timestamp + OPEN_TIME;
            end
            else begin
              state <= STOP_STATE;
            end
         end
        default       : begin
            state <= STOP_STATE;
          end
      endcase
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
endmodule
