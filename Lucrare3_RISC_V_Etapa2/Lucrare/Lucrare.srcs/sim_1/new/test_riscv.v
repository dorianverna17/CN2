`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2022 11:35:38 PM
// Design Name: 
// Module Name: test_riscv
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


module RISC_V_TB;
  reg clk,reset;
  
  wire [31:0] PC_EX_out;
  wire [31:0] ALU_OUT_EX_out;
  wire [31:0] PC_MEM_out;
  wire PCSrc_out;
  wire [31:0] DATA_MEMORY_MEM_out;
  wire [31:0] ALU_DATA_WB_out;
  wire [1:0] forwardA_out, forwardB_out;
  wire pipeline_stall_out;
  
  RISC_V_IF_ID procesor(clk, // semnalul de ceas global
                        reset, // semnalul de reset global
                        PC_EX_out, // adresa PC in etapa EX
                        ALU_OUT_EX_out, // valoarea calculata de ALU in etapa EX
                        PC_MEM_out, // adresa de salt calculata
                        PCSrc_out, // semnal de selectie pentru PC
                        DATA_MEMORY_MEM_out, // valoarea citita din memoria de date in MEM
                        ALU_DATA_WB_out, // valoarea finala scrisa in etapa WB
                        forwardA_out, forwardB_out, // semnalele de forwarding
                        pipeline_stall_out);  // semnal de stall la detectia de hazarduri  
    
  always #5 clk=~clk;
  
  initial begin
    #0 clk=1'b0;
       reset=1'b1;
       
    #10 reset=1'b0;
    #200 $finish;
  end
endmodule
