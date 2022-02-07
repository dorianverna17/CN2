`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2022 11:29:13 PM
// Design Name: 
// Module Name: if_id_pipe
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


module IF_ID_reg(clk,reset,write,pc_in,instruction_in,pc_out,instruction_out);
  
  input clk,write,reset;
  input [31:0] pc_in;
  input [31:0] instruction_in;
  
  output reg [31:0] pc_out;
  output reg [31:0] instruction_out;
  
  always@(posedge clk) begin
    if (reset) begin
      pc_out<=32'b0;
      instruction_out<=32'b0;
    end
    else begin
      if(write) begin
        pc_out <= pc_in;
        instruction_out <= instruction_in;
      end
    end
  end

endmodule
