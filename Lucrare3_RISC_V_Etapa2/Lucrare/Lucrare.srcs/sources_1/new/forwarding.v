`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2022 11:25:05 PM
// Design Name: 
// Module Name: forwarding
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


module forwarding(input [4:0] rs1, // adresa registrului sursa 1 din etapa de EX
                  input [4:0] rs2, // adresa registrului sursa 2 din etapa de EX
                  input [4:0] ex_mem_rd, // adresa registrului destinatie in etapa de MEM
                  input [4:0] mem_wb_rd, // adresa registrului destinatie i  etapa WB
                  input ex_mem_regwrite, // semnal de contril RegWrite in etapa MEM
                  input mem_wb_regwrite, // semnal de control RegWrite in etapa WB
                  output reg [1:0] forwardA,forwardB); // semnale de selectie ale multiplexoarelor
    always@(*) begin
        if (ex_mem_regwrite && (ex_mem_rd != 5'b0) && (ex_mem_rd == rs1)) 
            forwardA <= 2'b10;
        else if (mem_wb_regwrite 
                 && (mem_wb_rd != 5'b0) 
                 && !(ex_mem_regwrite && (ex_mem_rd != 5'b0) 
                 && (ex_mem_rd == rs1)) && (mem_wb_rd == rs1))
            forwardA <= 2'b01;     
        else 
            forwardA <= 2'b00;
        
        if(ex_mem_regwrite 
           && (ex_mem_rd != 5'b0) 
           && (ex_mem_rd == rs2))
            forwardB <= 2'b10;
        else if (mem_wb_regwrite 
                 && (mem_wb_rd != 5'b0) 
                 && !(ex_mem_regwrite && (ex_mem_rd != 5'b0) 
                 && (ex_mem_rd == rs2)) 
                 && (mem_wb_rd == rs2))
            forwardB <= 2'b01;
        else 
            forwardB <= 2'b00;
    end  
endmodule
