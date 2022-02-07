`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 12:28:48 AM
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


module mux2_1(B, one, F, out);

//    input [31:0]A, B, SEL;
//    output [31:0]out;
//    wire [31:0]out1_aux, out2_aux;
//    wire [31:0]SEL_n = ~SEL;
//    wire [31:0]aux;
    
//    nand NAND_A(out1_aux, A, SEL_n);
//    nand NAND_B(out2_aux, A, SEL);
//    nand NAND_C(aux, out1_aux, out2_aux);

//    assign out = aux;
    
    input [31:0] B, one;
    input F;
    output [31:0] out;
    reg [31:0]aux;
    
    always @* begin
        if (F == 1'b1)
            aux = one;
        else
            aux = B;
    end
    
    assign out = aux;
    
endmodule
