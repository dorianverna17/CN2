`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2021 09:41:24 PM
// Design Name: 
// Module Name: sumatorComplet_tb
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


module sumatorComplet_tb();

    reg x, y, cin;
    
    sumatorComplet instance1(x, y, cin, s, cout);
    
    initial begin
    
        #0 x = 0; y = 0; cin = 0;
        #20 x = 0; y = 0; cin = 1;
        #20 x = 0; y = 1; cin = 0;
        #20 x = 0; y = 1; cin = 1;
        #20 x = 1; y = 0; cin = 0;
        #20 x = 1; y = 0; cin = 1;
        #20 x = 1; y = 1; cin = 0;
        #20 x = 1; y = 1; cin = 1;
        
    end

endmodule
