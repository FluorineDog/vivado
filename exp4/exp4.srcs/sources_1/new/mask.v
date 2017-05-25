`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2017 03:41:40 PM
// Design Name: 
// Module Name: mask
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


module mask(
    input clk_ori,
    output clk_out
    );
    reg [31:0] count;
    assign clk_out = count[27];
    initial 
        count <= 0;
    always @ (posedge clk_ori)
    begin
        count[31:0] = count[31:0] + 1;
    end
endmodule