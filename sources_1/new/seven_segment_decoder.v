`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 04:59:18 PM
// Design Name: 
// Module Name: seven_segment_decoder
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


module seven_segment_decoder(X,C);
    input [3:0]X;
    output reg [6:0] C;
    
    always @(X)
    begin
        case(X)
            4'b0000: C = 7'b0000001;
            4'b0001: C = 7'b1001111;
            4'b0010: C = 7'b0010010;
            4'b0011: C = 7'b0000110;
            4'b0100: C = 7'b1001100;
            4'b0101: C = 7'b0100100;
            4'b0110: C = 7'b0100000;
            4'b0111: C = 7'b0001111;
            4'b1000: C = 7'b0000000;
            4'b1001: C = 7'b0001100;
            4'b1010: C = 7'b0001000;
            4'b1011: C = 7'b1100000;
            4'b1100: C = 7'b0110001;
            4'b1101: C = 7'b1000010;
            4'b1110: C = 7'b0110000;
            4'b1111: C = 7'b0111000;
        endcase
     end
endmodule
