`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 05:49:28 PM
// Design Name: 
// Module Name: lab8_top
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


module lab8_top(Clk100MHz, BTNC, BTNU, Sw, RollDiceLed, PlayerWinsLed, PlayerLosesLed,CA,CB,CC,CD,CE,CF,CG,DP,AN);
    input Clk100MHz,BTNC, BTNU;
    input [3:0] Sw;
    output CA,CB,CC,CD,CE,CF,CG,DP;
    output [7:0] AN;
    output RollDiceLed, PlayerWinsLed, PlayerLosesLed;
    wire Clk1KHzEn, Clk1HzEn;
    wire [31:0] Data;
    wire [7:0] XDP;
    
    clk_gen clk_gen(
        .Clk100MHz(Clk100MHz),
        .reset_n(~BTNC),
        .Clk1KHzEn(Clk1KHzEn),
        .Clk1HzEn(Clk1HzEn)   
    );
    
    data_gen data_gen(
        .Clk100MHz(Clk100MHz),
        .Clk1KHzEn(Clk1KHzEn), 
        .reset_n(~BTNC), 
        .async_sig(BTNU), 
        .Sw(Sw), 
        .Data(Data), 
        .XDP(XDP), 
        .RollDiceLed(RollDiceLed), 
        .PlayerWinsLed(PlayerWinsLed), 
        .PlayerLosesLed(PlayerLosesLed)
    );
    
    seven_seg_display seven_seg_display(
        .Clk100MHz(Clk100MHz), 
        .Clk1KHzEn(Clk1KHzEn), 
        .NumDigits(3'b010), 
        .Data(Data), 
        .XDP(XDP), 
        .reset_n(~BTNC), 
        .CA(CA),
        .CB(CB),
        .CC(CC),
        .CD(CD),
        .CE(CE),
        .CF(CF),
        .CG(CG), 
        .DP(DP), 
        .AN(AN)
    );    
endmodule
