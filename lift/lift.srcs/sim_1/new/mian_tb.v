`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2017 05:35:39 PM
// Design Name: 
// Module Name: mian_tb
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


module mian_tb(
  );
  reg RST = 1;
  reg clk250Hz = 0; 
  reg [7:0] up;
  reg [7:0] down;
  wire [7:0] up_enabled;
  wire [7:0] down_enabled;
  reg [7:0] inner_button;
  wire [7:0] inner_button_enabled;
  wire [1:0] direction;
  wire [2:0] state;
  wire [2:0] current_floor;
  reg force_open;
  reg force_close;
  // wire accCond, decCond, closeCond, openCond;
  wire timeoutCond;
  main main0(RST, clk250Hz, up, down, up_enabled, down_enabled, inner_button, inner_button_enabled,
            direction, state, current_floor, force_open, force_close, 
            // accCond, decCond, closeCond, openCond, 
            timeoutCond);
  always #2 clk250Hz = ~clk250Hz;
  initial begin
    up           = 0;
    down         = 0;
    inner_button = 0;
    force_open   = 0;
    force_close  = 0;
    #10000;
    up =   8'b1111_1111;
    down = 8'b1111_1111;
    inner_button = 8'b1111_1111;
    #10;
    up           = 0;
    down         = 0;
    inner_button = 0;
    #10000;
    force_close = 0;
    #100
    force_open = 0;
    #10;
    force_close = 0;
    #10000
    force_open = 0;
    #18000;
    RST = 1;
    #10;
    RST = 1;
    #200000;
  end
endmodule
