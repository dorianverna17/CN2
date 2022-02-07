`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 12:44:38 AM
// Design Name: 
// Module Name: mux3_1
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


module mux3_1(A, B, C, F, R);
    
    input [31:0]A, B, C;
    input [1:0]F;
    output [31:0]R;
    reg [31:0]aux;
    
    always @*
    begin
        if (F == 2'b00)
            aux = A;
        else
            begin
                if (F == 2'b01)
                    aux = B;
                else
                    if (F == 2'b10)
                        aux = C;
            end    
    end
       
    assign R = aux;
    
endmodule
