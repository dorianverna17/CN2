`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 07:30:07 PM
// Design Name: 
// Module Name: instruction_memory
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

module instruction_memory(input [9:0] address,
                            output reg [31:0] instruction);
    
    reg [31:0] mem_instruction [0:1023];
    
    initial $readmemh("code.mem", mem_instruction);
    
    always @(address)
        begin
            instruction = mem_instruction[address]; 
        end
    
endmodule