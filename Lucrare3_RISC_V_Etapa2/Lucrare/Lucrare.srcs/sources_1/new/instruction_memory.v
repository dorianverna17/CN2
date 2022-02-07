`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2022 11:31:02 PM
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
 
  reg [31:0] codeMemory [0:1023];
  
  initial $readmemh("code.mem", codeMemory);
  
  always@(address) begin
    instruction <= codeMemory[address];
  end

endmodule
