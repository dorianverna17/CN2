`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 12:16:30 AM
// Design Name: 
// Module Name: alu
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


module alu(A, B, F, out);

    input [31:0] A;
    input [31:0] B;
    input [2:0] F;
    
    output [31:0] out;
    
    reg f_0_aux;
    reg [1:0]f_2_1_aux;
    wire [31:0]add_out, substract_out, multiply_out, mux_out;
    wire [31:0]res;
    
    mux2_1 instance1(B, 32'b1, F[0], mux_out);
    
    add_module instance_add(A, mux_out, add_out);
    substract_module instance_substract(A, mux_out, substract_out);
    multiply_module instance_multiply(A, B, multiply_out);
    
    mux3_1 instance_res(add_out, substract_out, multiply_out, F[2:1], res);

    assign out = res;

endmodule
