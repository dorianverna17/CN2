`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 09:42:03 AM
// Design Name: 
// Module Name: counter_up_down_tb
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


module counter_up_down_tb();

    reg clk, reset, up_down;
    wire [3:0] out;

    initial begin
        clk = 0;
        forever #5 clk =~clk;
    end
    
    counter_up_down instance1(clk, reset, up_down, out);
    
    initial begin
    
        reset = 1;
        #5 reset = 0;
        #0 up_down = 1;
        #60 up_down = 0;
        #60 reset = 1; up_down = 1;
        #5 reset = 0;
    
    end
    
endmodule
