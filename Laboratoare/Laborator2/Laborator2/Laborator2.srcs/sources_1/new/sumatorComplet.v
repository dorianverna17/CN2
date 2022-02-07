`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2021 09:29:34 PM
// Design Name: 
// Module Name: sumatorComplet
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


module sumatorComplet(x, y, cin, s, cout);

    input x, y, cin;
    output s, cout;
    wire s1, cout1, cout2;
    
    halfadder ha1(x, y, s1, cout1);
    halfadder ha2(s1, cin, s, cout2);
    
    assign cout = cout1 || cout2;
    
endmodule
