`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2021 03:12:33 PM
// Design Name: 
// Module Name: halfadder_tb
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


module halfadder_tb();

    reg x, y;
    
    halfadder instance1(x, y, s, cout);
    
    initial begin
        #0 x = 0; y = 0;
        #20 x = 0; y = 1;
        #20 x = 1; y = 0;
        #20 x = 1; y = 1;
    end
endmodule
