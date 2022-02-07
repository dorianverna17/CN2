`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2021 12:36:47 PM
// Design Name: 
// Module Name: d_flip_flop
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


module d_flip_flop(d, clk, reset, out1);
    input [31:0]d;
    input clk, reset;
    output reg [31:0]out1;
    
    always @(posedge clk) begin
        if (reset)
            out1 <= 0;
        else
            out1 <= d;
    end
endmodule
