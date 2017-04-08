`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 05:15:59 PM
// Design Name: 
// Module Name: sync2
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


module sync2(Clk100MHz, reset_n, async_sig, sync_sig);
    input Clk100MHz, reset_n;
    input [3:0] async_sig;
    output reg [3:0] sync_sig;
    reg [3:0] D1, D2;
    always @(posedge Clk100MHz) 
        if(!reset_n) 
            D1 <= 0;
        else D1 <= async_sig;
        
    always @(posedge Clk100MHz) 
        if(!reset_n) 
            D2 <= 0;
        else D2 <= D1;
        
    always @(posedge Clk100MHz) 
        if(!reset_n) 
            sync_sig <= 0;
        else sync_sig <= D2;        
endmodule
