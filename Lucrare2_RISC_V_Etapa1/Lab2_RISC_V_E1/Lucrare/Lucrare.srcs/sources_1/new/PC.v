`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 06:49:24 PM
// Design Name: 
// Module Name: PC
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


module PC(input clk,res, write,
        input [31:0] in,
        output [31:0] out);
    
    reg [31:0] out;

    always @(posedge clk ) 
        begin
            if (res)
                out = 0;
            else if (write)
                out = in;
        end
endmodule
