`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2021 08:08:51 PM
// Design Name: 
// Module Name: registers
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


module registers(input clk,reg_write,
                 input [4:0] read_reg1,read_reg2,write_reg,
                 input [31:0] write_data,
                 output [31:0] read_data1,read_data2);
    
    reg [31:0] register[31:0];
    
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1)begin
            register[i] = i;
        end
    end
    
    always@(posedge clk)
        begin 
            if(reg_write == 1) begin
                register[write_reg] = write_data;
            end 
        end 

    assign read_data1 = register[read_reg1];
    assign read_data2 = register[read_reg2];
endmodule
