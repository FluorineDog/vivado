`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2017 09:22:29 PM
// Design Name: 
// Module Name: gate
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


module gate(
  input [2:0] state,
  input [3:0] remaining_time, 
  output reg [5:0] gate_led
  );
  localparam OPENING_STATE   = 3'h0,
             OPENED_STATE    = 3'h1,
             CLOSING_STATE   = 3'h2,
             STOP_STATE      = 3'h3,
             ACC_STATE       = 3'h4,
             ONGOING_STATE   = 3'h5,
             DEC_STATE       = 3'h6;
  parameter  OPEN_TIME         = 4,
             OPENED_DELAY      = 6,
             CLOSE_TIME        = 4;
             
  always @ (*) begin
    case(state) 
      ACC_STATE, ONGOING_STATE,
      DEC_STATE, STOP_STATE:
        gate_led = 6'b111111;
      OPENED_STATE: 
        gate_led = 6'b000000;
      CLOSING_STATE: 
        case(remaining_time)
          0:   gate_led = 6'b111111;
          1:   gate_led = 6'b110011;
          2:   gate_led = 6'b100001;
          3:   gate_led = 6'b000000;
          default: gate_led = 6'b000000;
        endcase
      OPENING_STATE: 
        case(remaining_time)
          3:   gate_led = 6'b111111;
          2:   gate_led = 6'b110011;
          1:   gate_led = 6'b100001;
          0:   gate_led = 6'b000000;
          default: gate_led = 6'b111111;
        endcase
      default: gate_led = 6'b110011;
    endcase
  end
endmodule
