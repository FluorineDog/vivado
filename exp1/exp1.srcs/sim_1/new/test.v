`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2017 09:57:11 AM
// Design Name: 
// Module Name: test
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


module test(

    );
    reg [3:0] data_reg;
    reg [1:0] valid_reg;
    reg flag_reg;

    wire valid_data_wire;

    integer i;
    
    mux_latch mux1(data_reg, valid_reg, flag_reg, valid_data_wire);
    initial
    begin
      for(i = 0; i < 128; i=i+1) 
      begin
        #50 data_reg[3:0] = i & 15;
        valid_reg[1:0] = (i>>4) & 3;
        flag_reg = (i>>6) & 1;
        if(valid_data_wire == 0) 
            $display("killing ", $time, i);
        else 
            $display("saving  ", $time, i);
      end
    end
endmodule
