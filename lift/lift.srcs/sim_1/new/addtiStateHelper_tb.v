`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/08/2017 09:46:31 AM
// Design Name: 
// Module Name: addtiStateHelper_tb
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


module addtiStateHelper_tb(
  );
  reg clk250Hz=0;
  reg [7:0] up;
  reg [7:0] down;
  reg [7:0] inner_button;
  reg [2:0] current_floor;
  reg isStopping;
  reg [1:0] direction;
  wire [2:0] next_floor;
  wire [7:0] up_enabled;
  wire [7:0] down_enabled;
  wire [7:0] inner_button_enabled;
  wire [1:0] nextDirection;
  parameter D_UP   = 1'b0,
            D_DOWN = 1'b1;
  addtionalStateHelper ash0(clk250Hz, up, down, inner_button, 
                        current_floor, next_floor, isStopping,
                        up_enabled, down_enabled, inner_button_enabled, 
                        direction, nextDirection);
  always #5 clk250Hz = ~clk250Hz;
  initial begin
    up = 0;
    down = 0;
    inner_button = 0;
    current_floor = 0;
    isStopping = 1;
    direction = 0;
    #100
    up =   8'b0010_0010;
    down = 8'b0110_1000;
    inner_button = 8'b0100_0000;
    #50 
    up = 0;
    down = 0;
    inner_button = 0;
    direction = nextDirection;
    isStopping = 0;
    #20
    current_floor = next_floor;
    #10
    isStopping = 1;
    #20 
    isStopping = 0;
    #10
    current_floor = next_floor;
    #20
    current_floor = next_floor;
    #20
    current_floor = next_floor;
    #20
    current_floor = next_floor;
    #10
    isStopping = 1;
    #20 
    isStopping = 0;
    #20
    current_floor = next_floor; //always updating when isStopping = 0;
    #10
    isStopping = 1;
    #20
    current_floor = next_floor; //always updating when isStopping = 0;
    #20
    current_floor = next_floor; //always updating when isStopping = 0;
  end
endmodule
