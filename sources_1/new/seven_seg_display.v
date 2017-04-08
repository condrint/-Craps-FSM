`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 04:58:11 PM
// Design Name: 
// Module Name: seven_seg_display
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


module seven_seg_display(Clk100MHz, Clk1KHzEn, NumDigits, Data, XDP, reset_n, CA,CB,CC,CD,CE,CF,CG, DP, AN);
    input Clk100MHz, Clk1KHzEn, reset_n;
    input [2:0] NumDigits;
    input [31:0] Data;
    input [7:0] XDP;
    output CA,CB,CC,CD,CE,CF,CG;
    wire [6:0] C;
    assign {CA,CB,CC,CD,CE,CF,CG}=C;
    output [7:0] AN;
    output reg DP;
    wire [2:0] DigitSelect;
    reg [3:0]D;
    
    counter counter(
        .Clk100MHz(Clk100MHz), 
        .Clk1KHzEn(Clk1KHzEn), 
        .reset_n(reset_n), 
        .NumDigits(NumDigits), 
        .cnt(DigitSelect)
    );
    
    decoder_3_8 decoder_3_8(
        .X(DigitSelect),
        .En(1'b1),
        .Yout(AN)
    );
    
    always @(posedge Clk100MHz) begin
        case(DigitSelect)
            3'b000: {DP,D} <= {XDP[0], Data[3:0]};
            3'b001: {DP,D} <= {XDP[1], Data[7:4]};
            3'b010: {DP,D} <= {XDP[2], Data[11:8]};
            3'b011: {DP,D} <= {XDP[3], Data[15:12]};
            3'b100: {DP,D} <= {XDP[4], Data[19:16]};
            3'b101: {DP,D} <= {XDP[5], Data[23:20]};
            3'b110: {DP,D} <= {XDP[6], Data[27:24]};
            3'b111: {DP,D} <= {XDP[7], Data[31:28]};
        endcase
    end
    
    seven_segment_decoder seven_segment_decoder(
        .X(D),
        .C(C)
    );
                
endmodule