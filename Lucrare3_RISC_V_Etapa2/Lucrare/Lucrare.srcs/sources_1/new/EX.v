`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2022 11:18:32 PM
// Design Name: 
// Module Name: EX
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


module EX(input [31:0] IMM_EX,            // valoarea immediate in EX     
          input [31:0] REG_DATA1_EX,      // valoarea registrului sursa1
          input [31:0] REG_DATA2_EX,      // valoarea registrului sursa2
          input [31:0] PC_EX,             // adresa instructiunii curente in EX
          input [2:0] FUNCT3_EX,          // funct3 pentru instructiunea din EX
          input [6:0] FUNCT7_EX,          // funct7 pentru instructiunea din EX
          input [4:0] RD_EX,              // adresa registrului destinatie
          input [4:0] RS1_EX,             // adresa registrului sursa 1
          input [4:0] RS2_EX,             // adresa registrului sursa 2
          input RegWrite_EX,              // semnal de scriere in bancul de registrii
          input MemtoReg_EX,
          input MemRead_EX,               // semnal pentru activarea citirii din memorie
          input MemWrite_EX,              // semnal pentru activarea scrierii in memorie
          input [1:0] ALUop_EX,           // semnalul de control ALUop
          input ALUSrc_EX,                // semnal de selectie intre RS2 si valoarea imediata
          input Branch_EX,                // semnal de identificare al instructiunilor de tip branch
          input [1:0] forwardA,forwardB,  // semnalele de selectie pentru multiplexoarele de forwarding
          
          input [31:0] ALU_DATA_WB,       // valoarea calculata de ALU, prezenta in WB
          input [31:0] ALU_OUT_MEM,       // // valoarea calculata de ALU, prezenta in MEM
          
          output ZERO_EX,                 // flag-ul ZERO, calculat de ALU
          output [31:0] ALU_OUT_EX,       // rezultatul calculat de ALU in EX
          output [31:0] PC_Branch_EX,     // adresa de salt calculata in EX
          output [31:0] REG_DATA2_EX_FINAL// valoarea registrului sursa 2 selectata dintre valorile prezente
                                          // in etape,e EX, MEM, WB
          );
          
        wire [3:0] ALU_control_out;
        wire [31:0] out1, out2, out3;

        mux4_1 instance1_mux4_1(REG_DATA1_EX, ALU_DATA_WB, ALU_OUT_MEM,
                                0, forwardA, out1);
                      
        mux4_1 instance2_mux4_1(REG_DATA2_EX, ALU_DATA_WB, ALU_OUT_MEM,
                                0, forwardB, out2);

        mux2_1 instance_mux2_1(out2, IMM_EX, ALUSrc_EX, out3);

        ALUcontrol ALU_control_instance(ALUop_EX, FUNCT7_EX, FUNCT3_EX,
                                        ALU_control_out);
        ALU alu_instance(ALU_control_out, out1, out3, ZERO_EX, ALU_OUT_EX);
        
        adder add_EX(PC_EX, IMM_EX, PC_Branch_EX);
        
        assign REG_DATA2_EX_FINAL = out2;
endmodule
