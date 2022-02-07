`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2022 11:17:52 PM
// Design Name: 
// Module Name: ALUcontrol
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


module ALUcontrol(input [1:0] ALUop,
                  input [6:0] funct7,
                  input [2:0] funct3,
                  output reg [3:0] ALUinput);
                  
    always@(*) begin
        casex ({ALUop[1:0],funct7[6:0],funct3[2:0]})
            // ld, sd
            12'b00xxxxxxxxxx: ALUinput <= 4'b0010;
            // add
            12'b100000000000: ALUinput <= 4'b0010;
            // addi
            12'b11xxxxxxx000: ALUinput = 4'b0010;
            // sub
            12'b100100000000: ALUinput <= 4'b0110;
            // and
            12'b100000000111: ALUinput <= 4'b0000;
            // or
            12'b100000000110: ALUinput <= 4'b0001;
            // ori
            12'b11xxxxxxx110: ALUinput = 4'b0001;
            // xor
            12'b100000000100: ALUinput <= 4'b0011;
            // srl
            12'b100000000101: ALUinput <= 4'b0101;
            // srli
            12'b110000001101: ALUinput <= 4'b0101;
            // sll -> R-type
            12'b100000000001: ALUinput <= 4'b0100;
            // slli -> I-type
            12'b110000001001: ALUinput <= 4'b0100;
            // sra -> R-type
            12'b100100000101: ALUinput <= 4'b1001;
            // srai -> I-type
            12'b110100001101: ALUinput <= 4'b1001;
            // sltu
            12'b100000000011: ALUinput <= 4'b0111;
            // slt -> R-type
            12'b100000000010: ALUinput <= 4'b1000;
            /////////////////////////////////////////
            // branch instructions
            // beq
            12'b01xxxxxxx000: ALUinput <= 4'b0110;
            // bne
            12'b01xxxxxxx001: ALUinput <= 4'b0110;
            // blt
            12'b01xxxxxxx100: ALUinput <= 4'b1000;
            // bge
            12'b01xxxxxxx101: ALUinput <= 4'b1000;
            // bltu
            12'b01xxxxxxx110: ALUinput <= 4'b0111;
            // bgeu
            12'b01xxxxxxx111: ALUinput <= 4'b0111;
            /////////////////////////////////////////
        endcase
    end
    
endmodule
