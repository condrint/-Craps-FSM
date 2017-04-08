`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 05:15:38 PM
// Design Name: 
// Module Name: debounce
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


module debounce(Clk100MHz, reset_n, Clk1KHzEn, sig, sig_clean);
    input Clk100MHz, reset_n, Clk1KHzEn, sig;
    output reg sig_clean;
    reg [7:0] shift_reg;
    always @(posedge Clk100MHz)
        if(!reset_n)
            shift_reg <= 0;
        else if(Clk1KHzEn)
            shift_reg <= {shift_reg[6:0],sig};
         
    always @(posedge Clk100MHz)
        if(!reset_n)
            sig_clean <= 0;
        else if(Clk1KHzEn) begin
            if(shift_reg == 8'b1111_1111)
                sig_clean <= 1'b1;
            else if( shift_reg == 8'b0000_0000)
                sig_clean <= 1'b0;
            else
                sig_clean <= sig_clean;        
        end                        
                   
endmodule