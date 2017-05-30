`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2017 11:12:01 AM
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
    input in,
    input clk,
    output y
    );
    wire q0, nq0, q1, nq1;
    wire w1;
    tff tff0(1, clk, 1, q0, nq0);
    xor xor1(w1, in, q0);
    tff tff1(w1, clk, 1, q1, nq1);
    nand nand1(y, in, nq1);
endmodule