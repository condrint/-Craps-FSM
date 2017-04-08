`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 05:15:26 PM
// Design Name: 
// Module Name: fe_detect
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


module fe_dectect(Clk100MHz, reset_n, sig, sig_fe);
    input Clk100MHz, reset_n, sig;
    output reg sig_fe;
    reg sig_D1;
    
    always @(posedge Clk100MHz) begin
        if(!reset_n) 
            sig_D1 <= 0;
        else
            sig_D1 <= sig;    
    end
        
    always @(posedge Clk100MHz)
        if(!reset_n)
            sig_fe <= 0;
        else if(!sig & sig_D1)
            sig_fe <= 1;
        else
            sig_fe <= 0;        
    
    
endmodule