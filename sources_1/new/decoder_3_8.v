`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 04:59:02 PM
// Design Name: 
// Module Name: decoder_3_8
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


module decoder_3_8(X,En,Yout);                           
    input [2:0] X;                                       
    input En;                                            
    output reg [7:0] Yout=0;                               
                                                         
    always @(X or En)                                    
    begin                                                
        if (!En)                                         
            Yout = 8'b11111111;                          
        else                                             
            case (X)                                     
                3'b000: Yout <= 8'b11111110;             
                3'b001: Yout <= 8'b11111101;             
                3'b010: Yout <= 8'b11111011;             
                3'b011: Yout <= 8'b11110111;             
                3'b100: Yout <= 8'b11101111;             
                3'b101: Yout <= 8'b11011111;             
                3'b110: Yout <= 8'b10111111;             
                3'b111: Yout <= 8'b01111111;             
                default:Yout <= 8'b11111111;             
            endcase                                      
    end                                                  
endmodule                                                
                                                         
