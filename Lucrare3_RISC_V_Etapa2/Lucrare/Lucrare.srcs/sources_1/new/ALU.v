`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2022 11:17:18 PM
// Design Name: 
// Module Name: ALU
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


module ALU(input [3:0] ALUop,
           input [31:0] ina, inb,
           output zero,
           output reg [31:0] out);
           
    always@(*) begin
        casex (ALUop)
            // ld, sd, add
            4'b0010: out <= ina + inb;
            // sub, beq, bne
            4'b0110: out <= ina - inb;
            // and
            4'b0000: out <= ina & inb;
            // or
            4'b0001: out <= ina | inb;
            // xor
            4'b0011: out <= ina ^ inb;
            // srl, srli
            4'b0101: out <= ina >> inb[4:0];
            // sll, slli
            4'b0100: out <= ina << inb[4:0];
            // sra, srai
            4'b1001: out <= ina >>> inb[4:0];
            // sltu, bltu, bgeu -> for unsigned
            4'b0111: out <= ina < inb ? 32'b1 : 32'b0;
            // slt, blt, bge -> for signed
            4'b1000: out <= $signed(ina) < $signed(inb) ? 32'b1 : 32'b0;
        endcase
    end
    
    assign zero = out == 0 ? 1 : 0;
endmodule
