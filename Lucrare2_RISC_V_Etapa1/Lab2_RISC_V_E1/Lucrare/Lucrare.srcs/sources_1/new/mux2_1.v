`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 04:33:54 PM
// Design Name: 
// Module Name: mux2_1
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


module mux2_1(input [31:0] ina,inb, input sel, 
              output [31:0] out);
    
    reg [31:0] out;
    
    always @(ina, inb, sel)
        begin
            if(sel == 0)
                out = ina;
            else
                out = inb;
        end
endmodule

