`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2017 05:14:57 PM
// Design Name: 
// Module Name: data_gen
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


module data_gen(Clk100MHz,Clk1KHzEn, reset_n, async_sig, Sw, Data, XDP, RollDiceLed, PlayerWinsLed, PlayerLosesLed);
    input Clk100MHz,Clk1KHzEn,reset_n, async_sig;
    input [3:0]Sw;
    output RollDiceLed, PlayerWinsLed, PlayerLosesLed;
    output  [31:0] Data;
    output  [7:0]XDP;
    wire sig, sig_clean, DiceRolled;
    wire [3:0] DiceSum;
    wire [3:0] present_state, MyPoint;
    sync sync(
        .Clk100MHz(Clk100MHz), 
        .reset_n(reset_n), 
        .async_sig(async_sig), 
        .sync_sig(sig)
    );
    
    fe_dectect fe_dectect(
        .Clk100MHz(Clk100MHz), 
        .reset_n(reset_n), 
        .sig(sig_clean), 
        .sig_fe(DiceRolled)
    );

    debounce debounce(
        .Clk100MHz(Clk100MHz), 
        .reset_n(reset_n), 
        .Clk1KHzEn(Clk1KHzEn), 
        .sig(sig), 
        .sig_clean(sig_clean)
    );
    
    sync2 sync2(
        .Clk100MHz(Clk100MHz), 
        .reset_n(reset_n), 
        .async_sig(Sw), 
        .sync_sig(DiceSum)  
    );
    fsm fsm(
        .Clk100MHz(Clk100MHz), 
        .reset_n(reset_n), 
        .present_state(present_state), 
        .DiceSum(DiceSum), 
        .DiceRolled(DiceRolled),
        .MyPoint(MyPoint), 
        .RollDiceLed(RollDiceLed), 
        .PlayerWinsLed(PlayerWinsLed), 
        .PlayerLosesLed(PlayerLosesLed)    
    );
    assign Data = {20'b0, DiceSum, MyPoint, present_state};
    assign XDP = 8'b11111001;               
endmodule