`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 12:52:29 AM
// Design Name: 
// Module Name: substract_module
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


module substract_module(A, B, S);
    
    input [31:0] A, B;
    output [31:0] S;
    
    assign S = A - B;
    
endmodule

