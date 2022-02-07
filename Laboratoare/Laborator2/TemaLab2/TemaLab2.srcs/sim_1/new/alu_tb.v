`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 01:23:38 AM
// Design Name: 
// Module Name: alu_tb
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


module alu_tb();

    reg [31:0]A, B;
    reg [2:0] F;
    wire [31:0] out;
    
    alu instance1(A, B, F, out);
    
    initial begin
    
        #0 A = 30; B = 15; F = 3;
        #20 A = 30; B = 15; F = 1;
        #20 A = 30; B = 15; F = 2;
        #20 A = 30; B = 15; F = 0;
        #20 A = 30; B = 15; F = 4;
        #20 A = 30; B = 15; F = 5;
        
    end
    
endmodule
