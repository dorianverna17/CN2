`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2022 11:24:21 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(input clk,       
                   input mem_read,                 // semnal de activare a citirii din memorie
                   input mem_write,                // semnal de activare a scrierii in memorie
                   input [31:0] address,           // adresa de scriere/citire
                   input [31:0] write_data,        // valoarea scrisa in memorie
                   output reg [31:0] read_data);   // valoarea citita din memorie
    reg [31:0] memData [0:1023];
    integer i;
    
    initial begin
        for (i = 0; i< 1024; i = i + 1) begin 
            memData[i] = 32'b0; 
        end
    end 
     
    always@(posedge clk) begin
        if(mem_write)
          memData[address[11:2]] <= write_data;
    end
    
    always@(*)
    begin
      if (mem_read == 1) 
          read_data <= memData[address[11:2]];
    end
    
    
endmodule
