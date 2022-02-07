`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2021 10:53:04 PM
// Design Name: 
// Module Name: d_flip_flop_tb
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


module d_flip_flop_tb();
    
    reg [31:0]d;
    reg clk, reset;
    wire [31:0]out1;
    
    d_flip_flop instance1(d, clk, reset, out1);
    
    initial begin
    
        clk = 0;
        forever #5 clk = ~clk;
    
    end
    
    initial begin
    
        #0 reset = 1; d = 32'd4;
        #10 reset = 0;
        #20 d = 32'd6;
        #20 d = 32'd16;
    
    end
    
endmodule
