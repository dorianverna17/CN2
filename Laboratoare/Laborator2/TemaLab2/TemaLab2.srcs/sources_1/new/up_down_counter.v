`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 09:11:13 AM
// Design Name: 
// Module Name: up_down_counter
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


module counter_up_down(clk, reset, up_down, out);
    
    input clk, reset, up_down;
    output reg [3:0]out;
    
    always @(posedge (clk) or posedge(reset))
    begin
        $display ("%b", out);
        case (reset)
        1'b1 : out <= 0;
        1'b0 : 
            case (up_down)
            1'b1 :
                case (out)
                4'b1111 : out <= 0;
                default : out <= out + 1;
                endcase
            1'b0 :
                case (out)
                4'b0000 : out <= 15;
                default : out <= out - 1;
                endcase
            endcase
        endcase
    end
    
endmodule
