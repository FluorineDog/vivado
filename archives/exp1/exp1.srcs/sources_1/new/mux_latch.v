`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2017 01:52:32 AM
// Design Name: 
// Module Name: mux_latch
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

module mux_latch( 
    input   [3:0] data, 
    input   [1:0] valid, 
    input   flag, 
    output reg valid_data); 
initial begin 
    valid_data=1'b0; 
    end 
always @ (*) 
if(flag) begin 
    case(valid) 
        2'b00 : begin valid_data = data[0];end 
        2'b01 : begin valid_data = data[1];end 
        2'b10 : begin valid_data = data[2];end 
        2'b11 : begin valid_data = data[3];end 
     endcase
end 
else begin
    valid_data = 1'b0; 
end 
endmodule