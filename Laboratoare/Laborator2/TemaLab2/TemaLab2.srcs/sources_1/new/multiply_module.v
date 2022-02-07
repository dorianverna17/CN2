`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 12:54:28 AM
// Design Name: 
// Module Name: multiply_module
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


module multiply_module(A, B, P);
    
    input [15:0] A, B;
    output [31:0] P;
    
    assign P = A * B;
    
endmodule
