`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 04:58:50 PM
// Design Name: 
// Module Name: counter
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


module counter(Clk100MHz, Clk1KHzEn, reset_n, NumDigits, cnt);
    input Clk100MHz, Clk1KHzEn, reset_n;
    input [2:0] NumDigits;
    output reg [2:0]cnt;
    
    always @(posedge Clk100MHz)
        if(!reset_n)
            cnt <= 0;
        else if (Clk1KHzEn == 1) begin
            if (cnt == NumDigits)
                cnt <=0;
            else
                cnt <= cnt +1;                      
        end    
     
endmodule

