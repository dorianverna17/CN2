`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2021 03:51:48 PM
// Design Name: 
// Module Name: mux_4_1
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


module mux_4_1(A, B, C, D, S0, S1, Y);
    
    input A, B, C, D, S0, S1;
    output Y;
    wire not_S0, not_S1;
    wire w1, w2, w3, w4;
    wire x1, x2;
    wire f1, f2;
    
    nand NAND_S0(not_S0, S0);
    nand NAND_S1(not_S1, S1);
    
    nand NAND_W1(w1, A, S0);
    nand NAND_W2(w2, B, not_S0);
    nand NAND_W3(w3, C, S0);
    nand NAND_W4(w4, D, not_S0);
    
    nand NAND_X1(x1, w1, w2);
    nand NAND_X2(x2, w3, w4);
    
    nand NAND_F1(f1, x1, S1);
    nand NAND_F2(f2, x2, not_S1);
    
//    nand NAND_A(w1, D, not_S0, not_S1);
//    nand NAND_B(w2, C, not_S0, S1);
//    nand NAND_C(w3, B, S0, not_S1);
//    nand NAND_D(w4, A, S0, S1);
    
    nand NAND_Y(Y, f1, f2);
    
endmodule
