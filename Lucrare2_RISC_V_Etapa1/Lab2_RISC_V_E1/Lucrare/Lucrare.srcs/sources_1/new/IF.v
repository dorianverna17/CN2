`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 07:47:09 PM
// Design Name: 
// Module Name: IF
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


module IF (input clk, reset, PCSrc, PC_write, 
           input [31:0] PC_Branch, 
           output [31:0] PC_IF, INSTRUCTION_IF);
    
    wire [31:0] res_adder;
    wire [31:0] res_PC;
    wire [31:0] res_mux;
    wire [31:0] res_mem_instruction;

    adder add(res_PC, 4, res_adder);
    
    mux2_1 mux(res_adder, PC_Branch, PCSrc, res_mux);
    
    PC pc(clk, reset, PC_write, res_mux, res_PC);
    
    instruction_memory mem(res_PC[11:2], res_mem_instruction);
  
    assign PC_IF = res_PC;
    assign INSTRUCTION_IF = res_mem_instruction;
    
endmodule
