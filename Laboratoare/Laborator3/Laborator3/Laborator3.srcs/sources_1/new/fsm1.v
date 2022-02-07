`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 12:32:35 PM
// Design Name: 
// Module Name: fsm1
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


module fsm1(clk, rst, in1, out1);
    input clk, rst, in1;
    output out1;
    
    parameter IDLE = 4'b0001,
                S0 = 4'b0010,
                S1 = 4'b0011,
                S2 = 4'b0100;
                
    reg [3:0]present_state, next_state;
    
    always @(posedge clk) begin
        if (rst)
            present_state <= IDLE;
        else
            present_state <= next_state;
    end
    
    always @(present_state, in1) begin
        next_state = IDLE;
        case (present_state)
            IDLE: begin
                    if (in1)
                        next_state = S0;
                  end
            S0: begin
                    if (in1)
                        next_state = S1;
                  end
            S1: begin
                    if (~in1)
                        next_state = S2;
                     else
                        next_state = S1;
                  end
            S2: begin
                    if (in1)
                        next_state = S0;
                  end
        endcase
    end
    
    assign out1 = (present_state == S2) ? 1: 0;
endmodule
