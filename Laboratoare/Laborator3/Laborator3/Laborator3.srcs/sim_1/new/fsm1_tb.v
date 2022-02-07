`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 12:46:55 PM
// Design Name: 
// Module Name: fsm1_tb
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


module fsm1_tb();

    reg clk, reset, in;
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    fsm1 instance1(clk, reset, in, out);
    
    initial begin
    
        reset = 1;
        #3 reset = 0; in = 0;
        #10 in = 1;
        #5 in = 0;
        #5 in = 1;
        #5 in = 0;
        #5 in = 0;
        
        #20 in = 1;
        #5 in = 1;
        #10 in = 0;
        #10 in = 1;
        #5 in = 1;
        #5 in = 0;
        #5 in = 1;
        #5 in = 0;
    
    end
endmodule
