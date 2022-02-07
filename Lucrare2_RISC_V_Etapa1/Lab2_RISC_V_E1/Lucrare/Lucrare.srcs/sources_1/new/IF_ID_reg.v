`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 09:17:45 PM
// Design Name: 
// Module Name: IF_ID_reg
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


module IF_ID_reg(input clk,reset,write,
                 input [31:0] pc_in, instruction_in,
                 output reg [31:0] pc_out, instruction_out);
    
    always @(posedge clk) begin
        if (reset)
            begin
                pc_out = 0;
                instruction_out = 0;
            end
        else if (write)
            begin
                pc_out = pc_in;
                instruction_out = instruction_in;
            end
    end
    
endmodule
